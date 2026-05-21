-- SQL Analytics Contábil com PostgreSQL
-- Arquivo 04: Distribuição estatística dos dados

-- Objetivo:
-- Mostrar a distribuição dos valores por centro de custo e moeda.

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
