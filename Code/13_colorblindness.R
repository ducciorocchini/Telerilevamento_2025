# Code to solve colorblindness problems

# Packages
library(terra)
library(imageRy)

# Installing cblindplot
library(devtools)
install_github("duciororocchini/cblindplot")
library(cblindplot)

# Importing data
setwd("~/Desktop")
# https://fb.watch/xfBsEdtO4Z/
vinicunca = rast("vinicunca.jpg")
plot(vinicunca)
vinicunca = flip(vinicunca)
plot(vinicunca)

# Simulating colorblindness
im.multiframe(1,2)
im.plotRGB(vinicunca, r=1, g=2, b=3, title="Standard Vision")
im.plotRGB(vinicunca, r=2, g=1, b=3, title="Protanopia")

# Solving colorblindness
dev.off()
rainbow = rast("rainbow.jpg")
plot(rainbow)
rainbow = flip(rainbow)
plot(rainbow)
cblind.plot(rainbow, cvd="protanopia")
cblind.plot(rainbow, cvd="deuteranopia")
cblind.plot(rainbow, cvd="tritanopia")


