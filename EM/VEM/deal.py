import json
import re

import matplotlib.pyplot as plt
import numpy as np
import pandas
import progressbar
import requests
import seaborn as sns

Clusterfile = './Cluster.csv'
SNPfile = './snp.json'
threshold = 1e-5
pmidexcept = ['30664745']


def snpLookup():
    data = pandas.read_csv("./Cluster.csv")
    SNP = data['SNPs']
    url = "https://atlas.ctglab.nl/PheWAS"
    headers_re = {
        'accept': 'text/html,application/xhtml+xml,application/xml',
        'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'
    }
    request_au = requests.get(url, headers=headers_re)
    cookies = requests.utils.dict_from_cookiejar(request_au.cookies)
    reg = r'<meta name="csrf-token" content="(.*)"/>'
    pattern = re.compile(reg)
    string = request_au.content.decode('UTF-8')
    result = pattern.findall(string)
    headers = {
        'Accept': '* / *',
        'Accept-Encoding': 'gzip,deflate,br',
        'Accept-Language': 'zh-CN,zh;q=0.9',
        'Connection': 'keep-alive',
        'Content-Length': '30',
        'Content-Type': 'application/x-www-form-urlencoded; charset = UTF-8',
        'Cookie': 'XSRF-TOKEN={}; atlas_session={}'.format(cookies['XSRF-TOKEN'], cookies['atlas_session']),
        'Host': 'atlas.ctglab.nl',
        'Origin': 'https://atlas.ctglab.nl',
        'Referer': 'https://atlas.ctglab.nl/PheWAS',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-origin',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36',
        'X-CSRF-TOKEN': result[0],
        'X-Requested-With': 'XMLHttpRequest'
    }
    datadic = {}
    prb = progressbar.ProgressBar()
    for snp in prb(SNP):
        dataFormat = {
            "text": snp,
            "ids": "",
            "maxP": "0.05"
        }
        response = requests.post(url + "/getData", headers=headers, data=dataFormat, allow_redirects=True)
        finaldata = response.json()
        datadic[snp] = finaldata

    jsonfile = json.dumps(datadic)
    with open("./snp.json", "w") as outfile:
        outfile.write(jsonfile)
    pass


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
    for SNP in dataframe['SNPs']:
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


# snpLookup()
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
