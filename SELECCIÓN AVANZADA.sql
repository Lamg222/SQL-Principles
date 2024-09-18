/*** Selección avanzada ***/

USE Alumnos; /*** Base de datos ***/

SELECT Pais, Poblacion /*** Selección de atrbituso/columnas ***/ 
FROM Poblacion_Mundial /*** Tabla con la información ***/
  WHERE Poblacion >= /*** Selección de registros, dada una condición mayor o igual ***/
	(SELECT Poblacion FROM Poblacion_Mundial /*** Selección de atributos y tabla de datos para la condición de selección de registros avanzada ***/ 
	WHERE Pais = 'Mexico'); /*** Que el atributo "Pais" sea igual a 'México' ***/
/*** Esta condición alude a otra condición, la cual es que se seleccionará PRIMERO, al atributo "Poblacion", de una tabla de datos específica,
donde el atributo "Pais" sea igual a 'México'. Después, obtenido el valor de la "Población" de 'México', BUSCAMOS aquellos registros, de la tabla específicada,
que tengan valores mayores o iguales a este valor. Devolviendo una tabla con los atributos "Pais" y "Poblacion" para los registros que cumplen con esta condición.
Dado a que la búsqueda se hace para los valores mayores o iguales, se INCUYE el valor igual a la población mexicana, por lo tanto, aparece el registro de México en la búsqueda ***/
