
/*** Cursores ***/
/*** Objetos que se crean en memoria para almacenar informaci�n contenida en una tabla e irla RECORRIENDO registro por registro ***/
USE Alumnos

/*** DECLARE + CURSOR FOR ***/
/*** Declaraci�n ***/
DECLARE Nombre_del_cursor /*** Especificamos el nombre del cursor, antecedido por el comando DECLARE ***/
		CURSOR FOR /*** Palabras clave ***/
		SELECT Id_Pais, Pais, Categoria /*** Informaci�n que nos interesa que almacene temporalmente ***/
		FROM Poblacion_Mundial /*** Tabla que contiene la informaci�n ***/



/*** OPEN ***/
/*** Apertura ***/ 
OPEN Nombre_del_cursor /*** Ejecutamos el comando OPEN, para acceder al cursor que tiene la informaci�n de inter�s ***/


/*** FETCH NEXT + FROM ***/
/*** Acceso a datos ***/
FETCH NEXT FROM Nombre_del_cursor /*** Con este comando hacemos el recorrido por los registros contenidos en nuestro cursor ***/
/*** El resultado devuelve el primer registro de la tabla con las columnas/atributos seleccionadas en el comando SELECT 
Al volver a ejecutar la l�nea de c�digo, devuelve el siguiente registro y as� con cada uno de los registros de la tabla ***/


/*** CLOSE ***/
/*** Cierre del cursor ***/
CLOSE Nombre_del_cursor /*** Al terminar de visualizar los registros de inter�s, podemos cerrar el cursor. 
							 Al cerrar el cursor, no es posible visualizar la informaci�n, sin embargo, podemos volver a abrirlo,
							 desde el comando OPEN, sin la necesidad de volver a declarar su creaci�n (debido a que se almacena temporalmente en memoria ***/


/*** DEALLOCATE ***/
/*** Desalojo de la memoria (lo retiramos de la memoria) ***/
DEALLOCATE Nombre_del_cursor /*** Con este comando, liberamos la memoria que utiliza el cursor.
								  En este punto, ya no podemos volver a abrir el cursor con el comando OPEN,
								  tendr�amos que volver a declarar su creaci�n y ejecutar todo desde el principio ***/


/*** Cursor + WHILE ***/
USE Alumnos

/*** Creamos el cursor ***/
DECLARE Cursor_1
		CURSOR FOR
		SELECT Id_Pais, Pais, Categoria
		FROM Poblacion_Mundial

/*** Accedemos al cursor para realizar alguna acci�n sobre los registros ***/
OPEN Cursor_1

	FETCH NEXT FROM Cursor_1 /*** PRIMER FETCH NEXT FROM ***/
	/*** WHILE ***/
	/*** Para recorrer el cursor sobre los registros sin tener que ejecutar el comando FETCH NEXT + FROM de manera manual ***/
	/*** Esto es un ciclo (WHILE) y consta de 3 palabras: WHILE + BEGIN + END ***/
	WHILE @@FETCH_STATUS = 0 /*** Junto a la palabra clave WHILE, colocamos una "variable especial" (FETCH_STATUS) que nos ayuda a checar si nos encontramos
								  en una posici�n que nos permita movernos dentro del cursor. Esta variable especial se escribe con @@ al inicio.
								  Con esto indicamos que, mientras la variable especial @@FETCH_STATUS sea igual a cero, vas seguir ejecutando la siguiente sentencia/acci�n ***/
							 /*** NOTA: la variable especial @@FETCH_STATUS, toma su valor inicial del PRIMER FETCH NEXT FROM (antes del comando WHILE), este valor lo especificamos en el c�digo,
								  pero al momento de ejecutar el ciclo, esta variable especial puede tomar valores -1, 0 y -2. Si el valor es 0, esto indica que la variable especial se ejecuta sin problema,
								  es decir, que existe un registro antes o despu�s al registro actual, sobre el cual podemos trabajar (se trabaja sobre alg�n registro previo o posterior al actual).
								  Por otro lado, si el valor actual es -1 indica un problema de ejecuci�n o que nos encontramos en un registro (hipot�tico) posicionalmente mayor al �ltimo registro de la tabla.
								  Por �ltimo, si el valor actual de la variable especial es -2, esto significa que no se encontr� el registro que solicitamos ***/
	BEGIN /*** Palabra clave para indicar donde empieza la sentencia/acci�n a ejecutar ***/
		FETCH NEXT FROM Cursor_1 /*** Sentencia/acci�n ***/
	END /*** Palabra clave para indicar donde termina de la sentencia/acci�n ***/

SELECT @@FETCH_STATUS AS FETCH_STATUS_VISTA /*** Con esto, podemos observar el valor de la variables especial (despu�s de haber ejecutado lo anterior),
												 es decir, en este punto, ya no hay registros que no hayan sido recorridos y esto nos debe devolver un valor actual de -1 para la variable especial.
												 Con la palabra clave AS, pido que se le agregue un alias a la variable especial.
												 Cuando llegamos al valor -1, no s�lo indica que ya hemos recorrido todos los registros, sino que ya no devolver� ninguna consulta el cursor,
												 ejecutado desde el comando WHILE (el ciclo ha terminado), dado a que la condici�n para que se ejecute es que su valor (de la variable especial) sea cero "0" ***/

/*** Cerramos el cursor ***/
CLOSE Cursor_1

/*** Retiramos de la memoria el cursor ***/
DEALLOCATE Cursor_1



/*** Cursor + SCROLL + FETCH FIRST ***/
USE Alumnos

DECLARE Cursor_2
		CURSOR SCROLL FOR /*** Con este comando a�adido al cursor, podemos especificar el inicio del recorrido ***/
						  /*** Esto se complementa con el comando FETCH FIRST FROM, establecido despu�s del comando de acceso al cursor (OPEN) ***/
		SELECT Id_Pais, Pais, Categoria
		FROM Poblacion_Mundial

/*** Accedemos al cursor para realizar alguna acci�n sobre los registros ***/
OPEN Cursor_2
	
	FETCH FIRST FROM Cursor_2 /*** Inicio del cursor (en este caso empezamos en el PRIMER REGISTRO) ***/

	WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM Cursor_2
	END

/*** Cerramos el cursor ***/
CLOSE Cursor_2

/*** Retiramos de la memoria el cursor ***/
DEALLOCATE Cursor_2



/*** Cursor + SCROLL + FETCH LAST + FETCH PRIOR ***/
USE Alumnos

DECLARE Cursor_3
		CURSOR SCROLL FOR /*** Con este comando a�adido al cursor, podemos especificar el inicio del recorrido ***/
						  /*** Esto se complementa con el comando FETCH FIRST FROM, establecido despu�s del comando de acceso al cursor (OPEN) ***/
		SELECT Id_Pais, Pais, Categoria
		FROM Poblacion_Mundial

/*** Accedemos al cursor para realizar alguna acci�n sobre los registros ***/
OPEN Cursor_3
	
	FETCH LAST FROM Cursor_3 /*** Inicio del cursor (en este caso empieza en el �LTIMO REGISTRO) ***/

	WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH PRIOR FROM Cursor_3 /*** Debido a que iniciamos en el �ltimo registro, cambiamos el FETCH NEXT por FETCH PRIOR,
									   el cual recorre el cursor hacia atr�s, es decir, retrocede sobre el registro actual (posicionalmente) ***/
	END

/*** Cerramos el cursor ***/
CLOSE Cursor_3

/*** Retiramos de la memoria el cursor ***/
DEALLOCATE Cursor_3



/*** Cursor + SCROLL + FETCH ABSOLUTE + FETCH RELATIVE ***/
USE Alumnos

DECLARE Cursor_4
		CURSOR SCROLL FOR /*** Con este comando a�adido al cursor, podemos especificar el inicio del recorrido ***/
						  /*** Esto se complementa con el comando FETCH FIRST FROM, establecido despu�s del comando de acceso al cursor (OPEN) ***/
		SELECT Id_Pais, Pais, Categoria
		FROM Poblacion_Mundial

/*** Accedemos al cursor para realizar alguna acci�n sobre los registros ***/
OPEN Cursor_4
	
	FETCH ABSOLUTE 5 FROM Cursor_4 /*** Inicio del cursor (en este caso empezamos en el registro 5) ***/

	WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH RELATIVE 10 FROM Cursor_4 /*** Con el comando FETCH RELATIVE, indicamos que el desplazamiento sobre los registros ser� determinado por el n�mero que especifiquemos, posteriormente a este comando.
											 En este caso, se desplazar� de 10 en 10 registros ***/
	END

/*** Cerramos el cursor ***/
CLOSE Cursor_4

/*** Retiramos de la memoria el cursor ***/
DEALLOCATE Cursor_4



/*** Cursor + SCROLL + FETCH ABSOLUTE + FETCH RELATIVE (Otro ejemplo con los mismos comandos) ***/
USE Alumnos

DECLARE Cursor_5
		CURSOR SCROLL FOR /*** Con este comando a�adido al cursor, podemos especificar el inicio del recorrido ***/
						  /*** Esto se complementa con el comando FETCH FIRST FROM, establecido despu�s del comando de acceso al cursor (OPEN) ***/
		SELECT Id_Pais, Pais, Categoria
		FROM Poblacion_Mundial

/*** Accedemos al cursor para realizar alguna acci�n sobre los registros ***/
OPEN Cursor_5
	
	FETCH ABSOLUTE 220 FROM Cursor_5 /*** Inicio del cursor (en este caso empezamos en el registro 220) ***/

	WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH RELATIVE -5 FROM Cursor_5 /*** Con el comando FETCH RELATIVE, indicamos que el desplazamiento sobre los registros ser� determinado por el n�mero que especifiquemos, posteriormente a este comando.
											 En este caso, al ser un n�mero negativo, significa que se desplazar� cada -5 registros, a partir del registro inicial especificado en FETCH ABSOLUTE ***/
	END

/*** Cerramos el cursor ***/
CLOSE Cursor_5

/*** Retiramos de la memoria el cursor ***/
DEALLOCATE Cursor_5