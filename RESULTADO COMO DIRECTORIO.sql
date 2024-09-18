
/*** Crear una concatenaci�n en formato de directorio ***/
/*** Es decir, que los elementos se vean as�:

Nombre_1
Correo
Direcci�n
Ciudad
Tel�fono
-----

Nombre_2
Correo
Direcci�n
Ciudad
Tel�fono
-----

Nombre_3
Correo
Direcci�n
Ciudad
Tel�fono

***/

USE Alumnos;

SELECT CONCAT_WS(
			CHAR(13), /*** Esto representa saldo de l�nea en cada concatenaci�n (es el separador especificado para cada elemento de los atributos/columnas ***/
			Nombre,
			Correo,
			Direccion,
			Ciudad,
			Telefono,
			' ----- ') /*** �ltimo elemento a concatenar (se puede especificar en cualquier parte). A diferencia del primero que se aplica en cada elemento concatenado, este s�lo se aplica en esta posici�n (NO en cada concatenaci�n) ***/
			AS Directorio
FROM Datos_Personales
ORDER BY Nombre; /*** Ordenamos de manera alfab�tica, de acuerdo a la columna "Nombre" ***/

/*** NOTA: Para observar el directorio en el formato que deseamos, debemos seleccionar que los resultados se observen como texto.
Esto se realiza, con el bot�n "Results to Text" en el apartado superior (�ltima fila por en medio) o con Ctrl + T y corriendo otra vez el c�digo. ***/
