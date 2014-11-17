

# Problem
You want to display the structure of the `Spatial` class and to build a `Spatial` object.

# Solution
The `Spatial` class is provided by the sp package and its structure is displayed using the `getClass` function:

```r
> library(sp)
> getClass('Spatial')
```

```
Class "Spatial" [package "sp"]

Slots:
                              
Name:         bbox proj4string
Class:      matrix         CRS

Known Subclasses: 
Class "SpatialPoints", directly
Class "SpatialGrid", directly
Class "SpatialLines", directly
Class "SpatialPolygons", directly
Class "SpatialPointsDataFrame", by class "SpatialPoints", distance 2
Class "SpatialPixels", by class "SpatialPoints", distance 2
Class "SpatialGridDataFrame", by class "SpatialGrid", distance 2
Class "SpatialLinesDataFrame", by class "SpatialLines", distance 2
Class "SpatialPixelsDataFrame", by class "SpatialPoints", distance 3
Class "SpatialPolygonsDataFrame", by class "SpatialPolygons", distance 2
```
The class of `bbox` and `proj4string` slots can also be displayed:

```r
> getClass('CRS')
```

```
Class "CRS" [package "sp"]

Slots:
                
Name:   projargs
Class: character
```
To build a `Spatial` object, use the `Spatial` function and define its arguments with a `bbox` and a `CRS` object.

```r
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
> # displays can be controlled (in this case, 2 levels).
> str(sp.object, 2)
```

```
Formal class 'Spatial' [package "sp"] with 2 slots
  ..@ bbox       : num [1:2, 1:2] 4 70 5 80
  .. ..- attr(*, "dimnames")=List of 2
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
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
`Spatial` objects has two slots. The `bbox` (bounding box) slot is a `matrix` defining the x-axis or eastings (first row) and y-axis or northings (second row) with numbers representing cooordinates. The `bbox` must have `c('min', 'max')` as column names. The `proj4string` slot is a string of class `CRS` defining the coordinate reference system. By default, the `proj4string` slot is defined as `NA`.

Displaying the `Spatial` class structure also shows the known sublcasses which inherit the `bbox` and `proj4string` slots. As you might expect, these subclasses are ingredients for recepies of subsequent sections.  

The `Spatial` function creates a `Spatial` object from a `bbox` and a `CRS` object.


# See also
... recepie to display the structure of an object and to access its slots.
... section to work with coordinate reference systems.
... section to read common file formats with spatial objects.
































