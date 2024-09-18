/*** Selección de carácteres específicos con LIKE ***/

/*** Búsqueda de caractéres de acuerdo a la posición ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Telefono like '______8%'; /*** Con los 6 guiones bajos, designamos que el valor que buscamos está en el 7mo lugar ***/
/*** Lo que devuelve son los registros que contienen en número 8 en la posición 7 ***/
/*** Usamos comillas simples y no dobles para especificar el valor buscado ***/
/*** Con el signo de % indicamos que sólo estamos interesados en que la búsqueda se haga en las primeras siete posiciones (valores combinados entre guiones y el número buscado) ***/


/*** Búsqueda de caractéres de acuerdo a el número de caracteres ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Ciudad like '______'; /*** Con los 6 guiones bajos, designamos que el número de caracteres que estamos buscamos ***/
/*** Lo que devuelve son los registros que contienen en el mismo número de caracteres que de guiones bajo sin importar cuales sean ***/
/*** Usamos comillas simples y no dobles para especificar el valor buscado ***/


/*** Búsqueda de caractéres que inicien y terminen con un elemento en particular ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Ciudad like 'L%n'; /*** Buscamos las ciudades (columna especificada) que inicien con la letra "L" y terminen con la letra "n" ***/
/*** Usamos comillas simples y no dobles para especificar el valor buscado ***/