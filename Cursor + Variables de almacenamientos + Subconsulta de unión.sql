
/*** Cursor + Variables de almacenamiento ***/

/*** Ejercicio ***/
/*** Obtener una lista de todos los alumnos que se encuentran en la tabla de Datos_Personales, incluyendo su nombre y ciudad en la que radican.
En caso de que el alumno esté registrado en alguna actividad extra-curricular, contenida en la tabla de Actividades_Extra_Nueva, debemos mostrar
también el nombre de dicha actividad ***/

/*** Creamos las variables de almacenamiento de los datos ***/
DECLARE @Nombre_del_alumno VARCHAR(255), @Ciudad_donde_vive_el_alumno VARCHAR(255)


USE Alumnos

/*** Creación del Cursor ***/
DECLARE Cursor_Alumnos
		CURSOR FOR
		SELECT Nombre, Ciudad /*** Variables/Columnas que nos interesa que devuelva la consulta ***/
		FROM Datos_Personales

/*** Acceso al Cursor ***/
OPEN Cursor_Alumnos

/*** Acción sobre los registros ***/
	FETCH NEXT FROM Cursor_Alumnos
		INTO @Nombre_del_alumno, @Ciudad_donde_vive_el_alumno /*** Con el comando INTO, almacenamos el recorrido (FETCH NEXT) en las variables creadas ***/

SELECT @Nombre_del_alumno AS NOMBRE_ALUMNO /*** Estas dos líneas (SELECT), sirven para mostrar lo que se almacena en las variables creadas (@) ***/
SELECT @Ciudad_donde_vive_el_alumno AS CIUDAD_ALUMNO 
/*** IMPORTANTE: SE DEBE CORRER JUNTO TODO EL CÓDIGO ANTERIOR A ESTE AVISO, DE HABERSE EJECUTADO ANTES, CERRAR EL CURSOR Y ELIMINARLO DE MEMORIA Y VOLVER A CORRER TODO LO ANTERIOR ***/


/*** Cerramos el Cursor ***/
CLOSE Cursor_Alumnos

/*** Eliminamos de memoria el Cursor ***/
DEALLOCATE Cursor_Alumnos


/*** Cursor + Variables de almacenamiento + WHITE + PRINT + Subconsulta ***/

DECLARE @Nombre_del_alumno VARCHAR(255), @Ciudad_donde_vive_el_alumno VARCHAR(255) /*** Creamos las variables de almacenamiento de los datos ***/


USE Alumnos

/*** Creación del Cursor ***/
DECLARE Cursor_Alumnos
		CURSOR FOR
		SELECT Nombre, Ciudad /*** Variables/Columnas que nos interesa que devuelva la consulta ***/
		FROM Datos_Personales

/*** Acceso al Cursor ***/
OPEN Cursor_Alumnos

/*** Acción sobre los registros ***/
	FETCH NEXT FROM Cursor_Alumnos
		INTO @Nombre_del_alumno, @Ciudad_donde_vive_el_alumno /*** Con el comando INTO, almacenamos el recorrido (FETCH NEXT) en las variables creadas (en este caso, se almacenará el primer registro,
																   que equivale al valor actual inicial, lo que representa siempre el primer comando FETCH NEXT, colocado antes del ciclo WHITE) ***/
	/*** Ciclo ***/
	WHILE @@FETCH_STATUS = 0
	BEGIN
		/*** Imprimimos en pantalla en cada recorrido del Cursor, en cada ciclo (WHILE) ***/
		PRINT 'Nombre del alumno: ' + @Nombre_del_alumno + 'Ciudad: ' + @Ciudad_donde_vive_el_alumno

		/*** Subconsulta para obtener las actividades extra-curriculares, de los alumnos registrados en la tabla "Actividades_Extra" ***/
		SELECT Actividad AS Actividad_Extracurricular /*** Atributo de interés y asignación de un alias (AS) ***/
		FROM Actividades_Extra_Nueva /*** Tabla de origen ***/
		WHERE Nombre = @Nombre_del_alumno /*** Condición que se debe cumplir sobre los registros devueltos en la consulta ***/

		FETCH NEXT FROM Cursor_Alumnos
			INTO @Nombre_del_alumno, @Ciudad_donde_vive_el_alumno /*** Aquí, almacenaremos los registros que recorre el Cursor,
																	   a partir del ciclo WHILE ***/

	END /*** Fin del ciclo ***/
/*** IMPORTANTE: SE DEBE CORRER JUNTO TODO EL CÓDIGO ANTERIOR A ESTE AVISO, DE HABERSE EJECUTADO ANTES, CERRAR EL CURSOR Y ELIMINARLO DE MEMORIA Y VOLVER A CORRER TODO LO ANTERIOR ***/
/*** NOTA: Para que se vea bien, poner la opción "Results to Text" (Ctrl + T) ***/

/*** Cerramos el Cursor ***/
CLOSE Cursor_Alumnos

/*** Eliminamos de memoria el Cursor ***/
DEALLOCATE Cursor_Alumnos