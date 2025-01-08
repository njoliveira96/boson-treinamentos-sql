-- INSERT INTO NOME DA TABELA (CAMPO (S) DA TABELA) VALUES (VALORES) : INSERINDO DADOS NAS TABELAS

INSERT INTO Assunto (NomeAssunto)
VALUES ('Ficcao Cientifica'), ('Botanica'),('Eletronica'),('Matematica'), ('Aventura'), ('Romance'), ('Financas'), 
('Gastronomia'), ('Terror'), ('Administracao'), ('Informatica'), ('Suspense');

SELECT * FROM Assunto;

INSERT INTO Editora (NomeEditora)
VALUES ('Prentice Hall'), ('O´Reilly'), ('Aleph'), ('Microsoft Press'), ('Wiley'), ('HarperCollins'), ('Erica'), ('Novatec'), ('McGraW-Hill'), ('Apress'), ('Francisco Alves'), 
('Sybex'),  ('Globo'), ('Companhia das letras'), ('Morro Branco'), ('Penguin Books'), ('Martin Claret'), ('Record'), ('Springer'), ('Melhoramentos'), ('Oxford'), ('Taschen'),
('Ediouro'), ('Bookman');

SELECT * FROM Editora
ORDER BY IdEditora ASC;

INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES ('Umberto', 'Eco'), ('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'), ('William', 'Stanek'), ('Christine', 'Bresnahan'), ('William', 'Gibson'), ('James', 'Joyce'), 
('Jhon', 'Emsley'), ('José', 'Saramago'), ('Richard', 'Silverman'), ('Robert','Byrnes'), ('Jay', 'Ts'), ('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield','Hill'), ('Joel','Murach'),
('Paul', 'Scherz'), ('Simon', 'Monk'), ('George', 'Orwell'), ('Italo', 'Calvino'), ('Machado', 'de Assis'), ('Oliver', 'Sacks'), ('Ray', 'Bradbury'), ('Walter', 'Isaacson'), ('Benjamin', 'Graham'),
('Júlio', 'Verne'), ('Marcelo','Gleiser'), ('Harri','Lorenzi'), ('Humphrey', 'Carpenter'), ('Isaac', 'Asimov'), ('Aldous', 'Huxley'), ('Arthur', 'Conan Doyle'), ('Blaise', 'Pascal'), ('Jostein','Gaarder'),
('Stephen', 'Hawking'), ('Stephen','Jay Gould'), ('Neil','De Grasse Tyson'), ('Charles','Darwin'), ('Alan','Turing'), ('Arthur','C. Clarke');

SELECT * FROM Autor;

INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdEditora, IdAssunto)
VALUES ('A arte da eletronica', '9788582604342','20170308', 300.74, 1160, 24, 3), ('Vinte Mil Leguas Submarinas', '9788582850022','20140916', 24.50, 448, 16, 1),
('O investidor inteligente','9788595080805', '20160125', 79.90, 450, 6, 7);

-- INSERT COM IMPORTAÇÃO DE ARQUIVOS

INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdEditora, IdAssunto)
SELECT NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdEditora, IdAssunto
FROM OPENROWSET(
	BULK 'C:\boson-treinamentos-sql\Livros.csv',
	FORMATFILE = 'C:\boson-treinamentos-sql\Formato.xml',
	CODEPAGE = '65001', -- UTF-8
	FIRSTROW = 2
) AS LivrosCSV;

SELECT * FROM Livro;

INSERT INTO LivroAutor (IdLivro, IdAutor)
VALUES (100,15),(100,16),(101,27),(102,26),(103,41),(104,24),(105,32),(106,20),(107,27),(108,1),(109,22),(110,10),(111,21),(112,5),(113,10),(114,8),(115,18),(115,19),(116,31),
(117,22);

SELECT * FROM LivroAutor;

-- ROTINA PARA INSERIR DADOS NA TABELA

DECLARE @Contador INT = 1
WHILE @Contador <=100
BEGIN 
	INSERT INTO Teste (ValorTeste) VALUES (@Contador * 3)
	SET @Contador = @Contador + 1
END

SELECT * FROM Teste;

-- DELETE FROM NOME DA TABELA : DELETA TODAS AS LINHAS OU ALGUMAS LINHAS DA TABELA

DELETE FROM Livro
WHERE IdLivro > 100;

-- TRUNCATE TABLE NOME DA TABELA: LIMPA DADOS DA TABELA, RESETA O VALOR DO IDENTITY

TRUNCATE TABLE Teste;

-- ELECT IDENT_CURRENT ('NOME DA TABELA'): RETORNA O VALOR ATUAL DO IDENTITY

SELECT IDENT_CURRENT ('Teste');