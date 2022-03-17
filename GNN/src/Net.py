import tensorflow as tf
from spektral.layers import GeneralConv, GlobalSumPool, GCNConv, ECCConv
from tensorflow.keras.layers import Dense, Dropout
from tensorflow.keras.models import Model
from tensorflow.keras.regularizers import l2


class Net(Model):
    def __init__(self, labels):
        super().__init__()
        self.conv1 = GCNConv(16, activation='elu', kernel_regularizer=l2(5e-4))
        self.conv2 = GCNConv(16, activation='elu', kernel_regularizer=l2(5e-4))
        # self.conv3 = GCNConv(32,activation='elu',kernel_regularizer=l2(5e-4))
        self.global_pool = GlobalSumPool()
        self.dropout = Dropout(0.5)
        # self.dense1 =Dense(64,activation='relu', kernel_regularizer=l2(0.01))

        self.dense2 = Dense(16, activation='relu', kernel_regularizer=l2(5e-4))

        self.dense3 = Dense(2, activation="sigmoid", kernel_regularizer=l2(5e-4))

    def call(self, inputs):
        x, a, i = inputs
        x = tf.cast(x, dtype='float64')
        x = self.conv1([x, a])
        x = self.conv2([x, a])
        # x = self.conv3([x, a])
        output = self.global_pool([x, i])
        # output = self.dense1(output)
        # output = self.dropout(output)
        output = self.dense2(output)
        output = self.dropout(output)
        output = self.dense3(output)
        return output


class ECCModel(Model):
    def __init__(self, Node, Edge, Labels):
        super().__init__()

        self.ecc = ECCConv(32, activation="relu")
        self.gcna = GeneralConv(16, activation="relu")
        self.gcnb = GeneralConv(16, activation="relu")
        self.pool = GlobalSumPool()
        self.dense = Dense(Labels, activation="sigmoid")

    def call(self, inputs):
        x, a, e, i = inputs
        x = tf.cast(x, dtype='float64')
        x = self.gcna([x, a])
        x = self.gcnb([x, a])
        x = self.pool([x, i])
        output = self.dense(x)
        return output
