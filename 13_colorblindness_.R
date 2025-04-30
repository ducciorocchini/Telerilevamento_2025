library(terra)
library(imageRy) 

library(cblindplot)

library(devtools)
install_github("ducciorocchini/cblindplot")

setwd("~/Desktop/")

# Simulating colorblindness
# https://fb.watch/xfBsEdtO4Z/
vinicunca = rast("vinicunca.jpg")
vinicunca = flip(vinicunca)
plot(vinicunca)

im.plotRGB(vinicunca, r=1, g=2, b=3, title="Standard Vision")
im.plotRGB(vinicunca, r=2, g=1, b=3, title="Protanopia")

im.multiframe(2,1)
im.plotRGB(vinicunca, r=1, g=2, b=3, title="Standard Vision")
im.plotRGB(vinicunca, r=2, g=1, b=3, title="Protanopia")

# Solving the daltonism problem
rainbow = rast("rainbow.jpg")
plot(rainbow)
rainbow = flip(rainbow)
plot(rainbow)

dev.off()
plot(rainbow)

cblind.plot(rainbow, cvd="protanopia")
cblind.plot(rainbow, cvd="deuteranopia")
cblind.plot(rainbow, cvd="tritanopia")

