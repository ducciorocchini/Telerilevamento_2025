# R code for performing multitemporal analysis

library(imageRy)
library(terra)
library(viridis)

im.list()

EN_01 = im.import("EN_01.png")
EN_01 = flip(EN_01)
plot(EN_01)

EN_13 = im.import("EN_13.png")
EN_13 = flip(EN_13)
plot(EN_13)

# Exercise: plot the two images one beside the other
im.multiframe(1,2)
plot(EN_01)
plot(EN_13)

ENdif = EN_01[[1]] - EN_13[[1]]
plot(ENdif)
plot(ENdif, col=inferno(100))

#-------

# Greenland ice melt

gr = im.import("greenland")

im.multiframe(1,2)
plot(gr[[1]], col=rocket(100))
plot(gr[[4]], col=rocket(100))

grdif = gr[[4]] - gr[[1]] # 2015 - 2000
plot(grdif)
# All the yellow parts are those in which there is a higher value in 2015





