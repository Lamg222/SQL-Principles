
/*** Consultas como Vistas ***/
/*** Esto sirve para crear consultas que se crean TEMPORALMENTE como tablas, lo que resulta �til cuando necesitamos realizar operaciones o acciones sobre una consulta ***/

USE Cursos; /*** IMPORTANTE: Ejecutamos primero esto, dado a que no se puede ejecutar en conjunto con el comando CREATE VIEW ***/

CREATE VIEW Nombre_que_quieras AS /*** Asignamos el nombre de nuestra tabla temporal ***/

SELECT Datos_Personales.Estado_Civil, Datos_Personales.Genero, Ciudad.Pais, /*** Atributos y orden de la consulta ***/
	   Actividades_Extra.Actividad
FROM Ciudad /*** Tabla primaria para la uni�n ***/
INNER JOIN Datos_Personales ON Ciudad.Ciudad = Datos_Personales.Ciudad /*** Primer INNER JOIN ***/
INNER JOIN Actividades_Extra ON Actividades_Extra.Id_num = Datos_Personales.Id_num; /*** Segndo INNER JOIN ***/
/*** Nota: No podemos utilizar algunos comandos cuando estamos creando la tabla temporal, sin embargo, se pueden aplicar despu�s de crear la tabla temporal ***/
/*** Este tipo de tabla temporal, contiene todos los registros que se encuentran en la intersecci�n de las tres tablas ***/

/*** Ahora, visalizamos la tabla temporal ***/
SELECT *
FROM Nombre_que_quieras;


/*** Ejectar consultas y operaciones sobre la tabla temporal ***/
/*** Buscamos el n�mero de personas que cumplen con la condici�n de ser de g�nero femenino y solteras, as� como, aquellos registros de g�nero masculino divorciados ***/
SELECT Pais, Estado_Civil, Genero, Actividad, COUNT(Actividad) AS Cant_misma_actividad /*** Columnas, orden y operaci�n (contamos las personas que tienen la misma actividad) ***/
FROM Nombre_que_quieras /*** Tabla temporal ***/
WHERE (Genero = 'F' AND Estado_Civil = 'Single') OR (Genero = 'M' AND Estado_Civil = 'Divorced') /*** Condiciones a cumplir ***/
GROUP BY Estado_Civil, Pais, Genero, Actividad /*** NOTA: debe existir la agrupaci�n m�ltiple, la cual debe contener a todas las columnas descritas en SELECT, sin incluir la columna de operaci�n ***/
ORDER BY Pais, Estado_Civil, Actividad; /*** Ordenamos empezando por pa�s, siguiendo el orden alfab�tico por la columna "Estado_Civil" y por �ltimo la actividad ***/



/*** 2do ejemplo ***/
/*** Ejectar consultas y operaciones sobre la tabla temporal ***/
/*** Buscamos el n�mero de personas que cumplen con la condici�n de ser de g�nero femenino y solteras, as� como, aquellos registros de g�nero masculino divorciados ***/
SELECT Pais, Genero, Actividad, Estado_Civil, COUNT(Estado_Civil) AS Cant_mismo_Estado_Civil /*** Columnas, orden y operaci�n (contamos las personas que tienen la misma actividad) ***/
FROM Nombre_que_quieras /*** Tabla temporal ***/
WHERE (Genero = 'F' AND Estado_Civil = 'Single') OR (Genero = 'M' AND Estado_Civil = 'Divorced') /*** Condiciones a cumplir ***/
GROUP BY Estado_Civil, Pais, Genero, Actividad /*** NOTA: debe existir la agrupaci�n m�ltiple, la cual debe contener a todas las columnas descritas en SELECT, sin incluir la columna de operaci�n ***/
ORDER BY Pais, Estado_Civil, Actividad; /*** Ordenamos empezando por pa�s, siguiendo el orden alfab�tico por la columna "Estado_Civil" y por �ltimo la actividad ***/



/*** 3er ejemplo ***/
/*** Ejectar consultas y operaciones sobre la tabla temporal ***/
/*** Buscamos el n�mero de personas que cumplen con la condici�n de ser de g�nero femenino y solteras, as� como, aquellos registros de g�nero masculino divorciados ***/
SELECT Pais, Genero, Estado_Civil, COUNT(Estado_Civil) AS Cant_mismo_Estado_Civil /*** Columnas, orden y operaci�n (contamos las personas que tienen la misma actividad) ***/
FROM Nombre_que_quieras /*** Tabla temporal ***/
WHERE (Genero = 'F' AND Estado_Civil = 'Single') OR (Genero = 'M' AND Estado_Civil = 'Divorced') /*** Condiciones a cumplir ***/
GROUP BY Estado_Civil, Pais, Genero /*** NOTA: debe existir la agrupaci�n m�ltiple, la cual debe contener a todas las columnas descritas en SELECT, sin incluir la columna de operaci�n ***/
ORDER BY Pais, Estado_Civil; /*** Ordenamos empezando por pa�s, siguiendo el orden alfab�tico por la columna "Estado_Civil" ***/



/*** Para eliminar la tabla temporal (Vista creada) ***/
DROP VIEW Nombre_que_quieras
