CREATE TABLE Produto (
id int primary key auto_increment,
nome varchar(150) not null,
preco decimal(10,2) not null,
QTDestoque int not null);

INSERT INTO Produto (nome, preco, QTDestoque)
VALUES
('Pão Francês', 0.80, 500),
('Pão de Queijo', 2.50, 150),
('Bolo de Chocolate', 35.00, 20),
('Sonho', 5.50, 40),
('Cuca de Banana', 18.00, 15),
('Torta de Morango', 45.00, 10),
('Croissant', 6.00, 30),
('Rosca Doce', 12.00, 25),
('Pão Integral', 8.50, 50),
('Cookie de Chocolate', 3.50, 80);

SELECT * FROM Produto;