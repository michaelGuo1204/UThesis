import numpy as np
import tensorflow as tf
from spektral.data import MixedLoader
from spektral.layers import GCNConv, GlobalSumPool
from tensorflow.keras import Model
from tensorflow.keras.layers import Dense
from tensorflow.keras.metrics import sparse_categorical_accuracy
from tensorflow.keras.regularizers import l2

from EM import EstimateAdj

l2_reg = 5e-4  # Regularization rate for l2


# Build model
class Net(Model):
    def __init__(self, batchsize, patience, epochs, optimizer, loss_fn, **kwargs):
        super().__init__(**kwargs)
        self.batch_size = batchsize
        self.patience = patience
        self.epochs = epochs
        self.optimizer = optimizer
        self.loss_fn = loss_fn
        self.conv1 = GCNConv(32, activation="elu", kernel_regularizer=l2(l2_reg))
        self.conv2 = GCNConv(32, activation="elu", kernel_regularizer=l2(l2_reg))
        self.flatten = GlobalSumPool()
        self.fc1 = Dense(512, activation="relu")
        self.fc2 = Dense(10, activation="softmax")  # MNIST has 10 classes

    def call(self, inputs):
        x, a = inputs
        x = self.conv1([x, a])
        x = self.conv2([x, a])
        output = self.flatten(x)
        output = self.fc1(output)
        output = self.fc2(output)
        return output

    def observe(self, inputs):
        x, a = inputs
        self.x = x
        self.hidden_out = self.conv1([self.x, a])
        self.output_out = self.conv2([self.hidden_out, a])
        pass

    def EMlearning(self, data):
        estimator = EstimateAdj(data.n_nodes)

        # Train Model
        for iter in range(5):
            self.fit(data)

            estimator.reset_obs()
            estimator.update_obs(self.knn(data.x))
            estimator.update_obs(self.knn(self.hidden_out))
            estimator.update_obs(self.knn(self.output_out))

            self.iter += 1
            adj = estimator.EM(self.output.max(1)[1].numpy())
            data.a = adj
            # adj = prob_to_adj(Q, args.threshold).to(self.device)

    @tf.function
    def train_on_batch(self, inputs, target):
        with tf.GradientTape() as tape:
            predictions = self(inputs, training=True)
            loss = self.loss_fn(target, predictions) + sum(self.losses)
            acc = tf.reduce_mean(sparse_categorical_accuracy(target, predictions))

        gradients = tape.gradient(loss, self.trainable_variables)
        self.optimizer.apply_gradients(zip(gradients, self.trainable_variables))
        return loss, acc

    # Evaluation function
    def evaluate(self, loader):
        step = 0
        results = []
        for batch in loader:
            step += 1
            inputs, target = batch
            predictions = self(inputs, training=False)
            loss = self.loss_fn(target, predictions)
            acc = tf.reduce_mean(sparse_categorical_accuracy(target, predictions))
            results.append((loss, acc, len(target)))  # Keep track of batch size
            if step == loader.steps_per_epoch:
                results = np.array(results)
                return np.average(results[:, :-1], 0, weights=results[:, -1])

    def preProcess(self, data):

        # The adjacency matrix is stored as an attribute of the dataset.
        # Create filter for GCN and convert to sparse tensor.
        data.a = GCNConv.preprocess(data.a)

        # Train/valid/test split
        data_tr, data_te = data[:-10000], data[-10000:]
        np.random.shuffle(data_tr)
        data_tr, data_va = data_tr[:-10000], data_tr[-10000:]

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
            loss, acc = self.train_on_batch(inputs, target)
            results_tr.append((loss, acc, len(target)))
            if step == loader_tr.steps_per_epoch:
                epoch += 1
                if epoch == self.epochs:
                    case = loader_te.__next__()
                    self.observe(case)
                    break
                results_va = self.evaluate(loader_va)
                if results_va[0] < best_val_loss:
                    best_val_loss = results_va[0]
                    current_patience = self.patience
                    results_te = self.evaluate(loader_te)
                else:
                    current_patience -= 1
                    if current_patience == 0:
                        print("Early stopping")
                        case = loader_te.__next__()
                        self.observe(case)
                        break
                # Print results
                results_tr = np.array(results_tr)
                results_tr = np.average(results_tr[:, :-1], 0, weights=results_tr[:, -1])
                print(
                    "Train loss: {:.4f}, acc: {:.4f} | "
                    "Valid loss: {:.4f}, acc: {:.4f} | "
                    "Test loss: {:.4f}, acc: {:.4f}".format(
                        *results_tr, *results_va, *results_te
                    )
                )
                # Reset epoch
                results_tr = []
                step = 0
