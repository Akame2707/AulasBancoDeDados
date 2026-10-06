CREATE TABLE tb_componentes (
id_componentes int primary key auto_increment,
nome varchar(150) not null,
categoria varchar(150) not null,
quantidade int not null,
preco_unitario decimal(10,2));

INSERT INTO
tb_componentes (nome, categoria, quantidade, preco_unitario)
VALUES 
('Placa ESP32', 'Microcontrolador', 15, 45.90),
('Módulo LoRa SX1276', 'Comunicação', 8, 38.50),
('Sensor Ultrassónico', 'Sensor', 22, 12.00),
('Arduino Uno R3', 'Microcontrolador', 5, 75.00),
('Módulo Relé 4 Canais', 'Atuador', 10, 25.00);

UPDATE tb_componentes
SET quantidade = 35
WHERE id_componentes = 21;

UPDATE tb_componentes
SET preco_unitario = 65.00
WHERE id_componentes = 24;

DELETE FROM tb_componentes
WHERE id_componentes = 25;

SELECT * FROM tb_componentes;

DELETE FROM tb_componentes;