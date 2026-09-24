# ============================================================
# cambiar-valor-pixel.R
# Modifica el valor de un bloque de pixeles en todos los
# rasters (.tif) de una carpeta y guarda una copia modificada
# de cada uno.
# Entrada: carpeta con archivos .tif
# Salida : carpeta con los rasters modificados
#
# Nota: script precursor del metodo para eliminar nubes con
# BQA. A diferencia de BQA, aqui el cambio es por bloque
# rectangular (filas x columnas), no pixel por pixel.
# Fue una primera prueba en R aplicada a un tema avanzado.
# ============================================================

library(raster) #carga la libreria para trabajar con rasters

setwd("ruta/a/tus/datos") #directorio donde se encuentren los datos

listfiles <- list.files(path = "raster", pattern = ".tif", full.names = TRUE) #carga la lista de rasters

dir.create("salida", showWarnings = FALSE) #crea la carpeta de salida si no existe

fila_ini <- 100 #fila inicial del bloque a modificar (ajustar)
fila_fin <- 300 #fila final del bloque a modificar (ajustar)
col_ini  <- 1000 #columna inicial del bloque a modificar (ajustar)
col_fin  <- 2000 #columna final del bloque a modificar (ajustar)
valor    <- 2    #valor que se asignara al bloque (ajustar)

for (i in 1:length(listfiles)) { #recorre cada raster de la lista
  po <- raster(listfiles[i]) #abre el raster actual
  po[fila_ini:fila_fin, col_ini:col_fin] <- valor #cambia el valor del bloque indicado

  nombre_salida <- file.path("salida", basename(listfiles[i])) #construye la ruta de salida conservando el nombre original
  writeRaster(po, nombre_salida, overwrite = TRUE) #guarda el raster modificado

  print(paste("Procesado:", basename(listfiles[i]))) #muestra el avance
}
