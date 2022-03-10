from spektral.layers import GeneralConv, GlobalAvgPool
from tensorflow.keras.layers import Dense
from tensorflow.keras.models import Model


class Net(Model):
    def __init__(self, labels):
        super().__init__()
        self.conv1 = GeneralConv(128, activation="relu", dropout=0.01)
        self.conv2 = GeneralConv(64, activation="relu", dropout=0.01)
        self.conv3 = GeneralConv(32, activation="relu", dropout=0.01)
        self.global_pool = GlobalAvgPool()
        self.dense = Dense(labels, activation="softmax")

    def call(self, inputs):
        x, a, i = inputs
        x = self.conv1([x, a])
        x = self.conv2([x, a])
        x = self.conv3([x, a])
        output = self.global_pool([x, i])
        output = self.dense(output)

        return output
