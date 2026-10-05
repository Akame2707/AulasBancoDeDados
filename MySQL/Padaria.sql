CREATE DATABASE padaria;
USE padaria;

CREATE TABLE Cliente (
id int primary key auto_increment,
nome varchar(150) not null,
telefone varchar(15) not null,
email varchar(150),
DTnascimento date not null);

INSERT INTO Cliente (nome, telefone, email, DTnascimento)
VALUES
	('Maria Julia', '(48)99876543', 'mariajulia@gmail.com', '2000-03-21'),
	('Jonas', '(48) 8792432', 'junior69@gmail.com', '2001-11-09'),
	('Marcos', '(48) 532344', 'antoniomarcos@gmail.com', '2012-01-16'),
	('Julia', '(48) 028922', 'thestyjulia', '2000-03-21'),
	('Giovana', '(48) 5376543', '', '1980-12-21'),
	('Maria Luiza', '(48) 9438098', 'mariluiza@gmail.com', '2002-03-03'),
	('Larissa', '(48) 847239', '', '2015-08-13'),
	('Lubawski', '(48) 996543', 'euodeiomeunome@gmail.com', '2010-12-06'),
	('Breno', '(48) 976543', 'brtec@gmail.com', '2006-10-26'),
	('Kayo', '(48) 95643', '', '1990-09-11');
    
SELECT * FROM Cliente;