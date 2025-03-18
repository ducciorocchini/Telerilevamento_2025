# Reporting multitemporal analysis by Markdown
In order to perform multitemporal analysis, datasets in different times can be imported, by:

``` r
im.list()
gr = im.import("greenland")
```

Once the set has been imported we can calculate the differences betwen different dates, as:

``` r
grdif = gr[[1]] - gr[[4]]
```

the output will be something like:

<img src="../Pics/difgreen.jpeg" width=100% />

> Note: link at the [Coprnicus page](https://www.copernicus.eu/)

