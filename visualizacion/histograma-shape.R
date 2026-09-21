# ============================================================
# histograma-shape.R
# Histograma de la columna "Var" de un archivo .dbf.
# Entrada: archivo .dbf
# Salida : figura en pantalla
#
# Nota: script de las primeras pruebas en R, aplicado a un
# tema avanzado (analisis espacial). Funciona, pero la
# documentacion es basica.
# ============================================================

library (foreign) #carga la libreria para leer archivos .dbf

setwd("ruta/a/tus/datos") #directorio donde se encuentren los datos

dato <- read.dbf("datos.dbf", as.is = FALSE) ##se ocupa solo el archivo dbf del shape
print(dato)

histograma <- hist(dato$Var, breaks = 20, xlim = c(0,9)) ##numero de divisiones y limites del eje x
plot(histograma)
