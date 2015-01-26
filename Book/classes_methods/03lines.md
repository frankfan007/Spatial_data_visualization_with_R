

# Problem
You want to display the structure of classes used to represent lines as well as the structure of an object of class `SpatialLinesDataFrame`.

# Solution
1. Use the `getClass` function to display the definition of classes.

```r
> library(sp)
> getClass('Line')
```

```
Class "Line" [package "sp"]

Slots:
             
Name:  coords
Class: matrix

Known Subclasses: "Polygon"
```

```r
> getClass('Lines')
```

```
Class "Lines" [package "sp"]

Slots:
                          
Name:      Lines        ID
Class:      list character
```

```r
> getClass('SpatialLines')
```

```
Class "SpatialLines" [package "sp"]

Slots:
                                          
Name:        lines        bbox proj4string
Class:        list      matrix         CRS

Extends: "Spatial", "SpatialLinesNULL"

Known Subclasses: "SpatialLinesDataFrame"
```

```r
> getClass('SpatialLinesDataFrame')
```

```
Class "SpatialLinesDataFrame" [package "sp"]

Slots:
                                                      
Name:         data       lines        bbox proj4string
Class:  data.frame        list      matrix         CRS

Extends: 
Class "SpatialLines", directly
Class "Spatial", by class "SpatialLines", distance 2
Class "SpatialLinesNULL", by class "SpatialLines", distance 2
```

2. Import a shapefile with data represented by lines using the `readOGR` function from the `rgdal` package and then inspect the specific slots of a `SpatialLinesDataFrame` object:

```r
> library(rgdal)
```

```
rgdal: version: 0.8-16, (SVN revision 498)
Geospatial Data Abstraction Library extensions to R successfully loaded
Loaded GDAL runtime: GDAL 1.11.0, released 2014/04/16
Path to GDAL shared files: C:/Users/raul/Documents/R/win-library/3.1/rgdal/gdal
GDAL does not use iconv for recoding strings.
Loaded PROJ.4 runtime: Rel. 4.8.0, 6 March 2012, [PJ_VERSION: 480]
Path to PROJ.4 shared files: C:/Users/raul/Documents/R/win-library/3.1/rgdal/proj
```

```r
> # Import the shapefile.
> fylk <- readOGR('../../Data', 'fylk_val')
```

```
OGR data source with driver: ESRI Shapefile 
Source: "../../Data", layer: "fylk_val"
with 97 features and 10 fields
Feature type: wkbLineString with 2 dimensions
```

```r
> # Display the general structure and the second object of the "lines" slot.
> str(fylk, 2)
```

```
Formal class 'SpatialLinesDataFrame' [package "sp"] with 4 slots
  ..@ data       :'data.frame':	97 obs. of  10 variables:
  ..@ lines      :List of 97
  ..@ bbox       : num [1:2, 1:2] -4868 6456207 1084722 7841997
  .. ..- attr(*, "dimnames")=List of 2
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
```

```r
> str(fylk@lines[[2]])
```

```
Formal class 'Lines' [package "sp"] with 2 slots
  ..@ Lines:List of 1
  .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. ..@ coords: num [1:4, 1:2] 1084722 1084706 1081226 1081217 7791342 ...
  ..@ ID   : chr "1"
```

```r
> fylk@lines[[2]]@Lines
```

```
[[1]]
An object of class "Line"
Slot "coords":
        [,1]    [,2]
[1,] 1084722 7791342
[2,] 1084706 7791372
[3,] 1081226 7797769
[4,] 1081217 7797822
```

# Discussion
Representation of lines in the `sp` package follows a hierarchical approach with a more complex structure in comparison with the representation of points.  
 
The `Line` class has two slots: `coords` and `ID`. The `coords` slot, which is a `matrix` to store point coordinates. It is the interpolation between these points (stright lines beteewn two succesive points) that represents lines. The `ID` slot has an identifying character string.

The `Lines` class has the `Lines` slot, which is a `list` of `Line` objects.  

Note that `SpatialLines` class extends the `Spatial` class adding the `lines` slot, which is a `List` of `Lines` objects. On the other hand, `SpatialLinesDataFrame` extends `SpatialLines` adding the `data` slot, a `data.frame` with features or attributes of the lines. Each row is associated with a line. The `ID` slot is used to match `Liness` objects stored in the `lines` slot, with observations in the `data` slot.

# See also
