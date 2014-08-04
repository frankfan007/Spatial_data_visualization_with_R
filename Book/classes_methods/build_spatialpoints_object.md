

# Problem
You want to build a `SpatialPoints` object, inspect their structure.

# Solution
Use a `matrix` of coordinates and a `CRS` object as arguments for the `SpatialPoints` function:

```r
> library(sp)
> # Draw a random sample of points.
> pts <- matrix(c(sample(3:10, 10, r = T),
+                 sample(70:100, 10, r = T)),
+               nc = 2)
> crs <- CRS(projargs = as.character(NA))
> sp.pt <- SpatialPoints(pts, crs)
> str(sp.pt, 2)
```

```
Formal class 'SpatialPoints' [package "sp"] with 3 slots
  ..@ coords     : num [1:10, 1:2] 7 4 8 10 7 6 5 9 4 8 ...
  .. ..- attr(*, "dimnames")=List of 2
  ..@ bbox       : num [1:2, 1:2] 4 70 10 94
  .. ..- attr(*, "dimnames")=List of 2
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slots
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
coords.x1   4  10
coords.x2  70  94
```

```r
> # Access the first 3 coordinates
> coordinates(sp.pt[1:3, ])
```

```
     coords.x1 coords.x2
[1,]         7        70
[2,]         4        73
[3,]         8        89
```

# Discussion
In addition to `@` and `slot`, the `coordinates` function can be used to access the `coords` slot.

# See also



















































