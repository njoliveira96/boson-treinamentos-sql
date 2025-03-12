SELECT (SELECT 'Nadson') AS Subconsulta;

-- EXEMPLO 1

SELECT NomeLivro, IdEditora
FROM Livro
WHERE IdEditora = (SELECT IdEditora FROM Editora WHERE NomeEditora = 'Aleph')
ORDER BY NomeLivro;

-- EXEMPLO 2

SELECT NomeEditora
FROM Editora
WHERE IdEditora IN (SELECT IdEditora FROM Livro WHERE IdAssunto IN (1,3,7))
ORDER BY NomeEditora;

-- EXEMPLO 3

SELECT Livro.NomeLivro, Livro.PrecoLivro
From Livro, (SELECT AVG (PrecoLivro) AS MediaPreco FROM Livro) AS Subconsulta 
WHERE Livro.PrecoLivro > Subconsulta.MediaPreco;

-- EXEMPLO 4

SELECT NomeEditora
FROM Editora
WHERE IdEditora IN (SELECT IdEditora	FROM Livro WHERE IdAssunto = (SELECT IdAssunto FROM Assunto WHERE NomeAssunto = 'Ficção Científica'))
ORDER BY NomeEditora;

