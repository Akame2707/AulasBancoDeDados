CREATE TABLE Reinos (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome INT NOT NULL,
    climaPredominante VARCHAR(150) NOT NULL,
    moedaLocal DECIMAL(10,2) NOT NULL,
    codigo INT NOT NULL
);

CREATE TABLE Heroi_Nucleo_Vital (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    Lv INT NOT NULL,
    classe VARCHAR(150) NOT NULL, 
    fk_Reinos_id INT NOT NULL,
    HP_Max INT NOT NULL,
    MP_Max INT NOT NULL,
    Estamina INT NOT NULL
);

CREATE TABLE Missao (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    recompensa DECIMAL(10,2) NOT NULL
);

CREATE TABLE Realizar (
    fk_Missao_id INT NOT NULL,
    fk_Heroi_Nucleo_Vital_id INT NOT NULL
);
 
ALTER TABLE Heroi_Nucleo_Vital ADD CONSTRAINT FK_Heroi_Nucleo_Vital_2
    FOREIGN KEY (fk_Reinos_id)
    REFERENCES Reinos (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Realizar ADD CONSTRAINT FK_Realizar_1
    FOREIGN KEY (fk_Missao_id)
    REFERENCES Missao (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Realizar ADD CONSTRAINT FK_Realizar_2
    FOREIGN KEY (fk_Heroi_Nucleo_Vital_id)
    REFERENCES Heroi_Nucleo_Vital (id)
    ON DELETE RESTRICT;

ALTER TABLE Reinos
MODIFY COLUMN nome VARCHAR(150) NOT NULL;

INSERT INTO Reinos (id, nome, climaPredominante, moedaLocal, codigo)
VALUES
(1, 'Ruínas', 'Frio e úmido', 10.00, 101),
(2, 'Snowdin', 'Neve e frio intenso', 15.00, 102),
(3, 'Cachoeira', 'Úmido e chuvoso', 20.00, 103),
(4, 'Hotland', 'Quente e vulcânico', 25.00, 104),
(5, 'Nova Casa', 'Temperado e tranquilo', 30.00, 105),
(6, 'Núcleo', 'Calor extremo', 35.00, 106);

INSERT INTO Heroi_Nucleo_Vital
(id, nome, Lv, classe, fk_Reinos_id, HP_Max, MP_Max, Estamina)
VALUES
(1, 'Frisk', 1, 'Humano Pacifista', 1, 20, 50, 100),
(2, 'Sans', 19, 'Esqueleto Mago', 2,  1, 999, 80),
(3, 'Papyrus', 8, 'Cavaleiro Esqueleto', 2, 120, 60, 100),
(4, 'Undyne', 15, 'Guerreira Real', 3, 180, 80, 150),
(5, 'Alphys', 10, 'Cientista', 4, 70, 150, 60),
(6, 'Toriel', 12, 'Maga Guardiã', 1, 200, 180, 100),
(7, 'Asgore', 20, 'Rei Guerreiro', 5, 300, 200, 180),
(8, 'Mettaton', 14, 'Ídolo Mecânico', 4, 160, 120, 130),
(9, 'Asriel', 20, 'Príncipe Mágico', 5, 250, 300, 200),
(10, 'Chara', 20, 'Humano Misterioso', 6, 150, 100, 160);

INSERT INTO Missao (id, titulo, recompensa)
VALUES
(1, 'O Despertar nas Ruínas', 100.00),
(2, 'O Enigma das Placas Antigas', 150.00),
(3, 'O Jardim de Toriel', 120.00),
(4, 'A Travessia de Snowdin', 200.00),
(5, 'O Desafio de Papyrus', 180.00),
(6, 'O Atalho de Sans', 250.00),
(7, 'A Floresta Congelada', 220.00),
(8, 'O Eco da Cachoeira', 260.00),
(9, 'A Lança de Undyne', 350.00),
(10, 'O Segredo dos Ecos', 280.00),
(11, 'O Laboratório de Alphys', 300.00),
(12, 'O Show de Mettaton', 320.00),
(13, 'A Fuga de Hotland', 400.00),
(14, 'O Caminho do Núcleo', 450.00),
(15, 'A Energia Perdida', 380.00),
(16, 'O Castelo de Asgore', 500.00),
(17, 'A Flor Misteriosa', 420.00),
(18, 'A Memória de Asriel', 550.00),
(19, 'O Julgamento das Almas', 600.00),
(20, 'A Escolha do Destino', 1000.00);

INSERT INTO Realizar (fk_Missao_id, fk_Heroi_Nucleo_Vital_id)
VALUES
-- Frisk
(1, 1),
(2, 1),
(3, 1),
(8, 1),
(19, 1),
(20, 1),

-- Sans
(6, 2),
(10, 2),
(19, 2),

-- Papyrus
(4, 3),
(5, 3),
(7, 3),

-- Undyne
(8, 4),
(9, 4),
(14, 4),

-- Alphys
(11, 5),
(13, 5),
(15, 5),

-- Toriel
(1, 6),
(2, 6),
(3, 6),

-- Asgore
(16, 7),
(19, 7),
(20, 7),

-- Mettaton
(12, 8),
(13, 8),

-- Asriel
(17, 9),
(18, 9),
(20, 9),

-- Chara
(14, 10),
(19, 10),
(20, 10);

SELECT
    h.nome AS heroi,
    h.Lv,
    h.classe,
    r.nome AS reino
FROM Heroi_Nucleo_Vital h
INNER JOIN Reinos r
    ON h.fk_Reinos_id = r.id;

SELECT
    h.nome AS heroi,
    m.titulo AS missao,
    m.recompensa
FROM Realizar r
INNER JOIN Heroi_Nucleo_Vital h
    ON r.fk_Heroi_Nucleo_Vital_id = h.id
INNER JOIN Missao m
    ON r.fk_Missao_id = m.id
ORDER BY h.nome, m.id;

SELECT 'Reinos' AS tabela, COUNT(*) AS total FROM Reinos
UNION ALL
SELECT 'Herois', COUNT(*) FROM Heroi_Nucleo_Vital
UNION ALL
SELECT 'Missoes', COUNT(*) FROM Missao
UNION ALL
SELECT 'Realizar', COUNT(*) FROM Realizar;