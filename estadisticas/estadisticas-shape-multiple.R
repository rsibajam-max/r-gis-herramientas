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

library(rgdal)   #carga la libreria para archivos espaciales
library(foreign) #carga la libreria para leer .dbf
library(dplyr)   #carga la libreria para manipulacion de datos

setwd("ruta/a/tus/datos") #directorio donde se encuentren los datos

listfiles <- list.files(path = "shp", pattern = ".dbf", full.names = TRUE) #carga lista de archivos .dbf

resultado <- NULL #valor nulo para comenzar

for (i in 1:length(listfiles)) { #recorre cada archivo .dbf
  p <- read.dbf(listfiles[i]) #lee la tabla de atributos del shapefile
  var <- p$Var #toma la columna de interes
  prom <- mean(var) #encuentra el promedio
  std <- sd(var) #encuentra la desviacion estandar
  valores <- cbind(prom, std) #crea un vector con los valores calculados
  archivo <- c(listfiles[i]) #asigna el nombre del archivo
  resultado <- rbind(resultado, data.frame(archivo, valores)) #agrega la fila al resultado
  print(resultado) #muestra el avance
}

write.csv(x = resultado, file = "resultado.csv", append = FALSE, quote = FALSE, sep = ",",
          col.names = FALSE, row.names = FALSE) #guarda el resultado como CSV
