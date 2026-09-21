# ============================================================
# histograma-raster.R
# Genera histograma y mapa (levelplot) de un raster, con
# escala de colores personalizada.
# Entrada: carpeta con archivos .tif
# Salida : figura en pantalla
#
# Nota: script de las primeras pruebas en R, aplicado a un
# tema avanzado (analisis espacial). Funciona, pero la
# documentacion es basica.
# ============================================================

# Carga las librerias necesarias
library(raster)
library(rasterVis)
library(rgdal)
library(jpeg)

# Define la carpeta de trabajo
setwd("ruta/a/tus/datos")  # <-- ajustar a tu ruta real

# Lista todos los archivos .tif de la carpeta "raster"
listfiles <- list.files(path = "raster", pattern = ".tif", full.names = TRUE)

# Abre el raster
r <- raster(listfiles)
print(r)

# Muestra cuantas celdas tiene el raster
ncell(r)

# ------------------------------------------------------------
# Histograma
# ------------------------------------------------------------
# Grafica la distribucion de valores del raster
hist(r,
     main = " ",
     breaks = 20,              # numero de barras
     xlab = "Valor",           # etiqueta eje X
     ylab = "Frecuencia",      # etiqueta eje Y
     col = "black",            # color de las barras
     maxpixels = ncell(r),     # usa todas las celdas
     border = "white",         # borde de las barras
     plot = TRUE,
     xlim = c(0, 9),           # rango eje X (ajustar)
     ylim = c(0, 1300000))     # rango eje Y (ajustar)

# ------------------------------------------------------------
# Mapa con escala de colores
# ------------------------------------------------------------
# Define los intervalos de la escala
breaks <- seq(0, 9, by = 0.5)

# Crea una rampa de colores (verde -> amarillo -> rojo)
cols <- colorRampPalette(c("green", "yellow", "red"))(length(breaks) - 1)

# Grafica el raster con la escala personalizada
levelplot(r,
          at = breaks,
          col.regions = cols,
          main = "Raster",
          xlim = c(649995, 730005),      # limites geograficos (ajustar)
          ylim = c(1120005, 1180005))
