
/*** Unión de varias consultas ***/
/*** El comando UNION debe ir entre cada consulta (después de cada una excepto en la final) y es IMPORTANTE que todas las consultas tengan las MISMAS COLUMNAS ***/

USE Alumnos; /*** IMPORTANTE: SÓLO SE ESPECIFICA LA BASE EN EL PRIMER APARTADO DE LA UNION, NO EN LOS DEMÁS ***/

SELECT Home,
	   Gender,
	   Age,
	   Tiempo,
	   'Lento' AS Categoría_corredor /*** Columna que almacenará los resultados calculados con el condicional ***/
FROM MaratonNY
WHERE Tiempo > 300 /*** Condicional de que el "Tiempo" de carrera sea mayor a 300 ***/

UNION


SELECT Home,
	   Gender,
	   Age,
	   Tiempo,
	   'Normal' AS Categoría_corredor
FROM MaratonNY
WHERE Tiempo BETWEEN 200 AND 300 /*** Recordar que BETWEEN es un intervalo cerrado, es decir, que incluye los números extremos ***/

UNION


SELECT Home,
	   Gender,
	   Age,
	   Tiempo,
	   'Rápido' AS Categoría_corredor
FROM MaratonNY
WHERE Tiempo < 200


ORDER BY Home; /*** Por último, ordenamos alfabéticamente con base en la columna de los países "Home" ***/