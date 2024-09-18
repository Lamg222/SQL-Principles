
/*** Devuelve s�lo los primeros 3 reigistros (considerados los de menor poblaci�n) ***/
USE Alumnos;

SELECT TOP 3 Pais, Poblacion FROM Poblacion_Mundial /*** Con el comando TOP, despu�s de SELECT, asignamos el n�mero de registros que queremos obtener como respuesta ***/
	WHERE Poblacion >=
		(SELECT Poblacion FROM Poblacion_Mundial
			WHERE Pais = 'Mexico')
			ORDER BY Poblacion; /*** Orden ascendente con base en el atributo "Poblaci�n" ***/



/*** Devuelve s�lo los �litmos 3 reigistros (considerados los de mayor poblaci�n) ***/
USE Alumnos;

SELECT TOP 3 Pais, Poblacion FROM Poblacion_Mundial /*** Con el comando TOP, despu�s de SELECT, asignamos el n�mero de registros que queremos obtener como respuesta ***/
	WHERE Poblacion >=
		(SELECT Poblacion FROM Poblacion_Mundial
			WHERE Pais = 'Mexico')
			ORDER BY Poblacion DESC; /*** Orden descendente con base en el atributo "Poblaci�n" ***/