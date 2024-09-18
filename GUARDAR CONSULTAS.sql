
/*** Guardar las consultas en un archivo CSV ***/
USE Alumnos; /*** Selección de la base de datos ***/

SELECT * /*** Selección de todas las columnas/atributos ***/
FROM MaratonNY /*** Selección de la tabla que contiene los datos ***/
WHERE Home IN ('MEX', 'BRA', 'ARG', 'PER'); /*** Selección de los registros que contengan (IN) estos países () en la columna/Atributo "Home" ***/

/*** Guardamos la consulta, seleccionado PRIMERO cualquier celda de la tabla de consulta que sale en la parte inferior, en el recuadro "Results".
Después, desde la ventana "File", posicionada en la esquina superior izquierda, seleccionamos la opción "Save Result As ..." ***/
