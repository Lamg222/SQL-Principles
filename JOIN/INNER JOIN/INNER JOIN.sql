/*** INNER JOIN (JOIN) ***/
/*** Unión de intersección, es decir, sólo se obtienen los registros presentes en todas las tablas de origen de los datos ***/
USE Alumnos; /*** NOTA: SI NO APARECEN LAS TABLAS EN EL APARTADO DE Query -> Desing Query in Editor, ENTONCES SE DEBE EJECUTAR EL COMANDO USE NOMBRE_BASE_DE_DATOS, ES DECIR, EL COMANDO CON EL QUE ESPECIFICAMOS LA BASE DE DATOS QUE ESTAMOS USANDO ***/																			

SELECT Actividades_Extra.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad /*** Aquí, se aprecian los atributos/columnas que 
queremos visualizar en la consulta. Cada columna viene precedida por la Tabla a la que pertenece y, con un punto, el nombre de la columna ***/
FROM   Actividades_Extra INNER JOIN Datos_Personales /*** Especificamos las Tablas donde proviene la información.
De igual forma, el tipo de unión que se realizará (este se coloca en medio de los nombres de las Tablas). 
PD: El INNER JOIN puede colocarce como JOIN. ***/
		ON Actividades_Extra.Id_num = Datos_Personales.Id_num /*** Con la palabra clave "ON", se especifica la condición que se está buscando.
		En este caso, se busca que el Id_num de la tabla "Actividades_Extra" sea igual al valor en los registros de la columna Id_num de la tabla "Datos_Personales" ***/


/*** Doble INNER JOIN ***/
SELECT        Actividades_Extra.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad, Ciudad.Ciudad /*** Se ha agregado el nuevo atributo de la nueva tabla "Ciudad" ***/
FROM            Actividades_Extra INNER JOIN
                         Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num INNER JOIN /*** Se agrega un nuevo comando INNER JOIN después de la primera sentencia de unión y comando de ejecución "ON" ***/
                         Ciudad ON Datos_Personales.Ciudad = Ciudad.Ciudad /*** Sólo se agrega el nombre de la nueva tabla, después del comando INNER JOIN y se incorpora la otra palabra clave ON de la nueva sentencia a ejecutar
																				la cual es que Ciudad de la tabla "Datos_Personales" sea igual al valor en los registros de la columna Ciudad de la tabla Ciudad.
																				Es importante remarcar que esta unión ya está condicionada a los registros encontrados en el primer INNER JOIN, lo que sólo traerá los valores para estos registros ***/


/*** NOTA: SI NO APARECEN LAS TABLAS EN EL APARTADO DE Query -> Desing Query in Editor, ENTONCES SE DEBE EJECUTAR EL COMANDO USE NOMBRE_BASE_DE_DATOS, ES DECIR, EL COMANDO CON EL QUE ESPECIFICAMOS LA BASE DE DATOS QUE ESTAMOS USANDO ***/																			


/*** OTRO EJEMPLO (PARECIDO AL ANTERIOR) ***/
SELECT        Actividades_Extra.Id_num, Datos_Personales.Nombre, Actividades_Extra.Actividad, Ciudad.Ciudad, Ciudad.Pais
FROM            Actividades_Extra INNER JOIN
                         Datos_Personales ON Actividades_Extra.Id_num = Datos_Personales.Id_num INNER JOIN
                         Ciudad ON Datos_Personales.Ciudad = Ciudad.Ciudad