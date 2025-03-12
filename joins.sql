/* JOINS: JUNÇÕES DE TABELAS

INNER JOIN: RETORNA LINHAS QUANDO HOUVER PELO MENOS UMA CORRESPONDÊNCIA EM AMBAS AS TABELAS
OUTER JOIN: RETORNA LINHAS MESMO QUANDO NÃO HOUVER PELO MENOS UMA CORRESPONDÊNCIA EM UMA DAS TABELAS (OU AMBAS), O OUTER JOIN DIVIDE SE EM LEFT JOIN, RIGHT JOIN E FULL JOIN

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

-- EXERCÍCIOS

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

-- RETORNA OS NOMES, OS PREÇOS, A EDITORA E OS ASSUNTOS DOS LIVROS, ORDENADOS PELOS NOMES DOS LIVROS

SELECT L.NomeLivro As 'Nome do livro', L.PrecoLivro AS 'Preço do livro', E.NomeEditora AS 'Nome da editora', A.NomeAssunto AS 'Nome do assunto'
FROM Livro AS L
INNER JOIN Editora AS E ON L.IdEditora = E.IdEditora
INNER JOIN Assunto AS A ON L.IdAssunto = A.IdAssunto
ORDER BY 'Nome do livro';

-- RETORNA OS NOMES DOS LIVROS E AS DATAS DE PUBLICAÇÃO DOS LIVROS CUJO SOBRENOME DO AUTOR COMEÇA COM A LETRA B

SELECT L.NomeLivro AS 'Nome do livro', L.DataPub AS 'Data de publicação do livro', AU.SobrenomeAutor AS 'Sobrenome do autor'
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

-- RETORNA OS PREÇOS, OS ASSUNTOS E OS NOMES DOS LIVROS QUE CUSTAM ENTRE R$ 70 E R$ 170 ORDENADO DO MAIS CARO PARA O MAIS BARATO

SELECT L.PrecoLivro, A.NomeAssunto, L.NomeLivro
FROM Livro AS L
INNER JOIN Assunto AS A ON A.IdAssunto = L.IdAssunto
WHERE L.PrecoLivro BETWEEN 70 AND 170
ORDER BY L.PrecoLivro DESC;

-- LEFT OUTER JOIN: RETORNA TODAS AS LINHAS DA TABELA À ESQUERDA, MESMO SE NÃO HOUVER NENHUMA CORRESPONDÊNCIA NA TABELA À DIREITA

SELECT * 
FROM Editora AS E
LEFT JOIN Livro AS L ON E.IdEditora = L.IdEditora;
-- WHERE L.IdLivro IS NOT NULL -> traz 
--ORDER BY E.NomeEditora;

SELECT * 
FROM Livro AS L
LEFT JOIN Editora AS E ON L.IdEditora = E.IdEditora;

-- RIGHT OUTER JOIN: RETORNA TODAS AS LINHAS DA TABELA À DIREITA, MESMO SE NÃO HOUVER NENHUMA CORRESPONDÊNCIA NA TABELA À ESQUERDA

SELECT * 
FROM Editora AS E
RIGHT JOIN Livro AS L ON E.IdEditora = L.IdEditora;

SELECT * 
FROM Livro AS L
RIGHT JOIN Editora AS E ON L.IdEditora = E.IdEditora;

-- FULL OUTER JOIN: RETORNA TODOS OS DADOS MESMO SE NÃO HOUVER NENHUMA CORRESPONDÊNCIA ENTRE AS TABELAS DA ESQUERDA E DA DIREITA

SELECT *
FROM Livro AS L
FULL JOIN Editora AS E ON L.IdEditora = E.IdEditora;

-- CROSS JOIN: RETORNA UM PRODUTO CARTESIANO ENTRE AS TABELAS MOSTRANDO TODAS AS COMBINAÇÕES POSSÍVEIS ENTRE OS REGISTROS

SELECT *
FROM Livro
CROSS JOIN Assunto;