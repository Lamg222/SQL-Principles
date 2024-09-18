
/*** Conjunto de operaciones sobre un atributo espec�fico ***/


/*** Valor m�nimo de una columna ***/
USE Alumnos;

SELECT MIN(Tiempo) /*** Menor tiempo de los corredores ***/
FROM MaratonNY;


/*** Valore m�ximo de una columna ***/
USE Alumnos;

SELECT MAX (Age) /*** Edad del participante m�s grande (en edad) ***/
FROM MaratonNY;


/*** Sumamos todos los valores num�ricos de un atributo ***/
USE Alumnos;

SELECT SUM(Tiempo) /*** Suma de los tiempos de todos los participantes ***/
FROM MaratonNY;


/*** Valor promedio de un atributo num�rico ***/
USE Alumnos;

SELECT AVG(Tiempo) /*** Tiempo promedio de los participantes de la carrera ***/
FROM MaratonNY;


/*** Redondear los resultados num�ricos de una consulta ***/
USE Alumnos;

SELECT ROUND(AVG(Tiempo), 2) /*** Especificamos el n�mero de decimales que queremos obtener en la consulta ***/
FROM MaratonNY;


/*** Contar el n�mero de registros en un atributo ***/
USE Alumnos;

SELECT COUNT(Tiempo) /*** Se puede seleccionar cualquier atributo del dataset para obtener el n�mero de registros de la tabla ***/
FROM MaratonNY;
/*** NOTA: La funci�n COUNT NO contabiliza los valores NULL ***/


/*** Contar el n�mero de registros �NICOS en un atributo ***/
USE Alumnos;

SELECT COUNT(DISTINCT(Home)) /*** El n�mero de pa�ses que participaron en el marat�n de NY ***/
FROM MaratonNY;