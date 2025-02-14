-- SELECT: USADO PRA FAZER AS CONSULTAS
/* 
SELECT COLUNAS OU * (TUDO) FROM TABELA;
*/
SELECT NomeLivro, PrecoLivro
FROM Livro;

-- SELECT INTO: CRIA UMA TABELA COM DADOS DE OUTRA TABELA
/*
SELECT COLUNAS
INTO NOVA_TABELA
FROM TABELA_ATUAL;
*/

SELECT NomeLivro, ISBN13
INTO LivroISBN
FROM Livro;

DROP TABLE  LivroISBN;

-- EXERC�CIOS

-- 1 - RETORNA OS NOMES DE LIVROS, PRE�OS E DATAS DE PUBLICA��O

SELECT NomeLivro, PrecoLivro, DataPub
FROM Livro
ORDER BY PrecoLivro;

-- 2 - RETORNA APENAS OS SOBRENOMES DOS AUTORES

SELECT SobrenomeAutor
FROM Autor
ORDER BY SobrenomeAutor;

-- 3 - RETORNA A LISTA DE ASSUNTOS

SELECT NomeAssunto
FROM Assunto
ORDER BY NomeAssunto;

--  4 - RETORNA A LISTA DE EDITORAS COM OS IDS DE CADA UMA, COM A COLUNA DE NOMES DE EDITORAS � ESQUERDA DA COLUNA DE IDS

SELECT NomeEditora, IdEditora
FROM Editora
ORDER BY IdEditora;

-- 5 - RETORNA OS IDS DE ASSUNTOS DOS QUAIS EXISTEM LIVROS CADASTRADOS NA TABELA DE LIVROS, SEM REPETI��O

SELECT DISTINCT IdAssunto
FROM Livro
ORDER BY IdAssunto;

-- 6 - CRIA UMA NOVA TABELA CHAMADA LivrosFiccao QUE CONTENHA TODOS OS DADOS DOS LIVROS RELACIONADOS AO ASSUNTO DE ID 1

SELECT * 
INTO LivrosFiccao
FROM Livro
WHERE IdAssunto = 1;

DROP TABLE LivrosFiccao;

-- SLECT TOP: USADO PRA FILTRAR AS CONSULTAS
/* 
SELECT TOP N�MERO/PERCENTUAL COLUNAS
FROM TABELA
ORDER BY
*/
-- RETORNA OS 2 PRIMEIROS LIVROS INSERIDOS ORDENADOS PELO NOME DO LIVRO

SELECT TOP (2) NomeLivro
FROM Livro
ORDER BY NomeLivro;

-- RETORNA OS 3 PRIMEIROS LIVROS CORRESPONDENTES A 15% DO TOTAL DE LIVROS INSERIDOS NA TABELA LIVRO ORDENADOS PELO NOME DO LIVRO

SELECT TOP(15) PERCENT NomeLivro
FROM Livro
ORDER BY NomeLivro ASC;

-- RETORNA OS 3 �LTIMOS LIVROS ORDENADOS PELO NOME DO LIVRO DA TABELA LIVRO

SELECT TOP (3) NomeLivro
FROM Livro
ORDER BY NomeLivro DESC;

-- RETORNA OS NOMES DOS LIVROS E OS 3 �LTIMOS IDS DA TABELA LIVROS INCLUINDO OS IDS REPETIDOS

SELECT TOP (3) WITH TIES NomeLivro, IdAssunto
FROM Livro
ORDER BY IdAssunto DESC;

-- WHERE: USADO PRA FILTRAR AS CONSULTAS USANDO CONDI��ES

SELECT NomeLivro, DataPub
FROM Livro
WHERE IdEditora = 3
ORDER BY IdEditora;

-- SELECT DENTRO DE OUTRO SELECT

SELECT NomeLivro, DataPub
FROM Livro
WHERE IdEditora = (
	SELECT IdEditora
	FROM Editora
	WHERE NomeEditora = 'Aleph'
	)
ORDER BY NomeLivro;

-- NOMES ALTERNATIVOS (ALIAS) AS
/*SELECT COLUNA1 AS NOME ALTERNATIVO1
FROM TABELA AS NOME ALTERNATIVO
*/
SELECT NomeLivro AS Livros
FROM Livro;

SELECT TOP (3) NomeLivro AS 'Livros mais caros', PrecoLivro AS 'Pre�o do livro'
FROM Livro AS L
ORDER BY 'Pre�o do livro' DESC;

-- OU

SELECT TOP (3) NomeLivro 'Livros mais caros', PrecoLivro 'Pre�o do livro'
FROM Livro L
ORDER BY 'Pre�o do livro' DESC;

-- USANDO VALORES L�GICOS: AND, OR, NOT

SELECT * FROM Livro
WHERE IdLivro > 102 AND IdEditora > 4;

SELECT * FROM Livro
WHERE IdLivro > 110 OR NOT IdEditora < 4;

-- USANDO O BETWEEN

SELECT * FROM Livro
WHERE DataPub BETWEEN '20040507' AND '20140507';

SELECT * FROM Livro
WHERE PrecoLivro BETWEEN 50.00 AND 100.00;

SELECT NomeLivro, DataPub, PrecoLivro
FROM Livro
WHERE PrecoLivro >= 50.00
AND DataPub BETWEEN '20050620' AND '20100620'
OR DataPub BETWEEN '20160101' AND '20200101'
ORDER BY DataPub DESC;

-- COMBINANDO CONSULTAS COM O OPERADOR UNION

-- EXEMPLO 1

SELECT NomeAutor Nome, 'Autor' AS Tipo FROM Autor
UNION
SELECT NomeEditora Nome, 'Editora' AS Tipo FROM Editora;

-- EXEMPLO 2

SELECT NomeLivro AS Nome, 'Livro' AS Tipo FROM Livro
UNION
SELECT NomeAssunto AS Nome, 'Assunto' AS Tipo FROM Assunto;

-- EXEMPLO 3

SELECT NomeAutor AS Nome, 'Autor' AS Tipo FROM Autor
UNION
SELECT NomeEditora AS Nome, 'Editora' AS Tipo FROM Editora
UNION
SELECT NomeAssunto AS Nome, 'Assunto' AS Tipo FROM Assunto
UNION
SELECT NomeLivro AS Nome, 'Livro' AS Tipo FROM Livro;

/* FUN��ES DE AGREGA��O: MIN, MAX, AVG, SUM, COUNT
-- COUNT: RETORNA A QUANTIDADE DE REGISTROS NA TABELA INFORMADA
-- MAX: RETORNA O VALOR MAIOR 
-- MIN: RETORNA O MENOR VALOR
-- AVG: RETORNA A M�DIA DE UM CONJUNTO DE VALORES
*/
SELECT COUNT (*) Total_de_registros_ou_linhas_na_tabela_autores
FROM Autor;

SELECT MAX (PrecoLivro) 'Valor do livro mais caro'
FROM Livro;

SELECT MIN (NumeroPaginas) 'Menor n�mero de p�ginas'
FROM Livro;

SELECT AVG (PrecoLivro) 'Pre�o m�dio de um livro'
FROM Livro;

-- OU

SELECT SUM (PrecoLivro) / COUNT (*) AS 'Pre�o m�dio'
FROM Livro;

SELECT SUM (PrecoLivro) 'Soma total dos pre�os dos livros'
FROM Livro;

SELECT COUNT (*) Total_de_livros_com_o_id_assunto_1
FROM Livro
WHERE IdAssunto = 1;

SELECT NomeLivro, PrecoLivro
FROM Livro
WHERE PrecoLivro = (
	SELECT MAX (PrecoLivro)
	FROM Livro
	);

-- USANDO O LIKE E O NOT LIKE
/*
% = QUALQUER CADEIA DE 0 OU MAIS CARACTERES
_ = QUALQUER CARACTERE �NICO
[] = CARACTERES �NICOS NO INTERVALO OU CONJUNTO ESPECIFICADO
[^] = CARACTERES �NICOS N�O NO INTERVALO OU CONJUNTO ESPECIFICADO
*/
-- RETORNA OS LIVROS QUE COME�AM COM A LETRA F

SELECT * FROM Livro
WHERE NomeLivro LIKE 'F%';

-- RETORNA OS LIVROS QUE N�O COME�AM COM A LETRA S

SELECT * FROM Livro
WHERE NomeLivro NOT LIKE 'S%';

-- RETORNA OS LIVROS QUE COME�AM COM A LETRA F OU D

SELECT * FROM Livro
WHERE NomeLivro LIKE '[FD]%';

-- RETORNA OS LIVROS QUE N�O COME�AM COM A LETRA F OU COM A LETRA D

SELECT * FROM Livro
WHERE NomeLivro LIKE '[^F^D]%';

-- RETORNA OS LIVROS QUE COME�AM COM VOGAL

SELECT * FROM Livro
WHERE NomeLivro LIKE '[aeiou]%';

-- RETORNA OS LIVROS QUE TERMINAM COM VOGAL

SELECT * FROM Livro
WHERE NomeLivro LIKE '%[aeiou]';

-- RETORNA OS LIVROS QUE COME�AM COM N�MEROS

SELECT * FROM Livro
WHERE NomeLivro LIKE '[0-9]%';

-- RETORNA OS LIVROS QUE COME�AM COM A E TERMINAM COM O

SELECT * FROM Livro
WHERE NomeLivro LIKE 'A%o';

-- RETORNA OS AUTORES CUJOS NOMES COME�AM COM R E OS SOBRENOMES COME�AM COM B

SELECT NomeAutor, SobrenomeAutor FROM Autor
WHERE NomeAutor LIKE 'R%' AND SobrenomeAutor LIKE 'B%';

-- RETORNA OS LIVROS QUE POSSUEM VOGAIS COMO A PEN�LTIMA LETRA DA PALAVRA

SELECT * FROM Livro
WHERE NomeLivro LIKE '%[aeiou]_';

-- RETORNA OS LIVROS QUE COME�A COM O J E POSSUEM 3 LETRAS AP�S O J

SELECT NomeAutor, SobrenomeAutor FROM Autor
WHERE NomeAutor LIKE 'J___';

-- RETORNA OS LIVROS QUE N�O COME�AM COM VOGAIS OU N�MEROS

SELECT * FROM Livro
WHERE NomeLivro NOT LIKE '[aeiou0-9]%';

/* JOINS: JUN��ES DE TABELAS

INNER JOIN: RETORNA LINHAS QUANDO HOUVER PELO MENOS UMA CORRESPOND�NCIA EM AMBAS AS TABELAS
OUTER JOIN: RETORNA LINHAS MESMO QUANDO N�O HOUVER PELO MENOS UMA CORRESPOND�NCIA EM UMA DAS TABELAS (OU AMBAS), O OUTER JOIN DIVIDE SE EM LEFT JOIN, RIGHT JOIN E FULL JOIN

*/
-- INNER JOIN

SELECT NomeLivro, NomeAssunto
FROM Livro
INNER JOIN Assunto
ON Livro.IdAssunto = Assunto.IdAssunto;

--  INNER JOIN COM ALIAS

SELECT L.NomeLivro AS 'Nomes dos livros', E.NomeEditora AS 'Nomes das editoras'
FROM Livro AS L INNER JOIN Editora AS E ON L.IdEditora = E.IdEditora
WHERE E.NomeEditora LIKE '[MH]%'
ORDER BY L.NomeLivro;

SELECT L.NomeLivro AS 'Nomes dos livros', A.NomeAutor AS 'Nome do autor', A.SobrenomeAutor AS 'Sobrenome do autor', E.NomeEditora AS 'Nome da editora'
FROM LivroAutor AS LA 
INNER JOIN Autor AS A ON LA.IdAutor = A.IdAutor
INNER JOIN Livro AS L ON L.IdLivro = LA.IdLivro 
INNER JOIN Editora AS E ON L.IdEditora = E.IdEditora
ORDER BY 'Nomes dos livros';

-- EXERC�CIOS

-- RETORNA UMA CONSULTA QUE RETORNE OS NOMES DOS LIVROS E SEUS RESPECTIVOS ASSUNTOS

SELECT L.NomeLivro AS 'Nome do livro', A.NomeAssunto AS 'Nome do assunto'
FROM Livro AS L
INNER JOIN Assunto AS A ON L.IdAssunto = A.IdAssunto
ORDER BY 'Nome do livro';

-- RETORNA OS NOMES DOS AUTORES, OS SOBRENOMES DOS AUTORES, OS LIVROS ESCRITOS POR ELES E OS ASSUNTOS DOS LIVROS

SELECT AU.NomeAutor AS 'Nome do autor', AU.SobrenomeAutor AS 'Sobrenome do autor', L.NomeLivro AS 'Nome do livro', A.NomeAssunto AS 'Nome do assunto'
FROM LivroAutor AS LA
INNER JOIN Autor AS AU ON AU.IdAutor = LA.IdAutor
INNER JOIN Livro As L ON L.IdLivro = LA.IdLivro
INNER JOIN Assunto AS A ON L.IdAssunto = A.IdAssunto
ORDER BY 'Nome do autor';

-- OU

SELECT AU.NomeAutor AS 'Nome do autor', AU.SobrenomeAutor AS 'Sobrenome do autor', L.NomeLivro AS 'Nome do livro', A.NomeAssunto AS 'Nome do assunto'
FROM Autor AS AU
INNER JOIN LivroAutor AS LA ON AU.IdAutor = LA.IdAutor
INNER JOIN Livro As L ON LA.IdLivro = L.IdLivro
INNER JOIN Assunto AS A ON L.IdAssunto = A.IdAssunto
ORDER BY 'Nome do autor';

-- RETORNA OS NOMES, OS PRE�OS, A EDITORA E OS ASSUNTOS DOS LIVROS, ORDENADOS PELOS NOMES DOS LIVROS

SELECT L.NomeLivro As 'Nome do livro', L.PrecoLivro AS 'Pre�o do livro', E.NomeEditora AS 'Nome da editora', A.NomeAssunto AS 'Nome do assunto'
FROM Livro AS L
INNER JOIN Editora AS E ON L.IdEditora = E.IdEditora
INNER JOIN Assunto AS A ON L.IdAssunto = A.IdAssunto
ORDER BY 'Nome do livro';

-- RETORNA OS NOMES DOS LIVROS E AS DATAS DE PUBLICA��O DOS LIVROS CUJO SOBRENOME DO AUTOR COME�A COM A LETRA B

SELECT L.NomeLivro AS 'Nome do livro', L.DataPub AS 'Data de publica��o do livro', AU.SobrenomeAutor AS 'Sobrenome do autor'
FROM Livro AS L
INNER JOIN LivroAutor AS LA ON LA.IdLivro = L.IdLivro
INNER JOIN Autor AS AU ON LA.IdAutor = AU.IdAutor
WHERE AU.SobrenomeAutor LIKE 'B%'
ORDER BY 'Sobrenome do autor';

-- RETORNA OS ASSUNTOS E OS SOBRENOMES DOS AUTORES DOS LIVROS QUE CUSTAM MAIS DE R$ 80

SELECT A.NomeAssunto AS 'Nome do assunto', AU.SobrenomeAutor AS 'Sobrenome do autor', L.NomeLivro As 'Nome do livro', L.PrecoLivro
FROM LivroAutor AS LA
INNER JOIN Livro as L ON LA.IdLivro = L.IdLivro
INNER JOIN Autor AU ON LA.IdAutor = AU.IdAutor
INNER JOIN Assunto AS A ON L.IdAssunto = A.IdAssunto
WHERE PrecoLivro > 80
ORDER BY PrecoLivro ASC;

-- RETORNA OS PRE�OS, OS ASSUNTOS E OS NOMES DOS LIVROS QUE CUSTAM ENTRE R$ 70 E R$ 170 ORDENADO DO MAIS CARO PARA O MAIS BARATO

SELECT L.PrecoLivro, A.NomeAssunto, L.NomeLivro
FROM Livro AS L
INNER JOIN Assunto AS A ON A.IdAssunto = L.IdAssunto
WHERE L.PrecoLivro BETWEEN 70 AND 170
ORDER BY L.PrecoLivro DESC;

-- LEFT OUTER JOIN: RETORNA TODAS AS LINHAS DA TABELA � ESQUERDA, MESMO SE N�O HOUVER NENHUMA CORRESPOND�NCIA NA TABELA � DIREITA

SELECT * 
FROM Editora AS E
LEFT JOIN Livro AS L ON E.IdEditora = L.IdEditora;
-- WHERE L.IdLivro IS NOT NULL -> traz 
--ORDER BY E.NomeEditora;

SELECT * 
FROM Livro AS L
LEFT JOIN Editora AS E ON L.IdEditora = E.IdEditora;

-- RIGHT OUTER JOIN: RETORNA TODAS AS LINHAS DA TABELA � DIREITA, MESMO SE N�O HOUVER NENHUMA CORRESPOND�NCIA NA TABELA � ESQUERDA

SELECT * 
FROM Editora AS E
RIGHT JOIN Livro AS L ON E.IdEditora = L.IdEditora;

SELECT * 
FROM Livro AS L
RIGHT JOIN Editora AS E ON L.IdEditora = E.IdEditora;

-- FULL OUTER JOIN: RETORNA TODOS OS DADOS MESMO SE N�O HOUVER NENHUMA CORRESPOND�NCIA ENTRE AS TABELAS DA ESQUERDA E DA DIREITA

SELECT *
FROM Livro AS L
FULL JOIN Editora AS E ON L.IdEditora = E.IdEditora;

-- CROSS JOIN: RETORNA UM PRODUTO CARTESIANO ENTRE AS TABELAS MOSTRANDO TODAS AS COMBINA��ES POSS�VEIS ENTRE OS REGISTROS

SELECT *
FROM Livro
CROSS JOIN Assunto;

/*
VIEW: SIMPLIFICA CONSULTAS COMPLEXAS, SEGURAN�A, ABSTRA��O, AGREGA��O E SUMARIZA��O DE DADOS
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

-- EXIBE O C�DIGO DA VIEW

EXEC sp_helptext vwLivroPreco;

-- ALTERANDO A VIEW

ALTER VIEW vwLivroPreco AS
	SELECT L.NomeLivro AS Livro, L.ISBN13, A.NomeAssunto AS Assunto
	FROM Livro AS L
	INNER JOIN Assunto AS A ON L.IdAssunto = A.IdAssunto;

SELECT * FROM vwLivroAssunto;

-- EXCLUINDO UMA VIEW

DROP VIEW vwLivroPreco;

/*
SUBCONSULTAS
*/
-- EXEMPLO 1

SELECT NomeLivro, IdEditora
FROM Livro 
WHERE IdEditora = (
	SELECT IdEditora
	FROM Editora
	WHERE NomeEditora = 'Aleph'
)
ORDER BY NomeLivro;

-- EXEMPLO 2

SELECT NomeEditora
FROM Editora
WHERE IdEditora IN (SELECT IdEditora FROM Livro	WHERE IdAssunto IN (1,3,7))
ORDER BY NomeEditora;

-- EXEMPLO 3

SELECT L.NomeLivro, L.PrecoLivro
FROM Livro AS L, (SELECT AVG(PrecoLivro) AS MediaPreco FROM Livro) AS Subconsulta
WHERE L.PrecoLivro > Subconsulta.MediaPreco;

-- EXEMPLO 4

SELECT NomeEditora
FROM Editora
WHERE IdEditora IN (SELECT IdEditora FROM Livro WHERE IdAssunto = (SELECT IdAssunto FROM Assunto WHERE NomeAssunto = 'Ficcao Cientifica'))
ORDER BY NomeEditora;