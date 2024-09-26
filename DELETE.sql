
/*** DELETE ***/
/*** Para borrar registros ***/
/*** Nota: si los registros de una tabla est�n ligados/vinculados, 
mediante una llave foranea (foreign keys, esta es una columna que sirve de v�nculo/relaci�n con la tabla primaria del estudio) NO podremos borrar los registros ***/

/*** DELETE para un registro en particular ***/
USE Cursos

DELETE MaratonNY_Modificada /*** Tabla donde se encuentra el registro que queremos eliminar ***/
WHERE Corredor = 53; /*** Condici�n para ejecutar el comando DELETE ***/

/*** Visualizamos los resultados ***/
USE Cursos

SELECT *
FROM MaratonNY_Modificada
ORDER BY Corredor;


/*** DELETE + WHERE + SELECT + FROM + WHERE ***/
/*** Eliminamos los registros dada una condici�n o resultado de una columna (Tiempo_Horas), basada en otra condici�n de otra columna (home) ***/
USE Cursos

DELETE FROM MaratonNY_Modificada
WHERE Tiempo_Horas < ALL /*** Con la palabra clave "ALL" especificamos que, 
							  los registros se eliminar�n (sentencia a ejecutar "DELETE") si el valor de la columna "Tiempo_Horas",
							  es menor (<) que TODOS (ALL) valores devueltos por la siguiente subconsulta (la qe se encuentra entre par�ntesis ()).
							  Por lo tanto, eliminar� aquellos valores que sean menores al valor m�s peque�o de la subconsulta siguiente ***/
	(SELECT Tiempo_Horas /*** Columna de inter�s (a que devuelve la consulta) ***/
		FROM MaratonNY_Modificada /*** Tabla que contiene la columna de inter�s establecida posteriormente en SELECT ***/
		WHERE home = 'MEX'); /*** Condici�n de b�squeda para el resultado de todo el c�digo que se encuentra entre par�ntesis () ***/
/*** Esto elimina todos los registros que tuvieron un mejor tiempo (en horas), que el corredor mexicano con menor tiempo.
Es decir, s�lo los corredores cuyo "Tiempo_Horas" es menor que el tiempo m�s r�pido registrado por cualquier corredor mexicano ser�n eliminados de la tabla ***/

/*** Visualizamos los resultados ***/
USE Cursos

SELECT *
FROM MaratonNY_Modificada
ORDER BY Tiempo_Horas; /*** Al ordenar los registros con base en la columna "Tiempo_Horas", observamos que no hay registros con tiempo menor al mexicano con menor tiempo de carrera ***/


/*** DELETE completo ***/
/*** Si queremos eliminar todos los registros de una tabla ***/
USE Cursos

DELETE FROM MaratonNY_Modificada /*** Esto eliminar� todos los registros, dado a que no hay condici�n de ejecuci�n, lo considera similar a "SELECT *" ***/