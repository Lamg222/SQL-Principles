
/*** Devuelve sólo los primeros 3 reigistros (considerados los de menor población) ***/
USE Alumnos;

SELECT TOP 3 Pais, Poblacion FROM Poblacion_Mundial /*** Con el comando TOP, después de SELECT, asignamos el número de registros que queremos obtener como respuesta ***/
	WHERE Poblacion >=
		(SELECT Poblacion FROM Poblacion_Mundial
			WHERE Pais = 'Mexico')
			ORDER BY Poblacion; /*** Orden ascendente con base en el atributo "Población" ***/



/*** Devuelve sólo los úlitmos 3 reigistros (considerados los de mayor población) ***/
USE Alumnos;

SELECT TOP 3 Pais, Poblacion FROM Poblacion_Mundial /*** Con el comando TOP, después de SELECT, asignamos el número de registros que queremos obtener como respuesta ***/
	WHERE Poblacion >=
		(SELECT Poblacion FROM Poblacion_Mundial
			WHERE Pais = 'Mexico')
			ORDER BY Poblacion DESC; /*** Orden descendente con base en el atributo "Población" ***/