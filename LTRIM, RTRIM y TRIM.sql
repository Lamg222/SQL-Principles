
/*** Quitar espacios en blanco ***/

/*** Cuando est�n al inicio (LEFT) ***/
SELECT LTRIM('        Aqu� los espacios estan al principio de la oraci�n')


/*** Cuando est�n al final (RIGHT) ***/
SELECT RTRIM('Aqu� los espacios est�n al final de la oraci�n            ')


/*** Cuando est�n al inicio y al final (T) ***/
SELECT TRIM('       Aqu� los espacios est�n al inicio y al final de la oraci�n      ')