# R code for visualizing satellite data

# install.packages("viridis")
# install.packages("devtools")
library(devtools)
# install_github("ducciorocchini/imageRy")

library(terra)
library(imageRy)
library(viridis)

im.list()
# Sentinel bands:
# https://custom-scripts.sentinel-hub.com/custom-scripts/sentinel-2/bands/
 
# For the whole course we are going to make use of = instead of <-
# This is based on the following video:
# https://www.youtube.com/watch?v=OJMpKCKH1hM

b2 = im.import("sentinel.dolomites.b2.tif")
plot(b2, col=cl)

cl = colorRampPalette(c("black", "dark grey", "light grey"))(100)
plot(b2, col=cl)

cl = colorRampPalette(c("black", "dark grey", "light grey"))(3)
plot(b2, col=cl)
# tlumley@u.washington.edu, Thomas Lumley

# Exercise: make your own color ramp
# https://sites.stat.columbia.edu/tzheng/files/Rcolor.pdf

cl = colorRampPalette(c("royalblue3", "seagreen1", "red1"))(100)
plot(b2, col=cl)

# bands
b3 = im.import("sentinel.dolomites.b3.tif")
b4 = im.import("sentinel.dolomites.b4.tif")
b8 = im.import("sentinel.dolomites.b8.tif")

par(mfrow=c(1,4))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

dev.off()

im.multiframe(1,4)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

# Exercise: plot the bands using im.multiframe() one on top of the other
im.multiframe(4,1)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

im.multiframe(2,2)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

cl = colorRampPalette(c("black", "light grey"))(100)
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

cl = colorRampPalette(c("black", "light grey"))(2)
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

sent = c(b2, b3, b4, b8)
plot(sent, col=cl)

names(sent) = c("b2-blue", "b3-green", "b4-red", "b8-NIR")
sent

plot(sent, col=cl)
plot(sent)

names(sent) = c("b2blue", "b3green", "b4red", "b8NIR")
dev.off()
plot(sent$b8NIR)

plot(sent[[4]])

# importing several bands altogether
sentdol = im.import("sentinel.dolomites")

# How to import severla sets altogether
pairs(sentdol)]
plot(sentdol[[4]])
plot(sentdol[[4]], col=inferno(100))

# viridis
plot(sentdol, col=viridis(100))
plot(sentdol, col=mako(100))
plot(sentdol, col=magma(100))

# Viridis colors:
# https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html

# Layers
# 1 = blue (b2)
# 2 = green (b3)
# 3 = red (b4)
# 4 = NIR (b8)

# Natural colors
# Color hypnosis here: https://www.youtube.com/watch?v=0G383538qzQ
im.plotRGB(sentdol, r=3, g=2, b=1)

# False colors
im.plotRGB(sentdol, r=4, g=3, b=2)

# Exercise: plot the image using the NIR ontop of the green component of the RGB scheme
im.plotRGB(sentdol, r=3, g=4, b=2)
pairs(sentdol)

im.plotRGB(sentdol, r=2, g=4, b=3)

im.multiframe(1, 2)
im.plotRGB(sentdol, r=3, g=4, b=2)
im.plotRGB(sentdol, r=2, g=4, b=3)

dev.off()
im.plotRGB(sentdol, r=3, g=2, b=4)



