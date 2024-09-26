
/*** EXEC + sp_rename ***/
/*** Para cambiar el nombre de una columna de una tabla ***/

/*** Tabla original ***/
USE Cursos

SELECT*
FROM MaratonNY_Modificada;

/*** sp_rename ***/
USE Cursos

EXEC sp_rename 'MaratonNY_Modificada.age', /*** Nombre completo de la columna (Nombre_de_la_tabla_y_nombre_de_la_columna)  a modificar ***/
				'Edad', /*** Nuevo nombre de la columna ***/
				'COLUMN'; /*** Indicamos que el objeto que estamos renombrando (EXEC sp_rename) es una columna ('COLUMN') ***/

/*** Visualizar resultado ***/
USE Cursos

SELECT*
FROM MaratonNY_Modificada; /*** Ahora la columna "age" se llama "Edad" ***/