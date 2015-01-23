

# Problem
You want to display the `SpatialPoints` and `SpatialPointsDataFrame` classes structure and to build objects of theses classes.

# Solution
`SpatialPoints` and `SpatialPointsDataFrame` classes structure.

```r
> library(sp)
> getClass('SpatialPoints')
```

```
Class "SpatialPoints" [package "sp"]

Slots:
                                          
Name:       coords        bbox proj4string
Class:      matrix      matrix         CRS

Extends: "Spatial"

Known Subclasses: 
Class "SpatialPointsDataFrame", directly
Class "SpatialPixels", directly
Class "SpatialPixelsDataFrame", by class "SpatialPixels", distance 2
```

```r
> getClass('SpatialPointsDataFrame')
```

```
Class "SpatialPointsDataFrame" [package "sp"]

Slots:
                                                                  
Name:         data  coords.nrs      coords        bbox proj4string
Class:  data.frame     numeric      matrix      matrix         CRS

Extends: 
Class "SpatialPoints", directly
Class "Spatial", by class "SpatialPoints", distance 2

Known Subclasses: 
Class "SpatialPixelsDataFrame", directly, with explicit coerce
```

Building a `SpatialPoints` object.

```r
> # Draw a random sample of points.
> pts <- matrix(c(sample(3:10, 10, r = T),
+                 sample(70:100, 10, r = T)),
+               nc = 2)
> 
> crs <- CRS(projargs = as.character(NA))
> sp.pt <- SpatialPoints(pts, crs)
> 
> str(sp.pt, 2)
```

```
Formal class 'SpatialPoints' [package "sp"] with 3 slots
  ..@ coords     : num [1:10, 1:2] 10 9 7 9 9 4 9 3 5 10 ...
  .. ..- attr(*, "dimnames")=List of 2
  ..@ bbox       : num [1:2, 1:2] 3 70 10 100
  .. ..- attr(*, "dimnames")=List of 2
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
```

```r
> summary(sp.pt)
```

```
       Length         Class          Mode 
           10 SpatialPoints            S4 
```

```r
> # bbox is created from pts.
> bbox(sp.pt)
```

```
          min max
coords.x1   3  10
coords.x2  70 100
```

```r
> # Access the first 3 coordinates
> coordinates(sp.pt[1:3, ])
```

```
     coords.x1 coords.x2
[1,]        10        95
[2,]         9        90
[3,]         7        70
```

Building a `SpatialPointsDataFrame` object.

```r
> # First option.
> df <- data.frame(
+   total.cases = sample(100:200, 10, r = T),
+   fatal.cases = sample(10:50, 10, r = T))
> 
> sp.ptdf <- SpatialPointsDataFrame(pts, df,
+                                   proj = crs)
> 
> # Second option.
> sp.ptdf2 <- data.frame(total.cases = df[ , 1],
+                        fatal.cases = df[ , 2],
+                        long = pts[ , 1],
+                        lat = pts[ , 2])
> coordinates(sp.ptdf2) <- 3:4
> proj4string(sp.ptdf2) <- crs
```

# Discussion
Note that the `SpatialPoints` class extends the `Spatial` class adding the `coords` slot. `coords` slot is a `matrix` containing the points coordinates. On the other hand, `SpatialPointsDataFrame` extends `SpatialPoints` adding the `data` and `coords.nrs` slots. `data` slot is a `data.frame` with features or attributes of the points. Each row is associated with a point. There are different ways to create a `SpatialPointsDataFrame`. When the `data.frame` with points features also has the points coordinates, the `coords` slot can be created from that `data.frame`. When this procedure is used, the columns in `data` slot with the coordinates are moved to the `coords` slot. `coords.nrs` indicates the index of that columns in the original `data.frame`.  

There are at least to options to create a `SpatialPointsDataFrame`. Using the first option, the row names in the `matrix` an the row names in the `data.frame` must be the same to match both sources of data. If the row names are not in the same order in both objects, the `data.frame` is re-ordered  to match the row names in the  `matrix`. This is useful because the coordinates and the features might be obtained from different sources and it often happens that the features associated with a point are not in the same row as the point.  

The second option produces a result equivalent to that of the first one. The main difference is in the `coords.nrs` slot, which in the second option indicates the columns in the original `data.frame` that contained the coordinates. The row names of the `coords` and `bbox` slots are set as the names of the columns with the coordinates in the original `data.frame`.



# See also































