
/*** Consultas como Vistas ***/
/*** Esto sirve para crear consultas que se crean TEMPORALMENTE como tablas, lo que resulta útil cuando necesitamos realizar operaciones o acciones sobre una consulta ***/

USE Cursos; /*** IMPORTANTE: Ejecutamos primero esto, dado a que no se puede ejecutar en conjunto con el comando CREATE VIEW ***/

CREATE VIEW Nombre_que_quieras AS /*** Asignamos el nombre de nuestra tabla temporal ***/

SELECT Datos_Personales.Estado_Civil, Datos_Personales.Genero, Ciudad.Pais, /*** Atributos y orden de la consulta ***/
	   Actividades_Extra.Actividad
FROM Ciudad /*** Tabla primaria para la unión ***/
INNER JOIN Datos_Personales ON Ciudad.Ciudad = Datos_Personales.Ciudad /*** Primer INNER JOIN ***/
INNER JOIN Actividades_Extra ON Actividades_Extra.Id_num = Datos_Personales.Id_num; /*** Segndo INNER JOIN ***/
/*** Nota: No podemos utilizar algunos comandos cuando estamos creando la tabla temporal, sin embargo, se pueden aplicar después de crear la tabla temporal ***/
/*** Este tipo de tabla temporal, contiene todos los registros que se encuentran en la intersección de las tres tablas ***/

/*** Ahora, visalizamos la tabla temporal ***/
SELECT *
FROM Nombre_que_quieras;


/*** Ejectar consultas y operaciones sobre la tabla temporal ***/
/*** Buscamos el número de personas que cumplen con la condición de ser de género femenino y solteras, así como, aquellos registros de género masculino divorciados ***/
SELECT Pais, Estado_Civil, Genero, Actividad, COUNT(Actividad) AS Cant_misma_actividad /*** Columnas, orden y operación (contamos las personas que tienen la misma actividad) ***/
FROM Nombre_que_quieras /*** Tabla temporal ***/
WHERE (Genero = 'F' AND Estado_Civil = 'Single') OR (Genero = 'M' AND Estado_Civil = 'Divorced') /*** Condiciones a cumplir ***/
GROUP BY Estado_Civil, Pais, Genero, Actividad /*** NOTA: debe existir la agrupación múltiple, la cual debe contener a todas las columnas descritas en SELECT, sin incluir la columna de operación ***/
ORDER BY Pais, Estado_Civil, Actividad; /*** Ordenamos empezando por país, siguiendo el orden alfabético por la columna "Estado_Civil" y por último la actividad ***/



/*** 2do ejemplo ***/
/*** Ejectar consultas y operaciones sobre la tabla temporal ***/
/*** Buscamos el número de personas que cumplen con la condición de ser de género femenino y solteras, así como, aquellos registros de género masculino divorciados ***/
SELECT Pais, Genero, Actividad, Estado_Civil, COUNT(Estado_Civil) AS Cant_mismo_Estado_Civil /*** Columnas, orden y operación (contamos las personas que tienen la misma actividad) ***/
FROM Nombre_que_quieras /*** Tabla temporal ***/
WHERE (Genero = 'F' AND Estado_Civil = 'Single') OR (Genero = 'M' AND Estado_Civil = 'Divorced') /*** Condiciones a cumplir ***/
GROUP BY Estado_Civil, Pais, Genero, Actividad /*** NOTA: debe existir la agrupación múltiple, la cual debe contener a todas las columnas descritas en SELECT, sin incluir la columna de operación ***/
ORDER BY Pais, Estado_Civil, Actividad; /*** Ordenamos empezando por país, siguiendo el orden alfabético por la columna "Estado_Civil" y por último la actividad ***/



/*** 3er ejemplo ***/
/*** Ejectar consultas y operaciones sobre la tabla temporal ***/
/*** Buscamos el número de personas que cumplen con la condición de ser de género femenino y solteras, así como, aquellos registros de género masculino divorciados ***/
SELECT Pais, Genero, Estado_Civil, COUNT(Estado_Civil) AS Cant_mismo_Estado_Civil /*** Columnas, orden y operación (contamos las personas que tienen la misma actividad) ***/
FROM Nombre_que_quieras /*** Tabla temporal ***/
WHERE (Genero = 'F' AND Estado_Civil = 'Single') OR (Genero = 'M' AND Estado_Civil = 'Divorced') /*** Condiciones a cumplir ***/
GROUP BY Estado_Civil, Pais, Genero /*** NOTA: debe existir la agrupación múltiple, la cual debe contener a todas las columnas descritas en SELECT, sin incluir la columna de operación ***/
ORDER BY Pais, Estado_Civil; /*** Ordenamos empezando por país, siguiendo el orden alfabético por la columna "Estado_Civil" ***/



/*** Para eliminar la tabla temporal (Vista creada) ***/
DROP VIEW Nombre_que_quieras
