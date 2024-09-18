
/*** Operadores de comparación ***/

/*** BETWEEN ***/
USE Alumnos;

SELECT Gender,
	   Age,
	   Tiempo
FROM MaratonNY
WHERE Tiempo BETWEEN 100 AND 200; /*** Valores entre estos intervalos. Se incluyen los valores extremos, es decir, es un intervalo cerrado ***/


/*** LIKE ***/
USE Alumnos;

SELECT Gender,
       Home,
	   Age,
	   Tiempo
FROM MaratonNY
WHERE Home LIKE 'M%'; /*** Operador que busca similitudes. En este caso, todos los registros donde Home empiece con M ***/


USE Alumnos;

SELECT Gender,
       Home,
	   Age,
	   Tiempo
FROM MaratonNY
WHERE Home LIKE '%M'; /*** Operador que busca similitudes. En este caso, todos los registros donde Home termine con M ***/


/*** Menor igual (<=) ***/
USE Alumnos;

SELECT Gender, /*** Subconsulta escalonada: Un operador de comparación (<=) dada una operación de cálculo (AVG) CON UN ÚNICO VALOR ***/
	   Age,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deberíamos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo <= /*** Operador de comparación <=, el cual nos devolverá aquellos registros con un valor en "Tiempo", menor o igual al promedio de este atributo ***/
		(SELECT AVG(Tiempo) 
		 FROM MaratonNY);


/*** Mayor que (>) ***/
/*** Complemento al operador <= ***/
USE Alumnos;

SELECT Gender, /*** Subconsulta escalonada: Un operador de comparación (>) dada una operación de cálculo (AVG) CON UN ÚNICO VALOR ***/
	   Age,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deberíamos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo > /*** Operador de comparación >, el cual nos devolverá aquellos registros con un valor en "Tiempo", mayor al promedio de este atributo ***/
		(SELECT AVG(Tiempo) 
		 FROM MaratonNY);


/*** ALL ***/
USE Alumnos;

SELECT Gender, /*** Subconsulta de lista: Operador comparativo dada una consulta de VARIOS VALORES ***/
	   Age,
	   Home,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deberíamos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo < ALL /*** Operador de comparación < ALL, el cual nos devolverá aquellos registros con un valor en "Tiempo", MENOR a TODOS los valores del "Tiempo" de los mexicanos (WHERE Home = 'MEX') ***/
		(SELECT Tiempo /*** A partir de aquí, obtenemos la lista de los elementos de "Tiempo" del país de México (WHERE Home 'MEX') ***/
		 FROM MaratonNY
		 WHERE Home = 'MEX');


/*** ANY ***/
USE Alumnos;

SELECT Gender, /*** Subconsulta de lista: Operador comparativo dada una consulta de VARIOS VALORES ***/
	   Age,
	   Home,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deberíamos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo < ANY /*** Operador de comparación < ALL, el cual nos devolverá aquellos registros con un valor en "Tiempo", MENOR a TODOS los valores del "Tiempo" de los mexicanos y peruanos (WHERE Home IN ('MEX', 'PER')) ***/
				   /*** Es decir, los registros con un valor en "Tiempo" menor al valor MÁXIMO del tiempo hecho por los mexicanos (Home = 'MEX') ***/
		(SELECT Tiempo /*** A partir de aquí, obtenemos la lista de los elementos de "Tiempo" del país de México (WHERE Home 'MEX') ***/
		 FROM MaratonNY
		 WHERE Home = 'MEX');


/*** IN ***/
USE Alumnos;

SELECT Gender, /*** Subconsulta de lista: Operador comparativo dada una consulta de VARIOS VALORES ***/
	   Age,
	   Home,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deberíamos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo < ALL /*** Operador de comparación IN, el cual nos devolverá aquellos registros con un valor en "Tiempo", contenido (IN) en una lista especificada ***/
		(SELECT Tiempo /*** A partir de aquí, obtenemos la lista de los elementos de "Tiempo" del país de México y Perú (WHERE Home IN ('MEX', 'PER')) ***/
		 FROM MaratonNY
		 WHERE Home IN ('MEX', 'PER'));
