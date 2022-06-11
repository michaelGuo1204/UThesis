library(tidyverse)
library(corrplot)
library(viridis)
library(igraph)
library(aricode)
library(sbm)
library(missSBM)
library(reticulate)
library(Matrix)
library(pheatmap)
# Use conda environment 
use_condaenv("r")
np <- import('numpy')
# load files
npz1 <- np$load("./GNN/Data/fsaj.npz")
npz1$files
arr <- npz1$f[["arr_0"]]
# Convert array to matrix
mat_from_file <- matrix(arr, nrow = 200, ncol = 200)

# Make igraph by this adjacency matrix
input_graph <- graph_from_adjacency_matrix(mat_from_file)
# Try blocks 1 to 20 and estimate the SBM model
blocks <- 1:20
estimation_result <- estimateMissSBM(as_adj(input_graph), blocks, "node")
# Plot overall training process
plot(estimation_result, "monitoring")
# Plot block selection progress 
plot(estimation_result)

optimalmodel <- estimation_result$bestModel
# Extract identification into clusters
membership <- optimalmodel$fittedSBM$memberships
# The optimal SBM model
SBM <- optimalmodel$fittedSBM
plot(SBM, type = "expected")

plot(optimalmodel, "expected")
plot(optimalmodel, "imputed")
plot(optimalmodel, "meso")
coef(optimalmodel, "sampling")
# Net of clusters
cluster_net <- coef(optimalmodel, "connectivity")$mean
# Net of nodes
predicted_net <- optimalmodel$fittedSBM$predict()

# Plot node nets
diag(predicted_net) <- 0
g_all <- graph_from_adjacency_matrix(predicted_net, mode = 'max', weighted = TRUE)
plot.igraph(g_all, vertex.color = factor(membership), edge.width = E(g_all)$weigh)

# Plot cluster nets
diag(cluster_net) <- 0

g_cluster <- graph_from_adjacency_matrix(cluster_net, weighted = TRUE)
plot.igraph(g_cluster, edge.width = E(g_cluster)$weight * 4, edge.arrow.size = 0.7)

pheatmap(cluster_net, cluster_rows = FALSE, cluster_cols = FALSE)

membermat <- matrix(membership, ncol = 1)
npz2 <- np$load("./GNN/Data/Explain0.33.npz")
npz2$files
arr2 <- npz2$f[["arr_0"]]
# Convert array to matrix
explain_mat <- matrix(arr2, nrow = 200, ncol = 200)
diag(explain_mat) <- 0
g_exp <- graph_from_adjacency_matrix(explain_mat, mode = 'max', weighted = TRUE)
list <- which(degree(g_exp) > 0)

sub <- subgraph(g_exp, list)
LOC = layout_nicely(sub)
plot.igraph(sub, layout = LOC, vertex.color = factor(membership), vertex.size = degree(sub) * 6, vertex.label.cex = degree(sub) / 8)
