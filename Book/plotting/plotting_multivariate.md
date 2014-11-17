


```r
> # How to plot Points?
> cities <- importShapefile('../../Data/cities', readDBF=FALSE);
```

```
Error: could not find function "importShapefile"
```

```r
> plotPoints(cities);
```

```
Error: could not find function "plotPoints"
```

Data source: [Fundação Estadual de Proteção Ambiental Henrique Luiz Roessler - RS (fepam)](http://www.fepam.rs.gov.br/biblioteca/geo/bases_geo.asp)


```r
> library(PBSmapping);
```

```
Error: there is no package called 'PBSmapping'
```

```r
> rsmunicipios <- importShapefile('../../Data/municipios_IBGE/Municipios_IBGE', readDBF=FALSE);
```

```
Error: could not find function "importShapefile"
```

```r
> plotMap(rsmunicipios);
```

```
Error: could not find function "plotMap"
```

```r
> rslagos <- importShapefile('../../Data/grandes_lagos_1_250000/Grandes_Lagos_1_250000', readDBF=FALSE);
```

```
Error: could not find function "importShapefile"
```

```r
> addPolys(rslagos, col="lightblue1");
```

```
Error: could not find function "addPolys"
```

```r
> # Create a data frame with the points coordinates
> pointCoordinates <- as.data.frame( cbind(1, -30.027879, -51.228467) );
> # Requirement: Rename the data frame columns (EID=unique identifier, Y=latitude e X=longitude)
> colnames(pointCoordinates) <- c("EID", "Y", "X");
> # Coerce the data frame to a EventData object, which is the standard object class of PBS Mapping functions
> PBSMappingCoordinates <- as.EventData( pointCoordinates, projection='LL');
```

```
Error: could not find function "as.EventData"
```

```r
> # Plot the points on the map (pch=point type, col=point color)
> addPoints(PBSMappingCoordinates, pch=19, col="red");
```

```
Error: could not find function "addPoints"
```


```r
> # How to calculate the Areas of Polygons
> polygonArea <- calcArea(rslagos, rollup=3);
```

```
Error: could not find function "calcArea"
```

```r
> head(polygonArea);
```

```
Error: object 'polygonArea' not found
```


```r
> # How to convert lat-long coordinates to UTM?
> pointCoordinates <- as.data.frame( cbind(1, -30.027879, -51.228467) );
> colnames(pointCoordinates) <- c("EID", "Y", "X");
> latLongCoordinates <- as.EventData( pointCoordinates, projection='LL');
```

```
Error: could not find function "as.EventData"
```

```r
> # Convert coordinates
> aux <- convUL(latLongCoordinates);
```

```
Error: could not find function "convUL"
```

```r
> print(aux);
```

```
Error: object 'aux' not found
```


```r
> # How to check an object class?
> rsmunicipios <- importShapefile('../../Data/municipios_IBGE/Municipios_IBGE', readDBF=FALSE);
```

```
Error: could not find function "importShapefile"
```

```r
> str(rsmunicipios);
```

```
Error: object 'rsmunicipios' not found
```

```r
> class(rsmunicipios);
```

```
Error: object 'rsmunicipios' not found
```


```r
> # How to convert a PBSmapping object to a SP object
> PBSMappingObject <- importShapefile('../../Data/grandes_lagos_1_250000/Grandes_Lagos_1_250000', readDBF=FALSE);
```

```
Error: could not find function "importShapefile"
```

```r
> class(PBSMappingObject);
```

```
Error: object 'PBSMappingObject' not found
```

```r
> SPObject <- PolySet2SpatialPolygons(PBSMappingObject);
```

```
Error: object 'PBSMappingObject' not found
```

```r
> class(SPObject);
```

```
Error: object 'SPObject' not found
```


```r
> # How to access a SP Polygon attribute?
> rslagos <- importShapefile('../../Data/grandes_lagos_1_250000/Grandes_Lagos_1_250000', readDBF=FALSE);
```

```
Error: could not find function "importShapefile"
```

```r
> rslagos <- PolySet2SpatialPolygons(rslagos);
```

```
Error: object 'rslagos' not found
```

```r
> aux1 <- slot(rslagos, "polygons");
```

```
Error: object 'rslagos' not found
```

```r
> aux2 <- rslagos@polygons;
```

```
Error: object 'rslagos' not found
```


```r
> # How to get the number of sub-polygons in a Polygon?
> rslagos <- importShapefile('../../Data/grandes_lagos_1_250000/Grandes_Lagos_1_250000', readDBF=FALSE);
```

```
Error: could not find function "importShapefile"
```

```r
> rslagos <- PolySet2SpatialPolygons(rslagos);
```

```
Error: object 'rslagos' not found
```

```r
> length(rslagos@polygons);
```

```
Error: object 'rslagos' not found
```
