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

# Carga las librerias necesarias
library(raster)
library(rgdal)
library(sp)

# Inicia el cronometro para medir cuanto tarda el script
t <- proc.time()

# Define la carpeta de trabajo
setwd("ruta/a/tus/datos")  # <-- ajustar a tu ruta real

# Lista todos los archivos .tif de la carpeta "raster"
ras <- list.files(path = "raster", pattern = ".tif", full.names = TRUE)
print(ras)

# Carga el shapefile con los poligonos de interes
# layer = nombre del archivo .shp sin extension
polygon <- readOGR(dsn = getwd(), layer = "perfiles")  # <-- ajustar nombre de capa

# Extrae los nombres de cada poligono desde la columna "Var"
nombres <- polygon$Var

print(polygon)

# Convierte la lista de rasters en un stack (varias capas juntas)
s <- stack(ras)

# Extrae el valor promedio de cada raster dentro de cada poligono
# fun = "mean" calcula el promedio, na.rm = TRUE ignora valores vacios
ex <- extract(s, polygon, fun = "mean", na.rm = TRUE, df = TRUE)

# Agrega los nombres de los poligonos al resultado
ex <- cbind(nombres, ex)

print(ex)

# Guarda el resultado como CSV
write.csv(x = ex,
          file = "resultado.csv",
          append = FALSE,
          quote = FALSE,
          sep = ",",
          col.names = FALSE,
          row.names = FALSE)

# Detiene el cronometro y muestra cuanto tardo
proc.time() - t
