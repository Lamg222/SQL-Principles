
/*** Comando HAVING ***/
/*** La diferencia entre WHERE y HAVING, es que WHERE filtra con base en los valores exitentes en los atributos/columnas ORIGINALES (colocandose ANTES de la sentencia GROUP BY).
Mientras que, HAVING se aplica sobre los RESULTADOS DE UNA CONSULTA (lo que hace que se coloque DESPUÉS de la sentencia GROUP BY) ***/

USE Alumnos

SELECT Home, 
	ROUND(COUNT(Corredor), 2) AS Núm_Corredores,
	ROUND(MIN(Tiempo), 2) AS Tiempo_Mín,
	ROUND(AVG(Tiempo), 2) AS Tiempo_Prom
FROM MaratonNY
GROUP BY Home
HAVING COUNT(Corredor) > 2 /*** Aquellos países (por eso va después del GROUP BY) con más de dos corredores en la carrera ***/
ORDER BY Tiempo_Mín;