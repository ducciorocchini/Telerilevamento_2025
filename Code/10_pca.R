# R code for Principal Component Analysis

library(imageRy)
library(terra

im.list()

sent = im.import("sentinel.png")
sent = flip(sent)
plot(sent

sent = c(sent[[1]],sent[[2]],sent[[3]])

# NIR = band 1
# red = band 2
# green = band 3

sentpca = im.pca(sent, n_samples=100000)

tot = 72 + 59 + 6
# 137

# 72 : 137 = x : 100

72 * 100 / tot

sdpc1 = focal(sentpca[[1]], w=c(3,3), fun="sd")
plot(sdpc1)     
