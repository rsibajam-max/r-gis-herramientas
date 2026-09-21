# ============================================================
# estadisticas-raster-shape.R
# Extrae el promedio de un stack de rasters dentro de los
# poligonos de un shapefile.
# Entrada: stack de .tif + shapefile (.shp)
# Salida : CSV con una fila por poligono
#
# Nota: script de las primeras pruebas en R, aplicado a un
# tema avanzado (analisis espacial). Funciona, pero la
# documentacion es basica.
# ============================================================

library(raster) #carga la libreria para rasters
library(rgdal)  #carga la libreria para archivos espaciales
library(sp)     #carga la libreria para datos espaciales

t <- proc.time() #se pone al inicio del codigo

setwd("ruta/a/tus/datos") #directorio donde se encuentren los datos

ras <- list.files(path = "raster", pattern = ".tif", full.names = TRUE) #carga los raster como una lista
print(ras)

polygon <- readOGR(dsn = getwd(), layer = "perfiles") #carga el shapefile (ajustar nombre de capa)

nombres <- polygon$Var #extrae los nombres de cada poligono

print(polygon)

s <- stack(ras) #convierte la lista de raster en un stack (conjunto de capas)

ex <- extract(s, polygon, fun = "mean", na.rm = TRUE, df = TRUE) #extrae el promedio del stack dentro del shape

ex <- cbind(nombres, ex) #agrega los nombres de los poligonos al resultado

print(ex)

write.csv(x = ex, file = "resultado.csv", append = FALSE, quote = FALSE, sep = ",",
          col.names = FALSE, row.names = FALSE) #guarda el resultado como CSV

proc.time() - t #se pone al final del codigo
