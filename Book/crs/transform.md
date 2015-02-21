

# Problem
You want to set the CRS for a spatial object - in this example, a single point - and then to transform the CRS.

# Solution
When you know exactly the EPSG code or the PROJ.4 description of the CRS:

```r
> library(sp); library(rgdal)
> 
> # Create a SpatialPoints object with a single point,
> # using the SIRGASS 2000, UTM zone 23S as the CRS.
> pt <- cbind(x = -23.5, y = -46.6)
> crs <- CRS('+init=epsg:31983')
> sp.pt <- SpatialPoints(pt, crs)
> 
> # Print the CRS.
> proj4string(sp.pt)
```

```
[1] "+init=epsg:31983 +proj=utm +zone=23 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
```

```r
> is.projected(sp.pt)
```

```
[1] TRUE
```

```r
> # Transform the CRS to WGS84.
> sp.pt <- spTransform(sp.pt, CRS("+init=epsg:4326"))
> proj4string(sp.pt)
```

```
[1] "+init=epsg:4326 +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
```

```r
> is.projected(sp.pt)
```

```
[1] FALSE
```

If you don't know exactly the EPSG code or the PROJ.4 description of the CRS, there are many ways to find this information.  

Suppose you have the object `sp.pt` with WGS84 as the CRS and want to tranform it to SIRGASS 2000, UTM zone 23S.

```r
> # Make a data frame with the available CRS.
> EPSG <- make_EPSG()
> names(EPSG)
```

```
[1] "code" "note" "prj4"
```

```r
> # Search CRS having the string "SIRGAS 2000" in their EPSG's note column.
> EPSG[grep('SIRGAS *2000', EPSG$note), 1:2]
```

```
      code                         note
321   4674                # SIRGAS 2000
2705  5396 # SIRGAS 2000 / UTM zone 26S
3654 31965 # SIRGAS 2000 / UTM zone 11N
3655 31966 # SIRGAS 2000 / UTM zone 12N
3656 31967 # SIRGAS 2000 / UTM zone 13N
3657 31968 # SIRGAS 2000 / UTM zone 14N
3658 31969 # SIRGAS 2000 / UTM zone 15N
3659 31970 # SIRGAS 2000 / UTM zone 16N
3660 31971 # SIRGAS 2000 / UTM zone 17N
3661 31972 # SIRGAS 2000 / UTM zone 18N
3662 31973 # SIRGAS 2000 / UTM zone 19N
3663 31974 # SIRGAS 2000 / UTM zone 20N
3664 31975 # SIRGAS 2000 / UTM zone 21N
3665 31976 # SIRGAS 2000 / UTM zone 22N
3666 31977 # SIRGAS 2000 / UTM zone 17S
3667 31978 # SIRGAS 2000 / UTM zone 18S
3668 31979 # SIRGAS 2000 / UTM zone 19S
3669 31980 # SIRGAS 2000 / UTM zone 20S
3670 31981 # SIRGAS 2000 / UTM zone 21S
3671 31982 # SIRGAS 2000 / UTM zone 22S
3672 31983 # SIRGAS 2000 / UTM zone 23S
3673 31984 # SIRGAS 2000 / UTM zone 24S
3674 31985 # SIRGAS 2000 / UTM zone 25S
```

```r
> # Alternatively, a more detailed search.
> pattern <- c("SIRGAS *2000", "UTM", "23S") 
> matches <- Reduce('&', lapply(pattern, grepl, EPSG$note))
> EPSG[matches, ]
```

```
      code                         note
3672 31983 # SIRGAS 2000 / UTM zone 23S
                                                                                prj4
3672 +proj=utm +zone=23 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs
```

```r
> # Transform the CRS using the EPSG code found above.
> crs <- CRS('+init=epsg:31983')
> sp.pt <- spTransform(sp.pt, crs)
```

Now suppose you have the object `sp.pt` with SIRGASS 2000, UTM zone 23S as the CRS and want to tranform it to WGS84. Searching for the strings "longlat" and "WGS 84" in the EPSG's note column dosen't find any CRS and searching only for "WGS 84" finds too many. As an alternative, you can search for the pattern in the EPSG's PROJ.4 column.


```r
> pattern <- c('longlat', 'WGS *84') 
> matches <- Reduce('&', lapply(pattern, grepl, EPSG$note))
> EPSG[matches, 1:2]
```

```
[1] code note
<0 rows> (or 0-length row.names)
```

```r
> pattern <- c('WGS *84') 
> matches <- Reduce('&', lapply(pattern, grepl, EPSG$note))
> # EPSG[matches, ] # Uncomment to print matches.
> 
> pattern <- c('longlat', 'WGS *84') 
> matches <- Reduce('&', lapply(pattern, grepl, EPSG$prj4))
> EPSG[matches, 1:2]
```

```
    code                                             note
33  4030  # Unknown datum based upon the WGS 84 ellipsoid
34  4031 # Unknown datum based upon the GEM 10C ellipsoid
63  4130                                         # Moznet
81  4148                               # Hartebeesthoek94
96  4163                                    # Yemen NGN96
99  4166                                    # Korean 1995
245 4318                                            # NGN
249 4326                                         # WGS 84
297 4640                                      # RRAF 1991
314 4667                                        # IKBD-92
317 4670                                          # IGM95
340 4693                                 # Nakhl-e Ghanem
341 4694                                      # POSGAR 94
397 4750                                     # ST87 Ouvea
402 4755                                          # DGN95
403 4756                                        # VN-2000
404 4757                                          # SVY21
405 4758                                        # JAD2001
409 4762                                        # BDA2000
410 4763                                  # Pitcairn 2006
451 5365                                           # CR05
454 5381                                   # SIRGAS-ROU98
```

```r
> # Transform the CRS using the EPSG code found above.
> crs <- CRS('+init=epsg:4326')
> sp.pt <- spTransform(sp.pt, crs)
```

# Discussion
When a spatial object is created, the CRS must be defined. Knowing the exact EPSG code or the PROJ.4 description, the the CRS can be defined using the `CRS` function. For example, to set the CRS as WGS84, to equivalent options are `crs <- CRS('+init=epsg:2346')` and `crs <- CRS('+proj=longlat +datum=WGS84 +no_defs')`. The CRS can also be set as `NA`.  

If neigther the exact EPSG code nor the PROJ.4 description are known exactly, the CRS can be searched in a EPSG list of CRS, available in the rgdal package. The list can be read in a `data.frame` using the `make_EPSG()` function. The `data.frame` has three columns, the first has the EPSG code, the second a note and the third the PROJ.4 description. A common approach is to search a pattern in the note column. For example, to search for the pattern "SIRGAS 2000", one option is `EPSG[grep('SIRGAS 2000'), ]`. If the pattern of interest is "SIRGAS", followed by 0 or more white spaces and ending in "2000", the search can be done using `EPSG[grep('SIRGAS *2000', EPSG$note), ]`. Beacuse the search is case sensitive the following option can be used when not sure about the case
`EPSG[grep('SIRGAS *2000', EPSG$note, ignore.case = T), ]`. Sometimes, searching in the note column dosen't return a useful result but you can try using the `prj4` column. Anyway, when one or more CRS is returned, the code or the PROJ.4 description (`prj4` column) might be used to set or transform the CRS of a spatial object. The more general the pattern, the higher the probability of matching many CRS. One way to narrow the search is to look for more than one pattern in the column of interest. This is the rationale behind the code: `pattern <- c("SIRGAS *2000", "UTM", "23S")` `matches <- Reduce('&', lapply(pattern, grepl, EPSG$note))`. Here, successful matches are given by entries in the note column, containing the patterns "SIRGAS *2000", "UTM" and "23S".
