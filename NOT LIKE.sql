/*** Búsqueda de registros con el comando NOT LIKE ***/

/*** Búsqueda de caractéres que NO empiecen con un elemento en particular ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Ciudad Not like 'L%'; /*** Buscamos las ciudades (columna especificada) que NO inician con la letra "L" ***/
/*** No es necesarios poner el símbolo "=" en la designación de la condición de la función WHERE cuando usamos el comando LIKE o NOT LIKE ***/
/*** Usamos comillas simples y no dobles para especificar el valor buscado ***/