INTERSECT: Retorna somente os registros que aparecem nos dois SELECTs
EXCEPT:Retorna os registros do primeiro SELECT que não existem no segundo
DISTINCT:(UNICO) REMOVE VALORES DUBLICADOS

IMPORTANTE:
INTERSECT e EXCEPT sempre removem duplicados, igual ao UNION.

SELECT cliente FROM vendas_2024;
SELECT cliente FROM vendas_2025;


SELECT cliente FROM vendas_2024
INTERSECT
SELECT cliente FROM vendas_2025;


SELECT cliente FROM vendas_2024
EXCEPT
SELECT cliente FROM vendas_2025;