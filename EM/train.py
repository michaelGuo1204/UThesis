from tensorflow.keras.losses import BinaryCrossentropy
from tensorflow.keras.optimizers import Adam

from EM import EstimateAdj
from Utils import TDataset

# Parameters
batch_size = 512  # Batch size
epochs = 50  # Number of training epochs
patience = 30  # Patience for early stopping

# Load data
data = TDataset()

# Create model
optimizer = Adam(learning_rate=1e-4)
loss_fn = BinaryCrossentropy()
em = EstimateAdj(data.n_nodes)
em.EMlearning(batch_size, patience, epochs, optimizer, loss_fn, data)
