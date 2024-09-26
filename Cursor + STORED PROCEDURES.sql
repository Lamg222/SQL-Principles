
/*** Cursor + Stored Procedure ***/

/** Cursor **/

USE Cursos /** Base de Datos **/

SELECT * FROM Datos_Personales; /** Tabla de inter�s **/

/** Creamos las variables donde se almacenar�n los datos **/

DECLARE @Nombre_cursor_var VARCHAR(255) /** Debemos crear las variables antes **/
DECLARE @Ciudad_cursor_var VARCHAR(255)


/** Creamos el cursor **/

DECLARE Clases_extras_cursor CURSOR /** Creaci�n y nombre del cursor **/
	FOR SELECT Nombre, Ciudad /** Atributos/columnas de inter�s **/
	FROM Datos_Personales; /** Tabla de inter�s **/
/** Estas variables se almacenar�n en nuestro cursor **/

/** Accedemo al cursor para la ejecuci�n de sentencias/acciones **/
OPEN Clases_extras_cursor;
	
	/** Tipo de recorrido INICIAL de registros **/
	FETCH NEXT FROM Clases_extras_cursor /** Aplicado al cursor (FROM) **/
		INTO @Nombre_cursor_var, @Ciudad_cursor_var /** Par�metros/variables creadas del cursor **/

	/** Ciclo (WHILE) de sentencias (PRINT, SELECT, FETCH NEXT + INTO) y condiciones (WHERE) **/
	WHILE @@FETCH_STATUS = 0 /** Mientras esto siga siendo verdadero (TRUE), seguir corriendo el ciclo **/
		BEGIN /** Comienzo de la consulta que se ejecutar� mientras se cumpla lo anterior (@@FETCH_STATUS = 0, es decir, mientras sigan existiendo registros
																						   para recorrer a los extremos (inferior o superior) del registro actual) **/
			 PRINT 'Nombre del alumno: ' + @Nombre_cursor_var + 'Ciudad donde vive: ' + @Ciudad_cursor_var /** Informaci�n que se imprime en consola **/

																  /** Tambi�n imprimimos esta informaci�n **/
			 SELECT Actividad AS Actividad_registrada_en_la_tabla /** Atributo/columna perteneciente a la tabla de inter�s **/
			 FROM Actividades_Extra /** Tabla de inter�s (esta es otra tabla diferente a la tabla del cursor (por esa raz�n es la siguiente condici�n)) **/
			 WHERE Nombre_Columna_Nueva = @Nombre_cursor_var /** Cuando los nombre de la tabla de inter�s sean iguales a los especificados en el cursor, 
																 devuelve una consulta con resultados **/

			FETCH NEXT FROM Clases_extras_cursor /** Volvemos a especificar el tipo de recorrido y el cursor (aplicado al siguiente registros, FETCH NEXT) **/
				INTO @Nombre_cursor_var, @Ciudad_cursor_var

		END /**T�rmino del buble/ciclo **/
		/** Ejecutar desde la creaci�n de variables (DECLARE @), hasta este punto (END) **/


/** Cerramos el cursor (al ejecutar esta l�nea de c�digo, ya no podremos acceder a la informaci�n guardada en el cursor) **/
/** Recordar que el cursor es un objeto de almacenamiento temporal donde se puede especificar el tipo de recorrido de los registros de una tabla **/
CLOSE Clases_extras_cursor


/** Quitamos de la memoria el cursor **/
DEALLOCATE Clases_extras_cursor

/** Es recomendable cambiar el tipo de salida de los datos a "Results to Text" (con Ctrl +T), ANTES de la ejecuci�n **/



/** SP**/
/** Creaci�n de procedimientos almacenados **/

/** Creaci�n de variables **/
CREATE PROCEDURE spLista_Actividades
(
	@Nombre_sp VARCHAR(255), /** Es necesario poner el delimitador "," para la creaci�n de m�ltiples variables para el procedimiento almacenado **/
	@Ciudad_sp VARCHAR(255)
)

AS

BEGIN
	PRINT 'Nombre del alumno: ' + @Nombre_sp + 'Ciudad donde vive: ' + @Ciudad_sp

	SELECT Actividad AS Actividad_registrada_en_la_tabla /** Seleccionamos el atributo de inter�s, de nuestra tabla de inter�s **/
	FROM Actividades_Extra /** Tabla de inter�s **/
	WHERE Nombre_Columna_Nueva = @Nombre_sp /** Condici�n para la ejecuci�n **/

END


/*** CURSOR + STORED PROCEDURE (con Cursor y SP creados anteriormente) ***/
/*** NOTA: Debe estar creado el SP ANTES de combinarlo con el cursor ***/
/*** NOTA 2: Se vuelve a crear el cursor (lo �ptimo es no haberlo creado antes) ***/

/** Creamos las variables donde se almacenar�n los datos **/

DECLARE @Nombre_cursor_var VARCHAR(255) /** Debemos crear las variables antes **/
DECLARE @Ciudad_cursor_var VARCHAR(255)


/** Creamos el cursor **/

DECLARE Clases_extras_cursor CURSOR /** Creaci�n y nombre del cursor **/
	FOR SELECT Nombre, Ciudad /** Atributos/columnas de inter�s **/
	FROM Datos_Personales; /** Tabla de inter�s **/
/** Estas variables se almacenar�n en nuestro cursor **/


/** Accedemo al cursor para la ejecuci�n de sentencias/acciones **/
OPEN Clases_extras_cursor;
	
	/** Tipo de recorrido INICIAL de registros **/
	FETCH NEXT FROM Clases_extras_cursor /** Aplicado al cursor (FROM) **/
		INTO @Nombre_cursor_var, @Ciudad_cursor_var /** Par�metros/variables creadas del cursor **/

	/** Ciclo (WHILE) de sentencias (PRINT, SELECT, FETCH NEXT + INTO) y condiciones (WHERE) **/
	WHILE @@FETCH_STATUS = 0 /** Mientras esto siga siendo verdadero (TRUE), seguir corriendo el ciclo **/
		BEGIN /** Comienzo de la consulta que se ejecutar� mientras se cumpla lo anterior (@@FETCH_STATUS = 0, es decir, mientras sigan existiendo registros
																						   para recorrer a los extremos (inferior o superior) del registro actual) **/
			 
			 EXEC spLista_Actividades @Nombre_sp = @Nombre_cursor_var, @Ciudad_sp = @Ciudad_cursor_var /** Cursor + SP, donde la estructura de ejecuci�n/sentencias,
																										   condiciones y origen de los datos, ya se especificaron en la creaci�n del 
																										   procedimiento almacenado (SP) **/

			FETCH NEXT FROM Clases_extras_cursor /** Volvemos a especificar el tipo de recorrido y el cursor (aplicado al siguiente registros, FETCH NEXT) **/
				INTO @Nombre_cursor_var, @Ciudad_cursor_var

		END /**T�rmino del buble/ciclo **/
		/** Ejecutar desde la creaci�n de variables (DECLARE @), hasta este punto (END) **/

/**	EL RESULTADO ES EL MISMO QUE EL DEL CURSOR CON LOS COMANDOS PRINT Y LA SUBCONSULTA, CON LOS DATOS ALMACENADOS EN EL CURSOR, PERO AHORA CON EL PROCEDIMIENTO ALMACENADO (SP)
PARA IMPRIMIR LA CONSULTA, CON BASE EN LA SUBCONSULTA ESTABLECIDA DENTRO DE LA ESTRUCTURA DEL SP **/

/** Cerramos el cursor (al ejecutar esta l�nea de c�digo, ya no podremos acceder a la informaci�n guardada en el cursor) **/
/** Recordar que el cursor es un objeto de almacenamiento temporal donde se puede especificar el tipo de recorrido de los registros de una tabla **/
CLOSE Clases_extras_cursor


/** Quitamos de la memoria el cursor **/
DEALLOCATE Clases_extras_cursor

/** Es recomendable cambiar el tipo de salida de los datos a "Results to Text" (con Ctrl +T), ANTES de la ejecuci�n **/
