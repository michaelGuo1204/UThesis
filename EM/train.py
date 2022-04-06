from spektral.datasets.mnist import MNIST
from tensorflow.keras.losses import SparseCategoricalCrossentropy
from tensorflow.keras.optimizers import Adam

from Model import Net

# Parameters
batch_size = 32  # Batch size
epochs = 5  # Number of training epochs
patience = 10  # Patience for early stopping

# Load data
data = MNIST()

# Create model
optimizer = Adam()
loss_fn = SparseCategoricalCrossentropy()
model = Net(batch_size, patience, epochs, optimizer, loss_fn)
model.EMlearning(data)
