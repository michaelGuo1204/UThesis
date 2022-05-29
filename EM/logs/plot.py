import re
from itertools import cycle

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib.cm import get_cmap
from scipy.interpolate import make_interp_spline

name = "tab10"
cmap = get_cmap(name)
colors = cycle(cmap.colors)
file = open('./jbl.log', 'r')
data = []
exclude = ['Early stopping', 'GNN training complete', 'ADJ produced', 'Preprocessing']
exgroup = True
Start = True
group = []
count = 0
for line in file.readlines():
    line = line[:-1]
    if 'No' in line:
        groupname = line.split(' ')[0]
        if not Start:
            groupdata = pd.DataFrame(group)
            groupdata.columns = ['Train Loss', 'Train acc', 'Val loss', 'Val acc', 'Val auc', 'Test loss', 'Test acc',
                                 'Test auc']
            data.append(groupdata)
        Start = False
        group = []
        continue
    if line in exclude:
        continue

    count += 1
    dataline = re.split(':| \| |,', line)
    group.append(dataline[1::2])
    pass
groupdata = pd.DataFrame(group)
groupdata.columns = ['Train Loss', 'Train acc', 'Val loss', 'Val acc', 'Val auc', 'Test loss', 'Test acc',
                     'Test auc']
data.append(groupdata)

for chart in groupdata.columns:
    sum = 0
    num_iter = 0
    plt.cla()
    plt.title("{} Curve".format(chart))
    for iter in data:
        x_space = np.array(range(sum, sum + iter.shape[0]))
        y = np.array(iter[chart].values).astype(np.float)
        cubic_interploation_model = make_interp_spline(x_space, y)
        # Plotting the Graph
        x = np.linspace(x_space.min(), x_space.max(), 500)
        y = cubic_interploation_model(x)
        plt.scatter(x, y, s=1, color=next(colors), label="No.{} iteration".format(num_iter))
        fig = plt.gca()
        fig.axes.get_xaxis().set_ticks([])
        num_iter += 1
        sum += iter.shape[0]

        pass
    plt.legend(loc='center left', bbox_to_anchor=(1, 0.5),
               fancybox=True, shadow=True)
    plt.xlabel('Iterations')
    plt.tight_layout()
    plt.savefig('../plots/jbl/{}.svg'.format(chart), dpi=1200)
    pass
pass
