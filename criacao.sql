/////////////1////////////////

CREATE DATABASE sistema_eventos;

CREATE TABLE Cidade (
    cod_cidade INT PRIMARY KEY,
    nome VARCHAR(50),
    uf VARCHAR(2)
);

CREATE TABLE Aluno (
    cd_aluno INT PRIMARY KEY,
    cod_cidade INT,
    cpf VARCHAR(11),
    nome VARCHAR(50),
    endereco VARCHAR(50),
    nome_cracha VARCHAR(40),
    cep VARCHAR(8),
    fone_fax VARCHAR(15),
    e_mail VARCHAR(50),
    setor VARCHAR(30),
    interesse VARCHAR(50),
    FOREIGN KEY (cod_cidade) REFERENCES Cidade(cod_cidade)
);

CREATE TABLE Evento (
    cod_evento INT PRIMARY KEY,
    cod_cidade INT,
    nome_evento VARCHAR(50),
    data_evento DATE,
    FOREIGN KEY (cod_cidade) REFERENCES Cidade(cod_cidade)
);

CREATE TABLE Presenca (
    cd_aluno INT,
    cod_cidade INT,
    cod_evento INT,
    hr_inicial TIME,
    hr_final TIME,
    PRIMARY KEY (cd_aluno, cod_cidade, cod_evento),
    FOREIGN KEY (cd_aluno) REFERENCES Aluno(cd_aluno),
    FOREIGN KEY (cod_cidade) REFERENCES Cidade(cod_cidade),
    FOREIGN KEY (cod_evento) REFERENCES Evento(cod_evento)
);



/////////////2////////////////

INSERT INTO Cidade (cod_cidade, nome, uf) VALUES
(1, 'Florianópolis', 'SC'),
(2, 'São José', 'SC'),
(3, 'Palhoça', 'SC'),
(4, 'Biguaçu', 'SC'),
(5, 'Santo Amaro', 'SC'),
(6, 'Curitiba', 'PR'),
(7, 'São Paulo', 'SP'),
(8, 'Rio de Janeiro', 'RJ'),
(9, 'Porto Alegre', 'RS'),
(10, 'Blumenau', 'SC');

INSERT INTO Aluno (cd_aluno, cod_cidade, cpf, nome, endereco, nome_cracha, cep, fone_fax, e_mail, setor, interesse) VALUES
(101, 1, '11111111111', 'Lewis Hamilton', 'Av. Beira Mar', 'Hamilton', '88010100', '48999991', 'lewis@mercedes.com', 'Back-end', 'Java, Spring'),
(102, 2, '22222222222', 'Max Verstappen', 'Rua das Dunas', 'Max', '88101200', '48999992', 'max@redbull.com', 'DevOps', 'Kubernetes, AWS'),
(103, 3, '33333333333', 'Lando Norris', 'Passeio Pedra Branca', 'Lando', '88137000', '48999993', 'lando@mclaren.com', 'Front-end', 'React, Next.js'),
(104, 1, '44444444444', 'Charles Leclerc', 'Jurerê Internacional', 'Leclerc', '88050100', '48999994', 'charles@ferrari.com', 'Full-Stack', 'Python, Django'),
(105, 2, '55555555555', 'Carlos Sainz', 'Av. Presidente Kennedy', 'Sainz', '88102300', '48999995', 'carlos@ferrari.com', 'Data Science', 'Python, IA'),
(106, 3, '66666666666', 'Oscar Piastri', 'Rua da Praia', 'Piastri', '88130000', '48999996', 'oscar@mclaren.com', 'Mobile', 'React Native'),
(107, 4, '77777777777', 'George Russell', 'Centro', 'Russell', '88160000', '48999997', 'george@mercedes.com', 'Back-end', 'C#, .NET'),
(108, 5, '88888888888', 'Fernando Alonso', 'Rua da Cachoeira', 'Alonso', '88140000', '48999998', 'alonso@aston.com', 'QA', 'Cypress, Testes'),
(109, 7, '99999999999', 'Ayrton Senna', 'Av. Paulista', 'Senna', '01311000', '11999999', 'senna@brasil.com', 'Embedded', 'C++, Arduino'),
(110, 6, '00000000000', 'Michael Schumacher', 'Jardim Botânico', 'Schumi', '80210000', '41999999', 'schumi@ferrari.com', 'DBA', 'PostgreSQL');

INSERT INTO Evento (cod_evento, cod_cidade, nome_evento, data_evento) VALUES
(1, 1, 'DevConf Floripa', '2025-11-20'),
(2, 2, 'Python Meetup SJ', '2025-11-25'),
(3, 3, 'Java Day Palhoça', '2025-12-01'),
(4, 1, 'React Avançado', '2025-12-05'),
(5, 7, 'Cloud Summit SP', '2025-12-10'),
(6, 3, 'SQL Básico Pedra Branca', '2025-11-18'),
(7, 2, 'Workshop Docker', '2025-11-22'),
(8, 1, 'IA Hackathon', '2025-11-30'),
(9, 6, 'Front-end PR', '2025-12-02'),
(10, 10, 'Oktobertech Blumenau', '2025-10-15');

INSERT INTO Presenca (cd_aluno, cod_cidade, cod_evento, hr_inicial, hr_final) VALUES
(101, 1, 1, '09:00:00', '18:00:00'),
(103, 3, 3, '10:00:00', '17:00:00'),
(102, 2, 2, '19:00:00', '21:00:00'),
(101, 1, 4, '14:00:00', '18:00:00'),
(105, 7, 5, '08:00:00', '17:00:00'),
(110, 3, 6, '09:30:00', '11:30:00'),
(102, 2, 7, '18:30:00', '22:00:00'),
(105, 1, 8, '09:00:00', '16:00:00'),
(103, 1, 1, '09:00:00', '17:00:00'),
(104, 1, 1, '09:00:00', '18:00:00');



/////////////3////////////////

/*
-------------------------------------------------------------
-- PERGUNTAS E RESPOSTAS (NÍVEL BÁSICO/SIMPLES)
-------------------------------------------------------------

/*
-- PERGUNTA 1: (COUNT + WHERE)
-- Quantos alunos moram em São José (cod_cidade = 2)?
*/

-- COMANDO SQL:
SELECT COUNT(*)
FROM Aluno
WHERE cod_cidade = 2;

/*
-- RESPOSTA:
2
*/

---
---

/*
-- PERGUNTA 2: (WHERE + EXTRACT)
-- Quais eventos (nome) acontecerão em Dezembro de 2025?
*/

-- COMANDO SQL:
SELECT nome_evento
FROM Evento
WHERE EXTRACT(MONTH FROM data_evento) = 12;

/*
-- RESPOSTA:
Java Day Palhoça
React Avançado
Cloud Summit SP
Front-end PR
*/

---
---

/*
-- PERGUNTA 3: (SELECT + WHERE)
-- Qual é o nome e o e-mail do aluno cujo código é 108?
*/

-- COMANDO SQL:
SELECT nome, e_mail
FROM Aluno
WHERE cd_aluno = 108;

/*
-- RESPOSTA:
Fernando Alonso | alonso@aston.com
*/

---
---

/*
-- PERGUNTA 4: (WHERE + OR)
-- Quais alunos (nome) têm interesse em 'React Native' OU 'C#, .NET'?
*/

-- COMANDO SQL:
SELECT nome
FROM Aluno
WHERE interesse = 'React Native' OR interesse = 'C#, .NET';

/*
-- RESPOSTA:
Oscar Piastri
George Russell
*/

---
---

/*
-- PERGUNTA 5: (JOIN + WHERE)
-- Em quais eventos (nome) o aluno 'Max Verstappen' (cd_aluno = 102) esteve presente?
*/

-- COMANDO SQL:
SELECT E.nome_evento
FROM Evento E
JOIN Presenca P ON E.cod_evento = P.cod_evento
WHERE P.cd_aluno = 102;

/*
-- RESPOSTA:
Python Meetup SJ
Workshop Docker
*/