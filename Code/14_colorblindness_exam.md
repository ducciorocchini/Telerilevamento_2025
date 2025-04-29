# Code to solve colorblindness problems

## Packages
The packages used are:

``` r
library(terra)
library(imageRy)
```

## Installing cblindplot
How to install cblindplot?

``` r
library(devtools)
install_github("duciororocchini/cblindplot")
library(cblindplot)
```

## Importing data
Data can be imported by:

``` r
setwd("~/Desktop")
vinicunca = rast("vinicunca.jpg")
plot(vinicunca)
vinicunca = flip(vinicunca)
plot(vinicunca)
```

## Simulating colorblindness
In order to simulate colorblindness we can use the following code:

``` r
im.multiframe(1,2)
im.plotRGB(vinicunca, r=1, g=2, b=3, title="Standard Vision")
im.plotRGB(vinicunca, r=2, g=1, b=3, title="Protanopia")
```

![vininunca_out](https://github.com/user-attachments/assets/efea1caf-73ab-4bc8-8a45-18a116626670)

## Solving colorblindness
To solve colorblindness we can use the cblindplot package:

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

Starting from an image in ranbow colors, this can be translated to an image that can be seen by people with protanopia:

![rainbow_out](https://github.com/user-attachments/assets/d1aaba3f-51c9-462f-bd2f-3e6b91ca6a14)
