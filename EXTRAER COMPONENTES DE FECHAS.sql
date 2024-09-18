

USE Adventure-Luis;

SELECT DateTime, /**** Selección de la columna de interés de nuestro dataset ****/
	DATEPART(YEAR, DateTime) AS Año, /**** Con esta función designamos la parte de la fecha que queremos obtener, desde la columna que contiene dicha información ****/
	/**** Por último, asignamos el nombre de la nueva columna donde se almacenará la información de extracción ****/

	DATEPART(MONTH, DateTime) AS Mes,
	DATEPART(DAY, DateTime) AS Día,
	DATEPART(HOUR, DateTime) AS Hora,
	DATEPART(MINUTE, DateTime) AS Minutos
FROM [Adventure-Luis].dbo.2. PODateTime-220809-110102;