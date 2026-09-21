# ============================================================
# estadisticas-raster.R
# Calcula max, min, promedio y desviacion estandar para cada
# raster (.tif) de una carpeta.
# Entrada: carpeta con archivos .tif
# Salida : CSV con una fila por raster
# ============================================================

# Carga las librerias necesarias para trabajar con rasters
library(raster)
library(rgdal)

# Define la carpeta de trabajo donde estan los datos
setwd("ruta/a/tus/datos")  # <-- ajustar a tu ruta real

# Lista todos los archivos .tif dentro de la carpeta "raster"
# full.names = TRUE devuelve la ruta completa de cada archivo
listfiles <- list.files(path = "raster", pattern = ".tif", full.names = TRUE)

# Variable vacia donde se iran acumulando los resultados
resultado <- NULL

# Recorre cada raster de la lista, uno por uno
for (i in 1:length(listfiles)) {

  # Abre el raster actual
  archivo_r <- raster(listfiles[i])

  # Calcula las estadisticas principales del raster
  max_v <- cellStats(archivo_r, stat = "max")            # valor maximo
  min_v <- cellStats(archivo_r, stat = "min")            # valor minimo
  prom  <- cellStats(archivo_r, stat = "mean")           # promedio
  sd_v  <- cellStats(archivo_r, stat = "sd", asSample = TRUE)  # desviacion estandar

  # Agrupa los valores calculados en un vector
  valores   <- c(max_v, min_v, prom, sd_v)

  # Nombres de cada estadistica (para identificarlas en el CSV)
  variables <- c("Maximo", "Minimo", "Promedio", "Desviacion estandar")

  # Repite el nombre del archivo 4 veces, una por cada estadistica
  archivo   <- rep(listfiles[i], 4)

  # Une todo en una tabla y la agrega al resultado acumulado
  resultado <- rbind(resultado, data.frame(archivo, variables, valores))

  # Muestra el avance en consola
  print(resultado)
}

# Guarda el resultado final como CSV en la carpeta de trabajo
write.csv(x = resultado,
          file = "resultado.csv",       # nombre del archivo de salida
          append = FALSE,               # sobrescribe si ya existe
          quote = FALSE,                # sin comillas alrededor del texto
          sep = ",",                    # separador por coma
          col.names = FALSE,            # sin encabezados
          row.names = FALSE)            # sin numeros de fila
