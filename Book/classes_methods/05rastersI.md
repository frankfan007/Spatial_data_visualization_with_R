

# Problem
You want to display the structure of classes `GridTopology`, `SpatialGrid` and `SpatialPixels` and to build instances of theses classes. You also want to inspect an object of class `SpatialixelsDataFrame`.

# Solution

```r
> ## Classes structure.
> 
> library(sp)
> getClass('GridTopology')
```

```
Class "GridTopology" [package "sp"]

Slots:
                                                            
Name:  cellcentre.offset          cellsize         cells.dim
Class:           numeric           numeric           integer
```

```r
> getClass('SpatialGrid')
```

```
Class "SpatialGrid" [package "sp"]

Slots:
                                             
Name:          grid         bbox  proj4string
Class: GridTopology       matrix          CRS

Extends: "Spatial"

Known Subclasses: "SpatialGridDataFrame"
```

```r
> getClass('SpatialPixels')
```

```
Class "SpatialPixels" [package "sp"]

Slots:
                                                                       
Name:          grid   grid.index       coords         bbox  proj4string
Class: GridTopology      integer       matrix       matrix          CRS

Extends: 
Class "SpatialPoints", directly
Class "Spatial", by class "SpatialPoints", distance 2
Class "SpatialPointsNULL", by class "SpatialPoints", distance 2

Known Subclasses: "SpatialPixelsDataFrame"
```

```r
> ## Build objects of the classes above.
> 
> box <- matrix(c(-100, -80, 100, 80), ncol = 2,
+               dimn = list(NULL, c('min', 'max')))
> cell.size <- c(0.1, 0.1)
> cell.center <- box[ , 1] + cell.size * 0.5
> cell.dim <- ceiling(diff(t(box)) / cell.size)
> 
> # GridTopology.
> (gt <- GridTopology(cellcentre.offset = cell.center,
+                     cellsize = cell.size, cells.dim = cell.dim))
```

```
                       X1      X2
cellcentre.offset  -99.95  -79.95
cellsize             0.10    0.10
cells.dim         2000.00 1600.00
```

```r
> # SpatialGrid.
> crs <- CRS('+proj=longlat +datum=WGS84')
> sg <- SpatialGrid(gt, proj4string = crs)
> str(sg)
```

```
Formal class 'SpatialGrid' [package "sp"] with 3 slots
  ..@ grid       :Formal class 'GridTopology' [package "sp"] with 3 slots
  .. .. ..@ cellcentre.offset: num [1:2] -100 -80
  .. .. ..@ cellsize         : num [1:2] 0.1 0.1
  .. .. ..@ cells.dim        : int [1:2] 2000 1600
  ..@ bbox       : num [1:2, 1:2] -100 -80 100 80
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : NULL
  .. .. ..$ : chr [1:2] "min" "max"
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
  .. .. ..@ projargs: chr "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
```

```r
> # SpatialPixels.
> spx <- as(sg, 'SpatialPixels')
> str(spx)
```

```
Formal class 'SpatialPixels' [package "sp"] with 5 slots
  ..@ grid       :Formal class 'GridTopology' [package "sp"] with 3 slots
  .. .. ..@ cellcentre.offset: num [1:2] -100 -80
  .. .. ..@ cellsize         : num [1:2] 0.1 0.1
  .. .. ..@ cells.dim        : int [1:2] 2000 1600
  ..@ grid.index : int [1:3200000] 1 2 3 4 5 6 7 8 9 10 ...
  ..@ coords     : num [1:3200000, 1:2] -100 -99.9 -99.8 -99.7 -99.5 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : NULL
  .. .. ..$ : chr [1:2] "s1" "s2"
  ..@ bbox       : num [1:2, 1:2] -100 -80 100 80
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:2] "s1" "s2"
  .. .. ..$ : chr [1:2] "min" "max"
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
  .. .. ..@ projargs: chr "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
```

```r
> ## Inspect an object of class SpatialPixelsDataFrame.
> data(meuse.grid)
> spxd = SpatialPixelsDataFrame(points = meuse.grid[c("x", "y")],
+                               data = meuse.grid)
> str(spxd)
```

```
Formal class 'SpatialPixelsDataFrame' [package "sp"] with 7 slots
  ..@ data       :'data.frame':	3103 obs. of  7 variables:
  .. ..$ x     : num [1:3103] 181180 181140 181180 181220 181100 ...
  .. ..$ y     : num [1:3103] 333740 333700 333700 333700 333660 ...
  .. ..$ part.a: num [1:3103] 1 1 1 1 1 1 1 1 1 1 ...
  .. ..$ part.b: num [1:3103] 0 0 0 0 0 0 0 0 0 0 ...
  .. ..$ dist  : num [1:3103] 0 0 0.0122 0.0435 0 ...
  .. ..$ soil  : Factor w/ 3 levels "1","2","3": 1 1 1 1 1 1 1 1 1 1 ...
  .. ..$ ffreq : Factor w/ 3 levels "1","2","3": 1 1 1 1 1 1 1 1 1 1 ...
  ..@ coords.nrs : num(0) 
  ..@ grid       :Formal class 'GridTopology' [package "sp"] with 3 slots
  .. .. ..@ cellcentre.offset: Named num [1:2] 178460 329620
  .. .. .. ..- attr(*, "names")= chr [1:2] "x" "y"
  .. .. ..@ cellsize         : Named num [1:2] 40 40
  .. .. .. ..- attr(*, "names")= chr [1:2] "x" "y"
  .. .. ..@ cells.dim        : Named int [1:2] 78 104
  .. .. .. ..- attr(*, "names")= chr [1:2] "x" "y"
  ..@ grid.index : int [1:3103] 69 146 147 148 223 224 225 226 300 301 ...
  ..@ coords     : num [1:3103, 1:2] 181180 181140 181180 181220 181100 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : NULL
  .. .. ..$ : chr [1:2] "x" "y"
  ..@ bbox       : num [1:2, 1:2] 178440 329600 181560 333760
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:2] "x" "y"
  .. .. ..$ : chr [1:2] "min" "max"
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
  .. .. ..@ projargs: chr NA
```

```r
> head(spxd@data)
```

```
       x      y part.a part.b    dist soil ffreq
1 181180 333740      1      0 0.00000    1     1
2 181140 333700      1      0 0.00000    1     1
3 181180 333700      1      0 0.01222    1     1
4 181220 333700      1      0 0.04347    1     1
5 181100 333660      1      0 0.00000    1     1
6 181140 333660      1      0 0.01222    1     1
```

# Discussion
The `GridTopology` class has three slots to describe a grid. The `cellsize` slot represents the cell resolution and the `cells.dim`, the number of columns and rows. These two slots define the grid extent. The origin of the grid is the lower-left cell center. To include the lower-left corner of the grid in the `GridTopology` representation, that cell center must be offset using the `cellcentre.offset`. The `SpatialGrid` class extends the `GridTopology` with the `bbox` and `proj4string` slots. An alternative representation of raster data is given by the cell center coordinates and a sequence of numbers to identify each cell in the whole raster. With this representation, data processing is more efficient since missing data can be discarded. The `SpatialPixels` class is an examle of this representation, which deine the cell center coordinates and the sequence of numbers in the slots `coords` and `grid.index`, respectively.  

Knowing the lower-left corner coordinates and the cell resolution, the cell center offset as well as the number of cloumns/rows can be easly defined. These information is enough to build a `GridTopology` object. To build a `SpatialGrid` object, a `GridTopology` object can be combined with a valid coordinate reference system definition. From a `SpatialGrid` (or `SpatialPoints`) object, a `SpatialPixels` object can be built. `SpatialGridDataFrame` and `SpatialPixelsDataFrame` extend their respective superclasses with the `data` slot.


# See also
