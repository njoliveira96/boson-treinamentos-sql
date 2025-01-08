-- UPDATE NOME DA TABELA SET COLUNA DA TABELA = NOVO VALOR WHERE COLUNA DA TABELA = VALOR: ATUALIZA DADOS DA TABELA

UPDATE Livro
SET NomeLivro = 'Eu, Robo'
WHERE IdLivro = 116;

UPDATE Livro
SET PrecoLivro = 60.00
WHERE IdLivro = 105;

UPDATE Livro
SET PrecoLivro = PrecoLivro * 1.1
WHERE IdLivro = 105;

UPDATE Livro
SET PrecoLivro = PrecoLivro * 0.8
WHERE IdLivro = 105;

UPDATE Livro
SET PrecoLivro = 60.00, NumeroPaginas = 320
WHERE IdLivro = 105;

SELECT * FROM Livro;