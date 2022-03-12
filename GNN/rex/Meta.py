import numpy as np
from sklearn.model_selection import train_test_split
from tensorflow.keras.utils import to_categorical
from sklearn.preprocessing import normalize
from supervised.automl import AutoML
import pandas as pd
onehot2seq = {0: 0, 1: 'A', 2: 'G', 3: 'C', 4: 'T'}


def one_hot_to_seq(X_onehot):  # input size should be (m, Tx)
    num_classes = 5  # the 5th number is left for N in the paper, namely a random nucleotide
    X = []  # a list of (Tx,5) arrays

    for x in X_onehot:
        r = []
        for row in x:
            x_r = [i for i in range(len(row)) if row[i] == 1]
            r.append(x_r)
        X.append(r)
    return np.array(X)


seq2one_hot = {'0': 0, 'A': 1, 'G': 2, 'C': 3, 'T': 4}


def seq_to_one_hot(X):  # input size should be (m, Tx)
    num_classes = 5  # the 5th number is left for N in the paper, namely a random nucleotide
    X_onehot = []  # a list of (Tx,5) arrays
    for x in X:
        x = [seq2one_hot[i] for i in x]
        x_onehot = np.zeros((len(x), num_classes))
        for idx in range(len(x)):
            x_onehot[idx, :] = to_categorical(x[idx], num_classes=num_classes)

        X_onehot.append(x_onehot)

    return np.array(X_onehot)


'''
file=pandas.read_excel('../Data/DVT-metabolomics.xlsx')
file=file.iloc[:,1:]
file=file.replace('DVT',1)
file=file.replace('non-DVT',0)
Y=np.array(file['Label'])
file=file.iloc[:,1:]
X=np.array(file)
np.savez("../Data/Meta.npz", X, Y)
'''
data = pd.read_csv('../Data/beDataset.csv')
'''for colum in data.columns:
    if colum == 'Cases' or colum=='Labels':continue
    str=data[colum].str
    data[colum]=data[colum].str.replace(r'(G)\w','4',regex=True)
    data[colum]=data[colum].str.replace(r'(C)\w','3',regex=True)
    data[colum]=data[colum].str.replace(r'(T)\w','2',regex=True)
    data[colum]=data[colum].str.replace(r'(A)\w','1',regex=True)
    data[colum]=data[colum].str.replace(r'(0)\w','0',regex=True)
data.to_csv('../Data/bnDataset.csv',index=False)
'''
data=data.to_numpy()
X = data[:,1:-1]
#X_onehot=seq_to_one_hot(X)
Y = data[:,-1]
# np.savez('XY.npz', X_onehot, Y)
# X_r=one_hot_to_seq(X)
#np.savez("../Data/EY.npz", X, Y)
# X = np.squeeze(X)
# Y = np.squeeze(Y)
#X=normalize(X)
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.2,stratify=Y)
automl = AutoML(mode="Explain", eval_metric='accuracy',mix_encoding=True)
automl.fit(X_train, y_train)
automl.predict(X_test)
automl.report()
