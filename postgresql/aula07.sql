--SUBQUERIES e CTEs
Subqueries (consultas aninhadas)
Uma subquery é uma query dentro de outra.
Pode aparecer em SELECT, FROM ou WHERE.

a) Subquery no WHERE
-- Listar clientes que já fizeram algum pedido
SELECT nome
FROM clientes
WHERE id IN (
    SELECT cliente_id
    FROM pedidos
);
b) Subquery no SELECT
-- Mostrar clientes e quantidade de pedidos de cada um
SELECT nome,
       (SELECT COUNT(*) FROM pedidos p WHERE p.cliente_id = c.id) AS total_pedidos
FROM clientes c;
-- Valor total de cada pedido
SELECT pedido_id, SUM(valor_total) AS total
FROM (
    SELECT pi.pedido_id, pr.preco * pi.quantidade AS valor_total
    FROM pedido_itens pi
    JOIN produtos pr ON pi.produto_id = pr.id
) AS sub
GROUP BY pedido_id;

--CTE (Common Table Expression – WITH)
WITH cria uma tabela temporária dentro da query.

Facilita leitura e manutenção de queries complexas.

Exemplo 1: Valor total por pedido

WITH pedido_valor AS (
    SELECT pi.pedido_id, SUM(pr.preco * pi.quantidade) AS total
    FROM pedido_itens pi
    JOIN produtos pr ON pi.produto_id = pr.id
    GROUP BY pi.pedido_id
)
SELECT pv.pedido_id, pv.total, c.nome AS cliente
FROM pedido_valor pv
JOIN pedidos p ON pv.pedido_id = p.id
JOIN clientes c ON p.cliente_id = c.id
ORDER BY pv.total DESC;