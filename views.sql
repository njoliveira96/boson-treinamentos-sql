/*
VIEW: SIMPLIFICA CONSULTAS COMPLEXAS, SEGURANÇA, ABSTRAÇÃO, AGREGAÇÃO E SUMARIZAÇÃO DE DADOS
*/
-- CRIA A VIEW

CREATE OR ALTER VIEW vwLivroPreco AS 
SELECT TOP 5 NomeLivro, PrecoLivro
FROM Livro
ORDER BY PrecoLivro;

-- OU

IF OBJECT_ID ('vwLivroAssunto', 'view') IS NOT NULL
	DROP VIEW vwLivroAssunto;
GO
CREATE VIEW vwLivroAssunto AS
	SELECT L.NomeLivro AS Livro, A.NomeAssunto AS Assunto
	FROM Livro AS L
	INNER JOIN Assunto AS A ON L.IdAssunto = A.IdAssunto;
GO

-- EXIBE A VIEW

SELECT * FROM vwLivroPreco;
SELECT Livro, Assunto FROM vwLivroAssunto;

-- EXIBE O CÓDIGO DA VIEW

EXEC sp_helptext vwLivroPreco;

-- ALTERANDO A VIEW

ALTER VIEW vwLivroPreco AS
	SELECT L.NomeLivro AS Livro, L.ISBN13, A.NomeAssunto AS Assunto
	FROM Livro AS L
	INNER JOIN Assunto AS A ON L.IdAssunto = A.IdAssunto;

SELECT * FROM vwLivroAssunto;

-- EXCLUINDO UMA VIEW

DROP VIEW vwLivroPreco;
DROP VIEW vwLivroAssunto;