-- INSERINDO DADOS NAS TABELAS

INSERT INTO Assunto (NomeAssunto)
VALUES
('Ficção Científica'), ('Botânica'),('Eletrônica'),('Matemática'), ('Aventura'), ('Romance'), ('Finanças'), 
('Gastronomia'), ('Terror'), ('Administração'), ('Informática'), ('Suspense');

-- VERIFICAÇÃO
SELECT * FROM Assunto;
SELECT * FROM Editora;
SELECT * FROM Autor;

INSERT INTO Editora (NomeEditora)
VALUES
('Prentice Hall'), ('O´Reilly');

INSERT INTO Editora (NomeEditora)
VALUES
('Aleph'), ('Microsoft Press'), ('Wiley'), ('HarperCollins'), ('Érica'), ('Novatec'), ('McGraW-Hill'), ('Apress'), ('Francisco Alves'), ('Sybex'),  ('Globo'),
('Companhia das letras'), ('Morro Branco'), ('Penguin Books'), ('Martin Claret'), ('Record'), ('Springer'), ('Melhoramentos'), ('Oxford'), ('Taschen'), ('Ediouro'), ('Bookman');

INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES ('Umberto', 'Eco'), ('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'), ('William', 'Stanek'), ('Christine', 'Bresnahan'), ('William', 'Gibson'), ('James', 'Joyce'), 
('Jhon', 'Emsley'), ('José', 'Saramago'), ('Richard', 'Silverman'), ('Robert','Byrnes'), ('Jay', 'Ts'), ('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield','Hill'), ('Joel','Murach'),
('Paul', 'Scherz'), ('Simon', 'Monk'), ('George', 'Orwell'), ('Ítalo', 'Calvino'), ('Machado', 'de Assis'), ('Oliver', 'Sacks'), ('Ray', 'Bradbury'), ('Walter', 'Isaacson'), ('Benjamin', 'Graham'),
('Júlio', 'Verne'), ('Marcelo','Gleiser'), ('Harri','Lorenzi'), ('Humphrey', 'Carpenter'), ('Isaac', 'Asimov'), ('Aldous', 'Huxley'), ('Arthur', 'Conan Doyle'), ('Blaise', 'Pascal'), ('Jostein','Gaarder'),
('Stephen', 'Hawking'), ('Stephen','Jay Gould'), ('Neil','De Grasse Tyson'), ('Charles','Darwin'), ('Alan','Turing'), ('Arthur','C. Clarke');

SELECT * FROM Autor;

INSERT INTO Livro (NomeLivro, ISBN13, DtaPub, PrecoLivro, NumeroPaginas, IdAssunto, IdEditora)
VALUES('A arte da eletrônica', '9788582604342','20170308', 300.74, 1160, 3, 24);

INSERT INTO Livro (NomeLivro, ISBN13, DtaPub, PrecoLivro, NumeroPaginas, IdAssunto, IdEditora)
VALUES('Vinte Mil Léguas Submarinas', '9788582850022','2014-09-16', 24.50, 448, 1, 16), -- Júlio Verne
('O investidor inteligente','9788595080805', '2016-01-25', 79.90, 450, 7, 6); -- Benjamin Graham

SELECT * FROM Livro;

/*DELETE FROM Livro
WHERE ISBN13 = 9788595080805;*/ -- TIVE QUE REINSERIR A LINHA 3, AJUSTEI O TÍTULO DO LIVRO

INSERT INTO Livro (NomeLivro, ISBN13, DtaPub, PrecoLivro, NumeroPaginas, IdEditora, IdAssunto)
SELECT NomeLivro, ISBN13, DtaPub, PrecoLivro, NumeroPaginas, IdEditora, IdAssunto
FROM OPENROWSET(
	BULK 'C:\boson-treinamentos-sql\Livros.csv',
	FORMATFILE = 'C:\boson-treinamentos-sql\Formato.xml',
	CODEPAGE = '65001', -- UTF-8
	FIRSTROW = 2
) AS LivrosCSV;

-- DELETA LINHAS DA TABELA
DELETE FROM Livro
WHERE IdLivro > 100;

-- ATUALIZA LINHAS DA TABELA 
UPDATE Assunto
SET NomeAssunto = 'Ficcao Científica'
WHERE IdAssunto = 1;

