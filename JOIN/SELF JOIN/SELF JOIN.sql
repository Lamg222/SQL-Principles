
/*** Self Join ***/
/*** Este tipo de unión, se realiza sobre la misma tabla.
Este tipo consultas son útiles, cuando queremos obtener filtros avanzados ***/

/*** Tabla ***/
USE Cursos;

SELECT *
FROM Empleados

/*** Unión ***/
USE Cursos;

SELECT *
FROM Empleados AS EMP /*** Designamos un alias para la tabla ***/
INNER JOIN Empleados AS SUP /*** Designamos otro alias para la MISMA tabla 
En este caso, la unión prioriza el primer alias ***/
	ON EMP.Supervisor = SUP.Nombre
ORDER BY EMP.Nombre;
/*** Esto devuelve, sólo los registros (empleados) que tienen un supervisor ***/
/*** Esto es útil, dado a que se puede incorporar información relevante a una nueva tabla.
En este caso, podemos encontrar la información de los supervisores, para agregarla al registro de los empleado. Lo anterior, con el fin de incorporar atributos o información a los registros, de manera más fácil.
Para este ejemplo, ahora los empleados cuentan con el número, dirección, ciudad, teléfono y jefe inmediato (Supervisor del supervisor) de sus supervisores ***/


/*** Seleccionando atributos de interés ***/
USE Cursos;

SELECT EMP.Nombre AS NOMBRE_EMPLEADO, 
	   SUP.Nombre AS NOMBRE_SUPERVISOR,
	   SUP.Telefono AS TELÉFONO_SUPERVISOR
FROM Empleados AS EMP /*** Designamos un alias para la tabla ***/
INNER JOIN Empleados AS SUP /*** Designamos otro alias para la MISMA tabla 
En este caso, la unión prioriza el primer alias ***/
	ON EMP.Supervisor = SUP.Nombre
ORDER BY EMP.Nombre;
/*** Esto devuelve, sólo los registros (empleados) que tienen un supervisor ***/