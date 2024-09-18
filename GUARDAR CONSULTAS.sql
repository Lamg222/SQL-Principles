
/*** Guardar las consultas en un archivo CSV ***/
USE Alumnos; /*** Selecci�n de la base de datos ***/

SELECT * /*** Selecci�n de todas las columnas/atributos ***/
FROM MaratonNY /*** Selecci�n de la tabla que contiene los datos ***/
WHERE Home IN ('MEX', 'BRA', 'ARG', 'PER'); /*** Selecci�n de los registros que contengan (IN) estos pa�ses () en la columna/Atributo "Home" ***/

/*** Guardamos la consulta, seleccionado PRIMERO cualquier celda de la tabla de consulta que sale en la parte inferior, en el recuadro "Results".
Despu�s, desde la ventana "File", posicionada en la esquina superior izquierda, seleccionamos la opci�n "Save Result As ..." ***/
