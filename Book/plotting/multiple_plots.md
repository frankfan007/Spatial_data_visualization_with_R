


```
library(sp)
library(rgeos)

pts <- readWKT("MULTIPOINT( (6 10), (7 9), (8 10) )")
plot(pts, pch=20, cex=2)

pts <- SpatialPoints(cbind(c(1, 1, 2, 3), c(1, 2, 1.5, 2.5))) 
plot(pts, pch=20, cex=2)

# Bounding Box
ch = gEnvelope(pts)
plot(ch, border="red", add=TRUE)

# Convex Hull
ch = gConvexHull(pts)
plot(ch, border="blue", add=TRUE)
```

```
library(sp)
library(rgeos)

# Cria os pontos
pts <- SpatialPoints(cbind(c(1, 1, 2, 3), c(1, 2, 1.5, 2.5))) 

# Gera o buffer ao redor dos pontos
b1 <- gBuffer(pts, width=0.6, byid=FALSE)
b2 <- gBuffer(pts, width=0.6, byid=TRUE)

#Se byid = TRUE, mantem os circulos de todos os pontos
#se byid = FALSE, corta as circulos que se inteceptam (dissolve)

# Plota o buffer
bufferFillColor=rgb(1,0,0,alpha=0.3)
plot(b1, lwd=2, col=bufferFillColor)
plot(b2, lwd=1, add=TRUE)

# Depois plota os pontos e os ids
points(pts, pch=20, cex=2)
text(coordinates(pts), labels=seq_len(length(pts)), pos=4, font=2)

###
# Exemplo 2

require(sp)
require(rgeos)
d=data.frame(lat=c(33.95,34.95,34.70), lon=c(-118.40,-118.22,-118.43),ID=1:3)

coordinates(d)=~lon+lat
proj4string(d)=CRS("+init=epsg:4326")

buf = gBuffer(d,width=0.2)
plot(buf)
points(d)
```

```
# Dissolve = Juntar poligonos ADJACENTES pg 53
# Merge = Juntar shapes que nao estejam sobrepostos pg 55
# Union = Juntar poligonos SOPREPOSTOS pg 57

library(sp)
# make fake data
# 1) counties:
Cty <- SpatialPolygons( list(
  Polygons(list(Polygon(cbind(x=c(0,1,2,2,0,0)+0.05,y=c(1,2,2,3,3,1)),hole=FALSE)),"county1"),
  Polygons(list(Polygon(cbind(x=c(2,3,3,4,4,3,3,2,2),y=c(1,1,2,2,3,3,4,4,1)),hole=FALSE)),"county2")
) )


counties <- SpatialPolygonsDataFrame(Cty, data = data.frame(ID=paste0("county",1:2),
                                                            row.names=paste0("county",1:2),
                                                            stringsAsFactors=FALSE)
                                     )
plot(counties, xlim=c(2, 4), ylim=c(-1, 4))




Pum <- SpatialPolygons(list(
  Polygons(list(Polygon(cbind(x=c(0,2,2,1,0,0)+1.25,y=c(0,0,2,2,1,0)-0.5), hole=FALSE)),"puma3"),
  Polygons(list(Polygon(cbind(x=c(4,5,5,4,4),y=c(0,0,3,2,0)),hole=FALSE)),"puma4")
))

Pumas <- SpatialPolygonsDataFrame(Pum, data = data.frame(ID=paste0("puma",3:4),
                                                         row.names=paste0("puma",3:4),
                                                         stringsAsFactors=FALSE)
                                  )

fillColor=rgb(0,0,1,alpha=0.3)
plot(Pum, border="red", add=TRUE, col=fillColor)

library(rgeos)
teste1 <- gUnion(counties, Pum)
plot(teste1, xlim=c(2, 4), ylim=c(-1, 4))

###
#Dissolve na mesma camada.


library(sp)
# make fake data
# 1) counties:
Cty <- SpatialPolygons( list(
  Polygons(list(Polygon(cbind(x=c(0,1,2,2,0,0)+0.05,y=c(1,2,2,3,3,1)),hole=FALSE)),"county1"),
  Polygons(list(Polygon(cbind(x=c(2,3,3,4,4,3,3,2,2),y=c(1,1,2,2,3,3,4,4,1)),hole=FALSE)),"county2")
) )


counties <- SpatialPolygonsDataFrame(Cty, data = data.frame(ID=paste0("county",1:2),
                                                            row.names=paste0("county",1:2),
                                                            stringsAsFactors=FALSE)
)
plot(counties, xlim=c(2, 4), ylim=c(-1, 4))

library(rgeos)
teste2 <- gUnaryUnion(counties)
plot(teste2, xlim=c(2, 4), ylim=c(-1, 4))

```

```
# Intersection
library(rgeos)

polygon1 <- readWKT("POLYGON((1 1,5 1,5 5,1 5,1 1),(2 2,2 3,3 3,3 2,2 2))")
line1 <- readWKT("LINESTRING(0 4, 3 4, 3 5.1, 7 5.1)")

isIntersection1 <- gIntersects(polygon1, line1)
intersection1 <- gIntersection(polygon1, line1)

plot(polygon1)
plot(line1, col="red", add=TRUE)
plot(intersection1, add=TRUE, lwd=3, col='blue')

```

```
# Point in polygon
quadrado1 <- readWKT("POLYGON( (0 0, 5 0, 5 5, 0 5, 0 0) )")
pontos1 <- readWKT("MULTIPOINT( 3 4, 2 1, -0.1 -0.1)")

pontos2 <- readWKT("MULTIPOINT( 3 4, 2 1, -0.1 -0.1)")

plot(quadrado1)
plot(pontos1, pch=16, add=TRUE)

gContains(quadrado1, pontos1)

```
