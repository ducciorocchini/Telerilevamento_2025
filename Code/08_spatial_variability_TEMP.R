
# Code to measure spatial varibaility considering both (i) spectral distances and (ii) relative abundances

library(terra)
library(imageRy)
library(ggplot2)
library(viridis)
library(patchwork)
library(rasterdiv)

im.list()


sent <- im.import("sentinel.png")
sent <- c(sent[[1]], sent[[2]], sent[[3]])

# RGB space

# 1 NIR
# 2 red
# 3 green

im.plotRGB(sent, r=1, g=2, b=3, title="NIR on red component")
im.plotRGB(sent, 1, 2, 3, title="NIR on red component")
im.plotRGB(sent, r=3, g=2, b=1, title="NIR on red component")
im.plotRGB(sent, r=3, g=1, b=2, title="NIR on red component")

# standard deviation
# sqrt(sum((x - mean(x))^2) / n)
# variance: sd^2

nir <- sent[[1]]
focal(nir, matrix(1/9,3,3), fun=sd)

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

im.ggplot(sd3)

var3 <- focal(nir, matrix(1/9, 3, 3), fun=var)
plot(var3)

par(mfrow=c(1,2))
plot(sd3)
plot(var3)

par(mfrow=c(1,2))
plot(sd3, col=plasma(100))
plot(var3, col=plasma(100))

par(mfrow=c(1,2))
plot(sd3, col=magma(100))
plot(var3, col=magma(100))

var3fromsd <- (sd3)^2

par(mfrow=c(1,3))
plot(sd3)
plot(var3)
plot(var3fromsd)

dif = var3 - var3fromsd
plot(dif)

# Other grains
sd5 <- focal(nir, matrix(1/25, 5, 5), fun=sd)
var5 <- focal(nir, matrix(1/25, 5, 5), fun=var)
plot(sd5)
plot(var5)

# Other grains
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
var7 <- focal(nir, matrix(1/49, 7, 7), fun=var)
plot(sd7)
plot(var7)

p1 <- im.ggplot(sd3)
p2 <- im.ggplot(var3)
p3 <- im.ggplot(sd5)
p4 <- im.ggplot(var5)
p5 <- im.ggplot(sd7)
p6 <- im.ggplot(var7)

(p1 | p2 | p3) /
(p4 | p5 | p6)


(p1 | p2) /
(p3 | p4) /
(p5 | p6) 

# Shannon index: abundance based methods
shan3 <- Shannon(nir, window=3)

p7 <- im.ggplot(shan3)

p1 + p7

# Speeding up calculation
ext <- c(0, 100, 0, 100)
cropnir <- crop(nir, ext)
p8 <- im.ggplot(cropnir)
p9 <- im.ggplot(nir)
p9 + p8
shan3 <- Shannon(cropnir, window=3)

p10 <- im.ggplot(shan3)
p7 + p10

# Second way
# Example of resampling
r <- rast(nrows=3, ncols=3, xmin=0, xmax=10, ymin=0, ymax=10)
values(r) <- 1:ncell(r)
s <- rast(nrows=25, ncols=30, xmin=1, xmax=11, ymin=-1, ymax=11)
x <- resample(r, s, method="bilinear")

niragg <- aggregate(nir, fact=5)
plot(niragg)

pnir <- im.ggplot(nir)
pniragg <- im.ggplot(niragg)
pnir + pniragg

shanagg3 <- Shannon(niragg, window=3)
pshan <- im.ggplot(shanagg3)
p7 + pshan
pniragg + pshan

# Shannon is a point descriptor, hence: Renyi
ren3 <- Renyi(niragg, window=3, alpah=seq(0,12,4), na.tolerance=0.2, np=1)
renstack <- c(ren3[[1]], ren3[[2]], ren3[[3]], ren3[[4]])
plot(renstack)

ren3 <- Renyi(niragg, window=3, alpha=seq(0,12,4), na.tolerance=0.2, np=1)
renstack <- c(ren3[[1]], ren3[[2]], ren3[[3]], ren3[[4]])
plot(renstack)

names(renstack) <- c("alpha=0","alpha=4","alpha=8","alpha=12")
plot(renstack)


