# ============================================================
# estadisticas-raster.R
# Calcula max, min, promedio y desviacion estandar para cada
# raster (.tif) de una carpeta.
# Entrada: carpeta con archivos .tif
# Salida : CSV con una fila por raster
#
# Nota: script de las primeras pruebas en R, aplicado a un
# tema avanzado (analisis espacial). Funciona, pero la
# documentacion es basica.
# ============================================================

library(raster) #carga la libreria para trabajar con rasters
library(rgdal)  #carga la libreria para archivos espaciales

setwd("ruta/a/tus/datos") #directorio donde se encuentren los datos

listfiles <- list.files(path = "raster", pattern = ".tif", full.names = TRUE) #carga los raster como una lista

resultado <- NULL #valor nulo para comenzar

for (i in 1:length(listfiles)) { #recorre cada raster de la lista
  archivo_r <- raster(listfiles[i]) #abre el raster actual
  max_v <- cellStats(archivo_r, stat = "max") #encuentra el valor maximo
  min_v <- cellStats(archivo_r, stat = "min") #encuentra el valor minimo
  prom  <- cellStats(archivo_r, stat = "mean") #encuentra el promedio
  sd_v  <- cellStats(archivo_r, stat = "sd", asSample = TRUE) #encuentra la desviacion estandar

  valores   <- c(max_v, min_v, prom, sd_v) #crea un vector con los valores calculados
  variables <- c("Maximo", "Minimo", "Promedio", "Desviacion estandar") #nombres de cada estadistica
  archivo   <- rep(listfiles[i], 4) #asigna el nombre del archivo a cada calculo

  resultado <- rbind(resultado, data.frame(archivo, variables, valores)) #agrega la fila al resultado
  print(resultado) #muestra el avance
}

write.csv(x = resultado, file = "resultado.csv", append = FALSE, quote = FALSE, sep = ",",
          col.names = FALSE, row.names = FALSE) #guarda el resultado como CSV
