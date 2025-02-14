CREATE DATABASE Biblioteca ON PRIMARY
(NAME = Biblioteca,
FILENAME = 'C:\boson-treinamentos-sql-databases\Biblioteca.mdf',
SIZE = 6MB,
MAXSIZE = 15MB,
FILEGROWTH = 10%)
LOG ON (
NAME = teste01_log,
FILENAME = 'C:\boson-treinamentos-sql-databases\Biblioteca.ldf',
SIZE = 1MB,
FILEGROWTH =1MB)
GO

CREATE DATABASE db_Biblioteca ON PRIMARY
(NAME = db_Biblioteca,
FILENAME = 'C:\boson-treinamentos-sql-databases\backup\db_Biblioteca.mdf',
SIZE = 6MB,
MAXSIZE = 15MB,
FILEGROWTH = 10%)
LOG ON (
NAME = teste01_log,
FILENAME = 'C:\boson-treinamentos-sql-databases\backup\db_Biblioteca.ldf',
SIZE = 1MB,
FILEGROWTH =1MB)
GO

-- CONSULTAR BANCOS EXISTENTES
/*
COMENTÁTRIO DE MÚLTIPLAS LINHAS
*/
SELECT name
FROM master.sys.databases
ORDER BY name;

-- PROCEDURE PRA CONSULTAR OS BANCOS EXISTENTES
EXEC sp_databases;

-- SELECIONANDO O BANCO
USE Biblioteca;

-- OBTER INFORMAÇÕES SOBRE UM BANCO ESPECÍFICO
EXEC sp_helpdb Biblioteca;

-- EXCLUINDO O BANCO
DROP DATABASE IF EXISTS Biblioteca;

-- EXCLUINDO BANCO EM USO
USE MASTER
GO
ALTER DATABASE Biblioteca
SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE Biblioteca;
