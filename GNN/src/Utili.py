import os

import numpy as np
import progressbar
import scipy.sparse as sp
from spektral.data import Dataset, Graph


class WkDataset(Dataset):

    def __init__(self, n_traits, load=False, p=1e-2, **kwargs):
        self.n_traits = n_traits
        self.p = p
        if (load):
            data = np.load("../Data/fs100.npz", allow_pickle=True)
            self.samples = data['arr_0']
            self.labels = data['arr_1']
            self.ad = np.load("../Data/fsaj.npz", allow_pickle=True)['arr_0']
        super().__init__(**kwargs)

    def download(self):
        print('Generating datasets')
        os.mkdir(self.path)
        prb = progressbar.ProgressBar()
        prb.start()
        for i in prb(range(13709)):
            sample = self.samples[i]
            label = self.labels[i]
            nodes = self.n_traits
            x = np.zeros((self.n_traits, 2))
            for index in range(0, nodes):
                if sample[index] == 2:
                    x[index] = [1, 1]
                elif sample[index] == 1:
                    x[index] = [0, 1]
            # a = np.random.rand(nodes, nodes) <= self.p
            a = self.ad  # * self.p
            # a = np.maximum(a, a.T).astype(int)
            filename = os.path.join(self.path, f'graph_{i}')
            np.savez(filename, x=x, a=a, y=label)
            i = i + 1

    def read(self):
        output = []
        print('Reading')
        prb = progressbar.ProgressBar()
        prb.start()
        for i in prb(range(13709)):
            data = np.load(os.path.join(self.path, f'graph_{i}.npz'), allow_pickle=True)
            _x = data['x']
            _a = data['a']
            _as = sp.csr_matrix(_a)
            _y = data['y']
            output.append(
                Graph(x=_x, a=_as, y=_y)
            )
        return output
