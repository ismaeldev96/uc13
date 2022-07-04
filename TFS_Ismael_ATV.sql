-- DDL 
CREATE DATABASE RpgDB
GO

USE RpgDB
GO

CREATE TABLE Usuarios (
	UsuarioId INT PRIMARY KEY IDENTITY,
	UsuarioEmail VARCHAR(120) UNIQUE NOT NULL,
	UsuarioNome VARCHAR(100) NOT NULL, 
	UsuarioSenha VARCHAR(100) NOT NULL
)
GO

CREATE TABLE Classes (
	ClasseId INT PRIMARY KEY IDENTITY,
	ClasseNome VARCHAR(100) UNIQUE NOT NULL,
	ClassDescricao VARCHAR(150) 
)
GO

CREATE TABLE Personagens (
	PersongaemId INT PRIMARY KEY IDENTITY,
	PersonagemNome VARCHAR(100) UNIQUE NOT NULL,
	UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT UNIQUE FOREIGN KEY REFERENCES Classes(ClasseId)
)
GO

CREATE TABLE Habilidades(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	HabilidadeNome VARCHAR(100) UNIQUE NOT NULL,
	HbilidadeDescricao VARCHAR(150),
)
GO

CREATE TABLE ClasseHabilidades(
	ClassId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadeId INT FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
)
GO

--DML
INSERT INTO Usuarios(UsuarioEmail, UsuarioSenha, UsuarioNome) VALUES('ismael@email.com','abc123','Ismael')
INSERT INTO Classes VALUES('Barbaro', 'Descrição da classe')
INSERT INTO Habilidades VALUES('Lança Mortal', 'Descrição da Habilidade'),('Escudo Supremo', 'Descrição da Habulidade')
INSERT INTO Personagens VALUES('DeuBug', 1, 1)
INSERT INTO ClasseHabilidades VALUES(1,1),(1,2)

INSERT INTO Usuarios(UsuarioEmail, UsuarioSenha, UsuarioNome) VALUES('Danox@email.com','abc123','Danox')
INSERT INTO Classes VALUES('Monge', 'Descrição da classe')
INSERT INTO Habilidades VALUES('Recuperar Vida', 'Descrição da Habilidade')
INSERT INTO Personagens VALUES('BitBug', 2, 2)
INSERT INTO ClasseHabilidades VALUES(2,3),(2,2)

UPDATE Usuarios SET UsuarioNome = 'Aphonso' WHERE UsuarioId = 1

INSERT INTO Usuarios(UsuarioEmail, UsuarioSenha, UsuarioNome) VALUES('ismael35@email.com','abc123','Ismael')
INSERT INTO Classes VALUES('Mago', 'Descrição da classe')
INSERT INTO Habilidades VALUES('Feitiço de Paralização', 'Descrição da Habilidade')
INSERT INTO Personagens VALUES('Gandalf', 3, 3)
INSERT INTO ClasseHabilidades VALUES(3,3),(3,2)

--DQL
SELECT UsuarioNome, UsuarioEmail, UsuarioSenha FROM Usuarios 
SELECT ClasseNome FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidades

-- selecionando tudo
SELECT * FROM Personagens INNER JOIN Classes ON Personagens.ClasseId = Classes.ClasseId

-- especificando as colunas
SELECT PersonagemNome, Classes.ClasseNome, Classes.ClassDescricao FROM Personagens INNER JOIN Classes ON Personagens.ClasseId = Classes.ClasseId

-- abreviando o nome das tabelas
SELECT PersonagemNome, C.ClasseNome, C.ClassDescricao FROM Personagens INNER JOIN Classes AS C ON Personagens.ClasseId = C.ClasseId



-- criando usuario jogador com limitação de acesso
CREATE LOGIN estudante 
WITH PASSWORD = '1234'
CREATE USER estudante FOR LOGIN estudante
GRANT SELECT TO estudante