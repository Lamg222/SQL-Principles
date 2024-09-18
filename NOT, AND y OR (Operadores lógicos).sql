
/*** Operadores lógicos ***/

/*** NOT ***/
USE Alumnos;

SELECT Gender, Home, Age, Tiempo
FROM MaratonNY
WHERE NOT Home = 'Mex'; /*** Operador lógico NOT hace una selección con excepción del elemento elegido.
NOTA: Va después del comando WHERE ***/


/*** AND ***/
USE Alumnos;

SELECT Home, Gender, Age, Tiempo
FROM MaratonNY
WHERE NOT Home = 'Mex' AND Gender = 'Female'; /*** Combinamos el operador lógico NOT con el operador AND que añade otra condición.
NOTA: Al agregar el operador AND estamos solicitando que se cumpla la siguiente condición especificada. No importa si el operador
lógico NOT está antes, este no afecta a AND, por lo tanto, sino que AND se convierte en una nueva condición ***/


/*** OR ***/
USE Alumnos;

SELECT Home, Gender, Age, Tiempo
FROM MaratonNY
WHERE NOT Home = 'Mex' AND (Gender = 'Female' OR (Gender = 'Male' AND Age BETWEEN 25 AND 30)) /*** Combinamos operadores lógicos.
En este caso, los registros no son de México (NOT Home = 'Mex') y (AND) el género debe ser femenino (Gender = 'Female') o (OR) puede
ser masculino (Gender = 'Male') sólo si tiene entre 25 y 30 años (AND Age BETWEEN 25 AND 30), incluidos estos valores, dado a que es intevalo cerrado ***/
ORDER BY Age; /*** Orden ascendente, basado en los valores de la edad (Age) ***/
/*** NOTA: los paréntesis son importantes, dado a que si quitamos el primero la condición de NOT Home = 'Mex', sólo se aplicaría a la segunda condición,
es decir, a la condición de que el género sea femenino (Gender = 'Female'). De ser así, obtendríamos registros de mexicanos con edades entre [25, 30] ***/
