
/*** CASE ***/
/*** Este comando sirve para ejecutar el c�digo, S�LO si se cumple cierta condici�n, de no encontrar ning�n registro donde se cumpla dicha condici�n, 
se ejecuta la cl�usula designada en el comando ELSE. Al momento de encontrar la condici�n descrita, ejecuta la cl�usula designada en dicha condici�n, 
si no NO ejecuta el resto/subsiguiente c�digo, es decir, ejecuta y termina el c�digo al encontrar la coincidencia ***/

USE Cursos

SELECT *, Columna_Nueva = /*** Seleccionamos todos los atributos (*) y pedimos que devuelva una columna adicional (Columna_Nueva), la cual contendr� los siguiente valores (=) ***/
	CASE	/*** Comando para las cl�usulas que se aplicar�n de acuerdo a ciertas condiciones ***/
		WHEN [time] <= 156 THEN 'R�pido'
		WHEN [time] BETWEEN 156 AND 300 THEN 'Normal' /*** BETWEEN AND son de intervalo cerrado, sin embargo, si colocamos <= o >= en la sentencia anterior, esta se ejecutar� primero y no considerar� algunos de los extremos especificados ***/
		WHEN [time] = NULL THEN 'No hay informaci�n' /*** Es necesario agregar la opci�n de datos NULL, porque si existen en los registros, estos obtendr�n el valor designado en el comando ELSE, aunque no pertenezcan a esa categor�a ***/
		ELSE 'Lento' /*** Esto se establece para TODOS los registros que no pertenecen a los grupos anteriores ***/
	END /*** Siempre debemos colocar la sentencia END ***/
	/*** NOTA: Si el atributo/columna tiene el nombre de alguna palabra designada por SQL, se debe colocar entre corchetes []
		 NOTA 2: Este c�digo se ejecuta rdenadamente, es decir, se ejecuta la primera l�nea de ��digo y hace la b�squeda de coincidencia, aquellos registros que no se cumplan, 
		 pasan a ser "candidatos" para la siguiente condici�n-sentencia, as� hasta completar todas las condiciones-sentencias establecidas ***/
FROM MaratonNY;


/*** Ejemplo, donde cambiamos el orden y cambia el resultado ***/
USE Cursos

SELECT *, Categor�a =
	CASE
		WHEN [time] BETWEEN 156 AND 300 THEN 'Normal'
		WHEN [time] <= 156 THEN 'R�pido' /*** Colocamos en la segunda l�nea de c�digo la sentencia que era la primera en el c�digo anterior. Esto cambia el resultado, dado a que se ejecuta primero el intervalo cerrado anterior ***/
		WHEN [time] IS NULL THEN 'No hay informaci�n' /*** Alternativa a = NULL ***/
		ELSE 'Lento'
	END
FROM MaratonNY;


/*** Otro ejemplo ***/
USE Cursos

SELECT Nombre, Comunicarse_por =
	CASE
		WHEN Telefono IS NOT NULL THEN CONCAT('Puede comunicarse con el alumno llamando al siguiente n�mero: ', Telefono)
		WHEN Direccion IS NOT NULL THEN CONCAT('El alumno no tiene n�mero pero su direcci�n es: ', Direccion)
		ELSE 'El alumno no cuenta con informaci�n de un n�mero telef�nico o direcci�n para ser contactado'
	END
FROM Datos_Personales_nueva;
/***NOTA: Los valores NULL son registros sin informaci�n, si la tabla tiene escrito NULL, no los considera como valores NULL, sino como texto (palabra NULL no es un valor NULL) ***/


/*** Opci�n si los datos NULL son texto que dice NULL ***/
USE Cursos

SELECT Nombre, Comunicarse_por =
	CASE
		WHEN Telefono = 'NULL' AND Direccion = 'NULL' THEN 'El alumno no cuenta con informaci�n de un n�mero telef�nico o direcci�n para ser contactado'
		WHEN Telefono = 'NULL' AND Direccion <> 'NULL' THEN CONCAT('El alumno no tiene n�mero pero su direcci�n es: ', Direccion)	/*** Esta sentencia debe ir primero que la sentencia de abajo, dado a que si no lo hacemos as�, devolver� NULL en los valores donde la columna de "Telefono" tiene el texto NULL ***/
		WHEN Telefono IS NOT NULL THEN CONCAT('Puede comunicarse con el alumno llamando al siguiente n�mero: ', Telefono) /*** Para los valores restantes que no cumplen las condiciones anteriores, se aplica esta opci�n ***/
	END
FROM Datos_Personales;

/*** Tambi�n se puede expresar as� ***/
USE Cursos

SELECT Nombre, Comunicarse_por =
	CASE
		WHEN Telefono = 'NULL' AND Direccion = 'NULL' THEN 'El alumno no cuenta con informaci�n de un n�mero telef�nico o direcci�n para ser contactado'
		WHEN Telefono = 'NULL' AND Direccion IS NOT NULL THEN CONCAT('El alumno no tiene n�mero pero su direcci�n es: ', Direccion)	/*** Esta sentencia debe ir primero que la sentencia de abajo, dado a que si no lo hacemos as�, devolver� NULL en los valores donde la columna de "Telefono" tiene el texto NULL ***/
		ELSE CONCAT('Puede comunicarse con el alumno llamando al siguiente n�mero: ', Telefono) /*** Para los valores restantes que no cumplen las condiciones anteriores, se aplica esta opci�n ***/
	END
FROM Datos_Personales;

