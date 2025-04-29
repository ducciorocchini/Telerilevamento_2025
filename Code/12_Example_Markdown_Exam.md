# Exam project title: title

## Data gathering

Data were gathered from the [Earth Observatory site](https://earthobservatory.nasa.gov/).

Packages used:

``` r
library(terra)
library(imageRy)
library(viridis) # in order to plot images with different viridis color ramp palettes
```

Setting the working directory and importing the data:

``` r
setwd("~/Desktop/")
fires = rast("fires.jpg")
plot(fires)
fires = flip(fires)
plot(fires)
```

The image is the following:

![fires](https://github.com/user-attachments/assets/e0f07ba3-8883-4b8b-b9e8-8e1a2049f296)

## Data analysis

Based on the data gathered from the site we can caluclate an index, using the first two bands:

``` r
fireindex = fires[[1]] - fires[[2]]
plot(fireindex)
```

In order to export the index, we can use the png() function like:

``` r
png("fireindex.png")
plot(fireindex)
dev.off()
```

The index looks like:

![fireindex](https://github.com/user-attachments/assets/0690737f-e49b-4b94-9178-29ad76804765)

## Index visualisation by viridis

In order to visualize the index with another viridis palette we made use of the following code:

``` r
plot(fireindex, col=inferno(100))
```

The output will look like:

![inferno](https://github.com/user-attachments/assets/9bab43f4-5374-4e4d-9115-25a1c234fea6)




