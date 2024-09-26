
/*** EXECUTE (EXEC) ***/

/*** Stored Procedures ***/
/*** Los procedimientos almacenados, son sentencias o funciones que se pueden guardar para futuras ejecuciones. Es decir, son acciones o funciones que se usan
frecuentemente en la consulta de bases de datos relacionales y se guardan con el fin de utilizarlas posteriormente en otros proyectos ***/

USE Cursos

/** sp_help **/

EXECUTE sp_help; /*** Comando para visualizar una lista sobre los objetos contenidos en nuestra base de datos ***/

EXECUTE sp_help 'Mexicanos_MaratonNY'; /*** Complementando el comando con el nombre de un objeto (en este caso una tabla) obtenemos la información de los 
											atributos que contiene dicho objeto, así como el tipo, longitud del vector, entre otras cosas ***/


/** sp_rename ***/

EXECUTE sp_rename 'Ciudad', 'Ciudades'; /*** Con este comando, renombramos tablas o columnas. En este caso, cambiamos el nombre de la tabla "Ciudad" por el nombre "Ciudades" ***/
										/*** Nota: Primero va el nombre original y después colocamos el nuevo nombre. Todo en comillas simples ***/							


EXEC sp_rename 'Ciudades', 'Ciudad'; /*** También podemos abreviar el comando EXECUTE por EXEC. Aquí, volvemos a renombrar la tabla para que tenga su nombre anterior ***/


