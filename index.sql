/* �NDICES (USADOS PARA OTIMIZAR A RECUPERA��O DE DADOS DE TABELAS:
PERMITEM QUE OS REGISTROS RELEVANTES SEJAM ENCONTRADOS MAIS RA�DAMENTE COM BASE EM DETERMINADOS CRIT�RIOS DE PESQUISA
CLUSTERIZADOS USAM B-TREE, N�O CLUSTERIZADOS
*/

-- CRIANDO O �NDICE:

CREATE INDEX  ind_nome_livro
ON Livro(NomeLivro);

SELECT NomeLivro
FROM Livro;

-- EXIBINDO OS �NDICES:

EXEC sp_helpindex Livro;

-- DESABILITANDO �NDICES:

ALTER INDEX ind_nome_livro
ON Livro
DISABLE;

-- DESABILITANDO TODOS OS �NDICES:

ALTER INDEX ALL ON Livro
DISABLE;

-- REEXIBINDO O �NDICE:

ALTER INDEX ind_nome_livro
ON Livro
REBUILD;

-- REEXIBINDO TODOS OS �NDICES:

ALTER INDEX ALL ON Livro
REBUILD;

-- EXCLUIR INDEX:

DROP INDEX Livro.ind_nome_livro;