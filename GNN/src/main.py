from spektral.data import DisjointLoader
from spektral.transforms.normalize_adj import NormalizeAdj
from tensorflow.keras.losses import BinaryCrossentropy
from tensorflow.keras.metrics import binary_accuracy
from tensorflow.keras.optimizers import Adam

from Net import *
from Utili import *

################################################################################
# Config
################################################################################
learning_rate = 1e-3  # Learning rate
epochs = 300  # Number of training epochs
es_patience = 10  # Patience for early stopping
batch_size = 64  # Batch size

################################################################################
# Load data
################################################################################

data = WDataset(load=True, n_traits=100, transforms=NormalizeAdj())

# Train/valid/test split
idxs = np.random.permutation(len(data))
split_va, split_te = int(0.8 * len(data)), int(0.9 * len(data))
idx_tr, idx_va, idx_te = np.split(idxs, [split_va, split_te])
data_tr = data[idx_tr]
data_va = data[idx_va]
data_te = data[idx_te]

# Data loaders
loader_tr = DisjointLoader(data_tr, batch_size=batch_size, epochs=epochs)
loader_va = DisjointLoader(data_va, batch_size=batch_size)
loader_te = DisjointLoader(data_te, batch_size=batch_size)

################################################################################
# Build model
################################################################################

# model = ECCModel(data.n_node_features,data.n_edge_features,data.n_labels)
model = GeneralGNN(data.n_labels, activation='softmax')
# model = Net(0)
optimizer = Adam(learning_rate=learning_rate, decay=0.05)
loss_fn = BinaryCrossentropy()
logdir = "./logs/{}".format(time.time())
logWriter = tf.summary.create_file_writer(logdir)
logWriter.set_as_default()
logWriter.init()
logstep = 0


################################################################################
# Fit model
################################################################################
# @tf.function(input_signature=loader_tr.tf_signature(), experimental_relax_shapes=True)
def train_step(inputs, target):
    with tf.GradientTape() as tape:
        predictions = model(inputs, training=True)
        loss = loss_fn(target, predictions) + sum(model.losses)
        predictions = tf.cast(predictions, dtype='float64')
        acc = tf.reduce_mean(binary_accuracy(target, predictions))
    gradients = tape.gradient(loss, model.trainable_variables)
    optimizer.apply_gradients(zip(gradients, model.trainable_variables))
    return loss, acc


def evaluate(loader):
    output = []
    step = 0
    while step < loader.steps_per_epoch:
        step += 1
        inputs, target = loader.__next__()
        pred = model(inputs, training=False)
        pred = tf.cast(pred, dtype='float64')
        outs = (
            loss_fn(target, pred),
            tf.reduce_mean(binary_accuracy(target, pred)),
            len(target),  # Keep track of batch size
        )
        output.append(outs)
        if step == loader.steps_per_epoch:
            output = np.array(output)
            return np.average(output[:, :-1], 0, weights=output[:, -1])


epoch = step = logstep = loss = 0
best_val_loss = np.inf
best_weights = None
patience = es_patience
results = []
for batch in loader_tr:
    step += 1
    loss, acc = train_step(*batch)
    results.append((loss, acc))
    if step == loader_tr.steps_per_epoch:
        step = 0
        epoch += 1
        loss, acc = np.mean(results, 0)
        # Compute validation loss and accuracy
        val_loss, val_acc = evaluate(loader_va)
        print(
            "Ep. {} - Loss: {:.3f} - Acc: {:.3f} - Val loss: {:.3f} - Val acc: {:.3f}".format(
                epoch, *np.mean(results, 0), val_loss, val_acc
            )
        )
        tf.summary.scalar(name='Train_loss', data=loss, step=epoch)
        tf.summary.scalar(name='Train_Acc', data=acc, step=epoch)
        # Check if loss improved for early stopping
        if val_loss < best_val_loss:
            best_val_loss = val_loss
            patience = es_patience
            print("New best val_loss {:.3f}".format(val_loss))
            best_weights = model.get_weights()
        else:
            patience -= 1
            if patience == 0:
                print("Early stopping (best val_loss: {})".format(best_val_loss))
                break
        results = []

logWriter.flush()
logWriter.close()
################################################################################
# Evaluate model
################################################################################

model.set_weights(best_weights)  # Load best model
test_loss, test_acc = evaluate(loader_te)
model.save(logdir, save_format="tf")
print("Done. Test loss: {:.4f}. Test acc: {:.2f}".format(test_loss, test_acc))
