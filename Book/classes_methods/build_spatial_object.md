

# Problem
You want to build a simple `Spatial` object and acces their slots.

# Solution
Create a `matrix` with the requirements of a `bbox` and a `CRS` object. Use these objects as arguments for `Spatial` function:

```r
> library(sp)
> box <- matrix(c(4, 70, 5, 80), ncol = 2,
+               dimn = list(NULL, c('min', 'max')))
> crs <- CRS(projargs = as.character(NA))
> (sp.object <- Spatial(bbox = box,
+                       proj4string = crs))
```

```
An object of class "Spatial"
Slot "bbox":
     min max
[1,]   4   5
[2,]  70  80

Slot "proj4string":
CRS arguments: NA 
```

```r
> # The maximal level of nesting that str
> # displays can be controlled
> str(sp.object, 2)
```

```
Formal class 'Spatial' [package "sp"] with 2 slots
  ..@ bbox       : num [1:2, 1:2] 4 70 5 80
  .. ..- attr(*, "dimnames")=List of 2
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slots
```

```r
> summary(sp.object)
```

```
 Length   Class    Mode 
      1 Spatial      S4 
```

```r
> # Access and display the slots separately.
> bbox(sp.object)
```

```
     min max
[1,]   4   5
[2,]  70  80
```

```r
> proj4string(sp.object)
```

```
[1] NA
```

# Discussion
Vector and raster data are often read from files and the reading process defines the `bbox` and `proj4string` slots. Remember that `slot(sp.object, 'bbox')` and `sp.object@bbox` are valid methos to access the `bbox`. The same is thrue for other slots (i.e. `proj4string`).  
`str` and `summary` are conveninet functions to inspect the structure of `Spatial` objects. Controling the maximal level of nesting displayed by the `str` is a useful option specially for objects with slots that have many levels of nesting or objects with many elemnts. Compare the result of  `str(sp.object, 2)` and `str(sp.object)`.


# See also



















































