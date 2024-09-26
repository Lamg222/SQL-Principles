
/*** INSERT ***/

/*** CREATE TABLE ***/
/*** Manera sub�ptima ***/
USE Cursos

CREATE TABLE Utiles_Escolares ( /*** Creamos una Tabla nueva, llamada "Utiles_Escolares", 
								seguida de par�ntesis que almacenar�n los nombres y tipos de variables contenidas en esta nueva tabla ***/
		Prod_Num INT, /*** Primera columna/variable/atributo de tipo entero ***/
		Prod_Name VARCHAR(50), /*** Segunda columna de tipo cadena de texto con un m�ximo de 50 caracteres ***/
		Proveedor VARCHAR(100), /*** Tercera columna de tipo cadena de textoo con un m�ximoo de 100 caracteres ***/
		Costo DECIMAL(6, 2) /*** �ltima columna de tipo decimal, con 6 d�gitos antes del punto y 2 d�gitos despu�s del punto ***/
	)

/*** INSERT INTO ***/
USE Cursos

INSERT INTO Utiles_Escolares ( /*** Especificamos la tabla a la que agregaremos la informaci�n ***/
		Prod_Num, Prod_Name, Proveedor, Costo) /*** Declaramos las variables/columnas/atributos de la tabla en el orden de los datos a agregar ***/
		VALUES (126, 'L�piz 2B', 'Papeler�a San Felipe', 3.5) /*** Agregamos los valores de cada una de las columnas con el comando VALUES ***/


/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares;


/*** INSERT INTO ***/
USE Cursos

INSERT INTO Utiles_Escolares ( /*** Especificamos la tabla a la que agregaremos la informaci�n ***/
		Prod_Name, Prod_Num, Costo, Proveedor) /*** Declaramos las variables/columnas/atributos de la tabla en el orden de los datos a agregar (aqu� hemos cambiado el orden) ***/
		VALUES ('Cuaderno cuadriculado', 129, 22.3, 'Oficinas S.A de C.V') /*** Agregamos los valores de cada una de las columnas con el comando VALUES ***/


/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares;


/*** M�ltiples INSERT INTO ***/
USE Cursos

INSERT INTO Utiles_Escolares (
		Prod_Num, Prod_Name, Proveedor, Costo)
		VALUES (133, 'Borrador blanco', 'Papeler�a "El recreo"', 5); /*** Al tener m�ltiples comandos INSERT INTO, es necesario agregar el ";" al final de cada comando VALUES ***/
INSERT INTO Utiles_Escolares (		/*** Es necesario volver a declarar el comando completo INSERT INTO, junto con VALUES, para cada incorporaci�n de nuevo registro ***/
		Prod_Num, Prod_Name, Proveedor, Costo)
		VALUES (119, 'Papel china', 'Oficinas S.A de C.V', 0.5);
INSERT INTO Utiles_Escolares (
		Prod_Num, Prod_Name, Proveedor, Costo)
		VALUES (115, 'Folder tama�o carta', 'Papeler�a San Felipe', 1.5);


/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares;


/*** DROP TABLE ***/
/*** Comando para borrar la tabla ***/
DROP TABLE Utiles_Escolares


/*** Registros con valores NULL ***/
/*** Dado a que no hemos especificado el comando "NOT NULL" al momento de crear la tabla, los atributos/columnas de nuestra tabla, permiten valores NULL ***/
USE Cursos

INSERT INTO Utiles_Escolares (Prod_Num, Prod_Name, Proveedor) /*** En este registro no tenemos el valor de la variable "Costo" ***/
	VALUES (123, 'Marcador negro', 'Papeler�a "El recreo"');
INSERT INTO Utiles_Escolares (Prod_Name, Costo) /*** Aqu�, s�lo tenemos informaci�n para las columnas relacionadas con el el nombre del producto y su costo ***/
	VALUES ('Pluma azul', 8.5)


/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares;


/*** Manera correcta de usar CREATE TABLE ***/
USE Cursos

CREATE TABLE Utiles_Escolares_Bueno (
		Prod_Num INT PRIMARY KEY, /*** Con esto especificamos que esta columna ser� la clave primaria, la cual NO contiene atributos repetidos ***/
		Prod_Name VARCHAR(50) NOT NULL, /*** Con este comando (NOT NULL), establecemos que no puede existir valores NULL o faltantes en esta columna ***/
		Proveedor VARCHAR(100) NOT NULL,
		Costo DECIMAL(6, 2) NOT NULL
	)