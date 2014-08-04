

# Problem
You want to display the definition of classes `SpatialPoints` and `SpatialPointsDataFrame`.

# Solution
Use the `getClass` function:

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

# Discussion
Note that the `SpatialPoints` class extends the `Spatial` class adding the `coords` slot. `coords` is a `matrix` containing the points coordinates. On the other hand, `SpatialPointsDataFrame` extends `SpatialPoints` adding the `data` and `coords.nrs` slots. `data` is a `data.frame` with features or attributes of points. Each row is associated with a point. There are different ways to create a `SpatialPointsDataFrame`. When the `data.frame` with points features also has the points coordinates, the `coords` slot can be created from that `data.frame`. When this procedure is used, the columns in `data` slot with the coordinates are moved to the `coords` slot. `coords.nrs` indicates the index of that columns in the original `data.frame`.

# See also































