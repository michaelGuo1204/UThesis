import numpy as np
import pandas
import pandas as pd
import progressbar
from sklearn.feature_selection import chi2


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
    # Whole.to_csv("../Data/Label.csv",index=False)
    dealed = zdata.sample(n=7000)
    New = pandas.concat([dealed, pdata])
    New.sample(frac=1)
    New.to_csv("../Data/beDataset.csv", index=False)


def mergeIds():
    data = pandas.read_csv('../Data/GWAS/MAF-selected.csv')
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
    data = pandas.read_csv('../Data/GWAS/MAF-selected.csv')
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
    data = pd.read_csv('../Data/beDataset_b.csv')
    # data = data.iloc[np.random.permutation(len(data))].reset_index(drop=True)
    header = data.columns[1:-1]
    datav = data.values

    X = datav[:, 1:-1]
    # X_onehot=seq_to_one_hot(X)
    # X[X == 2] = 1
    Y = datav[:, -1]
    select = chi2(X, Y)
    header = header[select[1] < 0.01]
    dealed = datav[:, 1:-1][:, select[1] < 0.01]
    dealeddf = pd.DataFrame(dealed)
    dealeddf.columns = header
    Result = pandas.concat([data['Cases'], dealeddf, data['Label']], axis=1)
    Result.to_csv("../Data/fs.csv", index=False)
    pass


def csvToNP():
    file = pandas.read_csv('../Data/fs.csv')
    file = file.to_numpy()
    X = file[:, 1:-1]
    # X_onehot=seq_to_one_hot(X)
    # X[X == 2] = 1
    Y = file[:, -1]
    np.savez("../Data/fs.npz", X, Y)


# phenoSelect()
# mergeIds()
# convertToBE()
# GWASSelction()
# featureSelection()
csvToNP()
