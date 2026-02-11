Funções agregadas
Função	Descrição	Exemplo
COUNT(coluna)	Conta registros (não-nulos)	COUNT(id)
SUM(coluna)	Soma valores numéricos	SUM(valor_total)
AVG(coluna)	Média de valores	AVG(preco)
MAX(coluna)	Maior valor	MAX(preco)
MIN(coluna)	Menor valor	MIN(preco)


--- EXEMPLO
SELECT COUNT(*) FROM cliente;
SELECT avg(preco) FROM produto;
SELECT max(preco) FROM produto;
SELECT min(preco) FROM produto;
SELECT sum(preco) FROM produto;
-- group  by
SELECT c.nome AS cliente, COUNT(p.id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.id
GROUP BY c.nome
ORDER BY total_pedidos DESC;