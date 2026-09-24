# edicion

Scripts para modificar y guardar archivos espaciales.

Estos scripts fueron desarrollados durante las primeras etapas de aprendizaje de R, aplicados a problemas reales de análisis espacial. Funcionan y sus resultados fueron verificados manualmente en ArcGIS/QGIS, aunque su documentación es básica.

## Scripts

### `cambiar-valor-pixel.R`

Modifica el valor de un bloque de píxeles en todos los rasters (`.tif`) de una carpeta y guarda una copia modificada de cada uno en una carpeta de salida.

- **Entrada:** carpeta con archivos `.tif`
- **Salida:** carpeta con los rasters modificados

Fue el script precursor del método para eliminar nubes con BQA. A diferencia de BQA, aquí el cambio es por bloque rectangular (filas × columnas), no píxel por píxel.

## Uso general

1. Colocar los archivos de entrada en una carpeta local.
2. Ajustar la ruta en la línea `setwd("ruta/a/tus/datos")`.
3. Ajustar el rango de filas y columnas, y el valor a asignar.
4. Ejecutar el script en R o RStudio.

## Notas

- Todos los rasters deben tener las mismas dimensiones para que el cambio de bloque sea consistente.
- El cambio ocurre solo en los archivos de salida; los originales no se modifican.
