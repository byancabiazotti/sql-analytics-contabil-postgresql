-- SQL Analytics Contábil com PostgreSQL
-- Arquivo 03: Sumarização de dados

-- Objetivo:
-- Mostrar diversas métricas por centro de custo.

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
