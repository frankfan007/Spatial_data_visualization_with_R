

# Problem
You want to display the structure of `Raster` class and to build and inspect objects of class `RasterLayer`, `RasterBrick` and `RasterStack`.

# Solution

```r
> ## Raster class.
> library(raster)
```

```
Error: there is no package called 'raster'
```

```r
> getClass('Raster')
```

```
Error: "Raster" is not a defined class
```

```r
> ## Build a RasterLayer object.
> (rl <- raster(ncol = 100, nrow = 100, xmn = -1000, xmx = 1000,
+              ymn = -500, ymx = 500, crs = '+proj=utm +zone=48 +datum=WGS84'))
```

```
Error: could not find function "raster"
```

```r
> # Resolution changes will change the number of columns/rows and vice versa.
> res(rl) <- c(40, 50)
```

```
Error: object 'rl' not found
```

```r
> ncol(rl); nrow(rl)
```

```
Error: object 'rl' not found
```

```
Error: object 'rl' not found
```

```r
> nrow(rl) <- 50
```

```
Error: object 'rl' not found
```

```r
> rl
```

```
Error: object 'rl' not found
```

```r
> # Assign random values to cells.
> hasValues(rl)
```

```
Error: could not find function "hasValues"
```

```r
> values(rl) <- runif(ncell(rl))
```

```
Error: could not find function "ncell"
```

```r
> hasValues(rl)
```

```
Error: could not find function "hasValues"
```

```r
> summary(rl)
```

```
Error: object 'rl' not found
```

```r
> # If the extent is changed, values are not lost. The same is not truth for changes  in the number of columns, the number of rows or resolution.
> xmax(rl) <- 2000
```

```
Error: object 'rl' not found
```

```r
> hasValues(rl)
```

```
Error: could not find function "hasValues"
```

```r
> ncol(rl) <- 300
```

```
Error: object 'rl' not found
```

```r
> hasValues(rl)
```

```
Error: could not find function "hasValues"
```

```r
> ## Build a RasterStack object from two RasterLayer objects.
> rl1 <- rl2 <- raster(nrow = 10, ncol = 10)
```

```
Error: could not find function "raster"
```

```r
> values(rl1) <- runif(ncell(rl1))
```

```
Error: could not find function "ncell"
```

```r
> values(rl2) <- runif(ncell(rl2))
```

```
Error: could not find function "ncell"
```

```r
> rs <- stack(rl1, rl2)
```

```
Error: object 'rl1' not found
```

```r
> rs
```

```
Error: object 'rs' not found
```

```r
> # Print properties of the first layer.
> rs@layers[[1]]
```

```
Error: object 'rs' not found
```

```r
> ## Build a RasterBrick object.
> rb1 <- brick(rs)
```

```
Error: could not find function "brick"
```

```r
> rb2 <- brick(rl1, rl2)
```

```
Error: could not find function "brick"
```

```r
> rb1
```

```
Error: object 'rb1' not found
```

```r
> identical(rb1, rb2)
```

```
Error: object 'rb1' not found
```

# Discussion
The `Raster` class extends a class known as `BasicRaster`. The `Raster` class is virtual (it is not possible to create objects of this class) and serves to create methods for classes `RasterLayer`, `RasterBrick` and `RasterStack`. Most of the slots of these classes not need to be directly accessed. The main properties of raster objects are described by 4 slots: `extent` (minimum and maximum x and y coordinates), `ncols` (number of columns), `nrows` (number of rows) and `crs` (coordinate reference system). `extent` and `crs` have their own classes, `Extent` and `CRS`. `Extent` slots (`xmin`, `xmax`, `ymin` and `ymax`) represent the extremes of the raster (corners) not the center of the corner cells.  

A `RasterLayer` object is a single-layer raster object whereas `RasterBrick` and `RasterStack` are multi-layer objects. The last two classes are suitable for dealing with multivariate raster datasets. A `RasterStack` object is a collection of `RasterLayer`, which can be built from diferent files and `RaterLayers`. `RasterBrick` objects can be built only from a single file but are their processing is more efficient in comparisson with `RasterStack` objects. The possibility of building `RasterStack` and `RasterBrick` objects from files stored on disk, allow the processing of raster dataset that are too large to load in memory.  

The `raster` function can be used to build `RasterLayer` objects. When used without arguments, the object is created with deafult parameters (run `raster()` to see the deafults). Changes in resolution affect the number of columns/rows and visce versa. Note that in a given axis, for example x, resolution is equal to the extent divided by the number of cells (try `(xmax(rl) - xmin(rl)) / ncol(rl) == res(rl)[1]`). Values assigned to cells are preserved after extent changes but lost when the number of columns/rows or resoultion change. This is because changes in the extent adjust the resolution but not the number of cells.  


# See also
