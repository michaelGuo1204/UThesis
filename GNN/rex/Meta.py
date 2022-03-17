import numpy as np
import pandas as pd
# from tensorflow.keras.utils import to_categorical
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
data = pd.read_csv('../Data/fs.csv')
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
data = data.iloc[np.random.permutation(len(data))].reset_index(drop=True)
data = data.values
X = data[:, 1:-1]
# X_onehot=seq_to_one_hot(X)
# X[X==2]=1
Y = data[:, -1]
# np.savez('XY.npz', X_onehot, Y)
# X_r=one_hot_to_seq(X)
# np.savez("../Data/EY.npz", X, Y)
# X = np.squeeze(X)
# Y = np.squeeze(Y)
# X=normalize(X)
'''
lsvc = LinearSVC(C=0.01, penalty="l1", dual=False).fit(X, Y)
model = SelectFromModel(lsvc, prefit=True)
X_new = model.transform(X)

X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.2,random_state=1)
print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)
clf = ak.StructuredDataClassifier()  # It tries 3 different models.
# Feed the structured data classifier with training data.
clf.fit(X_train, y_train,validation_data=(X_test,y_test),shuffle=True,batch_size=64,verbose=1)#,validation_data=(X_test,y_test))

# Evaluate the best model with testing data.
print(clf.evaluate(X_test,y_test))
model=clf.export_model()
try:
    model.save("model_autokeras", save_format="tf")
except Exception:
    model.save("model_autokeras.h5")
'''
'''
selector = SelectKBest(chi2, k =10)
X_new=selector.fit_transform(X, Y)
lsvc = LinearSVC(C=0.01, penalty="l1", dual=False).fit(X, Y)
model = SelectFromModel(lsvc, prefit=True)
X_new = model.transform(X)
'''
automl = AutoML(mode='Explain',
                eval_metric='auc')  # ,algorithms=['Neural Network'],total_time_limit=10,stack_models=False,train_ensemble=False,ml_task='binary_classification')
automl.fit(X, Y)
# automl.predict(X_test)
automl.report()
