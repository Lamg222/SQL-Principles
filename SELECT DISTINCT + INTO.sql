
/*** Creación de tabla sin valores duplicados (con base en algún atributo específico) ***/
USE Cursos;

/*** Tabla original ***/
SELECT *
FROM Actividades_Extra


/*** Tabla sin valores repetidos en el atributo "Actividad" ***/
SELECT DISTINCT Actividad INTO Lista_de_Actividades /*** Con el comando DISTINCT, después del comando SELECT, para oobtener los valores únicos de una columna.
Ahora, con la palabra clave "INTO", designamos la creación de la nueva tabla, seguida del nombre de esta ***/
FROM Actividades_Extra; /*** Origen de la tabla inicial: Aquella tabla donde provienen los datos ***/

/*** Visualizamos la nueva tabla ***/
SELECT *
FROM Lista_de_Actividades;
