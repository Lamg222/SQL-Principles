
/*** Conjunto de operaciones sobre un atributo específico ***/


/*** Valor mínimo de una columna ***/
USE Alumnos;

SELECT MIN(Tiempo) /*** Menor tiempo de los corredores ***/
FROM MaratonNY;


/*** Valore máximo de una columna ***/
USE Alumnos;

SELECT MAX (Age) /*** Edad del participante más grande (en edad) ***/
FROM MaratonNY;


/*** Sumamos todos los valores numéricos de un atributo ***/
USE Alumnos;

SELECT SUM(Tiempo) /*** Suma de los tiempos de todos los participantes ***/
FROM MaratonNY;


/*** Valor promedio de un atributo numérico ***/
USE Alumnos;

SELECT AVG(Tiempo) /*** Tiempo promedio de los participantes de la carrera ***/
FROM MaratonNY;


/*** Redondear los resultados numéricos de una consulta ***/
USE Alumnos;

SELECT ROUND(AVG(Tiempo), 2) /*** Especificamos el número de decimales que queremos obtener en la consulta ***/
FROM MaratonNY;


/*** Contar el número de registros en un atributo ***/
USE Alumnos;

SELECT COUNT(Tiempo) /*** Se puede seleccionar cualquier atributo del dataset para obtener el número de registros de la tabla ***/
FROM MaratonNY;
/*** NOTA: La función COUNT NO contabiliza los valores NULL ***/


/*** Contar el número de registros ÚNICOS en un atributo ***/
USE Alumnos;

SELECT COUNT(DISTINCT(Home)) /*** El número de países que participaron en el maratón de NY ***/
FROM MaratonNY;