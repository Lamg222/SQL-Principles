
/*** Variables ***/
/*** Sirven para almacenar operaciones de consulta, basados en cambios estructurales.
Esto, con el fin de obtener consultas r�pidas sobre un determinado registro ***/

USE Cursos; /*** Base de datos donde se almacenan las tablas ***/

DECLARE @Id_num�rico INT, @Pa�s VARCHAR(20), @Ciudad VARCHAR(20) /*** Declaramos las variables de nuestra consulta.
																Aqu�, especificamos el nombre (precedido poor un @) y el tipo de variable (junto al nombre) 
																En este caso, tenemos tres variables: una de tipo entero y dos de tipo cadena de caracteres con una longitud m�xima de 20 ***/
SET @Id_num�rico = 22 /*** Para asignarle (SET) un valor a cada variable (Pa�s y Ciudad) , designamos el registro de inter�s ***/


SET @Ciudad = /*** Asignamos el valor que devolver� para la variable Ciudad ***/
	(SELECT Ciudad
	 FROM Datos_Personales
	 WHERE Id_num = @Id_num�rico)
	 /*** Lo que devolver� ser� la ciudad (valor del atributo/columna) para el registro (Id_num) de la tabla "Datos_Personales", que sea igual al
		  valor especificado como registro de inter�s (@Id_num�rico) ***/

SET @Pa�s = (SELECT Pais
			 FROM Ciudad
			 WHERE Ciudad = @Ciudad)
			 /*** Lo que devuelve es el pa�s (valor del atributo/columna) para el registro (Ciudad) de la tabla "Ciudad", que sea igual al valor
				  espe�ificado como caracter�stica (@Ciudad) del registro de inter�s (@Id_num�rico) ***/

/*** Esto concatena informaci�n de dos consultas, basado en un registro (@Id_num�rico) que se enlaza, en primera instancia, con la tabla "Datos_Personales"
y, despu�s, ya obtenida la primera concatenaci�n de informaci�n (@Id_num�rico y @Ciudad), buscamos la coincidencia de la @Ciudad, basados en los datos de la
tabla llamada "Ciudad", donde queremos obtener el atributo "Pais" al que se enlaza este mismo valor (Ciudad = @Ciudad). Por �ltimo, obtenemos una consulta
con la informaci�n del registro especificado @Id_num�rico, con sus atributos @Ciudad y @Pa�s, obtenidos de la concatenaci�n de dos tablas distintas ***/ 


/*** Visualizamos los valores obtenidos ***/
/*** NOTA: Se debe seleccionar TODO el c�digo. Es decir, desde estas �ltimas 3 l�neas hasta el inicio (donde establecemos la Base de datos).
Al actualizar el valor del registro de inter�s (@Id_num�rico), debemos hacer lo mismo (correr todo el c�digo) ***/
SELECT @Id_num�rico AS Alumno
SELECT @Ciudad AS Ciudad_donde_vive
SELECT @Pa�s AS Pa�s_de_la_ciudad