
/*** Filtros para atributos num�ricos ***/

USE Alumnos;

SELECT *
FROM MaratonNY
WHERE Age > 30;


USE Alumnos;

SELECT *
FROM MaratonNY
WHERE Age >= 30; /*** Si queremos que sea una b�squeda "mayor e igual" debemos colocar el signo "=" DESPU�S del signo ">" ***/


/*** Selecci�n de registro en un intervalo cerrado definido ***/
USE Alumnos;

SELECT *
FROM MaratonNY
WHERE Age BETWEEN 30 AND 50; /*** Al ser un intervalo cerrado, INCLUYE a los registros que tienen los valores especificados ***/


/*** M�ltiples filtros utilizando operadores "<" y "AND" ***/
USE Alumnos;

SELECT *
FROM MaratonNY
WHERE Age = 30 AND Gender = 'Female' AND Tiempo < 200; /*** Con el comando AND se concatenan m�s condiciones de filtrado ***/
/*** Recordar que los atributos que contienen informaci�n de tipo texto, deben ir en comillas simples ***/


/*** Filtros m�s elaborados necesitan los par�ntesis como mecanismo de apertura para m�s condiciones ***/
USE Alumnos;

SELECT *
FROM MaratonNY
WHERE ((Age > 45 AND Gender = 'Female')
OR (Age > 50 AND Gender = 'Male'))
AND Tiempo	< 250; 
/*** Pedimos que devuelva aquellos registros con un tiempo menor a 250, y en el caso de que sean hombres deber�n tener m�s de 50 a�os.
Por otro lado, si son mujeres deberan tener m�s de 45 a�os ***/


