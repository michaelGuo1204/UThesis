import time

from spektral.data import DisjointLoader
from spektral.transforms import LayerPreprocess
from tensorflow.keras.losses import BinaryCrossentropy
from tensorflow.keras.metrics import binary_accuracy
from tensorflow.keras.optimizers import Adam

from Net import *
from Utils import *

################################################################################
# Config
################################################################################
learning_rate = 1e-3  # Learning rate
epochs = 30  # Number of training epochs
es_patience = 10  # Patience for early stopping
batch_size = 256  # Batch size

################################################################################
# Load data
################################################################################
# CHANGE TRANSFORMS WHEN MODIFYING THE MODEL
data = TDataset(load=True, n_traits=200, transforms=[LayerPreprocess(ChebConv)])
# Train/valid/test split
# data.a = sp.csr_matrix(np.load("../Data/fsaj.npz", allow_pickle=True)['arr_0'])
# data.a = GCNConv.preprocess(data.a)
# data.a = sp_matrix_to_sp_tensor(data.a)
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
# model = GeneralGNN(data.n_labels, activation='sigmoid')
model = Net(0)
optimizer = Adam(learning_rate=learning_rate, decay=0.05)
loss_fn = BinaryCrossentropy()
logdir = "./logs/{}".format(time.time())
logWriter = tf.summary.create_file_writer(logdir)
logWriter.set_as_default()
logWriter.init()
logstep = 0


# Get model summary as a string
def get_summary_str(model):
    lines = []
    model.summary(print_fn=lines.append)
    # Add initial spaces to avoid markdown formatting in TensorBoard
    return '    ' + '\n    '.join(lines)


def write_string_summary(writer, s):
    with writer.as_default():
        tf.summary.text('Model configuration', s, step=0)


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
    m = tf.keras.metrics.AUC(num_thresholds=200)
    while step < loader.steps_per_epoch:
        step += 1
        inputs, target = loader.__next__()
        pred = model(inputs, training=False)
        pred = tf.cast(pred, dtype='float64')
        m.update_state(target, pred)
        outs = (
            loss_fn(target, pred),
            tf.reduce_mean(binary_accuracy(target, pred)),
            len(target),  # Keep track of batch size
        )
        output.append(outs)
        if step == loader.steps_per_epoch:
            output = np.array(output)
            loss, acc = np.average(output[:, :-1], 0, weights=output[:, -1])
            return loss, acc, m.result().numpy()


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
        val_loss, val_acc, val_auc = evaluate(loader_va)
        print(
            "Ep. {} - Loss: {:.3f} - Acc: {:.3f} - Val loss: {:.3f} - Val acc: {:.3f} - Val auc: {:.3f}".format(
                epoch, *np.mean(results, 0), val_loss, val_acc, val_auc
            )
        )
        tf.summary.scalar(name='Train_loss', data=loss, step=epoch)
        tf.summary.scalar(name='Train_Acc', data=acc, step=epoch)
        tf.summary.scalar(name='Valid_loss', data=val_loss, step=epoch)
        tf.summary.scalar(name='Valid_Acc', data=val_acc, step=epoch)
        tf.summary.scalar(name='AUC', data=val_auc, step=epoch)
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

################################################################################
# Evaluate model
################################################################################

model.set_weights(best_weights)  # Load best model
test_loss, test_acc, test_auc = evaluate(loader_te)
model.save(logdir, save_format="tf")
write_string_summary(logWriter, get_summary_str(model))
logWriter.flush()
logWriter.close()
print("Done. Test loss: {:.4f}. Test acc: {:.2f}. Test auc:{:.2f}".format(test_loss, test_acc, test_auc))
inputs, target = loader_te.__next__()
x = model.output(inputs)
pass
