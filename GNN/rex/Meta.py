import numpy as np
import pandas as pd
from sklearn.feature_selection import SelectFromModel, SelectKBest, chi2
from sklearn.svm import LinearSVC
from supervised.automl import AutoML


def mlClassification(X, Y, selector):
    if selector:
        selector = SelectKBest(chi2, k=100)
        X_new = selector.fit_transform(X, Y)
    else:
        lsvc = LinearSVC(C=0.01, penalty="l1", dual=False).fit(X, Y)
        model = SelectFromModel(lsvc, prefit=True)
        X_new = model.transform(X)

    automl = AutoML(mode='Explain',
                    eval_metric='auc')  # ,algorithms=['Neural Network'],total_time_limit=10,stack_models=False,train_ensemble=False,ml_task='binary_classification')
    automl.fit(X, Y)
    # automl.predict(X_test)
    automl.report()


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


data = pd.read_csv('../Data/fs.csv')

data = data.iloc[np.random.permutation(len(data))].reset_index(drop=True)
data = data.values
X = data[:, 1:-1]
Y = data[:, -1]
mlClassification(X, Y, False)
