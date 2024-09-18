
/*** Concatenar dos atributos/columnas ***/

/*** 1er m�todo ***/
USE Adventure_Luis;

SELECT FirstName, LastName,
	   FirstName + ' ' + LastName AS Nomb_Completo /*** Concatenamos con los signos "+" y agregamos el espacio con comillas simples ***/
FROM Clientes



/*** 2do m�todo (CONCAT) ***/
USE Adventure_Luis;

SELECT FirstName, LastName,
	   CONCAT(FirstName, ' ', LastName) AS Nombre_Completo /*** Con el comando CONCAT podemos especificar las variables que queremos concatenar en un atributo nuevo
En este caso, concatenamos los valores contenidos en las columnas "FistName" y "LastName" y agregamos el espacio con comillas simples, como segundo elemento (DADO A QUE concatena en orden de asignaci�n dentro de los par�ntesis) ***/
FROM Clientes;
