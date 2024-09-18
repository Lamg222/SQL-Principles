/*** Selecci�n de car�cteres espec�ficos con LIKE ***/

/*** B�squeda de caract�res de acuerdo a la posici�n ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Telefono like '______8%'; /*** Con los 6 guiones bajos, designamos que el valor que buscamos est� en el 7mo lugar ***/
/*** Lo que devuelve son los registros que contienen en n�mero 8 en la posici�n 7 ***/
/*** Usamos comillas simples y no dobles para especificar el valor buscado ***/
/*** Con el signo de % indicamos que s�lo estamos interesados en que la b�squeda se haga en las primeras siete posiciones (valores combinados entre guiones y el n�mero buscado) ***/


/*** B�squeda de caract�res de acuerdo a el n�mero de caracteres ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Ciudad like '______'; /*** Con los 6 guiones bajos, designamos que el n�mero de caracteres que estamos buscamos ***/
/*** Lo que devuelve son los registros que contienen en el mismo n�mero de caracteres que de guiones bajo sin importar cuales sean ***/
/*** Usamos comillas simples y no dobles para especificar el valor buscado ***/


/*** B�squeda de caract�res que inicien y terminen con un elemento en particular ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Ciudad like 'L%n'; /*** Buscamos las ciudades (columna especificada) que inicien con la letra "L" y terminen con la letra "n" ***/
/*** Usamos comillas simples y no dobles para especificar el valor buscado ***/