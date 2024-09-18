
/*** Ordenar los valores de un atributo ***/
USE Alumnos;

SELECT Poblacion, Pais FROM Poblacion_Mundial
WHERE Poblacion >=
	(SELECT Poblacion FROM Poblacion_Mundial
	WHERE Pais = 'Mexico')
	ORDER BY Poblacion; /*** Ordena los valores de manera ASCENDENTE (por default) ***/


USE Alumnos;

SELECT Poblacion, Pais FROM Poblacion_Mundial
WHERE Poblacion >=
	(SELECT Poblacion FROM Poblacion_Mundial
	WHERE Pais = 'Mexico')
	ORDER BY Poblacion DESC; /*** Ordena los valores de manera DESCENDENTE agregando el comando DESC al final de la consulta ORDER BY***/


/*** Orden doble: Ordena primero un atributo y, después, ordena los elementos con base en otro atributo ***/
USE Alumnos;

SELECT Age, Tiempo
FROM MaratonNY
	ORDER BY Age, Tiempo; /*** De manera ASCENDENTE ***/


/*** Orden doble: Ordena primero un atributo y, después, ordena los elementos con base en otro atributo ***/
USE Alumnos;

SELECT Age, Tiempo
FROM MaratonNY
	ORDER BY Age, Tiempo DESC; /*** De manera DESCENDENTE sólo para el último atributo ***/


/*** Orden doble: Ordena primero un atributo y, después, ordena los elementos con base en otro atributo ***/
USE Alumnos;

SELECT Age, Tiempo
FROM MaratonNY
	ORDER BY Age DESC, Tiempo DESC; /*** De manera DESCENDENTE para ambos atributos ***/