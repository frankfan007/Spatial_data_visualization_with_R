

# Problem
You want to identify the CRS of a spatial object.

# Solution

```r
> library(rgdal)
> 
> # Read two shape files.
> muns <- readOGR('../../Data/municipios_IBGE', 'Municipios_IBGE')
```

```
OGR data source with driver: ESRI Shapefile 
Source: "../../Data/municipios_IBGE", layer: "Municipios_IBGE"
with 497 features and 11 fields
Feature type: wkbPolygon with 2 dimensions
```

```r
> fylk <- readOGR('../../Data', 'fylk_val')
```

```
OGR data source with driver: ESRI Shapefile 
Source: "../../Data", layer: "fylk_val"
with 97 features and 10 fields
Feature type: wkbLineString with 2 dimensions
```

```r
> # Print the CRS.
> proj4string(muns)
```

```
[1] "+proj=longlat +ellps=GRS80 +no_defs"
```

```r
> proj4string(fylk)
```

```
[1] "+proj=utm +zone=33 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0"
```

```r
> # Check if the CRS is projected.
> is.projected(muns)
```

```
[1] FALSE
```

```r
> is.projected(fylk)
```

```
[1] TRUE
```

# Discusion
The `proj4string` function print thes CRS of a spatial object, which is represented as a set of "tag=value" pairs or [parameters](https://trac.osgeo.org/proj/wiki/GenParms). For the `muns` object, it can be seen that the projection is "longlat" - meaning that the CRS is geographical or unprojected - and the ellipsoid is GRS80. For the `fylk` object, more parameters define the CRS; the projection is UTM, the UTM zone is 33, the datum is WGS84, the unit of measurment is the meter and the ellipsoid is WGS84. The "+towgs84" tag shows the translation (3 values) or the translation + rotation + scaling (7 values) needed to transform the datum to WGS84.


