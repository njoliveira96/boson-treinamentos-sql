/*BACKUP E RESTAURAÇÃO

BACKUP DATABASE NOME DO BANCO
TO DISK = CAMINHO ('C:\boson-treinamentos-sql-databases\backup\NOME DO BANCO.BAK')
[WITH FORMAT];
GO

RESTORE DATABASE NOME DO BANCO
FROM DISK = CAMINHO ('C:\boson-treinamentos-sql-databases\backup\NOME DO BANCO.BAK')
[WITH REPLACE];
GO

*/

BACKUP DATABASE db_Biblioteca
TO DISK = 'C:\boson-treinamentos-sql-databases\backup\db_Biblioteca.bak';
GO

-- SLECIONA O master E REMOVE O db_Biblioteca

USE master;
GO 
ALTER DATABASE db_Biblioteca
SET single_user WITH ROLLBACK immediate;
GO
DROP DATABASE db_Biblioteca;
GO

-- RESTAURA O db_Biblioteca

RESTORE DATABASE db_Biblioteca
FROM DISK = 'C:\boson-treinamentos-sql-databases\backup\db_Biblioteca.bak';
GO