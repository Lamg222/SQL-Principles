
/*** Variables ***/
/*** Sirven para almacenar operaciones de consulta, basados en cambios estructurales.
Esto, con el fin de obtener consultas rápidas sobre un determinado registro ***/

USE Cursos; /*** Base de datos donde se almacenan las tablas ***/

DECLARE @Id_numérico INT, @País VARCHAR(20), @Ciudad VARCHAR(20) /*** Declaramos las variables de nuestra consulta.
																Aquí, especificamos el nombre (precedido poor un @) y el tipo de variable (junto al nombre) 
																En este caso, tenemos tres variables: una de tipo entero y dos de tipo cadena de caracteres con una longitud máxima de 20 ***/
SET @Id_numérico = 22 /*** Para asignarle (SET) un valor a cada variable (País y Ciudad) , designamos el registro de interés ***/


SET @Ciudad = /*** Asignamos el valor que devolverá para la variable Ciudad ***/
	(SELECT Ciudad
	 FROM Datos_Personales
	 WHERE Id_num = @Id_numérico)
	 /*** Lo que devolverá será la ciudad (valor del atributo/columna) para el registro (Id_num) de la tabla "Datos_Personales", que sea igual al
		  valor especificado como registro de interés (@Id_numérico) ***/

SET @País = (SELECT Pais
			 FROM Ciudad
			 WHERE Ciudad = @Ciudad)
			 /*** Lo que devuelve es el país (valor del atributo/columna) para el registro (Ciudad) de la tabla "Ciudad", que sea igual al valor
				  espeçificado como característica (@Ciudad) del registro de interés (@Id_numérico) ***/

/*** Esto concatena información de dos consultas, basado en un registro (@Id_numérico) que se enlaza, en primera instancia, con la tabla "Datos_Personales"
y, después, ya obtenida la primera concatenación de información (@Id_numérico y @Ciudad), buscamos la coincidencia de la @Ciudad, basados en los datos de la
tabla llamada "Ciudad", donde queremos obtener el atributo "Pais" al que se enlaza este mismo valor (Ciudad = @Ciudad). Por último, obtenemos una consulta
con la información del registro especificado @Id_numérico, con sus atributos @Ciudad y @País, obtenidos de la concatenación de dos tablas distintas ***/ 


/*** Visualizamos los valores obtenidos ***/
/*** NOTA: Se debe seleccionar TODO el código. Es decir, desde estas últimas 3 líneas hasta el inicio (donde establecemos la Base de datos).
Al actualizar el valor del registro de interés (@Id_numérico), debemos hacer lo mismo (correr todo el código) ***/
SELECT @Id_numérico AS Alumno
SELECT @Ciudad AS Ciudad_donde_vive
SELECT @País AS País_de_la_ciudad