
/*** COUNT + GROUP BY ***/

USE Cursos;

SELECT Actividad, COUNT(Actividad) AS Cantidad
FROM Actividades_Extra
GROUP BY Actividad;