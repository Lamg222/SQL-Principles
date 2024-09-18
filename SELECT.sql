/**** Creación de la Tabla (sobre una Base de Datos existente) ****/
USE Alumnos;

CREATE TABLE MaratonNY (
Corredor SMALLINT,
Place SMALLINT,
Gender VARCHAR (6),
Age TINYINT,
Home VARCHAR(4),
Tiempo FLOAT
);
/**** REVISAR CORRECTAMENTE QUE SE HAYAN CREADO TODAS LAS COLUMNAS NECESARIAS PARA IMPORTAR EL DATASET ****/


BULK INSERT MaratonNY /**** IMPORTAMOS los registros en nuestra tabla creada****/

/**** Ruta de la base que se va a importar con todo y el nombre del archivo csv****/
FROM 'E:/SQL/Bases de datos Aprende el lenguaje SQL desde cero/4. Las Sentencias Básicas de SQL/1. MaratonNY-220809-110048.csv'
WITH
(
FIELDTERMINATOR = ',', /**** Caracter que determina del archivo (CSV) ****/
ROWTERMINATOR = '\n', /**** Caracter que determina la terminación de cada registro ****/
/**** IMPORTANTE, EL DETERMINADOR DE CAMBIO DE FILA ES "\n" no "/n" ****/

FIRSTROW = 2 /**** Se especifica que tiene encabezados y cada registro empieza desde la segunda fila ****/
)


/**** Selección completa ****/
USE Alumnos;

SELECT * /**** con "*" asignamos una selección completa de todos los atributos y registros ****/
FROM Alumnos.dbo.MaratonNY;

/**** Selección parcial ****/
USE Alumnos;

SELECT Corredor, Place, Age
FROM Alumnos.dbo.MaratonNY;

/**** Selección parcial con distinto orden ****/
USE Alumnos;

SELECT Place, Age, Corredor
FROM Alumnos.dbo.MaratonNY;