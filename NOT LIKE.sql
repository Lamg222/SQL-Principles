/*** B�squeda de registros con el comando NOT LIKE ***/

/*** B�squeda de caract�res que NO empiecen con un elemento en particular ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Ciudad Not like 'L%'; /*** Buscamos las ciudades (columna especificada) que NO inician con la letra "L" ***/
/*** No es necesarios poner el s�mbolo "=" en la designaci�n de la condici�n de la funci�n WHERE cuando usamos el comando LIKE o NOT LIKE ***/
/*** Usamos comillas simples y no dobles para especificar el valor buscado ***/