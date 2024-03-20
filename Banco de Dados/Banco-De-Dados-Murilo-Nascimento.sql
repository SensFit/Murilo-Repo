create database sensfit;

use sensfit;

CREATE TABLE Academias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(110) NOT NULL,
    endereco VARCHAR(250) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);


INSERT INTO Academias (nome, endereco, cidade, estado, telefone, email) 
VALUES ('Academia X', 'Rua da Academia X, 123', 'Ribeirão X', 'São Paulo X', '123456789', 'academiaX@gmail.com'),
		('Academia Y', 'Rua da Academia Y, 456', 'São Y', 'Rio de Janeiro Y', '987654321', 'academiaY@gmail.com'),
		('Academia Z', 'Rua da Academia Z, 789', 'Rio Z', 'Curitiba Z', '555444333', 'academiaZ@gmail.com');

SELECT * FROM Academias;

-- Selecionar academias com um determinado email
SELECT * FROM Academias WHERE email = 'academiaY@gmail.com';

-- Selecionar academias ordenasds pelo nome em ordem alfabétoca
SELECT * FROM Academias ORDER BY nome;

-- TABELA EQUIPAMENTOS 

CREATE TABLE Equipamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    quantidade_disponivel INT NOT NULL,
    academia_id INT,
    qtdVZSUsada INT,
    FOREIGN KEY (academia_id) REFERENCES Academias(id)
);

-- Inserir equipamentos na academia X
INSERT INTO Equipamentos (nome, tipo, quantidade_disponivel, qtdVZSUsada, academia_id) 
VALUES ('Esteira', 'Cardio', 5, 200, 1),
		('Fly', 'Peitoral', 3, 100, 1);

-- Inserir equipamentos na academia Y
INSERT INTO Equipamentos (nome, tipo, quantidade_disponivel, qtdVZSUsada, academia_id) 
VALUES ('Leg Press', 'Inferiores', 7, 100, 2),
		('Elíptico', 'Cardio', 4, 500,2);


SELECT * FROM Equipamentos;

SELECT * FROM Equipamentos WHERE quantidade_disponivel > 5;

SELECT * FROM Equipamentos ORDER BY nome;

DROP TABLE Equipamentos;

-- TABELA DE MANUTENÇÃO PREVENTINA

CREATE TABLE ManutencaoPreventiva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipamento_id INT,
    data_manutencao DATE NOT NULL,
    FOREIGN KEY (equipamento_id) REFERENCES Equipamentos(id)
);

-- Inserir manutenção preventiva para os equipamentos com quantidade de vezes usada maior ou igual a 200
INSERT INTO ManutencaoPreventiva (equipamento_id, data_manutencao)
SELECT id, CURDATE()
FROM Equipamentos
WHERE qtdVZSUsada >= 200;


SELECT * FROM ManutencaoPreventiva;

truncate table ManutencaoPreventiva;

DROP TABLE ManutencaoPreventiva;