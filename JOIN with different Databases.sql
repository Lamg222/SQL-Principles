
/*** JOIN con tablas de diferentes Bases de Datos ***/

SELECT * /*** Seleccionamos todos los atributos ***/
FROM Cursos.dbo.Actividades_Extra /*** Lo único que cambia es que se debe especificar la ruta completa de la tabla, considerando también la Base de Datos de la que proviene ***/
INNER JOIN Cursos.dbo.Datos_Personales /*** En este caso, no tengo otra Base de Datos, pero el ejercicio sería el mismo, incluyendo la ruta completa empezando por el nombre de la Base de Datos a la que pertenece la tabla ***/
		   ON Cursos.dbo.Actividades_Extra.Id_num = Cursos.dbo.Datos_Personales.Id_num;

/*** Otro ejemplo pero asignando un ALIAS para no escribir toda la ruta completa, en las subsiguientes menciones ***/
SELECT * /*** Seleccionamos todos los atributos ***/
FROM Cursos.dbo.Actividades_Extra AS C_AE/*** Lo único que cambia es que se debe especificar la ruta completa de la tabla, considerando también la Base de Datos de la que proviene ***/
INNER JOIN Cursos.dbo.Datos_Personales AS C_DP /*** En este caso, no tengo otra Base de Datos, pero el ejercicio sería el mismo, incluyendo la ruta completa empezando por el nombre de la Base de Datos a la que pertenece la tabla ***/
		   ON C_AE.Id_num = C_DP.Id_num;

/*** Otra opción del ejemplo con ALIAS ***/
SELECT * /*** Seleccionamos todos los atributos ***/
FROM Cursos.dbo.Actividades_Extra C_AE /*** Lo único que cambia es que se debe especificar la ruta completa de la tabla, considerando también la Base de Datos de la que proviene ***/
INNER JOIN Cursos.dbo.Datos_Personales C_DP /*** En este caso, no tengo otra Base de Datos, pero el ejercicio sería el mismo, incluyendo la ruta completa empezando por el nombre de la Base de Datos a la que pertenece la tabla ***/
		   ON C_AE.Id_num = C_DP.Id_num;