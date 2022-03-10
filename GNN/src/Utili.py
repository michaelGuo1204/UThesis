import os

import numpy as np
import scipy.sparse as sp
from spektral.data import Dataset, Graph


class TestDataset(Dataset):

    def __init__(self, n_traits, load=False, p=1e-4, **kwargs):
        self.n_traits = n_traits
        self.p = p
        if (load):
            data = np.load("../Data/XY.npz")
            self.samples = data['arr_0'][:1000, :, :]
            self.labels = data['arr_1'][:1000, :]
        super().__init__(**kwargs)

    def download(self):
        os.mkdir(self.path)
        i = 0
        for (sample, label) in zip(self.samples, self.labels):
            nodes = self.n_traits
            a = np.ones((nodes, nodes)) * self.p
            a = np.maximum(a, a.T).astype(int)
            y = np.ones(2)
            if label[0] == 0:
                y[0] = 0
            filename = os.path.join(self.path, f'graph_{i}')
            np.savez(filename, x=sample, a=a, y=y)
            i = i + 1

    def read(self):
        output = []
        for i in range(999):
            data = np.load(os.path.join(self.path, f'graph_{i}.npz'), allow_pickle=True)
            _x = data['x']
            _a = data['a']
            _as = sp.csr_matrix(_a)
            _y = data['y']
            output.append(
                Graph(x=_x, a=_as, y=_y)
            )
        return output
