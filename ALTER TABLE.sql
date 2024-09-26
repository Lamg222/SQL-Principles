
/*** ALTER TABLE ***/

/*** DELETE FROM ***/
/*** Eliminamos los registros que cumplan cierta condición ***/

/*** Tabla original ***/
USE Cursos

SELECT *
FROM Utiles_Escolares; /*** Contiene 7 registros ***/

/*** Modificamos (eliminamos) registros dada una condición ***/
USE Cursos

DELETE FROM Utiles_Escolares /*** Comando para eliminar registros ***/
	WHERE Prod_Num IS NULL; /*** La condición especificada, indica que se eliminarán los registros que contengan valores NULL en la columna "Prod_Num" ***/

/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares; /*** Ahora sólo tenemos 6 registros ***/


/*** DELET FROM ***/
USE Cursos

DELETE FROM Utiles_Escolares
	WHERE Prod_Num = 123; /*** Otra opción es WHERE Costo IS NULL, pero también podemos seleccionar un valor específico con el signo "=" ***/

/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares; /*** Ahora sólo tenemos 5 registros ***/


/*** ALTER TABLE + ALTER COLUMN + NOT NULL ***/
USE Cursos

ALTER TABLE Utiles_Escolares /*** Con el comando ALTER TABLE permitimos modificar la tabla de interés (Utiles_Escolares) ***/
ALTER COLUMN Prod_Num INT NOT NULL; /*** Después de especificar la tabla a modificar, agregamos el comando ALTER COLUMN y especificamos la variable/columna de interés.
										 En este caso, volvemos a asignar el tipo de variable (ya se había especificado en la creación de la tabla) y agregamos la nueva cualidad que será
										 NOT NULL (NO CONFUNDIR CON IS NOT NULL, EN ESTE CASO SÓLO ES NOT NULL) ***/

/*** ALTER TABLE + PRIMARY KEY ***/
/*** Una vez que NO tengamos valores repetidos NI valores NULL sobre nuestra columna de clave primaria (PK), podemos asignarle esa cualidad a la columna ***/
/*** NOTA: si hay valores repetidos o la columna no tiene explícitamente especificado NOT NULL, entonces dará error al momento de querer convertirla en clave primaria (PK) ***/
USE Cursos

ALTER TABLE Utiles_Escolares /*** Con el comando ALTER TABLE permitimos modificar la tabla de interés (Utiles_Escolares) ***/
ADD PRIMARY KEY (Prod_Num); /*** Después de especificar el nombre de la tabla, agregamos (ADD) el comando de interès (PRIMARY KEY) y especificamos la columna entre paréntesis () ***/


/*** ALTER TABLE múltiple ***/
USE Cursos

ALTER TABLE Utiles_Escolares
ALTER COLUMN Prod_Name VARCHAR(50) NOT NULL;
ALTER TABLE Utiles_Escolares
ALTER COLUMN Proveedor VARCHAR(100) NOT NULL;
ALTER TABLE Utiles_Escolares
ALTER COLUMN Costo DECIMAL(6, 2) NOT NULL;



/*** ALTER TABLE + ADD ***/
/*** Para agregar una columna nueva ***/
USE Cursos

ALTER TABLE Utiles_Escolares
ADD Precio_Venta DECIMAL(6, 2); /*** Agregamos una nueva columna con el comando ADD y especificamos el tipo de variable ***/
/*** NOTA: no podemos agregar la característica NOT NULL, dado a que existen registros en esta tabla y al crear esta nueva columna contendrá valores NULL.
		   Por lo tanto, debemos incorporar primero los valores de esta tabla y después volver a utilizar el comando ALTER TABLE para especificar la característica NOT NULL ***/

/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares;


/*** ALTER TABLE + DEFAULT + NOT NULL ***/
/*** Para agregar valores por defecto y que la nueva columna permita el comando NOT NULL ***/
USE Cursos

ALTER TABLE Utiles_Escolares
ADD Consumidores VARCHAR(50) DEFAULT ('Desconocido') NOT NULL;

/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares;



/*** ALTER TABLE + ALTER COLUMN ***/
USE Cursos

ALTER TABLE Utiles_Escolares
ALTER COLUMN Precio_Venta INT; /*** Cambiamos el tipo de variable (de DECIMAL(6, 2) a INT) ***/


/*** ALTER TABLE + DROP COLUMN ***/
USE Cursos

ALTER TABLE Utiles_Escolares
DROP COLUMN Precio_Venta; /*** Eliminamos esta columna ***/

/*** ALTER TABLE + DROP COLUMN ***/
/*** Para este caso, obtenemos un error que indica una restricción "DF__Utiles_Es__Consu__4D94879B" ***/

/*** Si no conocemos el nombre de la restricción, porque no aparece en pantalla, podemos encontrar el nombre de la siguiente manera (para poder eliminar la restricción necesitamos el nombre) ***/
SELECT OBJECT_NAME(OBJECT_ID) AS ConstraintName
FROM sys.default_constraints
WHERE parent_object_id = OBJECT_ID('Utiles_Escolares')
  AND parent_column_id = (
      SELECT column_id 
      FROM sys.columns 
      WHERE name = 'Consumidores' 
        AND object_id = OBJECT_ID('Utiles_Escolares')
  );

/*** Eliminamos primero la restricción ***/
ALTER TABLE Utiles_Escolares /*** Tabla de interés (la misma que contiene la columna a eliminar ***/
DROP CONSTRAINT DF__Utiles_Es__Consu__4D94879B; /*** Nombre de la restricción ***/


/*** Ahora eliminamos la columna que daba problema por la restricción ***/
USE Cursos

ALTER TABLE Utiles_Escolares
DROP COLUMN Consumidores;

/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares;


/*** ALTER TABLE + ADD + CHECK ***/
/*** Buscamos asignar un rango de valores posibles para una variable/columna nueva ***/
USE Cursos

ALTER TABLE Utiles_Escolares /*** Tabla de interés ***/
ADD Precio_Compra INT /*** Creación de la nueva columna ***/
CHECK (Precio_Compra > 0 AND Precio_Compra < 9999999); /*** Rango permitido de los valores enteros (INT) que contendrá la nueva columna ***/

/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares;

/*** Intentamos agregar un valor fuera del rango permitido ***/
USE Cursos

INSERT INTO Utiles_Escolares (Prod_Num, Prod_Name, Proveedor, Costo, Precio_Compra)
						VALUES (150, 'Tijeras', 'Acero e insumos', 10.5, -10);
/*** Esto devuelve "The INSERT statement conflicted with the CHECK constraint "CK__Utiles_Es__Preci__4F7CD00D". The conflict occurred in database "Cursos", table "dbo.Utiles_Escolares", column 'Precio_Compra'",
	lo que significa que no permite valores fuera del rango especificado (en este caso, menores a 0), pero también ocurriría el mismo error si fueran superiores a 9999999 ***/

/*** Ejemplo con valor superior al rango ***/
USE Cursos

INSERT INTO Utiles_Escolares (Prod_Num, Prod_Name, Proveedor, Costo, Precio_Compra)
						VALUES (150, 'Tijeras', 'Acero e insumos', 10.5, 10000000);
/*** Devuelve "he INSERT statement conflicted with the CHECK constraint "CK__Utiles_Es__Preci__4F7CD00D". The conflict occurred in database "Cursos", table "dbo.Utiles_Escolares", column 'Precio_Compra'.",
	 lo que indica que hay un conflicto porque supera el rango permitido para esta variable/columna ***/

/***Ejemplo con valor dentro del rango permitido ***/
USE Cursos

INSERT INTO Utiles_Escolares (Prod_Num, Prod_Name, Proveedor, Costo, Precio_Compra)
						VALUES (150, 'Tijeras', 'Acero e insumos', 10.5, 11);

/*** Visualizamos el resultado ***/
USE Cursos

SELECT *
FROM Utiles_Escolares;
