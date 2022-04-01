import networkx as nx
import networkx as nx
import pandas
from spektral.data import BatchLoader
from spektral.transforms.normalize_adj import NormalizeAdj

from Net import Net

################################################################################
# Hyper Params
################################################################################
a_threshold_list = [0.35, 0.345, 0.34, 0.335, 0.33, 0.325, 0.32, 0.31]  # HIGHEST FIRST!!!
layouts = [nx.layout.spring_layout, nx.layout.circular_layout]
batch_size = 1
epochs = 300
################################################################################
# Load data
################################################################################
file = pandas.read_csv('../Data/fs100.csv')
header = file.columns[1:-1]
data = WKDataset(load=True, n_traits=100, transforms=NormalizeAdj())
# Data loaders
loader = BatchLoader(data, batch_size=128, shuffle=False)

################################################################################
# Load Model
################################################################################

model = Net(0)
model.built = True
model.load_weights('./logs/64 GNN2 0.69 3/variables/variables')

data = pandas.DataFrame()
step = 0
for case in loader:
    step = step + 1
    inputs, targets = case
    out = model.output(inputs).numpy()
    df = pandas.DataFrame(out)
    data = pandas.concat([data, df])
    print(step)
    if step == loader.steps_per_epoch: break
data.to_csv('./Encoded.csv', index=False)
pass
