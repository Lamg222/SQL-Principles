
/*** Stored Procedures ***/
/*** Los procedimientos almacenados, son sentencias o funciones que se pueden guardar para futuras ejecuciones. Es decir, son acciones o funciones que se usan
frecuentemente en la consulta de bases de datos relacionales y se guardan con el fin de utilizarlas posteriormente en otros proyectos ***/

USE Cursos; /** Base de Datos ***/

CREATE PROCEDURE spPrimer_Procedimiento_Almacenado ( /*** CREATE PROCEDURE es el comando necesario para crear nuestro procedimiento almacenado. 
														  NOTA: es recomendable usar el prefijo "sp" pero, no utilizar "_" despu�s de este, debido a que
														  esta es la manera en la que empiezan los "Stored Procedure" (SP) de SQL y no se reconocer�an los 
														  SP creados por el usuario y aquellos ya incorporados por el sistema SQL. A parte, podr�a existir
														  el caso de nombrar de la misma manera un procedimiento almacenado y generar interferencia tanto en ejecuci�n
														  como en actualizaci�n del comando **/
	@Actividad_var VARCHAR(50)    /*** Creamos el/los par�metros que recibir�	el SP, sobre los cuales	se ejecutar�n las sentencias/acci�nes.
									 Se crean con un @, al inicio del nombre que nos interese asignarle, as� como, el tipo de variable/par�metro que ser� ***/
)
AS 

BEGIN /*** Los comandos AS y BEGIN se asignan para indicar el inicio de las instrucciones de nuestro SP ***/
	SELECT * /** Instrucciones: ***/
	FROM Actividades_Extra /*** Tabla origen de los datos ***/
	WHERE Actividad = @Actividad_var /*** Condici�n ***/
END; /*** Terminamos las intrucciones de nuestro SP ***/

/*** Esto se almacena en la Base de Datos especificada, en la carpeta "Programmability", en "Stored Procedures" (hay que actualizar la Base de Datos) ***/

/*** Ejecuci�n con c�digo ***/

EXECUTE spPrimer_Procedimiento_Almacenado 'Baile';