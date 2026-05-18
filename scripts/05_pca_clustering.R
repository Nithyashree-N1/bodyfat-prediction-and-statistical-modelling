# ==========================================
# 05_pca_clustering.R
# Description: PCA & Hierarchical Clustering
# ==========================================

library(factoextra)
library(cluster)

data <- read.csv("outputs/processed_data.csv")

# -------------------------------
# PCA
# -------------------------------
pca <- prcomp(data, scale. = TRUE)

write.csv(summary(pca)$importance, "outputs/pca_summary.csv")
write.csv(pca$rotation, "outputs/pca_loadings.csv")

fviz_eig(pca)
ggsave("outputs/scree.png")

fviz_pca_var(pca)
ggsave("outputs/pca_vars.png")

# -------------------------------
# Clustering
# -------------------------------
dist_mat <- dist(data)
hc <- hclust(dist_mat, method = "ward.D2")

clusters <- cutree(hc, k = 4)

fviz_cluster(list(data = data, cluster = clusters))
ggsave("outputs/clusters.png")

cat("PCA & Clustering completed.\n")
