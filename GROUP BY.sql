
/*** Agrupaci�n de elementos de un atributo ***/
USE Alumnos; /*** Base de datos ***/

SELECT Gender, /*** Columna/atributo de inter�s en nuestra consulta ***/
	MIN(Tiempo) /*** Calculamos el valor m�nimo de la columna "Tiempo" ***/
	AS Tiempo_m�nimo /*** Almacenamos los valores de la consulta en una "nueva columna" llamada " Tiempo_m�nimo" ***/
FROM MaratonNY /*** Tabla del origen de los datos ***/
GROUP BY Gender; 
/*** Agrupamos por el atributo/columna "Gender", lo que devuelve una tabla con los resultados de consulta (MIN(Tiempo))
para cada uno de los distintos valores de la columna "Gender" ***/


/*** Agrupaci�n de elementos de un atributo (ahora con suma) ***/
USE Alumnos;

SELECT Gender, MAX(Tiempo) AS Tiempo_m�ximo /*** Es importante la coma "," despu�s de los atributos de consulta ***/
FROM MaratonNY
GROUP BY Gender;


/*** Conocer c�antos participantes hay de un elemento dentro de un atributo espec�fico ***/
USE Alumnos;

SELECT Home, COUNT(Corredor) AS Cantidad_por_pa�s /*** Contabilizar el n�mero de corredores y almacenarlos en una columna llamada "Cantidad_por_pa�s ***/
FROM MaratonNY
GROUP BY Home /*** Agruparlos por la variable "Home" ***/
ORDER BY Cantidad_por_pa�s DESC; /*** Ordenarlos de manera descendente, con base en la columna "creada" "Cantidad_por_pa�s" ***/


/*** Agrupaci�n m�ltiple ***/
USE Alumnos;

SELECT Home, Gender, COUNT(Corredor) AS Cantidad_por_pa�s_por_g�nero
FROM MaratonNY
GROUP BY Home, Gender /*** ES IMPORTANTE AGREGAR EN "SELECT" Y EN "GROUP BY" LOS MISMOS ATRIBUTOS/VARIABLES QUE QUEREMOS OBTENER EN LA CONSULTA
En este caso, agregamos en ambos comandos las columnas "Home" y "Gender" ***/
ORDER BY Home, Gender; /*** Orden doble: primero ordena alfab�ticamente por "Home" y, despu�s, alfab�ticamente por "Gender" ***/



/*** Agrupaci�n y condicional ***/
USE Alumnos;

SELECT Home, Gender, MIN(Tiempo) AS Tiempo_m�nimo_M�xico_g�nero
FROM MaratonNY
WHERE Home = 'MEX' /*** Seleccionamos s�lo los registros que vienen de M�xico (Home = 'MEX') ***/
GROUP BY Home, Gender /*** Agrupamos por el pa�s y el g�nero ***/
ORDER BY Tiempo_m�nimo_M�xico_g�nero; /*** Ordenamos con base en la "nueva columna" "Tiempo_m�nimo_M�xico_g�nero" ***/


/*** Agrupaci�n con condicional m�ltiple sobre el mismo atributo ***/
USE Alumnos;

SELECT Home, Gender, ROUND(MIN(Tiempo), 2) AS Tiempo_m�n_Per�_M�x_g�nero
FROM MaratonNY
WHERE Home IN ('PER', 'MEX') /*** Donde se cumplan estas condiciones sobre la misma columna ***/
GROUP BY Home, Gender;


/*** Agrupaci�n y m�ltiples operaciones ***/
USE Alumnos;

SELECT Home, ROUND(MIN(Tiempo), 2) AS Tiempo_M�n, 
			 ROUND(MAX(Tiempo), 2) AS Tiempo_M�x,
			 ROUND(AVG(Tiempo), 2) AS Tiempo_Prom,
			 ROUND(COUNT(Corredor), 2) AS N�m_Corredores /*** NOTA: NO SE PONE LA �LTIMA COMA "," ANTES DEL OPERADOR FROM ***/
FROM MaratonNY
GROUP BY Home
ORDER BY Tiempo_M�n; /*** El comando GROUP BY es el �ltimo, dado a que queremos que sea lo �ltimo que se ejecute, despu�s de todas las operaciones y comandos ***/