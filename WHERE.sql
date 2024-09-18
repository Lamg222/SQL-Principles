/*** Seleccionamos los registros que cumplan la condici�n de estar casados ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Estado_Civil = 'Married'; /***Las comillas que se usan con comillas simples y no dobles ***/

/*** Seleccionamos los registros que cumplan la condici�n de NO estar casados ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Estado_Civil != 'Married'; /*** El s�mbolo != ***/
/***Las comillas que se usan con comillas simples y no dobles ***/
/*** Este resultado no devuelve los registros con valores NULL ***/

/*** Seleccionamos los registros que cumplan la condici�n de NO estar casados (opci�n 2) ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Estado_Civil <> 'Married'; /*** El s�mbolo <> el cual representa que sea "diferente" ***/
/***Las comillas que se usan con comillas simples y no dobles ***/
/*** Este resultado no devuelve los registros con valores NULL ***/

/*** Seleccionamos los registros que cumplan la condici�n de NO estar casados o tengan valores NULL sobre la columna espec�fica ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Estado_Civil <> 'Married' OR Estado_Civil IS NULL; /*** Agregamos el operador OR para agregar otra condici�n a la funci�n WHERE ***/
/*** Al utilizar IS NULL debemos especificar la columna (pero no hay necesidad de poner el signo "=", dado a que contiene la palabra IS ***/
/*** Con esto, obtenemos los registros que NO est�n casados o que tienen valores NULL sobre esta columna de "Estado civil" ***/
/***Las comillas que se usan con comillas simples y no dobles, sobre el elemento espec�fico del texto ***/


/*** Seleccionamos los registros que tengan un valor determinado sobre su cadena de caracteres ***/
/*** Es decir, alg�n patr�n dentro de los valores de alguna columna espec�fica ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Correo like '%gmail%'; /*** Con el comando like no es necesario utilizar el signo de "=" ***/
/*** ES NECESARIO UTILIZAR S�MBOLOS DE % ANTES Y DESPU�S DE LA PALABRA QUE SE EST� BUSCANDO ***/
/***Las comillas que se usan con comillas simples y no dobles, sobre el elemento espec�fico del texto ***/

/*** Seleccionamos los registros que tengan un valor determinado AL INICIO de su cadena de caracteres ***/
/*** Es decir, alg�n patr�n dentro de los valores de alguna columna espec�fica ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Nombre like 'A%'; /*** Con el comando like no es necesario utilizar el signo de "=" ***/
/*** ES NECESARIO UTILIZAR S�MBOLOS DE % DESPU�S DE LA LETRA QUE ESTAMOS BUSCANDO, PARA QUE BUSQUE S�LO LOS QUE EMPIEZAN ***/
/*** SI TAMBI�N AGREGAMOS S�MBOLO % ANTES, ENTONCES BUSCAR� TODOS LOS NOMBRES QUE CONTENGAN LA LETRA "A" EN SU NOMBRE ***/
/***Las comillas que se usan con comillas simples y no dobles, sobre el elemento espec�fico del texto ***/


/*** Seleccionamos los registros que tengan un valor determinado AL FINAL de su cadena de caracteres ***/
/*** Es decir, alg�n patr�n dentro de los valores de alguna columna espec�fica ***/
USE Alumnos;

SELECT *
FROM Datos_Personales
WHERE Nombre like '%A'; /*** Con el comando like no es necesario utilizar el signo de "=" ***/
/*** ES NECESARIO UTILIZAR S�MBOLOS DE % ANTES DE LA LETRA QUE ESTAMOS BUSCANDO, PARA QUE BUSQUE S�LO LOS QUE EMPIEZAN ***/
/*** SI TAMBI�N AGREGAMOS S�MBOLO % DESPU�S, ENTONCES BUSCAR� TODOS LOS NOMBRES QUE CONTENGAN LA LETRA "A" EN SU NOMBRE ***/
/***Las comillas que se usan con comillas simples y no dobles, sobre el elemento espec�fico del texto ***/