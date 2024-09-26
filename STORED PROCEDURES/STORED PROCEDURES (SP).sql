
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