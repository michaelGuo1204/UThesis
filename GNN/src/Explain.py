from spektral.data import DisjointLoader
from spektral.transforms.normalize_adj import NormalizeAdj

from Net import *
from Utili import *

################################################################################
# Load data
################################################################################
batch_size = 32
epochs = 300
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
# Explain model
################################################################################

model = GeneralGNN(data.n_labels, activation='softmax')
model.built = True
model.load_weights('./logs/1647925223.765264/variables/variables')
(x, a, i), y = next(loader_te)

cut_idx = (i == 0).sum()
x_exp = x[:cut_idx]
a_exp = tf.sparse.slice(a, start=[0, 0], size=[cut_idx, cut_idx])
explainer = GNNExplainer(model, graph_level=True, x_size_coef=0.001)

# Explain prediction for one graph
adj_mask, feat_mask = explainer.explain_node(x=x_exp, a=a_exp)

# Plot the result
G = explainer.plot_subgraph(adj_mask, feat_mask)
plt.savefig('Sub.png')
plt.show()
