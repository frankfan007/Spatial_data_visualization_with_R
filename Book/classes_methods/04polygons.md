

# Problem
You want to display the structure of classes used to represent polygons as well as the structure of an object of class `SpatialPolygonsDataFrame`.

# Solution
1. Use the `getClass` function to display the definition of classes.

```r
> library(sp)
> getClass('Polygon')
```

```
Class "Polygon" [package "sp"]

Slots:
                                              
Name:    labpt    area    hole ringDir  coords
Class: numeric numeric logical integer  matrix

Extends: "Line"
```

```r
> getClass('Polygons')
```

```
Class "Polygons" [package "sp"]

Slots:
                                                        
Name:   Polygons plotOrder     labpt        ID      area
Class:      list   integer   numeric character   numeric
```

```r
> getClass('SpatialPolygons')
```

```
Class "SpatialPolygons" [package "sp"]

Slots:
                                                      
Name:     polygons   plotOrder        bbox proj4string
Class:        list     integer      matrix         CRS

Extends: "Spatial"

Known Subclasses: "SpatialPolygonsDataFrame"
```

```r
> getClass('SpatialPolygonsDataFrame')
```

```
Class "SpatialPolygonsDataFrame" [package "sp"]

Slots:
                                                                  
Name:         data    polygons   plotOrder        bbox proj4string
Class:  data.frame        list     integer      matrix         CRS

Extends: 
Class "SpatialPolygons", directly
Class "Spatial", by class "SpatialPolygons", distance 2
```

2. Import a shapefile with data represented by lines using the `readOGR` function from the `rgdal` package and then inspect the specific slots of a `SpatialLinesDataFrame` object:

```r
> library(rgdal)
> # Import the shapefile.
> muns <- readOGR('../../Data/municipios_IBGE', 'Municipios_IBGE')
```

```
OGR data source with driver: ESRI Shapefile 
Source: "../../Data/municipios_IBGE", layer: "Municipios_IBGE"
with 497 features and 11 fields
Feature type: wkbPolygon with 2 dimensions
```

```r
> # Display the general structure and the second object of the "polygons" slot.
> str(muns, 2)
```

```
Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
  ..@ data       :'data.frame':	497 obs. of  11 variables:
  ..@ polygons   :List of 497
  .. .. [list output truncated]
  ..@ plotOrder  : int [1:497] 318 164 266 167 442 181 289 345 372 120 ...
  ..@ bbox       : num [1:2, 1:2] -57.6 -33.8 -49.7 -27.1
  .. ..- attr(*, "dimnames")=List of 2
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
```

```r
> str(muns@polygons[[2]])
```

```
Formal class 'Polygons' [package "sp"] with 5 slots
  ..@ Polygons :List of 1
  .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
  .. .. .. ..@ labpt  : num [1:2] -54.3 -27.6
  .. .. .. ..@ area   : num 0.0209
  .. .. .. ..@ hole   : logi FALSE
  .. .. .. ..@ ringDir: int 1
  .. .. .. ..@ coords : num [1:58, 1:2] -54.4 -54.4 -54.4 -54.4 -54.4 ...
  ..@ plotOrder: int 1
  ..@ labpt    : num [1:2] -54.3 -27.6
  ..@ ID       : chr "1"
  ..@ area     : num 0.0209
```

# Discussion
The `Polygon` class extends the `Line` class adding four slots: `labpt` (centroid of the polygon), `area` (area of the polygon in the metric of the coordinates), `hole` (indicates if the polygon is declared as hole), `ringDir` (ring direction of the polygon) and `coords` (point coordinates to represent polygons by interpolation). Under the hood, the `sp` package uses a non-toplogical representation of polygons and this requires specific information, which is available in the `hole` and `ringDir` slots.  

The `Polygons` class has  five slots: `Polygons` (list of `Polygon` objects), `plotOrder` (defines the plotting order - from largest to smallest), `labpt` (the label point of the polygon with the greatest area), `ID` (an identifying character tag) and `area` (sum of the area of all polygons).  

Note that `SpatialPolygons` class extends the `Spatial` class adding the `polygons` slot (`List` of `Polygons` objects) and the `plotOrder` slot previously discussed. On the other hand, `SpatialPolygonsDataFrame` extends `SpatialPolygons` adding the `data` slot, a `data.frame` with features or attributes of the lines. Each row is associated with a line. The `ID` slot is used to match `Polygons` objects stored in the `polygons` slot, with observations in the `data` slot.


# See also
