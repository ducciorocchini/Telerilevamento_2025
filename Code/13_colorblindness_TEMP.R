library(terra)
library(cblindplot)

# Vinicunca
# https://fb.watch/xfBsEdtO4Z/
setwd("~/Desktop/")
vinicunca <- rast("vinicunca.jpg")

plot(vinicunca)

par(mfrow=c(1,2))
im.plotRGB(vinicunca, 1,2,3, title="Standard vision")
im.plotRGB(vinicunca, 2,2,3, title="Protanopia")

## cblindplot
# Search the network for a rainbow color map typing e.g. 
# rainbow color map climate
setwd("~/Downloads/")
rainbow <- rast("rainbow.jpg")
# rainbowinput = "rainbow.png"
cblind.plot(rainbow, cvd= "protanopia")
