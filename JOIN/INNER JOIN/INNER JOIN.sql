/*** INNER JOIN (JOIN) ***/
/*** Uni�n de intersecci�n, es decir, s�lo se obtienen los registros presentes en todas las tablas de origen de los datos ***/
USE Alumnos; /*** NOTA: SI NO APARECEN LAS TABLAS EN EL APARTADO DE Query -> Desing Query in Editor, ENTONCES SE DEBE EJECUTAR EL COMANDO USE NOMBRE_BASE_DE_DATOS, ES DECIR, EL COMANDO CON EL QUE ESPECIFICAMOS LA BASE DE DATOS QUE ESTAMOS USANDO ***/																			

SELECT Actividades_Extra.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad /*** Aqu�, se aprecian los atributos/columnas que 
queremos visualizar en la consulta. Cada columna viene precedida por la Tabla a la que pertenece y, con un punto, el nombre de la columna ***/
FROM   Actividades_Extra INNER JOIN Datos_Personales /*** Especificamos las Tablas donde proviene la informaci�n.
De igual forma, el tipo de uni�n que se realizar� (este se coloca en medio de los nombres de las Tablas). 
PD: El INNER JOIN puede colocarce como JOIN. ***/
		ON Actividades_Extra.Id_num = Datos_Personales.Id_num /*** Con la palabra clave "ON", se especifica la condici�n que se est� buscando.
		En este caso, se busca que el Id_num de la tabla "Actividades_Extra" sea igual al valor en los registros de la columna Id_num de la tabla "Datos_Personales" ***/


/*** Doble INNER JOIN ***/
SELECT        Actividades_Extra.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad, Ciudad.Ciudad /*** Se ha agregado el nuevo atributo de la nueva tabla "Ciudad" ***/
FROM            Actividades_Extra INNER JOIN
                         Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num INNER JOIN /*** Se agrega un nuevo comando INNER JOIN despu�s de la primera sentencia de uni�n y comando de ejecuci�n "ON" ***/
                         Ciudad ON Datos_Personales.Ciudad = Ciudad.Ciudad /*** S�lo se agrega el nombre de la nueva tabla, despu�s del comando INNER JOIN y se incorpora la otra palabra clave ON de la nueva sentencia a ejecutar
																				la cual es que Ciudad de la tabla "Datos_Personales" sea igual al valor en los registros de la columna Ciudad de la tabla Ciudad.
																				Es importante remarcar que esta uni�n ya est� condicionada a los registros encontrados en el primer INNER JOIN, lo que s�lo traer� los valores para estos registros ***/


/*** NOTA: SI NO APARECEN LAS TABLAS EN EL APARTADO DE Query -> Desing Query in Editor, ENTONCES SE DEBE EJECUTAR EL COMANDO USE NOMBRE_BASE_DE_DATOS, ES DECIR, EL COMANDO CON EL QUE ESPECIFICAMOS LA BASE DE DATOS QUE ESTAMOS USANDO ***/																			


/*** OTRO EJEMPLO (PARECIDO AL ANTERIOR) ***/
SELECT        Actividades_Extra.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad, Ciudad.Ciudad, Ciudad.Pais
FROM            Actividades_Extra INNER JOIN
                         Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num INNER JOIN
                         Ciudad ON Datos_Personales.Ciudad = Ciudad.Ciudad