

# Problem
You want to display the structure of `Raster` class and to build and inspect objects of class `RasterLayer`, `RasterBrick` and `RasterStack`.

# Solution

```r
> ## Raster class.
> library(raster)
> getClass('Raster')
```

```
Virtual Class "Raster" [package "raster"]

Slots:
                                                                  
Name:      title    extent   rotated  rotation     ncols     nrows
Class: character    Extent   logical .Rotation   integer   integer
                                    
Name:        crs   history         z
Class:       CRS      list      list

Extends: "BasicRaster"

Known Subclasses: 
Class "RasterLayer", directly
Class "RasterBrick", directly
Class "RasterStack", directly
Class ".RasterQuad", directly
Class "RasterLayerSparse", by class "RasterLayer", distance 2
Class ".RasterBrickSparse", by class "RasterBrick", distance 2
```

```r
> ## Build a RasterLayer object.
> (rl <- raster(ncol = 100, nrow = 100, xmn = -1000, xmx = 1000,
+              ymn = -500, ymx = 500, crs = '+proj=utm +zone=48 +datum=WGS84'))
```

```
class       : RasterLayer 
dimensions  : 100, 100, 10000  (nrow, ncol, ncell)
resolution  : 20, 10  (x, y)
extent      : -1000, 1000, -500, 500  (xmin, xmax, ymin, ymax)
coord. ref. : +proj=utm +zone=48 +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0 
```

```r
> # Resolution changes will change the number of columns/rows and vice versa.
> res(rl) <- c(40, 50)
> ncol(rl); nrow(rl)
```

```
[1] 50
```

```
[1] 20
```

```r
> nrow(rl) <- 50
> rl
```

```
class       : RasterLayer 
dimensions  : 50, 50, 2500  (nrow, ncol, ncell)
resolution  : 40, 20  (x, y)
extent      : -1000, 1000, -500, 500  (xmin, xmax, ymin, ymax)
coord. ref. : +proj=utm +zone=48 +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0 
```

```r
> # Assign random values to cells.
> hasValues(rl)
```

```
[1] FALSE
```

```r
> values(rl) <- runif(ncell(rl))
> hasValues(rl)
```

```
[1] TRUE
```

```r
> summary(rl)
```

```
     Length       Class        Mode 
       2500 RasterLayer          S4 
```

```r
> # If the extent is changed, values are not lost. The same is not truth for changes  in the number of columns, the number of rows or resolution.
> xmax(rl) <- 2000
> hasValues(rl)
```

```
[1] TRUE
```

```r
> ncol(rl) <- 300
> hasValues(rl)
```

```
[1] FALSE
```

```r
> ## Build a RasterStack object from two RasterLayer objects.
> rl1 <- rl2 <- raster(nrow = 10, ncol = 10)
> values(rl1) <- runif(ncell(rl1))
> values(rl2) <- runif(ncell(rl2))
> rs <- stack(rl1, rl2)
```

```
Error in as.list.default(x): no method for coercing this S4 class to a vector
```

```r
> rs
```

```
Error in eval(expr, envir, enclos): object 'rs' not found
```

```r
> # Print properties of the first layer.
> rs@layers[[1]]
```

```
Error in eval(expr, envir, enclos): object 'rs' not found
```

```r
> ## Build a RasterBrick object.
> rb1 <- brick(rs)
```

```
Error in brick(rs): error in evaluating the argument 'x' in selecting a method for function 'brick': Error: object 'rs' not found
```

```r
> rb2 <- brick(rl1, rl2)
> rb1
```

```
Error in eval(expr, envir, enclos): object 'rb1' not found
```

```r
> identical(rb1, rb2)
```

```
Error in identical(rb1, rb2): object 'rb1' not found
```

# Discussion
The `Raster` class extends a class known as `BasicRaster`. The `Raster` class is virtual (it is not possible to create objects of this class) and serves to create methods for classes `RasterLayer`, `RasterBrick` and `RasterStack`. Most of the slots of these classes not need to be directly accessed. The main properties of raster objects are described by 4 slots: `extent` (minimum and maximum x and y coordinates), `ncols` (number of columns), `nrows` (number of rows) and `crs` (coordinate reference system). `extent` and `crs` have their own classes, `Extent` and `CRS`. `Extent` slots (`xmin`, `xmax`, `ymin` and `ymax`) represent the extremes of the raster (corners) not the center of the corner cells.  

A `RasterLayer` object is a single-layer raster object whereas `RasterBrick` and `RasterStack` are multi-layer objects. The last two classes are suitable for dealing with multivariate raster datasets. A `RasterStack` object is a collection of `RasterLayer`, which can be built from diferent files and `RaterLayers`. `RasterBrick` objects can be built only from a single file but are their processing is more efficient in comparisson with `RasterStack` objects. The possibility of building `RasterStack` and `RasterBrick` objects from files stored on disk, allow the processing of raster dataset that are too large to load in memory.  

The `raster` function can be used to build `RasterLayer` objects. When used without arguments, the object is created with deafult parameters (run `raster()` to see the deafults). Changes in resolution affect the number of columns/rows and visce versa. Note that in a given axis, for example x, resolution is equal to the extent divided by the number of cells (try `(xmax(rl) - xmin(rl)) / ncol(rl) == res(rl)[1]`). Values assigned to cells are preserved after extent changes but lost when the number of columns/rows or resoultion change. This is because changes in the extent adjust the resolution but not the number of cells.  


# See also
