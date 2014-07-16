

# problem
you want to append a data base inside a shapefile, using different reference cagories.

# solution 
the package base has the ``merge`` function that can make join of two data frames 


```r
> library(base)
> cities <- readOGR( ".", "xxxx" )
```

```
Error: could not find function "readOGR"
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
Error: object 'cities' not found
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
Error: object 'cities' not found
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















