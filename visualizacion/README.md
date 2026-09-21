# visualizacion

Scripts para generar histogramas y mapas a partir de rasters y shapefiles.

Estos scripts fueron desarrollados durante las primeras etapas de aprendizaje de R, aplicados a problemas reales de análisis espacial. Funcionan y sus resultados fueron verificados manualmente en ArcGIS/QGIS, aunque su documentación es básica.

## Scripts

### `histograma-raster.R`

Genera un histograma y un mapa (`levelplot`) de un raster, con escala de colores personalizada.

- **Entrada:** carpeta con archivos `.tif`
- **Salida:** figura en pantalla

### `histograma-shape.R`

Genera un histograma de la columna `Var` de un archivo `.dbf`.

- **Entrada:** archivo `.dbf`
- **Salida:** figura en pantalla

## Uso general

1. Colocar los archivos de entrada en una carpeta local.
2. Ajustar la ruta en la línea `setwd("ruta/a/tus/datos")` de cada script.
3. Ejecutar el script en R o RStudio.

## Notas

- `Var` es el nombre genérico de la columna de interés en los shapefiles (profundidad, velocidad, cobertura, etc.). Ajustar según el caso.
- Los límites de los ejes (`xlim`, `ylim`) y los intervalos de la escala de colores (`breaks`) deben ajustarse según el raster o la zona de estudio.
