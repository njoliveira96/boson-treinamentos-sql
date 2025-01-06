-- INSERINDO DADOS NAS TABELAS

INSERT INTO Assunto (NomeAssunto)
VALUES
('Ficcao Cientifica'), ('Botanica'),('Eletronica'),('Matematica'), ('Aventura'), ('Romance'), ('Financas'), 
('Gastronomia'), ('Terror'), ('Administracao'), ('Informatica'), ('Suspense');

SELECT * FROM Assunto;

INSERT INTO Editora (NomeEditora)
VALUES
('Prentice Hall'), ('O´Reilly'), ('Aleph'), ('Microsoft Press'), ('Wiley'), ('HarperCollins'), ('Erica'), ('Novatec'), ('McGraW-Hill'), ('Apress'), ('Francisco Alves'), ('Sybex'),  ('Globo'),
('Companhia das letras'), ('Morro Branco'), ('Penguin Books'), ('Martin Claret'), ('Record'), ('Springer'), ('Melhoramentos'), ('Oxford'), ('Taschen'), ('Ediouro'), ('Bookman');

SELECT * FROM Editora;

INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES ('Umberto', 'Eco'), ('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'), ('William', 'Stanek'), ('Christine', 'Bresnahan'), ('William', 'Gibson'), ('James', 'Joyce'), 
('Jhon', 'Emsley'), ('José', 'Saramago'), ('Richard', 'Silverman'), ('Robert','Byrnes'), ('Jay', 'Ts'), ('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield','Hill'), ('Joel','Murach'),
('Paul', 'Scherz'), ('Simon', 'Monk'), ('George', 'Orwell'), ('Italo', 'Calvino'), ('Machado', 'de Assis'), ('Oliver', 'Sacks'), ('Ray', 'Bradbury'), ('Walter', 'Isaacson'), ('Benjamin', 'Graham'),
('Júlio', 'Verne'), ('Marcelo','Gleiser'), ('Harri','Lorenzi'), ('Humphrey', 'Carpenter'), ('Isaac', 'Asimov'), ('Aldous', 'Huxley'), ('Arthur', 'Conan Doyle'), ('Blaise', 'Pascal'), ('Jostein','Gaarder'),
('Stephen', 'Hawking'), ('Stephen','Jay Gould'), ('Neil','De Grasse Tyson'), ('Charles','Darwin'), ('Alan','Turing'), ('Arthur','C. Clarke');

SELECT * FROM Autor;

INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdAssunto, IdEditora)
VALUES('A arte da eletronica', '9788582604342','20170308', 300.74, 1160, 3, 24);

INSERT INTO Livro (NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas, IdAssunto, IdEditora)
VALUES('Vinte Mil Leguas Submarinas', '9788582850022','20140916', 24.50, 448, 1, 16), -- Júlio Verne
('O investidor inteligente','9788595080805', '20160125', 79.90, 450, 7, 6); -- Benjamin Graham

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
VALUES (101,15),(101,16),(103,27),(104,26),(105,41),(106,24),(107,32),(108,20),(109,27),(110,1),(111,22),(112,10),(113,21),(114,5),(115,10),(116,8),(117,18),(117,19),
(118,31),(119,22);

SELECT * FROM LivroAutor;

-- VERIFICAÇÃO COM INNER JOIN (JUNÇÃO DE TABELAS)

SELECT NomeLivro, NomeAutor, SobrenomeAutor
FROM Livro
INNER JOIN LivroAutor
ON Livro.IdLivro = LivroAutor.IdLivro
INNER JOIN Autor
ON Autor.IdAutor = LivroAutor.IdAutor
ORDER BY NomeLivro;












-- DELETA LINHAS DA TABELA
DELETE FROM Livro
WHERE IdLivro > 100;

-- ATUALIZA LINHAS DA TABELA 
UPDATE Assunto
SET NomeAssunto = 'Ficcao Científica'
WHERE IdAssunto = 1;