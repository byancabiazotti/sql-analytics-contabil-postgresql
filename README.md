# SQL Analytics Contábil com PostgreSQL

## Descrição

Projeto desenvolvido em PostgreSQL com foco em análise de dados contábeis utilizando SQL para Data Analytics e Data Science.

O projeto simula um ambiente contábil real através da criação de:

- schema
- tabela contábil
- stored procedure para geração automática de dados
- consultas analíticas
- sumarização estatística
- distribuição de dados
- métricas financeiras

---

# Tecnologias Utilizadas

- PostgreSQL
- SQL
- pgAdmin

---

# Objetivo do Projeto

O objetivo deste projeto é demonstrar conhecimentos em:

- modelagem de dados
- análise estatística com SQL
- agregações
- análise financeira
- consultas analíticas
- manipulação de dados contábeis
- geração automatizada de dados

---

# Estrutura do Projeto

```text
sql-analytics-contabil-postgresql/
│
├── README.md
├── 01_criacao_schema_tabela.sql
├── 02_procedure_carga_dados.sql
├── 03_sumarizacao_dados.sql
├── 04_distribuicao_dados.sql
└── imagens/
```

---

# Criação do Schema

```sql
CREATE SCHEMA cap13 AUTHORIZATION dsa;
```

---

# Query de Sumarização de Dados

A query abaixo realiza análises agregadas por centro de custo.

## Métricas Calculadas

- quantidade de lançamentos
- soma total de valores
- média dos lançamentos
- maior valor
- menor valor
- soma por moeda
- média da taxa de conversão
- mediana

```sql
SELECT
    centro_custo,
    COUNT(*) AS contagem_lancamentos,
    SUM(valor) AS total_valores_lancamentos,
    ROUND(AVG(valor), 2) AS media_valores_lancamentos,
    MAX(valor) AS maior_valor,
    MIN(valor) AS menor_valor,
    SUM(CASE WHEN moeda = 'USD' THEN valor ELSE 0 END) AS soma_valores_usd,
    SUM(CASE WHEN moeda = 'EUR' THEN valor ELSE 0 END) AS soma_valores_eur,
    SUM(CASE WHEN moeda = 'BRL' THEN valor ELSE 0 END) AS soma_valores_brl,
    ROUND(AVG(CASE WHEN taxa_conversao IS NOT NULL THEN taxa_conversao ELSE 0 END), 2) AS media_taxa_conversao,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY valor) AS mediana_valores
FROM
    cap13.lancamentosdsacontabeis
GROUP BY
    centro_custo
ORDER BY
    total_valores_lancamentos DESC;
```

---

# Query de Distribuição Estatística

A query abaixo realiza análises estatísticas dos lançamentos financeiros.

## Métricas Estatísticas

- média
- desvio padrão
- menor valor
- maior valor
- primeiro quartil
- mediana
- terceiro quartil

```sql
SELECT
    centro_custo,
    moeda,
    COUNT(*) AS quantidade_lancamentos,
    ROUND(AVG(valor)::NUMERIC, 2) AS media_valor,
    ROUND(STDDEV(valor)::NUMERIC, 2) AS desvio_padrao_valor,
    MIN(valor) AS menor_valor,
    MAX(valor) AS maior_valor,
    ROUND((PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY valor))::NUMERIC, 2) AS primeiro_quartil,
    ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY valor))::NUMERIC, 2) AS mediana,
    ROUND((PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY valor))::NUMERIC, 2) AS terceiro_quartil
FROM
    cap13.lancamentosdsacontabeis
GROUP BY
    centro_custo, moeda
ORDER BY
    centro_custo, moeda;
```

---

# Conceitos Aplicados

- SUM()
- AVG()
- COUNT()
- MIN()
- MAX()
- STDDEV()
- PERCENTILE_CONT()
- CASE WHEN
- GROUP BY
- ORDER BY
- ROUND()
- tratamento de valores NULL

---

# Resultados Esperados

O projeto permite:

- analisar distribuição financeira
- identificar dispersão de valores
- comparar centros de custo
- analisar moedas diferentes
- calcular métricas estatísticas
- simular análises contábeis reais

---

# Autor

Byanca Romão Biazotti
