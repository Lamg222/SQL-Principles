
/*** Crear una concatenación en formato de directorio ***/
/*** Es decir, que los elementos se vean así:

Nombre_1
Correo
Dirección
Ciudad
Teléfono
-----

Nombre_2
Correo
Dirección
Ciudad
Teléfono
-----

Nombre_3
Correo
Dirección
Ciudad
Teléfono

***/

USE Alumnos;

SELECT CONCAT_WS(
			CHAR(13), /*** Esto representa saldo de línea en cada concatenación (es el separador especificado para cada elemento de los atributos/columnas ***/
			Nombre,
			Correo,
			Direccion,
			Ciudad,
			Telefono,
			' ----- ') /*** Último elemento a concatenar (se puede especificar en cualquier parte). A diferencia del primero que se aplica en cada elemento concatenado, este sólo se aplica en esta posición (NO en cada concatenación) ***/
			AS Directorio
FROM Datos_Personales
ORDER BY Nombre; /*** Ordenamos de manera alfabética, de acuerdo a la columna "Nombre" ***/

/*** NOTA: Para observar el directorio en el formato que deseamos, debemos seleccionar que los resultados se observen como texto.
Esto se realiza, con el botón "Results to Text" en el apartado superior (última fila por en medio) o con Ctrl + T y corriendo otra vez el código. ***/
