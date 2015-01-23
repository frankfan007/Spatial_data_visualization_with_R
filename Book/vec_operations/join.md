<<<<<<< HEAD


# problem
you want to append a data base inside a shapefile, using different reference cagories.

# solution 
the package base has the ``merge`` function that can make join of two data frames 


```r
> library(base)
> cities <- readOGR( ".", "xxxx" )
```

```
Error: Cannot open file
```

```r
> renda <- read.csv( "renda_distrito.R", header = TRUE )
```

```
Warning: cannot open file 'renda_distrito.R': No such file or directory
```

```
Error: cannot open the connection
```

```r
> str( cities, 2 )
```

```
Classes 'EventData' and 'data.frame':	606 obs. of  3 variables:
 $ EID: int  1 2 3 4 5 6 7 8 9 10 ...
 $ X  : num  33.1 40.6 30.5 150.8 56.2 ...
 $ Y  : num  69 64.5 60 59.6 58 ...
 - attr(*, "parent.child")= num 
 - attr(*, "shpType")= int 1
 - attr(*, "prj")= chr "GEOGCS[\"GCS_WGS_1984\",DATUM[\"D_WGS_1984\",SPHEROID[\"WGS_1984\",6378137,298.257223563]],PRIMEM[\"Greenwich\",0],UNIT[\"Degre"| __truncated__
 - attr(*, "projection")= chr "LL"
```

```r
> str(renda)
```

```
Error: object 'renda' not found
```

```r
> cities.renda <- merge( by = "nombre.distrito", cities@data$distrito, renda )
```

```
Error: trying to get slot "data" from an object (class "EventData") that
is not an S4 object
```

```r
> str( cities.renda )
```

```
Error: object 'cities.renda' not found
```

```r
> cities@data$renda <- cities.renda$x
```

```
Error: object 'cities.renda' not found
```

#Discusion 

To know the structure of shapefile and of a variavel used is important for the join. we need have a reference variavel with the categories of reference for could make the join for this do you need select a variavel that has the diferents categories of shapefile as the other file. After applied a funtion ``merge``, a new dataframe is create with two variavels, the firs variavel are references categories and the second .........

# see also















=======


# problem
you want to append a data base inside a shapefile, using different reference cagories.

# solution 
the package base has the ``merge`` function that can make join of two data frames 


```r
> library(base)
> cities <- readOGR( ".", "xxxx" )
```

```
Error: Cannot open file
```

```r
> renda <- read.csv( "renda_distrito.R", header = TRUE )
```

```
Warning: cannot open file 'renda_distrito.R': No such file or directory
```

```
Error: cannot open the connection
```

```r
> str( cities, 2 )
```

```
Formal class 'SpatialPointsDataFrame' [package "sp"] with 5 slots
  ..@ data       :'data.frame':	606 obs. of  4 variables:
  .. ..- attr(*, "data_types")= chr [1:4] "C" "C" "N" "C"
  ..@ coords.nrs : num(0) 
  ..@ coords     : num [1:606, 1:2] 33.1 40.6 30.5 150.8 56.2 ...
  .. ..- attr(*, "dimnames")=List of 2
  ..@ bbox       : num [1:2, 1:2] -165.3 -53.2 177.1 78.2
  .. ..- attr(*, "dimnames")=List of 2
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slots
```

```r
> str(renda)
```

```
Error: object 'renda' not found
```

```r
> cities.renda <- merge( by = "nombre.distrito", cities@data$distrito, renda )
```

```
Error: object 'renda' not found
```

```r
> str( cities.renda )
```

```
Error: object 'cities.renda' not found
```

```r
> cities@data$renda <- cities.renda$x
```

```
Error: object 'cities.renda' not found
```

#Discusion 

To know the structure of shapefile and of a variavel used is important for the join. we need have a reference variavel with the categories of reference for could make the join for this do you need select a variavel that has the diferents categories of shapefile as the other file. After applied a funtion ``merge``, a new dataframe is create with two variavels, the firs variavel are references categories and the second .........

# see also















>>>>>>> origin/master
