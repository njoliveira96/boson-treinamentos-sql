/*
TRIGGERS (GATILHOS): � UM TIPO ESPECIAL DE PROCEDIMENTO ARMAZENADO EXECUTADO AUTOMATICAMENTE QUANDO UM USU�RIO REALIZA UMA OPERA��O DE MODIFICA��O DE DADOS EM UMA TABELA OU VIEW
ESPECIFICADA

AS OPERA��ES QUE PODEM DISPARAR UM TRIGGER S�O INSERT, UPDATE, DELETE

EXISTEM TR�S TIPO DE TRIGGERS:
- TRIGGERS DE DML: DISPARADOS POR EVENTOS DML COMO INSERT, UPDATE OU DELETE
- TRIGGERS DE DDL: DISPARADOS POR EVENTOS DE DDL COMO CREATE, ALTER OU DROP
- TRIGGERS LOGON: DISPARADOS EM RESPOSTA A EVENTOS DE LOGON NO SERVIDOR

MODOS DE DISPARO:
- AFTER: O C�DIGO PRESENTE NO TRIGGER � EXECUTADO AP�S TODAS AS A��ES TEREM SIDO COMPLETADAS NA TABELA ESPECIFICADA
- INSTEAD OF - O C�DIGO PRESENTE NO TRIGGER � EXECUTADO NO LUGAR DA OPERA��O QUE CAUSOU SEU DISPARO
*/

CREATE OR ALTER TRIGGER tg_editora_cadastrada
ON Editora
AFTER INSERT
AS
BEGIN
	SELECT CONCAT ('Foi cadastrada uma nova editora, agora, h� ', COUNT(*), ' editoras cadastradas') AS Cadastros
	FROM Editora;
END
GO

EXEC sp_cadastra_editora 'Nova Editora';

SELECT * FROM Editora;

CREATE OR ALTER TRIGGER tg_bloqueia_autor
ON Autor
INSTEAD OF INSERT
AS
BEGIN
	PRINT 'Cadastro de autores n�o permitido no momento';
END
GO

INSERT INTO Autor (NomeAutor, SobrenomeAutor) VALUES ('Clarice', 'Lispector');
SELECT * FROM Autor;

-- DESABILITANDO OU REABILITANDO A TRIGGER

ALTER TABLE Autor
DISABLE TRIGGER	tg_bloqueia_autor;

ALTER TABLE Autor
ENABLE TRIGGER	tg_bloqueia_autor;

-- EXCLUINDO A TRIGGER

DROP TRIGGER tg_bloqueia_autor;

-- VISUALIZANDO AS TRIGGERS

EXEC sp_helptrigger @tabname=Autor;

SELECT * FROM sys.triggers
WHERE is_disabled = 0 OR is_disabled = 1;

-- EXEMPLO DE TRIGGER EXECUTANDO UMA PROCEDURE

CREATE OR ALTER PROCEDURE sp_consulta_autores
AS
BEGIN
	SELECT NomeAutor, SobrenomeAutor
	FROM Autor
	ORDER BY NomeAutor;
END
GO

CREATE OR ALTER TRIGGER tg_insere_autor
ON Autor
AFTER INSERT
AS
BEGIN
	EXEC sp_consulta_autores;
END
GO