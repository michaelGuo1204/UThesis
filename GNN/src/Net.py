import tensorflow as tf
from spektral.layers import GeneralConv
from tensorflow.keras.layers import Dense, Dropout, Flatten
from tensorflow.keras.models import Model
from tensorflow.keras.regularizers import l2


class Net(Model):
    def __init__(self, labels):
        super().__init__()
        self.channel = 64
        self.hidden = 256
        self.conv1 = GeneralConv(self.channel, aggregate='sum', activation='elu', kernel_regularizer=l2(5e-4))
        self.conv2 = GeneralConv(self.channel, aggregate='sum', activation='elu', kernel_regularizer=l2(5e-4))
        self.dropout = Dropout(0.5)
        self.flatten = Flatten(input_dim=(100, self.channel))
        self.dense1 = Dense(self.hidden, activation='relu', kernel_regularizer=l2(0.01))
        self.dense2 = Dense(self.hidden / 2, activation='relu', kernel_regularizer=l2(5e-4))
        self.dense3 = Dense(1, activation="sigmoid", kernel_regularizer=l2(5e-4))

    def call(self, inputs):
        x, a, i = inputs
        x = tf.cast(x, dtype='float64')
        x = self.conv1([x, a])
        # x = self.conv2([x, a])
        x = tf.reshape(x, shape=[tf.shape(x)[0] / 100, 100, self.channel])
        output = self.flatten(x)
        output = self.dense1(output)
        output = self.dense2(output)
        output = self.dropout(output)
        output = self.dense3(output)
        return output

    # Network without dense part
    def output(self, inputs):
        x, a, i = inputs
        x = tf.cast(x, dtype='float64')
        x = self.conv1([x, a])
        x = self.conv2([x, a])
        x = tf.reshape(x, shape=[tf.shape(x)[0] / 100, 100, self.channel])
        output = self.flatten(x)
        output = self.dense1(output)
        output = self.dense2(output)
        return output
