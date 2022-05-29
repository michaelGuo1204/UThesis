import matplotlib.pyplot as plt
import matplotlib.pyplot as plt
import networkx as nx
import pandas
from spektral.data import DisjointLoader
from spektral.models import GNNExplainer
from spektral.transforms.normalize_adj import NormalizeAdj

from Net import *
from Utils import *


def amExtract(G, a_threshold):
    edgelist = G.edges()
    blank = np.zeros((200, 200))
    for edge in edgelist:
        blank[edge[0], edge[1]] = 1
        blank[edge[1], edge[0]] = 1
    np.savez("../Data/Explain{}.npz".format(a_threshold), blank)


################################################################################
# Hyper Params
################################################################################
a_threshold_list = [0.33, 0.325, 0.32, 0.315, 0.31, 0.3]  # HIGHEST FIRST!!!
layouts = [nx.layout.spring_layout]  # , nx.layout.circular_layout]
batch_size = 1
epochs = 300
################################################################################
# Load data
################################################################################
file = pandas.read_csv('../Data/fs100.csv')
header = file.columns[1:-1]
data = TDataset(load=True, n_traits=200, transforms=NormalizeAdj())
# Data loaders
loader = DisjointLoader(data, batch_size=batch_size, epochs=epochs)

################################################################################
# Load Model
################################################################################

model = Net(0)
model.built = True
model.load_weights('./logs/New')
while True:
    (x, a, i), y = next(loader)
    if y == 1: break
cut_idx = (i == 0).sum()
x_exp = x[:cut_idx]
a_exp = tf.sparse.slice(a, start=[0, 0], size=[cut_idx, cut_idx])
explainer = GNNExplainer(model, graph_level=True)

# Explain prediction for one graph
adj_mask, feat_mask = explainer.explain_node(x=x_exp, a=a_exp)

#####################################################################
# Visualized the data
###################################################################
for layout in layouts:
    highest = True
    group = {}
    for a_threshold in a_threshold_list:
        # Get the sub graph thresholded by a
        G_r = explainer.plot_subgraph(adj_mask, feat_mask, a_thresh=a_threshold)
        # TODO: Integrated the code into spektral
        plt.close()  # Close first cuz the plot_subgraph will draw on plt
        plt.figure(dpi=1200)
        giant = max(nx.algorithms.components.connected_components(G_r), key=len)  # Select biggest connected subgraph

        G = G_r.subgraph(giant)
        pos = layout(G)  # Choose the circular form
        G_unf = nx.Graph(G)  # Unfrozen the graph to remove the self looped
        G_unf.remove_edges_from(nx.selfloop_edges(G_unf))
        G = G_unf
        amExtract(G, a_threshold)
        # Find the biggest smallest 0.9 biggest degrees
        d = dict(G.degree)

        '''low, *_, high = sorted(d.values())
        norm = mpl.colors.Normalize(vmin=low, vmax=high, clip=True)
        mapper = mpl.cm.ScalarMappable(norm=norm, cmap=mpl.cm.coolwarm)  # Create color map
        if highest:
            group = dict(G.degree)
            highest = False
        qua = np.quantile(list(d.values()), 0.75)
        # Draw!
        labels = {node: header[node] for (node, val) in d.items() if node in group or val > qua}
        nx.draw_networkx_nodes(G, pos=pos, node_size=30, node_color=[mapper.to_rgba(i) for i in d.values()])
        nx.draw_networkx_edges(G, pos=pos, edge_color="grey", alpha=0.8)
        nx.draw_networkx_labels(
            G, pos=pos, labels=labels, font_color="black", font_size=10, verticalalignment="bottom"
        )
        name = str(layout).split(' ')[1].split('_')[0]
        plt.show()
        pass
        # plt.savefig('../result/10k GNN explainer/{}Sub{}.png'.format(name, a_threshold))
        '''
