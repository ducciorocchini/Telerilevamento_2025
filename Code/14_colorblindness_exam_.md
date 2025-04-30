# Code to solve colorblindness problems

## Packages

The packages used in this script are the following:

``` r
library(terra)
library(imageRy)
```

## Installing cblindplot

In order to install cblindplot from GitHub follow these instructions:

``` r
library(devtools)
install_github("duciororocchini/cblindplot")
library(cblindplot)
```

## Importing data

Data can be imported by:

``` r
setwd("~/Desktop")
# https://fb.watch/xfBsEdtO4Z/
vinicunca = rast("vinicunca.jpg")
plot(vinicunca)
vinicunca = flip(vinicunca)
plot(vinicunca)
```

## Simulating colorblindness

Code to simulate colorblindness:

``` r
im.multiframe(2,1)
im.plotRGB(vinicunca, r=1, g=2, b=3, title="Standard Vision")
im.plotRGB(vinicunca, r=2, g=1, b=3, title="Protanopia")
```

The silumated image looks as follows:

![vinicunca_out](https://github.com/user-attachments/assets/76899d20-c1ad-4edd-b1dd-f301d21918fe)


## Solving colorblindness

In order to solve colorblindness issues, the *cblibd.plot()* function can be used:

``` r
dev.off()
rainbow = rast("rainbow.jpg")
plot(rainbow)
rainbow = flip(rainbow)
plot(rainbow)
cblind.plot(rainbow, cvd="protanopia")
cblind.plot(rainbow, cvd="deuteranopia")
cblind.plot(rainbow, cvd="tritanopia")
```

As an example, a person affected by protanopia can view a rainbow color image as:

![protanopia](https://github.com/user-attachments/assets/52d043f0-dabb-4fe7-bc52-66152219af93)


