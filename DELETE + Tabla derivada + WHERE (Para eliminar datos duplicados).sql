
/*** Eliminar datos duplicados ***/

/*** Creamos tabla con valores duplicados ***/
/*** CREATE TABLE ***/
USE Cursos

CREATE TABLE Tabla_Valores_Duplicados (
		Nombre VARCHAR(50),
		Profesión VARCHAR(40),
		Empresa VARCHAR(50)
	);

/*** INSERT INTO ***/
INSERT INTO Tabla_Valores_Duplicados /*** Podemos no especificar las columnas, siempre que los valores (VALUES) vayan en orden con el de las columnas de la tabla ***/
	VALUES ('Luis Méndez', 'Dentista', 'Institución gubernamental'),
		   ('Patricia Gasca', 'Abogada', 'Despacho de Abogados Toluca S.A de C.V'),
		   ('Alejandra Alonso', 'Administradora', 'Ping Solutions'),
		   ('Sergio Méndez', 'Chef', 'Jacob´s Bar'),
		   ('Daniela Méndez', 'Médico', 'ABC Santa Fe'),
		   ('Luis Méndez', 'Dentista', 'Institución gubernamental'),
		   ('Alejandra Alonso', 'Administradora', 'Ping Solutions'),
		   ('Luis Alberto M.G', 'Economísta & Data Scientist', 'Consultores S.A de C.V')

/*** Visualizamos la tabla creada ***/
USE Cursos

SELECT *
FROM Tabla_Valores_Duplicados;



/*** SELECT + COUNT() + OVER + PARTITION BY ***/
/*** Contamos los registros de la tabla ***/
USE Cursos  /*** Establece la base de datos en la que se va a trabajar, en este caso, la base de datos llamada 'Cursos'. **/

SELECT *,  /*** Selecciona todas las columnas de la tabla 'Tabla_Valores_Duplicados'. El asterisco (*) significa que se seleccionan todas las columnas. **/

    COUNT(*)  /*** Utiliza la función COUNT para contar el número de filas que cumplen con las particiones definidas (PARTITION BY) en la siguiente línea de código. En este caso, cuenta todas las filas dentro de cada grupo definido por la partición. **/

    OVER (PARTITION BY Nombre, Profesión, Empresa) AS Conteo  /*** 'OVER (PARTITION BY ...)' divide las filas en grupos, en este caso, basado en las columnas 'Nombre', 'Profesión' y 'Empresa'. 
    La función COUNT() se aplica a cada grupo individualmente, es decir, cuenta cuántas filas hay en cada grupo que tiene el mismo valor de 'Nombre', 'Profesión' y 'Empresa'. 
    El resultado se almacena en una columna temporal llamada 'Conteo'. **/

FROM Tabla_Valores_Duplicados;  /*** Indica la tabla de donde se seleccionan los datos, en este caso, 'Tabla_Valores_Duplicados'. **/


/*** SELECT + ROW_NUMBER() + OVER + PARTITION BY + ORDER BY ***/
/*** Para enumerar los registros, en vez de contarlos. Es decir, para el primer valor tomará 1 y si hay duplicados tomará valores subsecuentes del 2 hasta el total de veces que aparezca un mismo valor ***/
USE Cursos  /*** Establece la base de datos 'Cursos' en la que se va a ejecutar la consulta. **/

SELECT *,  /*** Selecciona todas las columnas de la tabla 'Tabla_Valores_Duplicados'. El asterisco (*) indica que se seleccionan todas las columnas. **/

    ROW_NUMBER()  /*** Utiliza la función ROW_NUMBER para asignar un número secuencial único a cada fila dentro de la partición (grupo) definido en la cláusula 'PARTITION BY'. **/

    OVER (PARTITION BY Nombre, Profesión, Empresa  /*** 'PARTITION BY' agrupa las filas basándose en las columnas 'Nombre', 'Profesión' y 'Empresa'. La función ROW_NUMBER() se reinicia para cada nuevo grupo. **/

          ORDER BY Nombre)  /*** 'ORDER BY Nombre' especifica que dentro de cada partición, las filas se enumerarán secuencialmente basándose en el orden alfabético de la columna 'Nombre'. Esto establece cómo se asignan los números de fila y es necesario para la enumeración. **/

    AS Enumeración  /*** Asigna el alias 'Enumeración' a la columna que contiene los números generados por la función ROW_NUMBER(), mostrando el número de fila en cada partición. **/

FROM Tabla_Valores_Duplicados;  /*** Especifica que los datos provienen de la tabla 'Tabla_Valores_Duplicados'. **/



/*** SELECT + Tabla derivada + WHERE ***/
USE Cursos

SELECT *
FROM ( /*** Las tablas derivadas se colocan después del comando FROM ***/
	  SELECT *, 
	  ROW_NUMBER() OVER (PARTITION BY Nombre, Profesión, Empresa ORDER BY Nombre, Profesión, Empresa) AS Enumeración
	  FROM Tabla_Valores_Duplicados) AS Enumeración_duplicados /*** Una tabla derivada es una subconsulta que aparece en la cláusula FROM de una consulta principal y que 
																	actúa como una tabla temporal sobre la cual se pueden realizar consultas.
																	Son usuales cuando necesitas realizar una operación como GROUP BY en una subconsulta y 
																	luego filtrar los resultados basados en ese agregado.***/
WHERE Enumeración_duplicados.Enumeración > 1; /*** Condición que devuelve todos aquellos registros con un valor mayor a 1 dentro de la columna "Enumeración" de
												   la tabla temporal "Enumeración_duplicados". Es decir, nos devuelve los registros duplicados ***/


/*** DELETE + Tabla derivada + WHERE ***/
USE Cursos

DELETE Enumeración_duplicados /*** Cambiamos SELECT * por DELETE y especificamos que los registros se eliminarán con base en el resultado devuelto por la tabla derivada ("Enumeración_duplicados") ***/
FROM ( /*** Las tablas derivadas se colocan después del comando FROM ***/
	  SELECT *, 
	  ROW_NUMBER() OVER (PARTITION BY Nombre, Profesión, Empresa ORDER BY Nombre, Profesión, Empresa) AS Enumeración
	  FROM Tabla_Valores_Duplicados) AS Enumeración_duplicados /*** Una tabla derivada es una subconsulta que aparece en la cláusula FROM de una consulta principal y que 
																	actúa como una tabla temporal sobre la cual se pueden realizar consultas.
																	Son usuales cuando necesitas realizar una operación como GROUP BY en una subconsulta y 
																	luego filtrar los resultados basados en ese agregado.***/
WHERE Enumeración_duplicados.Enumeración > 1; /*** Condición que devuelve todos aquellos registros con un valor mayor a 1 dentro de la columna "Enumeración" de
												   la tabla temporal "Enumeración_duplicados". Es decir, nos devuelve los registros duplicados ***/
/*** Aunque la sentencia se aplica, con base en los resultados de una tabla derivada, se aplica dicha acción a los registros de la tabla real ("Tabla_Valores_Duplicados) ***/

/*** Visualizamos los resultados ***/
USE Cursos

SELECT *
FROM Tabla_Valores_Duplicados;


USE Cursos

SELECT *, COUNT(*)
	OVER (PARTITION BY Nombre, Profesión, Empresa ORDER BY Nombre, Profesión, Empresa) AS Conteo
FROM Tabla_Valores_Duplicados;

																	


