
--DML
INSERT INTO Usuarios(UsuarioEmail, UsuarioSenha, UsuarioNome) VALUES('ismael@email.com','abc123','Ismael')
INSERT INTO Classes VALUES('Barbaro', 'Descri��o da classe')
INSERT INTO Habilidades VALUES('Lan�a Mortal', 'Descri��o da Habilidade'),('Escudo Supremo', 'Descri��o da Habulidade')
INSERT INTO Personagens VALUES('DeuBug', 1, 1)
INSERT INTO ClasseHabilidades VALUES(1,1),(1,2)

INSERT INTO Usuarios(UsuarioEmail, UsuarioSenha, UsuarioNome) VALUES('Danox@email.com','abc123','Danox')
INSERT INTO Classes VALUES('Monge', 'Descri��o da classe')
INSERT INTO Habilidades VALUES('Recuperar Vida', 'Descri��o da Habilidade')
INSERT INTO Personagens VALUES('BitBug', 2, 2)
INSERT INTO ClasseHabilidades VALUES(2,3),(2,2)

UPDATE Usuarios SET UsuarioNome = 'Aphonso' WHERE UsuarioId = 1

