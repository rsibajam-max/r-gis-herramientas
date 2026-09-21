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

library(raster)    #carga la libreria para trabajar con rasters
library(rasterVis) #carga la libreria para visualizacion de rasters
library(rgdal)     #carga la libreria para archivos espaciales
library(jpeg)      #carga la libreria para imagenes

setwd("ruta/a/tus/datos") #directorio donde se encuentren los datos

listfiles <- list.files(path = "raster", pattern = ".tif", full.names = TRUE) #carga lista de raster de la carpeta
ET <- raster(listfiles) #convierte la lista de archivos en un raster
plot(ET, col = terrain.colors(20)) #grafica el raster con colores de terreno
print(ET)
ncell(ET) #obtiene el numero de celdas del raster

#Histograma
graf <- hist(ET, main = " ", breaks = 20, xlab = "Valor", ylab = "Frecuencia",
             col = "black", maxpixels = ncell(ET), border = "white", plot = TRUE,
             xlim = c(0,9), ylim = c(0,1300000)) #grafica la distribucion de valores del raster

#Figura con escala de colores abajo########################################################

breaks <- seq(0, 9, by=0.5) #rango de colores en la figura
cols <- colorRampPalette(c("green", "yellow", "red"))(length(breaks)-1) #rampa de colores

levelplot(ET, at=breaks, col.regions=cols, main = "Raster", letters= 5,
          xlim=c( 649995, 730005), ylim=c( 1120005, 1180005)) #grafica el raster con la escala de colores

###########################################################################################
plot(ET, breaks) #grafica el raster con los breaks definidos
levelplot(ET, xlim=c( 649995, 730005), ylim=c( 1120005, 1180005)) #grafica el raster con los limites definidos
