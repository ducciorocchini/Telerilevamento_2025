# Multivariate analysis in R with satellite data

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()

sent <- im.import("sentinel.png")
sent <- c(sent[[1]], sent[[2]], sent[[3]])

# PCA workflow
# 1. Sample
sample <- spatSample(sent, 100)
sample

# 2. PCA
pca <- prcomp(sample)
summary(pca)

# 3. map
pcmap <- predict(sent, pca, index=c(1:3))

##### Test with another set
sentdo <- im.import("sentinel.dolomites")

# 1. Sample
sample <- spatSample(sentdo, 100)
sample
head(sample)

# 2. PCA
pca <- prcomp(sample)
summary(pca)

# 3. map
pcmap <- predict(sentdo, pca, index=c(1:4))
plot(pcmap)

pcmap <- predict(sentdo, pca, index=c(1:2))
plot(pcmap)

# Sensitivity: number of cases = 1000

# 1. Sample
sample <- spatSample(sentdo, 1000)
sample
head(sample)

# 2. PCA
pca <- prcomp(sample)
summary(pca)

# 3. map
pcmap1000 <- predict(sentdo, pca, index=c(1:4))
plot(pcmap1000)

# Using im.pca
pcmapim <- im.pca(sent)
pcmapdoim <- im.pca(sentdo, n_components=4)
pcmapdoim <- im.pca(sentdo, n_components=4, n_samples=1000)

# calculating variability
varpca <- focal(pcmapim[[1]], matrix(1/9,3,3), fun=sd)

# seeing the difference with the nir calculation
varnir <- focal(sent[[1]], matrix(1/9,3,3), fun=sd)

p1 <- im.ggplot(varpca)
p2 <- im.ggplot(varnir)

p1 + p2

