

USE Adventure-Luis;

SELECT DateTime, /**** Selecci�n de la columna de inter�s de nuestro dataset ****/
	DATEPART(YEAR, DateTime) AS A�o, /**** Con esta funci�n designamos la parte de la fecha que queremos obtener, desde la columna que contiene dicha informaci�n ****/
	/**** Por �ltimo, asignamos el nombre de la nueva columna donde se almacenar� la informaci�n de extracci�n ****/

	DATEPART(MONTH, DateTime) AS Mes,
	DATEPART(DAY, DateTime) AS D�a,
	DATEPART(HOUR, DateTime) AS Hora,
	DATEPART(MINUTE, DateTime) AS Minutos
FROM [Adventure-Luis].dbo.2. PODateTime-220809-110102;