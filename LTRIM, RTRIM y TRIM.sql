
/*** Quitar espacios en blanco ***/

/*** Cuando están al inicio (LEFT) ***/
SELECT LTRIM('        Aquí los espacios estan al principio de la oración')


/*** Cuando están al final (RIGHT) ***/
SELECT RTRIM('Aquí los espacios están al final de la oración            ')


/*** Cuando están al inicio y al final (T) ***/
SELECT TRIM('       Aquí los espacios están al inicio y al final de la oración      ')