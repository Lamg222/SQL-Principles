
/*** Stored Procedures ***/
/*** Los procedimientos almacenados, son sentencias o funciones que se pueden guardar para futuras ejecuciones. Es decir, son acciones o funciones que se usan
frecuentemente en la consulta de bases de datos relacionales y se guardan con el fin de utilizarlas posteriormente en otros proyectos ***/

USE Cursos; /** Base de Datos ***/

CREATE PROCEDURE spPrimer_Procedimiento_Almacenado ( /*** CREATE PROCEDURE es el comando necesario para crear nuestro procedimiento almacenado. 
														  NOTA: es recomendable usar el prefijo "sp" pero, no utilizar "_" después de este, debido a que
														  esta es la manera en la que empiezan los "Stored Procedure" (SP) de SQL y no se reconocerían los 
														  SP creados por el usuario y aquellos ya incorporados por el sistema SQL. A parte, podría existir
														  el caso de nombrar de la misma manera un procedimiento almacenado y generar interferencia tanto en ejecución
														  como en actualización del comando **/
	@Actividad_var VARCHAR(50)    /*** Creamos el/los parámetros que recibirá	el SP, sobre los cuales	se ejecutarán las sentencias/acciónes.
									 Se crean con un @, al inicio del nombre que nos interese asignarle, así como, el tipo de variable/parámetro que será ***/
)
AS 

BEGIN /*** Los comandos AS y BEGIN se asignan para indicar el inicio de las instrucciones de nuestro SP ***/
	SELECT * /** Instrucciones: ***/
	FROM Actividades_Extra /*** Tabla origen de los datos ***/
	WHERE Actividad = @Actividad_var /*** Condición ***/
END; /*** Terminamos las intrucciones de nuestro SP ***/

/*** Esto se almacena en la Base de Datos especificada, en la carpeta "Programmability", en "Stored Procedures" (hay que actualizar la Base de Datos) ***/

/*** Ejecución con código ***/

EXECUTE spPrimer_Procedimiento_Almacenado 'Baile';

EXECUTE spPrimer_Procedimiento_Almacenado 'Canto'; /** Otra búsqueda **/

EXECUTE spPrimer_Procedimiento_Almacenado 'Robotica'; /** Otra búsqueda **/


/*** ALTER PROCEDURE ***/
/*** Modificando el procedimiento almacenado (Stored Procedures) ***/

ALTER PROCEDURE spPrimer_Procedimiento_Almacenado
(
		@Actividad_var AS VARCHAR(50)
)

AS

BEGIN
	SELECT *
	FROM Actividades_Extra
	WHERE Actividad = @Actividad_var
	ORDER BY Nombre_Columna_Nueva /*** La modificación fue orientada a agregar el comando ORDER BY, para ordenar los resultados de consulta con base en 
									   el orden alfabético de la columna "Nombre_Columna_Nueva" de la tabla "Actividad_Extra" ***/
END


/*** Ejecución con código ***/

EXECUTE spPrimer_Procedimiento_Almacenado 'Baile';

EXECUTE spPrimer_Procedimiento_Almacenado 'Canto'; /** Otra búsqueda. NULL es un valor que va primero (debido a que no hay información) **/

EXECUTE spPrimer_Procedimiento_Almacenado 'Robotica'; /** Otra búsqueda **/



/*** DROP PROCEDURE ***/
/** Para eliminar el Stored Procedure (SP) **/

DROP PROCEDURE spPrimer_Procedimiento_Almacenado /** Con el comando DROP PROCEDURE, eliminamos el SP, contenido en la carpeta "Stored Procedure" de la carpeta 
													 "Programmability" de la base de datos "Cursos" **/




/*** CREATE PROCEDURE + UPDATE ***/
/*** Actualización o cambio de un registro, dada una variable específica, a travéz de un procesimiento almacenado (SP) ***/

CREATE PROCEDURE spCambio_Costos (

	@Producto_var VARCHAR(50), /** Cuando egregamos varias variables/parámetros sobre los que se guiará la sentencia/acción, debemos colocar el delimitador "," **/
	@Costo_var DECIMAL (6, 2)
)

AS

BEGIN
	UPDATE Utiles_Escolares /** Tabla con la informaciónn que queremos modificar/actualizar/cambiar **/
	SET Costo = @Costo_var /** Modificamos (sentencia) la información de la columna existente "Costo", la cual será igual al parámetro de nuestro SP "Costo_var" **/
	WHERE Prod_Name = @Producto_var /** Condición para aplicar la sentecia (SET) **/
END


/** Ejecutamos el nuevo SP **/

SELECT * FROM Utiles_Escolares; /** Observamos los valores de la tabla (sin cambios) **/
								/** El producto "Tijeras" cuesta (originalmente) 10.5 **/

EXEC spCambio_Costos 'Tijeras', 11.5; /** Cambiamos el costo del registro 'Tijeras', de 10.5 a 11.5 **/
									  /** Los campos alfanuméricos van en comillas simples y los atributos numéricos no necesitan de ninguna condición **/	
									  /** NOTA: De acuerdo al orden establecido en el SP, el procedimiento almacenado espera que las variables sigan este orden.
										  Por lo tanto, es necesario que los parámetros especificados en el SP tengan el mismo orden que los establecidos en su estructura.
										  De no ser así, devuelve un error la ejecución del SP (EXEC o EXECUTE) **/

SELECT * FROM Utiles_Escolares; /** Observamos el cambio **/


EXECUTE spCambio_Costos @Costo_var = 10.5, @Producto_var = 'Tijeras'; /** Si especificamos (hacemos explícita) la asignación de los parámetros, no importa el orden en el que se especifiquen los valores **/

SELECT * FROM Utiles_Escolares; /** Observamos el cambio **/