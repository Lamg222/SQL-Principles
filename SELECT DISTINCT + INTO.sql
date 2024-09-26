
/*** Creaci�n de tabla sin valores duplicados (con base en alg�n atributo espec�fico) ***/
USE Cursos;

/*** Tabla original ***/
SELECT *
FROM Actividades_Extra


/*** Tabla sin valores repetidos en el atributo "Actividad" ***/
SELECT DISTINCT Actividad INTO Lista_de_Actividades /*** Con el comando DISTINCT, despu�s del comando SELECT, para oobtener los valores �nicos de una columna.
Ahora, con la palabra clave "INTO", designamos la creaci�n de la nueva tabla, seguida del nombre de esta ***/
FROM Actividades_Extra; /*** Origen de la tabla inicial: Aquella tabla donde provienen los datos ***/

/*** Visualizamos la nueva tabla ***/
SELECT *
FROM Lista_de_Actividades;
