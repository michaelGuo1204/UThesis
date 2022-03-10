import numpy as np
from sklearn.model_selection import train_test_split
from supervised.automl import AutoML

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
data = np.load('../Data/NY.npz')
X = data['arr_0']
Y = data['arr_1']
# X_r=one_hot_to_seq(X)
# np.savez("../Data/NY.npz", X_r, Y)
X = np.squeeze(X)
Y = np.squeeze(Y)
for y in Y:
    if y > 0:
        y = 1
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.2)
automl = AutoML(mode='Explain', eval_metric='accuracy')
automl.fit(X_train, y_train)
automl.report()
