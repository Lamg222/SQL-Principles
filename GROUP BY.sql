
/*** Agrupación de elementos de un atributo ***/
USE Alumnos; /*** Base de datos ***/

SELECT Gender, /*** Columna/atributo de interés en nuestra consulta ***/
	MIN(Tiempo) /*** Calculamos el valor mínimo de la columna "Tiempo" ***/
	AS Tiempo_mínimo /*** Almacenamos los valores de la consulta en una "nueva columna" llamada " Tiempo_mínimo" ***/
FROM MaratonNY /*** Tabla del origen de los datos ***/
GROUP BY Gender; 
/*** Agrupamos por el atributo/columna "Gender", lo que devuelve una tabla con los resultados de consulta (MIN(Tiempo))
para cada uno de los distintos valores de la columna "Gender" ***/


/*** Agrupación de elementos de un atributo (ahora con suma) ***/
USE Alumnos;

SELECT Gender, MAX(Tiempo) AS Tiempo_máximo /*** Es importante la coma "," después de los atributos de consulta ***/
FROM MaratonNY
GROUP BY Gender;


/*** Conocer cúantos participantes hay de un elemento dentro de un atributo específico ***/
USE Alumnos;

SELECT Home, COUNT(Corredor) AS Cantidad_por_país /*** Contabilizar el número de corredores y almacenarlos en una columna llamada "Cantidad_por_país ***/
FROM MaratonNY
GROUP BY Home /*** Agruparlos por la variable "Home" ***/
ORDER BY Cantidad_por_país DESC; /*** Ordenarlos de manera descendente, con base en la columna "creada" "Cantidad_por_país" ***/


/*** Agrupación múltiple ***/
USE Alumnos;

SELECT Home, Gender, COUNT(Corredor) AS Cantidad_por_país_por_género
FROM MaratonNY
GROUP BY Home, Gender /*** ES IMPORTANTE AGREGAR EN "SELECT" Y EN "GROUP BY" LOS MISMOS ATRIBUTOS/VARIABLES QUE QUEREMOS OBTENER EN LA CONSULTA
En este caso, agregamos en ambos comandos las columnas "Home" y "Gender" ***/
ORDER BY Home, Gender; /*** Orden doble: primero ordena alfabéticamente por "Home" y, después, alfabéticamente por "Gender" ***/



/*** Agrupación y condicional ***/
USE Alumnos;

SELECT Home, Gender, MIN(Tiempo) AS Tiempo_mínimo_México_género
FROM MaratonNY
WHERE Home = 'MEX' /*** Seleccionamos sólo los registros que vienen de México (Home = 'MEX') ***/
GROUP BY Home, Gender /*** Agrupamos por el país y el género ***/
ORDER BY Tiempo_mínimo_México_género; /*** Ordenamos con base en la "nueva columna" "Tiempo_mínimo_México_género" ***/


/*** Agrupación con condicional múltiple sobre el mismo atributo ***/
USE Alumnos;

SELECT Home, Gender, ROUND(MIN(Tiempo), 2) AS Tiempo_mín_Perú_Méx_género
FROM MaratonNY
WHERE Home IN ('PER', 'MEX') /*** Donde se cumplan estas condiciones sobre la misma columna ***/
GROUP BY Home, Gender;


/*** Agrupación y múltiples operaciones ***/
USE Alumnos;

SELECT Home, ROUND(MIN(Tiempo), 2) AS Tiempo_Mín, 
			 ROUND(MAX(Tiempo), 2) AS Tiempo_Máx,
			 ROUND(AVG(Tiempo), 2) AS Tiempo_Prom,
			 ROUND(COUNT(Corredor), 2) AS Núm_Corredores /*** NOTA: NO SE PONE LA ÚLTIMA COMA "," ANTES DEL OPERADOR FROM ***/
FROM MaratonNY
GROUP BY Home
ORDER BY Tiempo_Mín; /*** El comando GROUP BY es el último, dado a que queremos que sea lo último que se ejecute, después de todas las operaciones y comandos ***/