
/*** Concatenación indicando un separador ***/

USE Alumnos;

SELECT Direccion, Ciudad,
		CONCAT_WS(' ** ', Direccion, Ciudad) AS Ubicación_Completa /*** Con el comando CONCAT_WS, especificamos, PRIMERO, el separador de los siguientes campos/elementes dentro de esos atributos/columnas ***/
FROM Datos_Personales;


USE Alumnos;

SELECT Direccion, Ciudad,
		CONCAT_WS(' - ', Direccion, Ciudad) AS Ubicación_Completa /*** NOTA: el separador se especifica con comillas simples ***/
FROM Datos_Personales;
/***IMPORTANTE: Si hay valores NULL en alguno de estos elementos de las columnas a concatenar, el resultado devolverá sólo el valor no NULL
sin incluir el elemento separador especificado entre comillas simples ***/