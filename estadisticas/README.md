# estadisticas

Scripts para calcular estadísticas sobre rasters y shapefiles sin necesidad de abrir ArcGIS o QGIS.

Estos scripts fueron desarrollados durante las primeras etapas de aprendizaje de R, aplicados a problemas reales de análisis espacial. Funcionan y sus resultados fueron verificados manualmente en ArcGIS/QGIS, aunque su documentación es básica.

## Scripts

### `estadisticas-raster.R`

Calcula máximo, mínimo, promedio y desviación estándar para cada raster (`.tif`) de una carpeta.

- **Entrada:** carpeta con archivos `.tif`
- **Salida:** CSV con una fila por raster

### `estadisticas-raster-shape.R`

Extrae el promedio de un stack de rasters dentro de los polígonos de un shapefile.

- **Entrada:** stack de `.tif` + shapefile (`.shp`)
- **Salida:** CSV con una fila por polígono

### `estadisticas-shape-multiple.R`

Calcula promedio y desviación estándar de la columna `Var` en varios archivos `.dbf` de una carpeta.

- **Entrada:** carpeta con archivos `.dbf`
- **Salida:** CSV con una fila por archivo

## Uso general

1. Colocar los archivos de entrada en una carpeta local.
2. Ajustar la ruta en la línea `setwd("ruta/a/tus/datos")` de cada script.
3. Ejecutar el script en R o RStudio.

## Notas

- `Var` es el nombre genérico de la columna de interés en los shapefiles (profundidad, velocidad, cobertura, etc.). Ajustar según el caso.
- Los scripts de estadísticas para raster requieren al menos dos rasters en la carpeta para funcionar correctamente.
