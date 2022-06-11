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
        snpcase['cluster'] = id
        snpcollection = pandas.concat([snpcollection, snpcase])
    clusterfieldsummary = clusterFieldDisplay(snpcollection, id)
    clustertraitsummary = clusterTraitDisplay(snpcollection, id)
    return clusterfieldsummary, clustertraitsummary, snpcollection


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
    fig.autofmt_xdate(rotation=45)
    # plt.savefig("./Cluster/Cluster {} bar.svg".format(clusterid), dpi=1200)
    fig, ax = plt.subplots(figsize=(10, 10))
    plt.pie(count.tolist(), explode=explode, labels=count.axes[0].tolist())
    plt.title("Cluster {}".format(clusterid))
    # plt.savefig("./Cluster/Cluster {}.svg".format(clusterid), dpi=1200)
    cluster['log'] = -np.log10(cluster['p'])
    labels, index = np.unique(cluster["field"], return_inverse=True)
    fig, ax = plt.subplots(figsize=(30, 10))
    cluster = cluster[cluster['log'] < 20]
    # cluster = cluster[cluster['field'].isin(['Activities','Environment','Cell'])]
    sns.boxplot(x="field", y="log", data=cluster, palette="Set2")
    sns.swarmplot(x="field", y="log", data=cluster)
    # ax.legend(loc='right', bbox_to_anchor=(1.1, 0.6), ncol=1, title="Field")
    # plt.ylim(4, 20)
    # plt.xticks(color='w')
    plt.title("P values of cluster {}".format(clusterid))
    fig.autofmt_xdate(rotation=45)
    # plt.savefig("./Cluster/BOX of cluster {}.svg".format(clusterid), dpi=1200)
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
    # plt.savefig("./Cluster/Cluster {} inner.svg".format(id), dpi=1200)
    return inner


def drawViolin(data):
    fieldlist = [y for x, y in data.groupby('field')]
    for field in fieldlist:
        fieldname = field['field'].sample(n=1).values[0]
        fig, ax = plt.subplots(figsize=(30, 10))
        field['log'] = -np.log10(field['p'])
        field = field[field['log'] < 20]
        # cluster = cluster[cluster['field'].isin(['Activities','Environment','Cell'])]
        sns.violinplot(x="cluster", y="log", data=field, scale='count', palette="Set2")
        sns.swarmplot(x="cluster", y="log", data=field)
        # ax.legend(loc='right', bbox_to_anchor=(1.1, 0.6), ncol=1, title="Field")
        # plt.ylim(4, 20)
        # plt.xticks(color='w')
        plt.title("P values of Field {}".format(fieldname))
        # plt.savefig("./Cluster/Violin of {}.svg".format(fieldname), dpi=1200)
        pass


def drawHeatMap(whole):
    whole = whole.head(20).set_index('field')
    whole.columns = ['Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Cluster 5', 'Cluster 6']
    fig, ax = plt.subplots(figsize=(10, 10))
    whole = whole.fillna(0)
    # And see the result
    df_norm_col = (whole - whole.mean()) / whole.std()
    sns.heatmap(df_norm_col, cmap='viridis')
    plt.xticks(rotation=30)
    plt.title("Heatmap")
    plt.savefig("./Cluster/heatmap_col.svg", dpi=1200)

    df_norm_row = whole.apply(lambda x: (x - x.mean()) / x.std(), axis=1)

    fig, ax = plt.subplots(figsize=(10, 10))
    # And see the result
    sns.heatmap(df_norm_row, cmap='viridis')
    plt.title("Heatmap")
    plt.savefig("./Cluster/heatmap_row.svg", dpi=1200)
    pass


plt.rcParams['font.size'] = '20'
clusterlists = readSNPlist()
snpdetail = readJSON()
id = 1
wholedata = pandas.DataFrame()
for cluster in clusterlists:
    field, traits, all = clusterThreshold(cluster, snpdetail, id)
    traits.to_csv('./traits/{}traits.csv'.format(id), header=False)
    id += 1
    wholedata = pandas.concat([wholedata, all])
    if id == 2:
        whole = field
        continue
    whole = pandas.merge(whole, field, on=['field'], how='outer')

drawViolin(wholedata)
drawHeatMap(whole)
