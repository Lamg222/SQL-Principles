
/*** Creaci�n de tablas a partir de otra tabla ***/
USE Cursos;

SELECT gender, age, [time] INTO Maraton_tabla_nueva /*** Con la palabra clave "INTO", seguida del nombre de la nueva tabla, creamos la nueva tabla ***/
FROM MaratonNY; /*** Tabla origen ***/
/*** Recordar que las columnas con nombres id�nticos a las palabras designadas dentro SQL para alg�n comando, operaci�n o acci�n deben ir entre corchetes [] ***/

/*** Visualizamos la tabla creada ***/
/*** Puede ser necesario refresh/actualizar el explorador que muestra las Bases de Datos y las Tablas ***/
SELECT *
FROM Maraton_tabla_nueva;


/*** Configuraci�n de la tabla nueva ***/
/*** Podemos observar las caracter�sticas de cada columna de cualquier tabla en dando clic derecho sobre la tabla (la cual se encuentra en el explorador de objetos),
y seleccionar la opci�n "Design" ***/


/*** Creaci�n de una tabla desde una vista o tabla temporal ***/
USE Cursos; /*** Recordar que esta l�nea de c�digo se ejecta primero y no al mismo tiempo que CREATE VIEW ***/

CREATE VIEW Mexicanos_MaratonNY AS
SELECT Corredor, place, gender, age, [time]
FROM MaratonNY
WHERE home = 'Mex';

/*** Observamos el resultado ***/
SELECT *
FROM Mexicanos_MaratonNY;

/*** Guardamos la tabla temporal o vista como una tabla nueva ***/
SELECT * INTO Tabla_Mexicanos_MaratonNY
FROM Mexicanos_MaratonNY /*** El origen es la tabla temporal o vista ***/

/*** Visualizamos la nueva tabla ***/
SELECT *
FROM Tabla_Mexicanos_MaratonNY;