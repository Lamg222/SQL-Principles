
/*** Comando HAVING ***/
/*** La diferencia entre WHERE y HAVING, es que WHERE filtra con base en los valores exitentes en los atributos/columnas ORIGINALES (colocandose ANTES de la sentencia GROUP BY).
Mientras que, HAVING se aplica sobre los RESULTADOS DE UNA CONSULTA (lo que hace que se coloque DESPU�S de la sentencia GROUP BY) ***/

USE Alumnos

SELECT Home, 
	ROUND(COUNT(Corredor), 2) AS N�m_Corredores,
	ROUND(MIN(Tiempo), 2) AS Tiempo_M�n,
	ROUND(AVG(Tiempo), 2) AS Tiempo_Prom
FROM MaratonNY
GROUP BY Home
HAVING COUNT(Corredor) > 2 /*** Aquellos pa�ses (por eso va despu�s del GROUP BY) con m�s de dos corredores en la carrera ***/
ORDER BY Tiempo_M�n;