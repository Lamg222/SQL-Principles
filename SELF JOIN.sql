
/*** Self Join ***/
/*** Este tipo de uni�n, se realiza sobre la misma tabla.
Este tipo consultas son �tiles, cuando queremos obtener filtros avanzados ***/

/*** Tabla ***/
USE Cursos;

SELECT *
FROM Empleados

/*** Uni�n ***/
USE Cursos;

SELECT *
FROM Empleados AS EMP /*** Designamos un alias para la tabla ***/
INNER JOIN Empleados AS SUP /*** Designamos otro alias para la MISMA tabla 
En este caso, la uni�n prioriza el primer alias ***/
	ON EMP.Supervisor = SUP.Nombre
ORDER BY EMP.Nombre;
/*** Esto devuelve, s�lo los registros (empleados) que tienen un supervisor ***/
/*** Esto es �til, dado a que se puede incorporar informaci�n relevante a una nueva tabla.
En este caso, podemos encontrar la informaci�n de los supervisores, para agregarla al registro de los empleado. Lo anterior, con el fin de incorporar atributos o informaci�n a los registros, de manera m�s f�cil.
Para este ejemplo, ahora los empleados cuentan con el n�mero, direcci�n, ciudad, tel�fono y jefe inmediato (Supervisor del supervisor) de sus supervisores ***/


/*** Seleccionando atributos de inter�s ***/
USE Cursos;

SELECT EMP.Nombre AS NOMBRE_EMPLEADO, 
	   SUP.Nombre AS NOMBRE_SUPERVISOR,
	   SUP.Telefono AS TEL�FONO_SUPERVISOR
FROM Empleados AS EMP /*** Designamos un alias para la tabla ***/
INNER JOIN Empleados AS SUP /*** Designamos otro alias para la MISMA tabla 
En este caso, la uni�n prioriza el primer alias ***/
	ON EMP.Supervisor = SUP.Nombre
ORDER BY EMP.Nombre;
/*** Esto devuelve, s�lo los registros (empleados) que tienen un supervisor ***/