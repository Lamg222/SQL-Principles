
/*** Uni�n de varias consultas ***/
/*** El comando UNION debe ir entre cada consulta (despu�s de cada una excepto en la final) y es IMPORTANTE que todas las consultas tengan las MISMAS COLUMNAS ***/

USE Alumnos; /*** IMPORTANTE: S�LO SE ESPECIFICA LA BASE EN EL PRIMER APARTADO DE LA UNION, NO EN LOS DEM�S ***/

SELECT Home,
	   Gender,
	   Age,
	   Tiempo,
	   'Lento' AS Categor�a_corredor /*** Columna que almacenar� los resultados calculados con el condicional ***/
FROM MaratonNY
WHERE Tiempo > 300 /*** Condicional de que el "Tiempo" de carrera sea mayor a 300 ***/

UNION


SELECT Home,
	   Gender,
	   Age,
	   Tiempo,
	   'Normal' AS Categor�a_corredor
FROM MaratonNY
WHERE Tiempo BETWEEN 200 AND 300 /*** Recordar que BETWEEN es un intervalo cerrado, es decir, que incluye los n�meros extremos ***/

UNION


SELECT Home,
	   Gender,
	   Age,
	   Tiempo,
	   'R�pido' AS Categor�a_corredor
FROM MaratonNY
WHERE Tiempo < 200


ORDER BY Home; /*** Por �ltimo, ordenamos alfab�ticamente con base en la columna de los pa�ses "Home" ***/