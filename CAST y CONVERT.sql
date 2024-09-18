
/*** Cambiar el formato de una columna ***/

/*** Esto no cambia el formato de la tabla original, para eso es necesario exportar los resultados
Tambi�n es �til para crear nuevas consultas y exportar esas consultar, despu�s de sus operaciones aplicadas ***/

/*** La diferencia entre CONVERT y CAST, es que CONVERT s�lo se usa en algunas interfaces de gesti�n de datos,
mientras que, CAST es universal y se usa en todas las interfaces de gesti�n de datos.
Otra cosa es que CONVERT tiene m�s opciones de formatos de salida (conversi�n) ***/

/*** CAST ***/
SELECT '02/22/1995' /*** Aqu�, la fecha est� en formato de texto, debido a las comillas simples ***/

SELECT CAST('02/22/1995' AS DATETIME) /*** Aqu�, tranformamos el texto en fecha ***/
/*** NOTA: SIEMPRE DEBE IR PRIMERO EL MES, DESPU�S EL D�A Y POR �LTIMO EL A�O ***/

SELECT CAST(CAST('02/22/1995' AS DATETIME) - /*** Primero, transformamos los textos en fechas (AS DATETIMER) ***/
			CAST('01/11/1994' AS DATETIME) AS INT); /*** Despu�s, restamos ambas fechas y transformamos el resultado en un entero (INT) ***/

SELECT CAST(CAST('02/22/1995' AS DATETIME) -
			CAST('01/11/1994' AS DATETIME) AS FLOAT)/ 365; /*** En a�os como diferencia ***/

SELECT CAST(CAST('02/22/1995' AS DATETIME) AS CHAR(12)) /*** Primero, transformamos el texto en fecha (AS DATETIME) ***/
														/*** Despu�s, transformamos la fecha en un formato de fecha diferente (CHAR(12)) ***/


/*** CONVERT ***/

USE Adventure_Luis;

SELECT *,
CONVERT(VARCHAR, DateTime, 100) /*** Primero, seleccionamos el tipo de variable que queremos obtener.
								Despu�s, especificamos el atributo/columna que queremos transformar.
								Por �ltimo, el formato que queremos que utilice ***/
AS Nueva_Fecha
FROM PODateTime_1;

/*** Otro formato (mes/d�a/a�o) ***/
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

/*** Otro formato (d�a/mes/a�o) ***/
USE Adventure_Luis;

SELECT *,
CONVERT(VARCHAR, DateTime, 103)
AS Nueva_Fecha
FROM PODateTime_1;


/*** Para conocer m�s formatos: https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16 ***/
