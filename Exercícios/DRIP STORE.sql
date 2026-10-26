CREATE DATABASE Loja_Tenis;
USE Loja_Tenis;

CREATE TABLE Tenis_NFT (
    id INT NOT NULL PRIMARY KEY,
    Modelo VARCHAR(150) NOT NULL,
    Marca VARCHAR(150) NOT NULL,
    dataRegistro DATE NOT NULL
);

CREATE TABLE Marca (
    id INT NOT NULL PRIMARY KEY NOT NULL,
    nome VARCHAR(150) NOT NULL,
    cnpj INT NOT NULL,
    endereco VARCHAR(500) NOT NULL
);

CREATE TABLE Cliente (
    id INT NOT NULL PRIMARY KEY NOT NULL,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    dataCadastro DATE NOT NULL,
    cpf INT NOT NULL
);

CREATE TABLE Modelo_Tenis (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cor VARCHAR(150) NOT NULL,
    preco INT NOT NULL,
    fk_Marca_id INT NOT NULL
);

CREATE TABLE possui (
    fk_Tenis_NFT_id INT NOT NULL,
    fk_Marca_id INT NOT NULL
);

CREATE TABLE Favorita (
    fk_Cliente_id INT NOT NULL,
    fk_Tenis_NFT_id INT NOT NULL
);
 
ALTER TABLE Modelo_Tenis ADD CONSTRAINT FK_Modelo_Tenis_2
    FOREIGN KEY (fk_Marca_id)
    REFERENCES Marca (id)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_Tenis_NFT_id)
    REFERENCES Tenis_NFT (id)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_Marca_id)
    REFERENCES Marca (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Favorita ADD CONSTRAINT FK_Favorita_1
    FOREIGN KEY (fk_Cliente_id)
    REFERENCES Cliente (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Favorita ADD CONSTRAINT FK_Favorita_2
    FOREIGN KEY (fk_Tenis_NFT_id)
    REFERENCES Tenis_NFT (id)
    ON DELETE RESTRICT;
    
INSERT INTO Marca (id, nome, cnpj, endereco)
VALUES
(1, 'Nike', 12345678, 'Rua das Flores, 100, Sao Paulo'),
(2, 'Adidas', 23456789, 'Av. Brasil, 200, Rio de Janeiro'),
(3, 'Puma', 34567890, 'Rua Central, 300, Curitiba'),
(4, 'New Balance', 45678901, 'Av. Paulista, 400, Sao Paulo'),
(5, 'Vans', 56789012, 'Rua do Comercio, 500, Florianopolis');

-- INSERINDO OS CLIENTES

INSERT INTO Cliente (id, nome, email, dataCadastro, cpf)
VALUES
(1, 'Ana Silva', 'ana@email.com', '2026-01-10', 123456789),
(2, 'Lucas Santos', 'lucas@email.com', '2026-02-15', 234567890),
(3, 'Mariana Costa', 'mariana@email.com', '2026-03-20', 345678901),
(4, 'Pedro Oliveira', 'pedro@email.com', '2026-04-05', 456789012),
(5, 'Julia Martins', 'julia@email.com', '2026-05-12', 567890123);

-- INSERINDO OS MODELOS DE TENIS

INSERT INTO Modelo_Tenis (id, nome, cor, preco, fk_Marca_id)
VALUES
(1, 'Air Jordan 1', 'Vermelho e branco', 1200, 1),
(2, 'Air Force 1', 'Branco', 700, 1),
(3, 'Ultraboost', 'Preto', 900, 2),
(4, 'Suede Classic', 'Azul', 450, 3),
(5, '574 Core', 'Cinza', 600, 4),
(6, 'Old Skool', 'Preto e branco', 400, 5);

-- INSERINDO OS TENIS COM NFT

INSERT INTO Tenis_NFT (id, Modelo, Marca, dataRegistro)
VALUES
(1, 'Air Jordan 1', 'Nike', '2026-01-15'),
(2, 'Air Force 1', 'Nike', '2026-02-10'),
(3, 'Ultraboost', 'Adidas', '2026-03-05'),
(4, 'Suede Classic', 'Puma', '2026-04-12'),
(5, '574 Core', 'New Balance', '2026-05-18'),
(6, 'Old Skool', 'Vans', '2026-06-20');

-- RELACIONANDO OS TENIS AS MARCAS

INSERT INTO possui (fk_Tenis_NFT_id, fk_Marca_id)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5);

-- INSERINDO OS TENIS FAVORITOS DOS CLIENTES

INSERT INTO Favorita (fk_Cliente_id, fk_Tenis_NFT_id)
VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 5),
(3, 4),
(3, 6),
(4, 1),
(5, 3),
(5, 6);

-- CONSULTANDO OS DADOS

SELECT * FROM Marca;
SELECT * FROM Cliente;
SELECT * FROM Modelo_Tenis;

SELECT
    tn.id AS id_nft,
    tn.Modelo,
    tn.Marca,
    tn.dataRegistro,
    m.endereco
FROM Tenis_NFT tn
INNER JOIN possui p
    ON tn.id = p.fk_Tenis_NFT_id
INNER JOIN Marca m
    ON p.fk_Marca_id = m.id;
    
    
SELECT
    c.nome AS cliente,
    c.email,
    tn.Modelo AS tenis_favorito,
    tn.Marca
FROM Cliente c
INNER JOIN Favorita f
    ON c.id = f.fk_Cliente_id
INNER JOIN Tenis_NFT tn
    ON f.fk_Tenis_NFT_id = tn.id
ORDER BY c.nome;

SELECT
    c.nome AS cliente,
    COUNT(f.fk_Tenis_NFT_id) AS total_favoritos
FROM Cliente c
LEFT JOIN Favorita f
    ON c.id = f.fk_Cliente_id
GROUP BY c.id, c.nome
ORDER BY total_favoritos DESC;