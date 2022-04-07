import numpy as np
import tensorflow as tf
from spektral.data import MixedLoader
from spektral.layers import GCNConv
from tensorflow.keras import Model
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.keras.metrics import binary_accuracy
from tensorflow.keras.regularizers import l2

l2_reg = 5e-4  # Regularization rate for l2

import logging

logging.basicConfig(level=logging.INFO, format='%(message)s')
logger = logging.getLogger()
logger.addHandler(logging.FileHandler('logs/gnn6.log', 'a'))
print = logger.info


# Build model
class Net(Model):
    def __init__(self, batchsize, patience, epochs, optimizer, loss_fn, **kwargs):
        super().__init__(**kwargs)
        self.batch_size = batchsize
        self.patience = patience
        self.epochs = epochs
        self.optimizer = optimizer
        self.loss_fn = loss_fn
        self.mode = 'inter'
        self.iter = 10
        self.channel = 32
        self.hidden = 512
        self.conv1 = GCNConv(self.channel, activation="elu", kernel_regularizer=l2(l2_reg))
        self.conv2 = GCNConv(self.channel, activation="elu", kernel_regularizer=l2(l2_reg))
        self.flatten = Flatten(input_dim=(200, self.channel))
        self.fc1 = Dense(512, activation="relu")
        self.fc2 = Dense(256, activation="relu")
        self.fc3 = Dense(1, activation='sigmoid')

    def call(self, inputs):
        x, a = inputs
        x = tf.cast(x, dtype='float64')
        x = self.conv1([x, a])
        x = self.conv2([x, a])
        output = self.flatten(x)
        output = self.fc1(output)
        output = self.fc2(output)
        output = self.fc3(output)
        return output

    def observe(self, inputs):
        x, a = inputs
        x = tf.cast(x, dtype='float64')
        if self.mode == 'inter':
            self.x = x
            self.hidden_out = self.conv1([self.x, a])
            self.output_out = self.conv2([self.hidden_out, a])
            self.x = self.x[0, :, :]
            self.hidden_out = self.hidden_out[0, :, :]
            self.output_out = self.output_out[0, :, :]
        else:
            self.x = x
            self.hidden_out = self.conv1([self.x, a])
            self.output_out = self.conv2([self.hidden_out, a])

    # @tf.function
    def train_on_batch(self, inputs, target):
        with tf.GradientTape() as tape:
            target = tf.cast(tf.reshape(target, [-1, 1]), tf.float32)
            predictions = self(inputs, training=True)
            loss = self.loss_fn(target, predictions) + sum(self.losses)
            acc = tf.reduce_mean(binary_accuracy(target, predictions))
        trainable_vars = self.trainable_variables
        gradients = tape.gradient(loss, trainable_vars)
        self.optimizer.apply_gradients(zip(gradients, trainable_vars))
        return loss, acc

    # Evaluation function
    def evaluate(self, loader):
        step = 0
        results = []
        m = tf.keras.metrics.AUC(num_thresholds=200)
        for batch in loader:
            step += 1
            inputs, target = batch
            target = tf.cast(tf.reshape(target, [-1, 1]), tf.float32)
            predictions = self(inputs, training=False)
            loss = self.loss_fn(target, predictions)
            acc = tf.reduce_mean(binary_accuracy(target, predictions))
            results.append((loss, acc, len(target)))  # Keep track of batch size
            m.update_state(target, predictions)
            if step == loader.steps_per_epoch:
                results = np.array(results)
                loss, acc = np.average(results[:, :-1], 0, weights=results[:, -1])
                return loss, acc, m.result().numpy()

    def preProcess(self, data):
        print('Preprocessing')
        # The adjacency matrix is stored as an attribute of the dataset.
        # Create filter for GCN and convert to sparse tensor.
        data.a = GCNConv.preprocess(data.a)

        # Train/valid/test split
        idxs = np.random.permutation(len(data))
        split_va, split_te = int(0.8 * len(data)), int(0.9 * len(data))
        idx_tr, idx_va, idx_te = np.split(idxs, [split_va, split_te])
        data_tr = data[idx_tr]
        data_va = data[idx_va]
        data_te = data[idx_te]

        # We use a MixedLoader since the dataset is in mixed mode
        loader_tr = MixedLoader(data_tr, batch_size=self.batch_size, epochs=self.epochs)
        loader_va = MixedLoader(data_va, batch_size=self.batch_size)
        loader_te = MixedLoader(data_te, batch_size=self.batch_size)
        return loader_tr, loader_va, loader_te

    def fit(self, data):
        # Data
        loader_tr, loader_va, loader_te = self.preProcess(data)
        # Setup training
        best_val_loss = 99999
        current_patience = self.patience
        step = 0
        epoch = 0
        # Training loop
        results_tr = []
        for batch in loader_tr:
            step += 1

            # Training step
            inputs, target = batch
            loss, acc = self.train_on_batch(*batch)
            results_tr.append((loss, acc, len(target)))
            if step == loader_tr.steps_per_epoch:
                epoch += 1
                if epoch == self.epochs:
                    case, tar = loader_te.__next__()
                    self.observe(case)
                    break
                val_loss, val_acc, val_auc = self.evaluate(loader_va)
                if val_loss < best_val_loss:
                    best_val_loss = val_loss
                    current_patience = self.patience
                    test_loss, test_acc, test_auc = self.evaluate(loader_te)
                else:
                    current_patience -= 1
                    if current_patience == 0:
                        print("Early stopping")
                        case, tar = loader_te.__next__()
                        self.observe(case)
                        break
                # Print results
                results_tr = np.array(results_tr)
                results_tr = np.average(results_tr[:, :-1], 0, weights=results_tr[:, -1])
                print(
                    "Train loss: {:.4f}, acc: {:.4f} | "
                    "Valid loss: {:.4f}, acc: {:.4f}, auc:{:.4f} | "
                    "Test loss: {:.4f}, acc: {:.4f}, auc:{:.4f} ".format(
                        *results_tr,
                        val_loss, val_acc, val_auc,
                        test_loss, test_acc, test_auc
                    )
                )
                # Reset epoch
                results_tr = []
                step = 0
