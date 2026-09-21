# ============================================================
# estadisticas-shape-multiple.R
# Calcula promedio y desviacion estandar de la columna "Var"
# en varios archivos .dbf de una carpeta.
# Entrada: carpeta con archivos .dbf
# Salida : CSV con una fila por archivo
#
# Nota: script de las primeras pruebas en R, aplicado a un
# tema avanzado (analisis espacial). Funciona, pero la
# documentacion es basica.
# ============================================================

# Carga las librerias necesarias
library(rgdal)
library(foreign)
library(dplyr)

# Define la carpeta de trabajo
setwd("ruta/a/tus/datos")  # <-- ajustar a tu ruta real

# Lista todos los archivos .dbf de la carpeta "shp"
listfiles <- list.files(path = "shp", pattern = ".dbf", full.names = TRUE)

# Variable vacia donde se acumulan los resultados
resultado <- NULL

# Recorre cada archivo .dbf de la lista
for (i in 1:length(listfiles)) {

  # Lee la tabla de atributos del shapefile (.dbf)
  p <- read.dbf(listfiles[i])

  # Toma la columna de interes (ajustar segun el caso)
  var <- p$Var

  # Calcula promedio y desviacion estandar de esa columna
  prom <- mean(var)
  std  <- sd(var)

  # Agrupa los valores y el nombre del archivo
  valores <- cbind(prom, std)
  archivo <- c(listfiles[i])

  # Agrega la fila al resultado acumulado
  resultado <- rbind(resultado, data.frame(archivo, valores))

  # Muestra el avance en consola
  print(resultado)
}

# Guarda el resultado final como CSV
write.csv(x = resultado,
          file = "resultado.csv",
          append = FALSE,
          quote = FALSE,
          sep = ",",
          col.names = FALSE,
          row.names = FALSE)
