-- SQL Analytics Contábil com PostgreSQL
-- Arquivo 01: Criação do schema e da tabela

-- Cria o schema no banco de dados
CREATE SCHEMA cap13 AUTHORIZATION dsa;

-- Criação da tabela de lançamentos contábeis
CREATE TABLE cap13.lancamentosdsacontabeis (
    id INT PRIMARY KEY,
    data_lancamento DATE,
    conta_debito VARCHAR(50),
    conta_credito VARCHAR(50),
    valor DECIMAL(15, 2),
    documento VARCHAR(255),
    natureza_operacao VARCHAR(255),
    centro_custo VARCHAR(50),
    impostos TEXT,
    moeda VARCHAR(3),
    taxa_conversao DECIMAL(10, 6) NULL
);
