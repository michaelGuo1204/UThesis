import tensorflow as tf
from spektral.layers import ChebConv
from tensorflow.keras.layers import Dense, Dropout, Flatten
from tensorflow.keras.models import Model
from tensorflow.keras.regularizers import l2


class Net(Model):
    def __init__(self, labels):
        super().__init__()
        self.channel = 32
        self.hidden = 128
        # chebcov works with formal transformations
        self.conv = ChebConv(self.channel, K=2, activation='elu', kernel_regularizer=l2(5e-4))
        self.dropout = Dropout(0.5)
        self.flatten = Flatten(input_dim=(258, self.channel))
        self.dense1 = Dense(self.hidden, activation='relu', kernel_regularizer=l2(0.01))
        self.dense2 = Dense(self.hidden / 2, activation='relu', kernel_regularizer=l2(5e-4))
        self.dense3 = Dense(self.hidden / 4, activation='relu', kernel_regularizer=l2(5e-4))
        self.dense4 = Dense(1, activation="sigmoid", kernel_regularizer=l2(5e-4))

    def call(self, inputs):
        x, a, i = inputs
        x = tf.cast(x, dtype='float64')
        x = self.conv([x, a])
        x = tf.reshape(x, shape=[tf.shape(x)[0] / 258, 258, self.channel])
        output = self.flatten(x)
        output = self.dense1(output)
        output = self.dense2(output)
        output = self.dropout(output)
        output = self.dense3(output)
        output = self.dense4(output)
        return output

    # Network without dense part
    def output(self, inputs):
        x, a, i = inputs
        x = tf.cast(x, dtype='float64')
        x = self.conv([x, a])
        x = tf.reshape(x, shape=[tf.shape(x)[0] / 258, 258, self.channel])
        output = self.flatten(x)
        output = self.dense1(output)
        output = self.dense2(output)
        output = self.dense3(output)
        return output
