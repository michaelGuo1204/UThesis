import os

import numpy as np
import progressbar
import scipy.sparse as sp
from spektral.data import Dataset, Graph


class TDataset(Dataset):

    def __init__(self, n_traits=200, load=False, p=1e-2, **kwargs):
        self.n_traits = n_traits
        self.p = p
        self.a = None

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
        a_read = False
        for i in prb(range(13709)):
            data = np.load(os.path.join(self.path, f'graph_{i}.npz'), allow_pickle=True)
            _x = data['x']
            if not a_read:
                # _a = data['a']
                _a = np.ones((self.n_traits, self.n_traits))
                self.a = sp.csr_matrix(_a)
                a_read = True
            _y = data['y']
            output.append(
                Graph(x=_x, y=_y)
            )
        return output


class JBDataset(Dataset):

    def __init__(self, n_traits, load=False, p=1e-2, **kwargs):
        self.n_traits = n_traits
        self.p = p
        if (load):
            data = np.load("../Data/fs2.npz", allow_pickle=True)
            self.samples = data['arr_0']
            self.labels = data['arr_1']
            self.ad = np.load("../Data/fsaj.npz", allow_pickle=True)['arr_0']
        super().__init__(**kwargs)

    def download(self):
        print('Generating datasets')
        os.mkdir(self.path)
        prb = progressbar.ProgressBar()
        prb.start()
        for i in prb(range(610)):
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
        for i in prb(range(610)):
            data = np.load(os.path.join(self.path, f'graph_{i}.npz'), allow_pickle=True)
            _x = data['x']
            a_read = False
            if not a_read:
                # _a = data['a']
                _a = np.ones((self.n_traits, self.n_traits))
                self.a = sp.csr_matrix(_a)
                a_read = True
            _y = data['y']
            output.append(
                Graph(x=_x, y=_y)
            )
        return output
