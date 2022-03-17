import datetime
import logging

import numpy as np
import pandas as pd
import tensorflow as tf
from keras import layers, callbacks
from keras.optimizers import adam_v2
from sklearn.feature_selection import SelectFromModel
from sklearn.model_selection import train_test_split
from sklearn.svm import LinearSVC
from tensorflow import feature_column

tf.get_logger().setLevel(logging.ERROR)


def df_to_dataset(dataframe, shuffle=True, batch_size=32):
    dataframe = dataframe.copy()
    labels = dataframe.pop('Label')
    ds = tf.data.Dataset.from_tensor_slices((dict(dataframe), labels))
    if shuffle:
        ds = ds.shuffle(buffer_size=len(dataframe))
    ds = ds.batch(batch_size)
    return ds


data = pd.read_csv('../Data/beDataset_b.csv')
data = data.drop("Cases", axis=1)  # Clean the Case colum
data = data.iloc[np.random.permutation(len(data))].reset_index(drop=True)
header = data.columns[:-1]
data = data.values
X = data[:, :-1]
X[X == 2] = 1
Y = data[:, -1]
lsvc = LinearSVC(C=0.01, penalty="l1", dual=False).fit(X, Y)
model = SelectFromModel(lsvc, prefit=True)
X_new = model.transform(X)
header = header[model.get_support()]
X_df = pd.DataFrame(X_new)
Y_df = pd.DataFrame(Y)
X_df.columns = header
Y_df.columns = ['Label']
DF = pd.concat([X_df, Y_df], axis=1)
train, val = train_test_split(DF, test_size=0.2, random_state=1)
train_pip = df_to_dataset(train)
val_pip = df_to_dataset(val)

feature_columns = []
for id in header:
    feature_columns.append(feature_column.numeric_column(id))

feature_layer = tf.keras.layers.DenseFeatures(feature_columns)
model = tf.keras.Sequential([
    feature_layer,
    # layers.Dense(1024, activation='relu'),
    # layers.Dropout(.1),
    layers.Dense(256, activation='relu'),
    layers.Dropout(.1),
    layers.Dense(64, activation='relu'),
    layers.Dropout(.1),
    layers.Dense(1)
])

logdir = "./logs/scalars/" + datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
tensorboard_callback = callbacks.TensorBoard(log_dir=logdir, histogram_freq=1)
es_callback = callbacks.EarlyStopping(monitor='val_loss', min_delta=0.0001, patience=5)
optimizer = adam_v2.Adam(learning_rate=1e-4, decay=0.05)

model.compile(optimizer=optimizer,
              loss=tf.keras.losses.BinaryCrossentropy(from_logits=True),
              metrics=['accuracy'])

history = model.fit(train_pip,
                    validation_data=val_pip,
                    verbose=1,
                    epochs=1000,
                    shuffle=True,
                    callbacks=[tensorboard_callback, es_callback])

model.summary()
