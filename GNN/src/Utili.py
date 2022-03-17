import os

import numpy as np
import progressbar
import scipy.sparse as sp
from spektral.data import Dataset, Graph


class TestDataset(Dataset):

    def __init__(self, n_traits, load=False, p=1e-2, **kwargs):
        self.n_traits = n_traits
        self.p = p
        if (load):
            data = np.load("../Data/fs.npz", allow_pickle=True)
            self.samples = data['arr_0']
            self.labels = data['arr_1']
        super().__init__(**kwargs)

    def download(self):
        print('Generating datasets')
        os.mkdir(self.path)
        i = 0
        prb = progressbar.ProgressBar()
        prb.start()
        for (sample, label) in zip(self.samples, self.labels):
            nodes = self.n_traits
            x = np.zeros((self.n_traits, 2))
            for index in range(0, 81):
                if sample[index] == 2:
                    x[index] = [1, 1]
                elif sample[index] == 1:
                    x[index] = [0, 1]
            # a = np.random.rand(nodes, nodes) <= self.p
            a = np.ones((nodes, nodes))  # * self.p
            # a = np.maximum(a, a.T).astype(int)
            y = np.zeros(2)
            if label == 1:
                y[1] = 1
            filename = os.path.join(self.path, f'graph_{i}')
            np.savez(filename, x=x, a=a, y=y)
            prb.update()
            i = i + 1

    def read(self):
        output = []
        print('Reading')
        prb=progressbar.ProgressBar()
        for i in prb(range(13708)):
            data = np.load(os.path.join(self.path, f'graph_{i}.npz'), allow_pickle=True)
            _x = data['x']
            _a = data['a']
            _as = sp.csr_matrix(_a)
            _y = data['y']
            output.append(
                Graph(x=_x, a=_as, y=_y)
            )
        return output
