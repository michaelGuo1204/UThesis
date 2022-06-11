import visualkeras
from tensorflow.python.keras.layers import InputLayer, Conv2D, MaxPool2D, Dense, Flatten, Dropout
from tensorflow.python.keras.models import Sequential

# from Net import *

model = Sequential()
model.add(InputLayer(input_shape=(200, 200, 1)))
model.add(Conv2D(64, activation='relu', kernel_size=(3, 3)))
model.add(MaxPool2D())
model.add(Flatten())
model.add(visualkeras.SpacingDummyLayer())
model.add(Dense(512, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(256, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(64, activation='softmax'))
model.summary()
visualkeras.layered_view(model, scale_xy=1, scale_z=1, max_z=100, legend=True, to_file='./a.png').show()
