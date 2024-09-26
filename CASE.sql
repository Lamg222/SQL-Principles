
/*** CASE ***/
/*** Este comando sirve para ejecutar el código, SÓLO si se cumple cierta condición, de no encontrar ningún registro donde se cumpla dicha condición, 
se ejecuta la cláusula designada en el comando ELSE. Al momento de encontrar la condición descrita, ejecuta la cláusula designada en dicha condición, 
si no NO ejecuta el resto/subsiguiente código, es decir, ejecuta y termina el código al encontrar la coincidencia ***/

USE Cursos

SELECT *, Columna_Nueva = /*** Seleccionamos todos los atributos (*) y pedimos que devuelva una columna adicional (Columna_Nueva), la cual contendrá los siguiente valores (=) ***/
	CASE	/*** Comando para las cláusulas que se aplicarán de acuerdo a ciertas condiciones ***/
		WHEN [time] <= 156 THEN 'Rápido'
		WHEN [time] BETWEEN 156 AND 300 THEN 'Normal' /*** BETWEEN AND son de intervalo cerrado, sin embargo, si colocamos <= o >= en la sentencia anterior, esta se ejecutará primero y no considerará algunos de los extremos especificados ***/
		WHEN [time] = NULL THEN 'No hay información' /*** Es necesario agregar la opción de datos NULL, porque si existen en los registros, estos obtendrán el valor designado en el comando ELSE, aunque no pertenezcan a esa categoría ***/
		ELSE 'Lento' /*** Esto se establece para TODOS los registros que no pertenecen a los grupos anteriores ***/
	END /*** Siempre debemos colocar la sentencia END ***/
	/*** NOTA: Si el atributo/columna tiene el nombre de alguna palabra designada por SQL, se debe colocar entre corchetes []
		 NOTA 2: Este código se ejecuta rdenadamente, es decir, se ejecuta la primera línea de çódigo y hace la búsqueda de coincidencia, aquellos registros que no se cumplan, 
		 pasan a ser "candidatos" para la siguiente condición-sentencia, así hasta completar todas las condiciones-sentencias establecidas ***/
FROM MaratonNY;


/*** Ejemplo, donde cambiamos el orden y cambia el resultado ***/
USE Cursos

SELECT *, Categoría =
	CASE
		WHEN [time] BETWEEN 156 AND 300 THEN 'Normal'
		WHEN [time] <= 156 THEN 'Rápido' /*** Colocamos en la segunda línea de código la sentencia que era la primera en el código anterior. Esto cambia el resultado, dado a que se ejecuta primero el intervalo cerrado anterior ***/
		WHEN [time] IS NULL THEN 'No hay información' /*** Alternativa a = NULL ***/
		ELSE 'Lento'
	END
FROM MaratonNY;


/*** Otro ejemplo ***/
USE Cursos

SELECT Nombre, Comunicarse_por =
	CASE
		WHEN Telefono IS NOT NULL THEN CONCAT('Puede comunicarse con el alumno llamando al siguiente número: ', Telefono)
		WHEN Direccion IS NOT NULL THEN CONCAT('El alumno no tiene número pero su dirección es: ', Direccion)
		ELSE 'El alumno no cuenta con información de un número telefónico o dirección para ser contactado'
	END
FROM Datos_Personales_nueva;
/***NOTA: Los valores NULL son registros sin información, si la tabla tiene escrito NULL, no los considera como valores NULL, sino como texto (palabra NULL no es un valor NULL) ***/


/*** Opción si los datos NULL son texto que dice NULL ***/
USE Cursos

SELECT Nombre, Comunicarse_por =
	CASE
		WHEN Telefono = 'NULL' AND Direccion = 'NULL' THEN 'El alumno no cuenta con información de un número telefónico o dirección para ser contactado'
		WHEN Telefono = 'NULL' AND Direccion <> 'NULL' THEN CONCAT('El alumno no tiene número pero su dirección es: ', Direccion)	/*** Esta sentencia debe ir primero que la sentencia de abajo, dado a que si no lo hacemos así, devolverá NULL en los valores donde la columna de "Telefono" tiene el texto NULL ***/
		WHEN Telefono IS NOT NULL THEN CONCAT('Puede comunicarse con el alumno llamando al siguiente número: ', Telefono) /*** Para los valores restantes que no cumplen las condiciones anteriores, se aplica esta opción ***/
	END
FROM Datos_Personales;

/*** También se puede expresar así ***/
USE Cursos

SELECT Nombre, Comunicarse_por =
	CASE
		WHEN Telefono = 'NULL' AND Direccion = 'NULL' THEN 'El alumno no cuenta con información de un número telefónico o dirección para ser contactado'
		WHEN Telefono = 'NULL' AND Direccion IS NOT NULL THEN CONCAT('El alumno no tiene número pero su dirección es: ', Direccion)	/*** Esta sentencia debe ir primero que la sentencia de abajo, dado a que si no lo hacemos así, devolverá NULL en los valores donde la columna de "Telefono" tiene el texto NULL ***/
		ELSE CONCAT('Puede comunicarse con el alumno llamando al siguiente número: ', Telefono) /*** Para los valores restantes que no cumplen las condiciones anteriores, se aplica esta opción ***/
	END
FROM Datos_Personales;

