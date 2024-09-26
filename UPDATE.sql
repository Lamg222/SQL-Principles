
/*** UPDATE ***/
/*** Modifica información de una tabla ***/

/*** INTO ***/
/*** Creamos una tabla, a partir de los datos contenidos en otra tabla ***/
USE Cursos

SELECT * INTO MaratonNY_Modificada /*** Con el comando INTO, después de la selección de aquellos atributos/columnas de interés, seguido por el nombre de la nueva tabla
										podemos crear una nueva tabla con los registros y columnas de la tabla origen (FROM) ***/
FROM MaratonNY;

/*** Visualizamos la nueva tabla ***/
USE Cursos

SELECT *
FROM MaratonNY_Modificada; /*** El resultado es una tabla idéntica a la tabla origen ***/


/*** ALTER TABLE ***/
USE Cursos

ALTER TABLE MaratonNY_Modificada
ADD Estrato_edad_género VARCHAR(50);

/*** Visualizamos la nueva tabla ***/
USE Cursos

SELECT *
FROM MaratonNY_Modificada;


/*** UPDATE + SET + WHERE ***/
/*** Para agregar informaçión sobre un atributo/columna nuevo ***/
USE Cursos

UPDATE MaratonNY_Modificada /*** Tabla a modificar ***/
SET Estrato_edad_género = 'Hombre joven' /*** Utilizando el comando SET asignamos la sentencia a ejecutar en la columna especificada (Estrato_edad_género) ***/
WHERE gender = 'Male' AND age <= 35; /*** Con el comando WHERE, especificamos la condición para que se ejecute la sentencia, en este caso son dos condiciones (AND) ***/

/*** Visualizamos los resultados ***/
USE Cursos

SELECT *
FROM MaratonNY_Modificada;


/*** UPDATE + SET + WHERE múltiple ***/
USE Cursos

UPDATE MaratonNY_Modificada /*** Tabla de interés ***/
SET Estrato_edad_género = 'Mujer joven' /*** Sentencia ***/
WHERE gender = 'Female' AND age <= 35; /*** Condiciones ***/

UPDATE MaratonNY_Modificada /*** Tabla de interés ***/
SET Estrato_edad_género = 'Señor' /*** Sentencia a ejecutar ***/
WHERE gender = 'Male' AND age > 35; /*** Condiciones a cumplir ***/

UPDATE MaratonNY_Modificada /*** Tabla de interés a modificar ***/
SET Estrato_edad_género = 'Señora' /*** Acción a ejecutar ***/
WHERE gender = 'Female' AND age > 35; /*** Caracteríticas necesarias de los registros para ser ejecutada la acción ***/

/*** Visualizamos los resultados ***/
USE Cursos

SELECT *
FROM MaratonNY_Modificada;


/*** UPDATE + SET + WHERE ***/
/*** Para modificar valores existentes en una columna específica ***/
USE Cursos

UPDATE MaratonNY_Modificada /*** Tabla de interés ***/
SET gender = 'Hombre bello' /*** Sentencia a ejecutar ***/
WHERE gender = 'Male'; /*** Condición de los registros para aplicar la sentencia ***/

UPDATE MaratonNY_Modificada
SET gender = 'Mujer hermosa'
WHERE gender = 'Female';

/*** Visualizamos los resultados ***/
USE Cursos

SELECT *
FROM MaratonNY_Modificada;


/*** ALTER TABLE + UPDATE + SET ***/
USE Cursos

ALTER TABLE MaratonNY_Modificada
ADD Tiempo_Horas FLOAT;

UPDATE MaratonNY_Modificada
SET Tiempo_Horas = [time]/60; /*** Recordemos que las palabras de los registros o columnas parecidas a las designadas en el lenguaje de SQL para operaciones o consultas, deben ir entre corchetes [] ***/ 

/*** Visualizamos la nueva tabla ***/
USE Cursos

SELECT *
FROM MaratonNY_Modificada;


/*** ALTER TABLE + ADD + UPDATE + SET + FROM + WHERE ***/
/*** Agregar información a una tabla, con base en la información de otra tabla, dada una condición ***/

/*** Tabla original ***/
USE Cursos

SELECT *
FROM Actividades_Extra; /*** Sólo contiene dos columnas: "Id_num" y "Actividad" ***/

/*** Ejercicio ***/
USE Cursos

/*** Creación de columna ***/
ALTER TABLE Actividades_Extra /*** Tabla a la que queremos agregar la nueva columna ***/
ADD Nombre_Columna_Nueva VARCHAR(255); /*** Creamos la columna de tipo cadena de texto con un máximo de caracteres de 250 ***/
/*** NOTA: Primero se crea la nueva variable ***/

/*** Modificación/Agregar información a la columna nueva ***/
UPDATE Actividades_Extra /*** Tabla de interés para agregar información (tabla destino) ***/
SET Nombre_Columna_Nueva = Datos_Personales.Nombre /*** Sentencia a ejecutar (Agregar el nombre de la columna "Nombre" de la tabla "Datos_Personales") sobre la nueva columna (Nombre_Columna_Nueva) ***/
FROM Datos_Personales /*** Tabla de origen de los datos a incorporar ***/
WHERE Actividades_Extra.Id_num = Datos_Personales.Id_num; /*** Condición a cumplir para ejecutar/agregar la información a la nueva columna y tabla destino ***/

/*** Visualizamos resultados ***/
USE Cursos

SELECT *
FROM Actividades_Extra; /*** Hay registros con valores NULL en la nueva columna, dado a que estos registros no se encuentran en la tabla origen de la información (Datos_Personales), sino que sólo se encuentran en la tabla destino (Actividades_Extra) ***/