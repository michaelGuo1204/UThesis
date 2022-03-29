import matplotlib.pyplot as plt
import numpy as np
import pandas
import pandas as pd
import scikitplot as skplt
from sklearn.feature_selection import SelectFromModel, SelectKBest, chi2
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import roc_auc_score, r2_score
from sklearn.model_selection import train_test_split
from sklearn.svm import LinearSVC
from supervised.automl import AutoML


def mlClassification(X, Y, data, header, selector):
    if selector:
        selector = SelectKBest(chi2, k=100)
        X_new = selector.fit_transform(X, Y)
    else:
        lsvc = LinearSVC(C=0.01, penalty="l1", dual=False).fit(X, Y)
        model = SelectFromModel(lsvc, max_features=100, prefit=True)
        X_new = model.transform(X)
        # header_new = model.transform(header.values.reshape(1, -1))
        # dealeddf = pd.DataFrame(X_new)
        # dealeddf.columns = header_new[0, :]
        # Result = pandas.concat([data['Cases'], dealeddf, data['Label']], axis=1)
        # Result.to_csv("../Data/fs100.csv", index=False)

    automl = AutoML(mode='Explain',
                    eval_metric='auc')  # ,algorithms=['Neural Network'],total_time_limit=10,stack_models=False,train_ensemble=False,ml_task='binary_classification')
    automl.fit(X_new, Y)
    # automl.predict(X_test)
    automl.report()


'''
def dlClassification(X, Y, selector):
    lsvc = LinearSVC(C=0.01, penalty="l1", dual=False).fit(X, Y)
    model = SelectFromModel(lsvc, prefit=True)
    X_new = model.transform(X)

    X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.2, random_state=1)
    print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)
    clf = ak.StructuredDataClassifier()  # It tries 3 different models.
    # Feed the structured data classifier with training data.
    clf.fit(X_train, y_train, validation_data=(X_test, y_test), shuffle=True, batch_size=64,
            verbose=1)  # ,validation_data=(X_test,y_test))

    # Evaluate the best model with testing data.
    print(clf.evaluate(X_test, y_test))
    model = clf.export_model()
    try:
        model.save("model_autokeras", save_format="tf")
    except Exception:
        model.save("model_autokeras.h5")
'''


def prsAnalysis(X, Y, header):
    manual = pandas.read_csv('../Data/Criteria/SNPManual.csv')
    manual = manual.drop_duplicates(subset='SNV')
    manual = manual.set_index('SNV')
    manual = manual.reindex(header, axis=0)
    effect = manual['Effect'].values
    result = []
    for row in X:
        result_row = np.asscalar(np.dot(row.reshape(1, -1), effect.reshape(-1, 1)))
        result.append(result_row)
    X_train, X_test, Y_train, Y_test = train_test_split(np.array(result).reshape(-1, 1), Y, test_size=0.2)
    lrc = LogisticRegression().fit(X_train, Y_train)
    Y_pre = lrc.predict(X_test)
    auc = roc_auc_score(Y_test, Y_pre)
    score = lrc.score(X_test, Y_test)
    proba = lrc.predict_proba(X_test)
    skplt.metrics.plot_roc_curve(Y_test, proba)
    rr = r2_score(Y_test, Y_pre)
    plt.show()
    print('AUC: %.3f' % auc)


data = pd.read_csv('/home/bili/Lernen/Data/beDataset_b80.csv')

data = data.iloc[np.random.permutation(len(data))].reset_index(drop=True)
header = data.columns[1:-1]
datav = data.values
X = datav[:, 1:-1]
Y = datav[:, -1]
mlClassification(X, Y, data, header, False)
#prsAnalysis(X, Y, header)
