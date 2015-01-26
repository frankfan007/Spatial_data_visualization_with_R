

# Problem
You want to read a shapefile.

# Solution
The ``rgdal`` package has the function ``readOGR()`` to read shapefiles:

```r
> library(rgdal)
> cities <- readOGR('../../Data', 'cities')
```

```
OGR data source with driver: ESRI Shapefile 
Source: "../../Data", layer: "cities"
with 606 features and 4 fields
Feature type: wkbPoint with 2 dimensions
```
The ``maptools`` package also has functions to read shapefiles:

```r
> library(maptools)
```

```
Checking rgeos availability: TRUE
```

```r
> cities <- readShapeSpatial('../../Data/cities')
```
The ``PBSmapping`` package, which requires the ```maptools``, ``sp``, ``rgeos`` and ``foreign`` packages, also has functions to read shapefiles:

```r
> library(PBSmapping);
```

```

-----------------------------------------------------------
PBS Mapping 2.67.60 -- Copyright (C) 2003-2013 Fisheries and Oceans Canada

PBS Mapping comes with ABSOLUTELY NO WARRANTY;
for details see the file COPYING.
This is free software, and you are welcome to redistribute
it under certain conditions, as outlined in the above file.

A complete user guide 'PBSmapping-UG.pdf' is located at 
C:/Users/raul/Documents/R/win-library/3.1/PBSmapping/doc/PBSmapping-UG.pdf

Packaged on 2014-03-27
Pacific Biological Station, Nanaimo

All available PBS packages can be found at
http://code.google.com/p/pbs-software/

To see demos, type '.PBSfigs()'.
-----------------------------------------------------------
```

```r
> library(maptools);
> library(sp);
> library(rgeos);
> library(foreign);
> cities <- importShapefile('../../Data/cities', readDBF=FALSE);
```


# Discussion
The Esri [shapefile](http://en.wikipedia.org/wiki/Shapefile), or simply a shapefile, is a popular geospatial vector data format for storing geometric location and associated attribute information. A shapefile is a set of files. Three individual files are mandatory to store the core data that comprise a shapefile: .shp, .shx, and .dbf. There are further optional files which store primarily index data to improve performance. All files should be located in the same folder.  

When using ``readOGR()`` to read ``cities.shp`` located at ``~/Data (windows: C:/Data)``, define the ``dsn`` argument as the path and the ``layer`` argument as the name of the file without extension. For example: ``readOGR('~/Data', "cities")``. If the shapefile is in the current working directory, an equivalent function call is: ``readOGR('.', "cities")``. See ``?readOGR`` for a detailed description of available arguments.  

With ``readShapeSpatial()``, use ``readShapeSpatial('~/Data/cities')`` to read ``cities.shp`` located at ``~/Data (windows: C:/Data)``. If the shapefile is in the current working directory, an equivalent function call is: ``readShapeSpatial('cities')``. The maptools package also has specific functions for each vector data type: ``readShapePoints()``, ``readShapePoly()`` and ``readShapeLines()``. ``readShapeSpatial()`` can be used instead of the previous three functions. See ``?readShapeSpatial`` for a detailed description of available arguments.  

# See also
XXX Draft XXX  
Classes and methods section for a description of the structure of created objects (in this case ``cities``).   













