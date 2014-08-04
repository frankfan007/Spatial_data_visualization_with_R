

# Problem
You want to inspect the `Spatial` class definition.

# Solution
The `Spatial` class is provided by the sp package and the definition is displayed using the `getClass` function:

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
The class of bbox and proj4string slots can also be displayed:

```r
> getClass('CRS')
```

```
Class "CRS" [package "sp"]

Slots:
                
Name:   projargs
Class: character
```

# Discussion
`Spatial` objects has two slots. The `bbox` (bounding box) slot is a `matrix` defining the x-axis or eastings (first row) and y-axis or northings (second row) with numbers representing cooordinates. The `bbox` must have `c('min', 'max')` as column names. The `proj4string` slot is a string of class `CRS` defining the coordinate reference system. By default, the `proj4string` slot is defined as `NA`.

Displaying the `Spatial`class definition also shows the known sublcasses which inherit the `bbox` and `proj4string` slots. As you might expect, these subclasses are ingredients for recepies of subsequent sections.

# See also
































