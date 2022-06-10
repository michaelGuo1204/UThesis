#setwd('D:\\资料\\学习资料\\Projects\\circRNA\\Predict\\Figures_Run2\\Imp\\heatmap')
#setwd('D:\\文件\\资料\\Project\\circRNA\\circ_predict\\results_pictrues\\Figures_Run2\\Imp\\heatmap')
#setwd("/backup/public/chenjiabin/project/circRNA/circ_predict/Run_4/expression/Imp")

# Plot heatmap of features by feature rank

library(vegan)
library(pheatmap)
library(viridis)

# set arguments
args <- commandArgs(T)
#PM <- args[1]
mean <- function(x) { x - mean(x) / std(x) }

all_imp <- read.table('~/Lernen/UThesis/EM/All-ranked-Imp-signal.mat', sep = '\t', header = F)
df_imp <- data.frame(all_imp[, c(2:7)])
data <- decostand(df_imp, "standardize", MARGIN = 2)
colnames(data) <- c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5", "Cluster 6")
rownames(data) <- all_imp[, 1]

## main figure
#pdf('Feature_heatmap_reg_signal.pdf', height = 6, width = 6)
pheatmap(data, treeheight_col = 10, clustering_method = 'single', cluster_rows = FALSE,
         color = colorRampPalette(c("navy", "white", "firebrick3"))(15),
         display_numbers = FALSE, number_format = '%.0f', number_color = 'black',
         cellwidth = 25, cellheight = 20, fontsize = 12, fontsize_row = 13, fontsize_col = 13) #, main = 'Heatmap of features')

#dev.off()

## legend
pdf('Feature_heatmap_reg_signal_legend.pdf', height = 6, width = 6)
pheatmap(df_imp, treeheight_col = 10, clustering_method = "single",
         color = colorRampPalette(c("navy", "white", "firebrick3"))(15),
         cellwidth = 25, cellheight = 20, fontsize = 12, fontsize_row = 13, fontsize_col = 13) #, main = 'Heatmap of features'

dev.off()

save(list = ls(), file = 'Feature_heatmap_reg.RData')

#END
