/*** Selecci�n avanzada ***/

USE Alumnos; /*** Base de datos ***/

SELECT Pais, Poblacion /*** Selecci�n de atrbituso/columnas ***/ 
FROM Poblacion_Mundial /*** Tabla con la informaci�n ***/
  WHERE Poblacion >= /*** Selecci�n de registros, dada una condici�n mayor o igual ***/
	(SELECT Poblacion FROM Poblacion_Mundial /*** Selecci�n de atributos y tabla de datos para la condici�n de selecci�n de registros avanzada ***/ 
	WHERE Pais = 'Mexico'); /*** Que el atributo "Pais" sea igual a 'M�xico' ***/
/*** Esta condici�n alude a otra condici�n, la cual es que se seleccionar� PRIMERO, al atributo "Poblacion", de una tabla de datos espec�fica,
donde el atributo "Pais" sea igual a 'M�xico'. Despu�s, obtenido el valor de la "Poblaci�n" de 'M�xico', BUSCAMOS aquellos registros, de la tabla espec�ficada,
que tengan valores mayores o iguales a este valor. Devolviendo una tabla con los atributos "Pais" y "Poblacion" para los registros que cumplen con esta condici�n.
Dado a que la b�squeda se hace para los valores mayores o iguales, se INCUYE el valor igual a la poblaci�n mexicana, por lo tanto, aparece el registro de M�xico en la b�squeda ***/
