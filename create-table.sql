CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE Autor(
IdAutor SMALLINT IDENTITY,
NomeAutor VARCHAR(50) NOT NULL,
SobrenomeAutor VARCHAR(60) NOT NULL,
CONSTRAINT pk_id_autor PRIMARY KEY (IdAutor)
);
sp_help Autor;

CREATE TABLE Editora(
IdEditora SMALLINT PRIMARY KEY IDENTITY,
NomeEditora VARCHAR(50) NOT NULL
);

CREATE TABLE Assunto(
IdAssunto TINYINT PRIMARY KEY IDENTITY,
NomeAssunto VARCHAR(25) NOT NULL
);

CREATE TABLE Livro(
IdLivro SMALLINT NOT NULL PRIMARY KEY IDENTITY (100,1),
NomeLivro VARCHAR(70) NOT NULL,
ISBN13 CHAR(13) UNIQUE NOT NULL,
DtaPub DATE,
PrecoLivro MONEY NOT NULL,
NumeroPaginas SMALLINT NOT NULL,
IdEditora SMALLINT NOT NULL,
IdAssunto TINYINT NOT NULL,
CONSTRAINT fk_id_editora FOREIGN KEY(IdEditora) REFERENCES Editora(IdEditora) ON DELETE CASCADE,
CONSTRAINT fk_id_assunto FOREIGN KEY(IdAssunto) REFERENCES Assunto(IdAssunto) ON DELETE CASCADE,
CONSTRAINT verifica_preco CHECK(PrecoLivro >=0)
);

CREATE TABLE LivroAutor(
IdLivro SMALLINT NOT NULL,
IdAutor SMALLINT NOT NULL,
CONSTRAINT fk_id_livros FOREIGN KEY(IdLivro) REFERENCES Livro(IdLivro),
CONSTRAINT fk_id_autores FOREIGN KEY(IdAutor) REFERENCES Autor(IdAutor),
CONSTRAINT pk_livro_autor PRIMARY KEY(IdLivro, IdAutor)
);

-- PARA CONSULTAR AS TABELAS EXISTENTES NO BANCO QUE EST� SENDO USADO

SELECT name FROM Biblioteca.sys.tables;

-- GERENCIAMENTO DE TABELAS
/*
ALTER, DROP, RENAME
*/
-- ADCIONA A NOVA COLUNA Edicao NA TABELA LIVRO
ALTER TABLE Livro
ADD Edicao SMALLINT;

-- ALTERA O TIPO DE DADOS DA COLUNA Edicao NA TABELA LIVRO
ALTER TABLE Livro
ALTER COLUMN Edicao TINYINT;

-- ADICIONA UMA CHAVE PRIM�RIA
ALTER TABLE Livro
ADD PRIMARY KEY (ISBN13);

-- EXLCUI UMA CONSTRAINT DE UMA COLUNA
ALTER TABLE Livro
DROP CONSTRAINT verifica_preco;

-- PRA VERIFICAR OS NOMES DAS CONSTRAINTS QUE DESEJA REMOVER
sp_help Livro;

-- EXCLUI UMA COLUNA DE UMA TABELA
ALTER TABLE Livro
DROP COLUMN Edicao,

-- EXCLUI UMA TABELA
DROP TABLE NOMEDATABELA;

-- RENOMEA UMA TABELA
sp_rename 'Livro', 'tbl_livros';

