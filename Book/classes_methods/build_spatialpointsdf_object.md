

# Problem
You want to build a `SpatialPointsDataFrame` object, inspect their structure.

# Solution
First option: use 1: a `matrix` of coordinates with an integer sequence as row names; 2: a `CRS` object; and 3: a `data.frame` with row names that associate the features in the `data.frame` with the coordinates in the `matrix`; as arguments for the `SpatialPointsDataFrame` function.  
Second option: use a `data.frame` with both the coordinates and the features as the argument for the `coordinate`function an assign to it the index (or names) of the columns containing the coordinates. Use the same `data.frame` as the argument for the `proj4string` function and assing to it an `CRS`oject.

```r
> library(sp)
> ## First option
> # Draw a random sample of points.
> pts <- matrix(c(sample(3:10, 10, r = T),
+                 sample(70:100, 10, r = T)),
+               nc = 2,
+               dimnames = list(1:10, NULL))
> 
> crs <- CRS(projargs = as.character(NA))
> 
> # Draw a random sample of features
> df <- data.frame(
+   total.cases = sample(100:200, 10, r = T),
+   fatal.cases = sample(10:50, 10, r = T))
> 
> sp.ptdf <- SpatialPointsDataFrame(pts, df,
+                                   proj = crs)
> str(sp.ptdf, 2)
```

```
Formal class 'SpatialPointsDataFrame' [package "sp"] with 5 slots
  ..@ data       :'data.frame':	10 obs. of  2 variables:
  ..@ coords.nrs : num(0) 
  ..@ coords     : num [1:10, 1:2] 10 9 9 4 5 8 8 8 5 4 ...
  .. ..- attr(*, "dimnames")=List of 2
  ..@ bbox       : num [1:2, 1:2] 4 70 10 98
  .. ..- attr(*, "dimnames")=List of 2
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slots
```

```r
> summary(sp.ptdf)
```

```
                Length                  Class                   Mode 
                    10 SpatialPointsDataFrame                     S4 
```

```r
> ## Second option.
> sp.ptdf2 <- data.frame(total.cases = df[ , 1],
+                        fatal.cases = df[ , 2],
+                        long = pts[ , 1],
+                        lat = pts[ , 2])
> coordinates(sp.ptdf2) <- 3:4
> proj4string(sp.ptdf2) <- crs
> str(sp.ptdf2, 2)
```

```
Formal class 'SpatialPointsDataFrame' [package "sp"] with 5 slots
  ..@ data       :'data.frame':	10 obs. of  2 variables:
  ..@ coords.nrs : int [1:2] 3 4
  ..@ coords     : num [1:10, 1:2] 10 9 9 4 5 8 8 8 5 4 ...
  .. ..- attr(*, "dimnames")=List of 2
  ..@ bbox       : num [1:2, 1:2] 4 70 10 98
  .. ..- attr(*, "dimnames")=List of 2
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slots
```

```r
> ## Access the first 3 lines of the data.frame
> sp.ptdf2@data[1:3, ]
```

```
  total.cases fatal.cases
1         171          14
2         125          19
3         136          21
```

# Discussion
Using the first option, the row names in the `matrix` an the row names in the `data.frame` must be the same to match both sources of data. If the row names are not in the same order in both objects, the `data.frame` is re-ordered  to match the row names in the  `matrix`. This is useful because the coordinates and the features might be obtained from different sources and it often happens that the features associated with a point are not in the same row as the point.  
The second option produces a result equivalent to that of the first one. The main difference is in the `coords.nrs` slot, which in the second option indicates the columns in the original `data.frame` that contained the coordinates. The row names of the `coords` and `bbox` slots are set as the names of the columns with the coordinates in the original `data.frame`.

# See also


















































