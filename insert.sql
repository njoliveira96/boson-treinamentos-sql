-- INSERINDO DADOS NAS TABELAS

INSERT INTO Assunto (NomeAssunto)
VALUES
('Fic��o Cient�fica'), ('Bot�nica'),('Eletr�nica'),('Matem�tica'), ('Aventura'), ('Romance'), ('Finan�as'), 
('Gastronomia'), ('Terror'), ('Administra��o'), ('Inform�tica'), ('Suspense');

-- VERIFICA��O
SELECT * FROM Assunto;
SELECT * FROM Editora;
SELECT * FROM Autor;

INSERT INTO Editora (NomeEditora)
VALUES
('Prentice Hall'), ('O�Reilly');

INSERT INTO Editora (NomeEditora)
VALUES
('Aleph'), ('Microsoft Press'), ('Wiley'), ('HarperCollins'), ('�rica'), ('Novatec'), ('McGraW-Hill'), ('Apress'), ('Francisco Alves'), ('Sybex'),  ('Globo'),
('Companhia das letras'), ('Morro Branco'), ('Penguin Books'), ('Martin Claret'), ('Record'), ('Springer'), ('Melhoramentos'), ('Oxford'), ('Taschen'), ('Ediouro'), ('Bookman');

INSERT INTO Autor (NomeAutor, SobrenomeAutor)
VALUES ('Umberto', 'Eco'), ('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'), ('William', 'Stanek'), ('Christine', 'Bresnahan'), ('William', 'Gibson'), ('James', 'Joyce'), 
('Jhon', 'Emsley'), ('Jos�', 'Saramago'), ('Richard', 'Silverman'), ('Robert','Byrnes'), ('Jay', 'Ts'), ('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield','Hill'), ('Joel','Murach'),
('Paul', 'Scherz'), ('Simon', 'Monk'), ('George', 'Orwell'), ('�talo', 'Calvino'), ('Machado', 'de Assis'), ('Oliver', 'Sacks'), ('Ray', 'Bradbury'), ('Walter', 'Isaacson'), ('Benjamin', 'Graham'),
('J�lio', 'Verne'), ('Marcelo','Gleiser'), ('Harri','Lorenzi'), ('Humphrey', 'Carpenter'), ('Isaac', 'Asimov'), ('Aldous', 'Huxley'), ()















-- DELETA LINHAS DA TABELA
DELETE FROM Autor

-- ATUALIZA LINHAS DA TABELA 
UPDATE Assunto
SET NomeAssunto = 'Ficcao Cient�fica'
WHERE IdAssunto = 1;

