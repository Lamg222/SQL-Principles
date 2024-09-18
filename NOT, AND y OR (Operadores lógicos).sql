
/*** Operadores l�gicos ***/

/*** NOT ***/
USE Alumnos;

SELECT Gender, Home, Age, Tiempo
FROM MaratonNY
WHERE NOT Home = 'Mex'; /*** Operador l�gico NOT hace una selecci�n con excepci�n del elemento elegido.
NOTA: Va despu�s del comando WHERE ***/


/*** AND ***/
USE Alumnos;

SELECT Home, Gender, Age, Tiempo
FROM MaratonNY
WHERE NOT Home = 'Mex' AND Gender = 'Female'; /*** Combinamos el operador l�gico NOT con el operador AND que a�ade otra condici�n.
NOTA: Al agregar el operador AND estamos solicitando que se cumpla la siguiente condici�n especificada. No importa si el operador
l�gico NOT est� antes, este no afecta a AND, por lo tanto, sino que AND se convierte en una nueva condici�n ***/


/*** OR ***/
USE Alumnos;

SELECT Home, Gender, Age, Tiempo
FROM MaratonNY
WHERE NOT Home = 'Mex' AND (Gender = 'Female' OR (Gender = 'Male' AND Age BETWEEN 25 AND 30)) /*** Combinamos operadores l�gicos.
En este caso, los registros no son de M�xico (NOT Home = 'Mex') y (AND) el g�nero debe ser femenino (Gender = 'Female') o (OR) puede
ser masculino (Gender = 'Male') s�lo si tiene entre 25 y 30 a�os (AND Age BETWEEN 25 AND 30), incluidos estos valores, dado a que es intevalo cerrado ***/
ORDER BY Age; /*** Orden ascendente, basado en los valores de la edad (Age) ***/
/*** NOTA: los par�ntesis son importantes, dado a que si quitamos el primero la condici�n de NOT Home = 'Mex', s�lo se aplicar�a a la segunda condici�n,
es decir, a la condici�n de que el g�nero sea femenino (Gender = 'Female'). De ser as�, obtendr�amos registros de mexicanos con edades entre [25, 30] ***/
