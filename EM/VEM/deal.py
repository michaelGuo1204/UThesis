import json

import matplotlib.pyplot as plt
import numpy as np
import pandas
import seaborn as sns

Clusterfile = './Cluster.csv'
SNPfile = './snp.json'
threshold = 1e-5
pmidexcept = ['30664745']


def readSNPlist():
    data = pandas.read_csv(Clusterfile)
    SNPlists = [y for x, y in data.groupby('Cluster')]
    return SNPlists


def readJSON():
    file = open(SNPfile)
    jsonfile = json.load(file)
    return jsonfile


# var order={"alph":0, "p":1, "n":2, "domain_alph":3, "domain_p":4};
def SNPanalysis(SNPcell):  # Select case by p-value, which is order[1]
    dataframe = pandas.DataFrame(SNPcell['data'])
    dataframe.columns = ['atlasid', 'p', 'pmid', 'year', 'field', 'traits', 'N', 'EA', 'NEA']
    dataframe = dataframe[dataframe['p'] < threshold]
    desiredcase = dataframe[~dataframe['pmid'].isin(pmidexcept)]
    return desiredcase


def clusterThreshold(dataframe, snpdic, id):
    snpcollection = pandas.DataFrame()
    for SNP in dataframe['SNPS']:
        snpcase = SNPanalysis(snpdic[SNP])
        snpcollection = pandas.concat([snpcollection, snpcase])
    clusterfieldsummary = clusterFieldDisplay(snpcollection, id)
    clustertraitsummary = clusterTraitDisplay(snpcollection, id)
    return clusterfieldsummary, clustertraitsummary


def clusterFieldDisplay(cluster, clusterid):
    cluster = cluster.sort_values('field')
    count = cluster.value_counts('field')
    others = count[count <= 10]
    count = count[count > 10]
    count['Others'] = others.count()
    explode = [0 for x in count.tolist()]
    explode[0] = 0.1
    fig, ax = plt.subplots(figsize=(30, 10))
    plt.bar(count.axes[0].tolist(), count.tolist())
    plt.title("Cluster {} bar".format(clusterid))
    plt.savefig("./Cluster/Cluster {} bar.svg".format(clusterid), dpi=1200)
    fig, ax = plt.subplots(figsize=(10, 10))
    plt.pie(count.tolist(), explode=explode, labels=count.axes[0].tolist())
    plt.title("Cluster {}".format(clusterid))
    plt.savefig("./Cluster/Cluster {}.svg".format(clusterid), dpi=1200)
    cluster['log'] = -np.log10(cluster['p'])
    labels, index = np.unique(cluster["field"], return_inverse=True)
    fig, ax = plt.subplots(figsize=(30, 10))
    sns.scatterplot(x=range(cluster.shape[0]), y="log", data=cluster, hue="field", palette="Set2")
    ax.legend(loc='right', bbox_to_anchor=(1.1, 0.6), ncol=1, title="Field")
    plt.ylim(4, 20)
    plt.xticks(color='w')
    plt.title("P values of cluster {}".format(clusterid))
    plt.savefig("./Cluster/P values of cluster {}.svg".format(clusterid), dpi=1200)
    return cluster.value_counts('field').reset_index(name=id)


def clusterTraitDisplay(cluster, clusterid):
    cluster['count'] = 1
    cluster = cluster[['field', 'traits', 'count']]
    outer = cluster.groupby('field').sum()
    inner = cluster.groupby(['field', 'traits']).sum()
    inner_labels = inner.index.get_level_values(1)
    fig, ax = plt.subplots(figsize=(10, 10))
    size = 0.3

    ax.pie(outer.values.flatten(), radius=1,
           labels=outer.index,
           wedgeprops=dict(width=size, edgecolor='w'))

    ax.pie(inner.values.flatten(), radius=1 - size,
           # labels=inner_labels,
           wedgeprops=dict(width=size, edgecolor='w'))

    ax.set(aspect="equal", title='Cluster{}'.format(id))
    plt.savefig("./Cluster/Cluster {} inner.svg".format(id), dpi=1200)
    return inner


def drawHeatMap(whole):
    whole = whole.set_index('field')
    fig, ax = plt.subplots(figsize=(10, 10))
    # And see the result
    df_norm_col = (whole - whole.mean()) / whole.std()
    sns.heatmap(df_norm_col, cmap='viridis')
    plt.title("Heatmap")
    plt.savefig("./Cluster/heatmap_col.svg", dpi=1200)

    df_norm_row = whole.apply(lambda x: (x - x.mean()) / x.std(), axis=1)

    fig, ax = plt.subplots(figsize=(10, 10))
    # And see the result
    sns.heatmap(df_norm_row, cmap='viridis')
    plt.title("Heatmap")
    plt.savefig("./Cluster/heatmap_row.svg", dpi=1200)
    pass


clusterlists = readSNPlist()
snpdetail = readJSON()
id = 1

for cluster in clusterlists:
    field, traits = clusterThreshold(cluster, snpdetail, id)
    traits.to_csv('./traits/{}traits.csv'.format(id), header=False)
    id += 1
    if id == 2:
        whole = field
        continue
    whole = pandas.merge(whole, field, on=['field'], how='outer')

drawHeatMap(whole)
