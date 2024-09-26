
/*** Eliminar datos duplicados ***/

/*** Creamos tabla con valores duplicados ***/
/*** CREATE TABLE ***/
USE Cursos

CREATE TABLE Tabla_Valores_Duplicados (
		Nombre VARCHAR(50),
		Profesi�n VARCHAR(40),
		Empresa VARCHAR(50)
	);

/*** INSERT INTO ***/
INSERT INTO Tabla_Valores_Duplicados /*** Podemos no especificar las columnas, siempre que los valores (VALUES) vayan en orden con el de las columnas de la tabla ***/
	VALUES ('Luis M�ndez', 'Dentista', 'Instituci�n gubernamental'),
		   ('Patricia Gasca', 'Abogada', 'Despacho de Abogados Toluca S.A de C.V'),
		   ('Alejandra Alonso', 'Administradora', 'Ping Solutions'),
		   ('Sergio M�ndez', 'Chef', 'Jacob�s Bar'),
		   ('Daniela M�ndez', 'M�dico', 'ABC Santa Fe'),
		   ('Luis M�ndez', 'Dentista', 'Instituci�n gubernamental'),
		   ('Alejandra Alonso', 'Administradora', 'Ping Solutions'),
		   ('Luis Alberto M.G', 'Econom�sta & Data Scientist', 'Consultores S.A de C.V')

/*** Visualizamos la tabla creada ***/
USE Cursos

SELECT *
FROM Tabla_Valores_Duplicados;



/*** SELECT + COUNT() + OVER + PARTITION BY ***/
/*** Contamos los registros de la tabla ***/
USE Cursos  /*** Establece la base de datos en la que se va a trabajar, en este caso, la base de datos llamada 'Cursos'. **/

SELECT *,  /*** Selecciona todas las columnas de la tabla 'Tabla_Valores_Duplicados'. El asterisco (*) significa que se seleccionan todas las columnas. **/

    COUNT(*)  /*** Utiliza la funci�n COUNT para contar el n�mero de filas que cumplen con las particiones definidas (PARTITION BY) en la siguiente l�nea de c�digo. En este caso, cuenta todas las filas dentro de cada grupo definido por la partici�n. **/

    OVER (PARTITION BY Nombre, Profesi�n, Empresa) AS Conteo  /*** 'OVER (PARTITION BY ...)' divide las filas en grupos, en este caso, basado en las columnas 'Nombre', 'Profesi�n' y 'Empresa'. 
    La funci�n COUNT() se aplica a cada grupo individualmente, es decir, cuenta cu�ntas filas hay en cada grupo que tiene el mismo valor de 'Nombre', 'Profesi�n' y 'Empresa'. 
    El resultado se almacena en una columna temporal llamada 'Conteo'. **/

FROM Tabla_Valores_Duplicados;  /*** Indica la tabla de donde se seleccionan los datos, en este caso, 'Tabla_Valores_Duplicados'. **/


/*** SELECT + ROW_NUMBER() + OVER + PARTITION BY + ORDER BY ***/
/*** Para enumerar los registros, en vez de contarlos. Es decir, para el primer valor tomar� 1 y si hay duplicados tomar� valores subsecuentes del 2 hasta el total de veces que aparezca un mismo valor ***/
USE Cursos  /*** Establece la base de datos 'Cursos' en la que se va a ejecutar la consulta. **/

SELECT *,  /*** Selecciona todas las columnas de la tabla 'Tabla_Valores_Duplicados'. El asterisco (*) indica que se seleccionan todas las columnas. **/

    ROW_NUMBER()  /*** Utiliza la funci�n ROW_NUMBER para asignar un n�mero secuencial �nico a cada fila dentro de la partici�n (grupo) definido en la cl�usula 'PARTITION BY'. **/

    OVER (PARTITION BY Nombre, Profesi�n, Empresa  /*** 'PARTITION BY' agrupa las filas bas�ndose en las columnas 'Nombre', 'Profesi�n' y 'Empresa'. La funci�n ROW_NUMBER() se reinicia para cada nuevo grupo. **/

          ORDER BY Nombre)  /*** 'ORDER BY Nombre' especifica que dentro de cada partici�n, las filas se enumerar�n secuencialmente bas�ndose en el orden alfab�tico de la columna 'Nombre'. Esto establece c�mo se asignan los n�meros de fila y es necesario para la enumeraci�n. **/

    AS Enumeraci�n  /*** Asigna el alias 'Enumeraci�n' a la columna que contiene los n�meros generados por la funci�n ROW_NUMBER(), mostrando el n�mero de fila en cada partici�n. **/

FROM Tabla_Valores_Duplicados;  /*** Especifica que los datos provienen de la tabla 'Tabla_Valores_Duplicados'. **/



/*** SELECT + Tabla derivada + WHERE ***/
USE Cursos

SELECT *
FROM ( /*** Las tablas derivadas se colocan despu�s del comando FROM ***/
	  SELECT *, 
	  ROW_NUMBER() OVER (PARTITION BY Nombre, Profesi�n, Empresa ORDER BY Nombre, Profesi�n, Empresa) AS Enumeraci�n
	  FROM Tabla_Valores_Duplicados) AS Enumeraci�n_duplicados /*** Una tabla derivada es una subconsulta que aparece en la cl�usula FROM de una consulta principal y que 
																	act�a como una tabla temporal sobre la cual se pueden realizar consultas.
																	Son usuales cuando necesitas realizar una operaci�n como GROUP BY en una subconsulta y 
																	luego filtrar los resultados basados en ese agregado.***/
WHERE Enumeraci�n_duplicados.Enumeraci�n > 1; /*** Condici�n que devuelve todos aquellos registros con un valor mayor a 1 dentro de la columna "Enumeraci�n" de
												   la tabla temporal "Enumeraci�n_duplicados". Es decir, nos devuelve los registros duplicados ***/


/*** DELETE + Tabla derivada + WHERE ***/
USE Cursos

DELETE Enumeraci�n_duplicados /*** Cambiamos SELECT * por DELETE y especificamos que los registros se eliminar�n con base en el resultado devuelto por la tabla derivada ("Enumeraci�n_duplicados") ***/
FROM ( /*** Las tablas derivadas se colocan despu�s del comando FROM ***/
	  SELECT *, 
	  ROW_NUMBER() OVER (PARTITION BY Nombre, Profesi�n, Empresa ORDER BY Nombre, Profesi�n, Empresa) AS Enumeraci�n
	  FROM Tabla_Valores_Duplicados) AS Enumeraci�n_duplicados /*** Una tabla derivada es una subconsulta que aparece en la cl�usula FROM de una consulta principal y que 
																	act�a como una tabla temporal sobre la cual se pueden realizar consultas.
																	Son usuales cuando necesitas realizar una operaci�n como GROUP BY en una subconsulta y 
																	luego filtrar los resultados basados en ese agregado.***/
WHERE Enumeraci�n_duplicados.Enumeraci�n > 1; /*** Condici�n que devuelve todos aquellos registros con un valor mayor a 1 dentro de la columna "Enumeraci�n" de
												   la tabla temporal "Enumeraci�n_duplicados". Es decir, nos devuelve los registros duplicados ***/
/*** Aunque la sentencia se aplica, con base en los resultados de una tabla derivada, se aplica dicha acci�n a los registros de la tabla real ("Tabla_Valores_Duplicados) ***/

/*** Visualizamos los resultados ***/
USE Cursos

SELECT *
FROM Tabla_Valores_Duplicados;


USE Cursos

SELECT *, COUNT(*)
	OVER (PARTITION BY Nombre, Profesi�n, Empresa ORDER BY Nombre, Profesi�n, Empresa) AS Conteo
FROM Tabla_Valores_Duplicados;

																	


