import json
import re

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np
import pandas
import pandas as pd
import paramiko
import progressbar
import requests
import seaborn as sns
from sklearn.feature_selection import SelectFromModel, SelectKBest, chi2
from sklearn.svm import LinearSVC


def phenoSelect():
    data = pandas.read_csv("../Data/41270.csv")
    pla = pandas.read_csv("../Data/Criteria/Pheno_include.csv")
    plabel = pla["ICD"].tolist()
    nla = pandas.read_csv("../Data/Criteria/Pheno_exclude.csv")
    nlabel = nla["ICD"].tolist()
    hit = []
    phenos = data.to_numpy().tolist()
    for row in phenos:
        p = set.intersection(set(row), set(plabel))
        n = set.intersection(set(row), set(nlabel))
        if len(p) > 0:
            hit.append([row[0], 1])
        elif len(n) == 0:
            hit.append([row[0], 0])
        pass

    label = pandas.DataFrame(hit)
    label.to_csv("../Data/Labels.csv", index=False)

def convertToBE():
    print('Load')
    SNPcollect = pandas.read_csv("../Data/MAP/SNPManual.csv")

    Labels = pandas.read_csv("../Data/Labels.csv")
    # includeFlag = pandas.DataFrame(data.Cases.isin(Labels['Cases']).astype(int))

    snplist = SNPcollect['SNV']

    prb1 = progressbar.ProgressBar(50)
    prb1.init()
    chunksize = 1000
    i = 0
    for chunk in pd.read_csv("../Data/Geno.csv", chunksize=chunksize):
        print('Convert')
        data = pandas.DataFrame()
        data['Cases'] = chunk['Cases']
        prb = progressbar.ProgressBar()
        prb.init()
        for snp in prb(snplist):
            if not snp in list(chunk.columns): continue
            pair = SNPcollect.loc[SNPcollect['SNV'] == snp]
            EA = np.array_str(pair['EA'].values).split('\'')[1].upper()
            # NEA = pair['NEA'].values
            data[snp] = [case.count(EA) for case in chunk[snp]]
        print('{} chunk dealed!'.format(i))
        data.to_csv('../Data/Cache{}.csv'.format(i), index=False)
        prb1.update(1)
        i += 1

    print('Find')
    data = pandas.DataFrame()
    for i in range(0, 50):
        input = pandas.read_csv('../Data/Cache{}.csv'.format(i))
        Whole = pandas.merge(input, Labels, on=['Cases'])
        data = pandas.concat([data, Whole])
        print('{}\n'.format(i))
    number = data['Label'].value_counts()
    pdata = data.loc[data['Label'] == 1]
    zdata = data.loc[data['Label'] == 0]
    dealed = zdata.sample(7000)
    New = pandas.concat([dealed, pdata])
    New.sample(frac=1)
    New.to_csv("../Data/beDataset_b.csv", index=False)


def mergeIds():
    data = pandas.read_csv('../Data/GWAS/MAF-selected_8000.csv')
    ids = data['MarkerName'].apply(lambda x: x.split('_')[0])
    EA = data['Allele1']
    data = pandas.concat([ids, EA], axis=1)
    all = pandas.DataFrame()
    for chro in range(1, 24):
        if chro in [5, 7, 10, 13, 14, 17, 18, 21, 22, 23]: continue
        map = pandas.read_table('../Data/MAP/Chrome{}.map'.format(chro), header=None)
        map[2] = map[0].astype(str) + ':' + map[3].astype(str)
        pi = pandas.concat([map[2], map[1]], axis=1)
        pi.columns = ['MarkerName', 'SNV']
        all = pandas.concat([all, pi])
        pass
    content = pandas.merge(data, all, on=['MarkerName'], how='outer')
    content = content[content['SNV'].notna()]
    content.columns = ['Marker', 'EA', 'SNV']
    content.to_csv('../Data/MAP/SNPManual.csv', index=False)
    pass


def GWASSelction():
    data = pandas.read_table('../Data/GWAS/GSK_UKBBv3_ArcoGEN-UKHLS-HRC_ALLOA_METAL_1.txt', sep='\t')
    pdata = data.loc[data['P-value'] < 1e-8]
    pdata.to_csv('../Data/GWAS/P-selected.csv', index_label=False)
    mafdata = pdata.loc[data['MinFreq'] > 0.01]
    mafdata.to_csv('../Data/GWAS/MAF-selected.csv', index_label=False)
    data = pandas.read_csv('../Data/GWAS/MAF-selected_8000.csv')
    cidx = data['MarkerName'].apply(lambda x: x.split('_')[0].split(":")[0])
    pidx = data['MarkerName'].apply(lambda x: x.split('_')[0].split(":")[1])
    call = pd.Series(range(997))
    cidx.reset_index(drop=True, inplace=True)
    pidx.reset_index(drop=True, inplace=True)
    call.reset_index(drop=True, inplace=True)
    output = pandas.concat([cidx, pidx, pidx, call], axis=1)
    output.to_csv('../Data/GWAS/task.csv', sep=' ', index=False)
    pass


def featureSelection():
    data = pd.read_csv('/home/bili/Lernen/Data/beDataset_b80.csv')
    # data = data.iloc[np.random.permutation(len(data))].reset_index(drop=True)
    header = data.columns[1:-1]
    datav = data.values
    chiSelect = False
    X = datav[:, 1:-1]
    Y = datav[:, -1]
    lsvc = LinearSVC(C=0.01, penalty="l1", dual=False).fit(X, Y)
    model = SelectFromModel(lsvc, prefit=True)
    header_new = model.transform(header.values.reshape(1, -1))
    X_new = model.transform(X)
    if chiSelect:
        model = SelectKBest(chi2, k=100)
        header = header[model[1] < 0.00000000000000001]
        dealed = datav[:, 1:-1][:, model[1] < 0.00000000000000001]
        X_new = model.fit_transform(X, Y)
    header_new = model.get_feature_names_out(header.values)
    dealeddf = pd.DataFrame(X_new)
    dealeddf.columns = header_new[0, :]
    Result = pandas.concat([data['Cases'], dealeddf, data['Label']], axis=1)
    Result.to_csv("../Data/fs.csv", index=False)
    pass


def csvToNP():
    file = pandas.read_csv('../Data/fs100.csv')
    file = file.to_numpy()
    X = file[:, 1:-1]
    # X_onehot=seq_to_one_hot(X)
    # X[X == 2] = 1
    Y = file[:, -1]
    np.savez("../Data/fs100.npz", X, Y)

def makeManual():
    alldata = pandas.read_csv('../Data/GWAS/MAF-selected_8000.csv')
    ids = alldata['MarkerName'].apply(lambda x: x.split('_')[0])
    EA = alldata['Allele1']
    EAF = alldata['Freq1']
    effect = alldata['Effect']
    p = alldata['P-value']
    data = pandas.concat([ids, EA, EAF, effect, p], axis=1)
    idlist = pandas.read_csv('../Data/MAP/SNPManual.csv')
    content = pandas.merge(data, idlist, on=['MarkerName'], how='outer')
    content = content[content['SNV'].notna()]
    content.to_csv('../Data/Criteria/SNPManual.csv', index=False)
    pass


def corrCalculation():
    data = pandas.read_csv('../Data/fs100.csv')
    data = data.drop(['Cases', 'Label'], axis=1)
    corr = data.corr()
    sns.heatmap(corr)
    plt.show()
    # Transform it in a links data frame (3 columns only):
    links = corr.stack().reset_index()
    links.columns = ['var1', 'var2', 'value']
    # Keep only correlation over a threshold and remove self correlation (cor(A,A)=1)
    links_filtered = links.loc[(links['value'] > 0) & (links['var1'] != links['var2'])]
    # Build your graph
    G = nx.from_pandas_edgelist(links_filtered, 'var1', 'var2')
    # Plot the network:
    dia = nx.diameter(G, e=None, usebounds=False)
    nx.draw(G, with_labels=True, node_color='orange', node_size=40, edge_color='black', linewidths=1, font_size=15)
    plt.show()
    am = nx.adjacency_matrix(G).A
    np.savez("../Data/fsaj.npz", am)
    pass


def supplemtPhenoExtract():
    phenolist = pandas.read_csv("../Data/Criteria/32883.csv")
    phenolist = phenolist.loc[phenolist['Accept'] == 1]
    caselist = pandas.read_csv('../Data/fs100.csv').iloc[:, [0, 101]]
    caselist.columns = ['eid', 'label']
    whole = caselist
    # Open a transport
    host, port = "58.206.100.246", 22222
    transport = paramiko.Transport((host, port))

    # Auth
    username, password = "GQR", "guoqirui"
    transport.connect(None, username, password)

    # Go!
    sftp = paramiko.SFTPClient.from_transport(transport)

    for index in phenolist['ID']:
        data = sftp.file('/home/WJH/data/phenotype/zl/test/ukb32833/{}.csv'.format(index))
        data = pandas.read_csv(data).iloc[:, 0:2]
        print(index)
        whole = pandas.merge(whole, data, on=['eid'], how='inner')

    whole.to_csv('../Data/Phenos.csv', index=False)

    pass


def snpLookup():
    data = pandas.read_csv("../../EM/VEM/Cluster.csv")
    SNP = data['SNPS']
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
    with open("../../EM/VEM/snp.json", "w") as outfile:
        outfile.write(jsonfile)
    pass


# phenoSelect()
# mergeIds()
# convertToBE()
# GWASSelction()
# featureSelection()
# csvToNP()
# makeManual()
# corrCalculation()
# safsd()
# supplemtPhenoExtract()
snpLookup()
