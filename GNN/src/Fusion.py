import pandas
from spektral.data import DisjointLoader
from spektral.transforms import LayerPreprocess

from Net import Net, ChebConv
from Utils import TDataset

################################################################################
# Hyper Params
################################################################################
batch_size = 128

################################################################################
# Load data
################################################################################
file = pandas.read_csv('../Data/fs100.csv')
header = file.columns[1:-1]
data = TDataset(load=True, n_traits=200, transforms=[LayerPreprocess(ChebConv)])
# Data loaders
loader = DisjointLoader(data, batch_size=batch_size, shuffle=False)

################################################################################
# Load Model
################################################################################

model = Net(0)
model.built = True
model.load_weights('./logs/New/variables/variables')

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
