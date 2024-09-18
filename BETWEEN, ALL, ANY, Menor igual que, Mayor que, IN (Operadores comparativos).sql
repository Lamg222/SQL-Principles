
/*** Operadores de comparaci�n ***/

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

SELECT Gender, /*** Subconsulta escalonada: Un operador de comparaci�n (<=) dada una operaci�n de c�lculo (AVG) CON UN �NICO VALOR ***/
	   Age,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deber�amos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo <= /*** Operador de comparaci�n <=, el cual nos devolver� aquellos registros con un valor en "Tiempo", menor o igual al promedio de este atributo ***/
		(SELECT AVG(Tiempo) 
		 FROM MaratonNY);


/*** Mayor que (>) ***/
/*** Complemento al operador <= ***/
USE Alumnos;

SELECT Gender, /*** Subconsulta escalonada: Un operador de comparaci�n (>) dada una operaci�n de c�lculo (AVG) CON UN �NICO VALOR ***/
	   Age,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deber�amos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo > /*** Operador de comparaci�n >, el cual nos devolver� aquellos registros con un valor en "Tiempo", mayor al promedio de este atributo ***/
		(SELECT AVG(Tiempo) 
		 FROM MaratonNY);


/*** ALL ***/
USE Alumnos;

SELECT Gender, /*** Subconsulta de lista: Operador comparativo dada una consulta de VARIOS VALORES ***/
	   Age,
	   Home,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deber�amos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo < ALL /*** Operador de comparaci�n < ALL, el cual nos devolver� aquellos registros con un valor en "Tiempo", MENOR a TODOS los valores del "Tiempo" de los mexicanos (WHERE Home = 'MEX') ***/
		(SELECT Tiempo /*** A partir de aqu�, obtenemos la lista de los elementos de "Tiempo" del pa�s de M�xico (WHERE Home 'MEX') ***/
		 FROM MaratonNY
		 WHERE Home = 'MEX');


/*** ANY ***/
USE Alumnos;

SELECT Gender, /*** Subconsulta de lista: Operador comparativo dada una consulta de VARIOS VALORES ***/
	   Age,
	   Home,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deber�amos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo < ANY /*** Operador de comparaci�n < ALL, el cual nos devolver� aquellos registros con un valor en "Tiempo", MENOR a TODOS los valores del "Tiempo" de los mexicanos y peruanos (WHERE Home IN ('MEX', 'PER')) ***/
				   /*** Es decir, los registros con un valor en "Tiempo" menor al valor M�XIMO del tiempo hecho por los mexicanos (Home = 'MEX') ***/
		(SELECT Tiempo /*** A partir de aqu�, obtenemos la lista de los elementos de "Tiempo" del pa�s de M�xico (WHERE Home 'MEX') ***/
		 FROM MaratonNY
		 WHERE Home = 'MEX');


/*** IN ***/
USE Alumnos;

SELECT Gender, /*** Subconsulta de lista: Operador comparativo dada una consulta de VARIOS VALORES ***/
	   Age,
	   Home,
	   Tiempo /*** NOTA: si hubieramos escrito "time" o alguna otra palabra reservada en SQL, deber�amos poner entre corchetes la palabra (por ejemplo, [time]) ***/
FROM MaratonNY
WHERE Tiempo < ALL /*** Operador de comparaci�n IN, el cual nos devolver� aquellos registros con un valor en "Tiempo", contenido (IN) en una lista especificada ***/
		(SELECT Tiempo /*** A partir de aqu�, obtenemos la lista de los elementos de "Tiempo" del pa�s de M�xico y Per� (WHERE Home IN ('MEX', 'PER')) ***/
		 FROM MaratonNY
		 WHERE Home IN ('MEX', 'PER'));
