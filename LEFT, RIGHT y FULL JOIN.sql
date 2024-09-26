
/*** Left Join ***/

/*** En este ejercicio, buscamos que la unión se priorice para la tabla "Actividades_Extra"
Es decir, esta tabla será nuestra tabla "izquierda" o tabla primaria de unión ***/
USE Cursos;

SELECT Actividades_Extra.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad /*** Utilizamos la clave primaraia (PK) de la tabla primaria de la unión ***/
FROM Actividades_Extra LEFT JOIN /*** La tabla especificada, ANTES del comando LEFT JOIN, es la tabla "izquierda" o tabla primaria ***/
		Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num; /*** Con la palabra clave "ON", se especifica la condición que se está buscando.
		En este caso, se busca que el Id_num de la tabla "Actividades_Extra" sea igual al valor en los registros de la columna Id_num de la tabla "Datos_Personales" ***/
/*** Nota: En esta unión, nos quedamos con todos los registros de la tabla "izquierda", y si no hay información de estos en la tabla secundaria, devuelve valores NULL para estos registros ***/
/*** Nota 2: Cuando hay más de un dato, en la tabla secundaria, para alguno de los registros, sobre la misma variable, se incorporan ambos valores, por lo tanto, tendríamos dos (o más) registros para una misma instancia, lo que se refleja con otro registro con la misma clave primaria (PK) ***/


/*** Right Join ***/

/*** En este ejercicio, buscamos la unión que se priorice para la tabla "Datos_Personales"
Es decir, esta tabla será nuestra tabla "derecha" o tabla primaria de unión ***/
USE Cursos;

SELECT Datos_Personales.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad /*** Utilizamos la clave primaraia (PK) de la tabla primaria de la unión ***/
FROM Actividades_Extra RIGHT JOIN /*** La tabla especificada, DESPUÉS del comando RIGHT JOIN, es la tabla "derecha" o tabla primaria ***/
		Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num; /*** Con la palabra clave "ON", se especifica la condición que se está buscando.
		En este caso, se busca que el Id_num de la tabla "Actividades_Extra" sea igual al valor en los registros de la columna Id_num de la tabla "Datos_Personales" ***/
/*** Nota: En esta unión, nos quedamos con todos los registros de la tabla "derecha", y si no hay información de estos en la tabla secundaria, devuelve valores NULL para estos registros ***/
/*** Nota 2: Cuando hay más de un dato, en la tabla secundaria, para alguno de los registros, sobre la misma variable, se incorporan ambos valores, por lo tanto, tendríamos dos (o más) registros para una misma instancia, lo que se refleja con otro registro con la misma clave primaria (PK) ***/


/*** Full Join ***/
/*** En este caso, la unión representa su máxima expresión. Es decir, se devuelve la información COMPLETA de todas las tablas ***/
USE Cursos;

SELECT Datos_Personales.Id_num, Actividades_Extra.Id_num AS Id_num_Act_Ext, /*** Incorporamos las claves primarias (PK) de cada una de las tablas, dado a que cada registro NO presente en ambas, se incorporará
																			También, es importante nombrar de diferente manera aquellas columnas con el mismo nombre, que serán devueltas en la consulta, con el fin de conocer de qué tabla es tal atributo ***/
	   Datos_Personales.Nombre, Actividades_Extra.Actividad
FROM Actividades_Extra FULL JOIN Datos_Personales /*** No discriminamos el orden, debido a que no es relevante en esta unión ***/
	 ON Actividades_Extra.Id_num = Datos_Personales.Id_num; /*** Ahora, esta condición "ON" busca empatar aquellos registros con el mismo "Id_num" pero, esto no es una condición de unión.
																 Es decir, la consulta unirá aquellos registros con la misma clave primaria (PK), sin embargo, la consulta también devolverá aquellos registros que no sean iguales, dado el tipo de unión (FULL JOIN).
																 Con esto se indica que la condición "ON" es una condición de unión pero, no es una condición de consulta (dado a que devuelve, en la consulta, aquellos registros que cumplen o no con esta condición) ***/