
/*** DELETE VS TRUNCATE TABLE ***/
/*** Si tenemos una tabla con valores autoincrementables (es decir, una columna que agrega un valor superior, ya sea +1 o +n, a los nuevos registros)
     con el comando DELETE para eliminar todos los registros, al momento de incorporar más registros estos no empiezan con el valor inicial especificado
	 en la columna autoincremental, sino que empiezan desde el último registro anterior a la eliminación +1 o +n (de acuerdo al valor incremental especificado
	 en la creación de esta variable/columna).
	 Por otro lado, el comando TRUNCATE TABLE Nombre_de_la_tabla elimina los registros (al igual que DELETE), sin embargo, al momento de agregar nuevos datos
	 a la tabla sin registros, estos comienzan desde el primer valor especificado en la colummna incremental y no desde el último valor del registro eliminado +1 o +n.
	 Es decir, el comando TRUNCATE TABLE deja la tabla sin memoria de los registros eliminados anteriormente. ***/

	 /*** ALTER TABLE + DROP COLUMN ***/
	 /*** Este comando funciona para eliminar una columna de una tabla existente ***/
	 USE Cursos

	 ALTER TABLE Tabla_Valores_Duplicados
	 DROP COLUMN Profesión;


	 /*** ALTER TABLE + Múltiples DROP COLUMN ***/
	 USE Cursos

	 ALTER TABLE Tabla_Valores_Duplicados
	 DROP COLUMN Nombre
	 DROP COLUMN Empresa


	 /*** ALTER TABLE + DROP COLUMN + IF EXISTS ***/
	 USE Cursos

	 ALTER TABLE Tabla_Valores_Duplicados
	 DROP COLUMN IF EXISTS Nombre /*** Esto eliminará la columna si esta existe, de no existir NO arroja un error ***/

/*** DROP TABLE ***/
/*** Para eliminar una tabla completa ***/
USE Cursos

DROP TABLE Nombre_tabla_para_eliminar


/*** DROP TABLE + IS EXISTS ***/
USE Cursos

DROP TABLE IF EXISTS Nombre_tabla_para_eliminar /*** Comando para eliminar la tabla y, de no existir esta tabla, NO arroja ningún error ***/

	