# R code for multitemporal analysis

library(terra)
library(imageRy)
library(viridis)

im.list()

EN_01 = im.import("EN_01.png")
EN_01 = flip(EN_01)
plot(EN_01)

EN_13 = im.import("EN_13.png")
EN_13 = flip(EN_13)
plot(EN_13)

im.multiframe(1,2)
plot(EN_01)
plot(EN_13)

ENdif = EN_01[[1]] - EN_13[[1]]
plot(ENdif)
plot(ENdif, col=inferno(100))

#----- 

Greenland ice melt

gr = im.import("greenland")

grdif = gr[[1]] - gr[[4]]
grdif = gr[[4]] - gr[[1]] # 2015 - 2000
plot(grdif)
plot(grdif, col=rocket(100))

#------

setwd("~/Downloads/")
setwd("C:\\utante\Downloads") 
setwd("C://utante/Downloads") 
setwd("~/Desktop/")

getwd()

pdf("output.pdf")
plot(grdif)
dev.off()

jpeg("output.jpeg")
plot(grdif)
dev.off()







