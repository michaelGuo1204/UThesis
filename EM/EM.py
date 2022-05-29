import numpy as np
import scipy.sparse as sp
import tensorflow as tf
from sklearn.metrics.pairwise import cosine_similarity as cos

from Model import Net, print


class EstimateAdj():
    def __init__(self, nodes):
        """
        Class for estimating the adjacent matrix by EM algorithm
        :param nodes: number of nodes contained in the graph
        :param adj: Sparse matrix
        """
        # N numbers in the observations
        self.N = None
        # E store edges in observations
        self.E = None
        self.nodes = nodes
        self.k = 2
        self.iterations = 0

    # Reset the observations
    def reset_obs(self):
        self.N = 0
        self.E = np.zeros((self.nodes, self.nodes), dtype=np.int64)

    # Updata the observations
    def update_obs(self, output):
        self.E += output
        self.N += 1

    def E_step(self, Q):
        """
        Function for expectation process
        :param Q:
        :return:
        """
        # Calculation of alpha and beta
        an = Q * self.E
        an = np.triu(an, 1).sum()
        # \sum_{i<j} Q_ij E_ij
        bn = (1 - Q) * self.E
        bn = np.triu(bn, 1).sum()
        # \sum_{i<j} (1 - Q_ij) E_ij
        ad = Q * self.N
        ad = np.triu(ad, 1).sum()
        # M \sum_{i<j} Q_ij
        bd = (1 - Q) * self.N
        bd = np.triu(bd, 1).sum()
        # M \sum_{i<j} (1 - Q_ij)

        # Calculate alpha, beta
        alpha = an * 1. / (ad)
        beta = bn * 1. / (bd)

        O = self.E / self.N
        return (alpha, beta, O)

    def M_step(self, alpha, beta, O):
        # Convert triangle omega matrix to symmetric matrix
        O += O.T - np.diag(O.diagonal())

        p1 = O * np.power(alpha, self.E) * np.power(1 - alpha, self.N - self.E)
        p2 = (1 - O) * np.power(beta, self.E) * np.power(1 - beta, self.N - self.E)
        Q = p1 * 1. / (p1 + p2 * 1.)
        return Q

    def EM(self, tolerance=.000001):
        """Run the complete EM algorithm.
        Parameters
        ----------
        tolerance:
            Determine the tolerance in the variantions of alpha, beta and O, which is acceptable to stop iterating (float)
        seed:
            seed for np.random.seed (int)
        Returns
        ----------
        iterations:
            The number of iterations to achieve the tolerance on the parameters (int)
        """
        # Record previous values to confirm convergence
        alpha_p = 0
        beta_p = 0

        # Do an initial E-step with random alpha, beta and O
        # Beta must be smaller than alpha
        beta, alpha = np.sort(np.random.rand(2))
        # Omega to control the connection
        # TODO: num_class to be substituted
        O = np.triu(np.random.rand(self.nodes, self.nodes))

        # Calculate initial Q
        Q = self.M_step(alpha, beta, O)

        while abs(alpha_p - alpha) > tolerance or abs(beta_p - beta) > tolerance:
            alpha_p = alpha
            beta_p = beta
            alpha, beta, O = self.E_step(Q)
            Q = self.M_step(alpha, beta, O)
            self.iterations += 1
        adj = self.prob_to_adj(Q, 0.000000001)
        return adj

    def knn(self, feature, k=3):
        adj = np.zeros((self.nodes, self.nodes), dtype=np.int64)
        dist = cos(feature)
        col = np.argpartition(dist, -(k), axis=1)[:, -(k + 1):].flatten()
        adj[np.arange(self.nodes).repeat(k + 1), col] = 1
        return adj

    def prob_to_adj(self, mx, threshold):
        mx = np.triu(mx, 1)
        mx += mx.T
        (row, col) = np.where(mx > threshold)
        adj = sp.coo_matrix((np.ones(row.shape[0]), (row, col)), shape=(mx.shape[0], mx.shape[0]), dtype=np.int64)
        return adj

    def EMlearning(self, batchsize, patience, epochs, optimizer, loss_fn, data):

        self.iter = 0
        adj = data.a
        # Train Model
        for iter in range(10):
            print("No.{} training in progress ".format(iter))
            model = Net(batchsize, patience, epochs, optimizer, loss_fn)
            model.fit(data)
            print("GNN training complete")
            self.reset_obs()
            for item in model.result:
                self.update_obs(self.knn(tf.squeeze(item)))

            self.iter += 1
            adj = self.EM()
            data.a = adj
            np.savez("../Data/ADJ No.{}.npz".format(self.iter), adj)
            print("ADJ produced")
            tf.keras.backend.clear_session()
            # adj = prob_to_adj(Q, args.threshold).to(self.device)
