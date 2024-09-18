
/*** Cambiar el formato de una columna ***/

/*** Esto no cambia el formato de la tabla original, para eso es necesario exportar los resultados
También es útil para crear nuevas consultas y exportar esas consultar, después de sus operaciones aplicadas ***/

/*** La diferencia entre CONVERT y CAST, es que CONVERT sólo se usa en algunas interfaces de gestión de datos,
mientras que, CAST es universal y se usa en todas las interfaces de gestión de datos.
Otra cosa es que CONVERT tiene más opciones de formatos de salida (conversión) ***/

/*** CAST ***/
SELECT '02/22/1995' /*** Aquí, la fecha está en formato de texto, debido a las comillas simples ***/

SELECT CAST('02/22/1995' AS DATETIME) /*** Aquí, tranformamos el texto en fecha ***/
/*** NOTA: SIEMPRE DEBE IR PRIMERO EL MES, DESPUÉS EL DÍA Y POR ÚLTIMO EL AÑO ***/

SELECT CAST(CAST('02/22/1995' AS DATETIME) - /*** Primero, transformamos los textos en fechas (AS DATETIMER) ***/
			CAST('01/11/1994' AS DATETIME) AS INT); /*** Después, restamos ambas fechas y transformamos el resultado en un entero (INT) ***/

SELECT CAST(CAST('02/22/1995' AS DATETIME) -
			CAST('01/11/1994' AS DATETIME) AS FLOAT)/ 365; /*** En años como diferencia ***/

SELECT CAST(CAST('02/22/1995' AS DATETIME) AS CHAR(12)) /*** Primero, transformamos el texto en fecha (AS DATETIME) ***/
														/*** Después, transformamos la fecha en un formato de fecha diferente (CHAR(12)) ***/


/*** CONVERT ***/

USE Adventure_Luis;

SELECT *,
CONVERT(VARCHAR, DateTime, 100) /*** Primero, seleccionamos el tipo de variable que queremos obtener.
								Después, especificamos el atributo/columna que queremos transformar.
								Por último, el formato que queremos que utilice ***/
AS Nueva_Fecha
FROM PODateTime_1;

/*** Otro formato (mes/día/año) ***/
USE Adventure_Luis;

SELECT *,
CONVERT(VARCHAR, DateTime, 101)
AS Nueva_Fecha
FROM PODateTime_1;

/*** Otro formato ***/
USE Adventure_Luis;

SELECT *,
CONVERT(VARCHAR, DateTime, 102)
AS Nueva_Fecha
FROM PODateTime_1;

/*** Otro formato (día/mes/año) ***/
USE Adventure_Luis;

SELECT *,
CONVERT(VARCHAR, DateTime, 103)
AS Nueva_Fecha
FROM PODateTime_1;


/*** Para conocer más formatos: https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16 ***/
