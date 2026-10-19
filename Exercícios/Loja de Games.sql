
CREATE TABLE tb_desenvolvedora (
    id_desenvolvedora INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(150) NOT NULL
);

SHOW TABLES;
DESCRIBE tb_desenvolvedora;

INSERT INTO tb_desenvolvedora (nome_empresa)
VALUES 
    ("CD Projekt RED"),
    ("Mojang"),
    ("Riot Games"),
    ("ConcernedApe"), 
    ("Team Cherry"),
    ("Rockstar Games"), 
    ("Innersloth"),
    ("EA Sports"),
    ("Maddy Makes Games");

SELECT * FROM tb_desenvolvedora;

CREATE TABLE tb_jogo (
    id_jogo INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    categoria VARCHAR(150) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    classificacao INT NOT NULL,
    multijogador VARCHAR(3) NOT NULL, 
    fk_tb_desenvolvedora_id_desenvolvedora INT,
    FOREIGN KEY (fk_tb_desenvolvedora_id_desenvolvedora) 
    REFERENCES tb_desenvolvedora(id_desenvolvedora)
);

DESCRIBE tb_jogo;

INSERT INTO tb_jogo
    (titulo, categoria, preco, classificacao, multijogador, fk_tb_desenvolvedora_id_desenvolvedora)
VALUES
    ('Cyberpunk 2077', 'RPG', 199.90, 18, 'Não', 1),
    ('Minecraft', 'Sandbox', 99.00, 0, 'Sim', 2),
    ('Valorant', 'FPS', 0.00, 14, 'Sim', 3),
    ('The Witcher 3', 'RPG', 79.90, 18, 'Não', 1),
    ('Stardew Valley', 'Simulador', 24.99, 10, 'Sim', 4),
    ('Hollow Knight', 'Metroidvania', 27.99, 10, 'Não', 5),
    ('Grand Theft Auto V', 'Ação', 109.90, 18, 'Sim', 6),
    ('Among Us', 'Casual', 10.50, 10, 'Sim', 7),
    ('FIFA 23', 'Esporte', 299.90, 0, 'Sim', 8),
    ('Celeste', 'Plataforma', 36.99, 10, 'Não', 9);

SELECT * FROM tb_jogo;

SELECT tb_jogo.titulo, tb_desenvolvedora.nome_empresa 
FROM tb_jogo JOINM tb_desenvolvedora ON
tb_jogo.fk_tb_desenvolvedora_id_desenvolvedora = tb_desenvolvedora.id_desenvolvedora

