VOCABULÁRIO DO DIA
🔹 ROW_NUMBER
📘 Inglês: número da linha
📘 Português: numeração sequencial de linhas

👉 Dá um número único para cada linha do resultado.

🔹 WINDOW FUNCTION
📘 Inglês: função de janela
📘 Português (conceito):

Função que calcula valores sem agrupar os dados

📌 Diferente de GROUP BY.

🔹 OVER
📘 Inglês: sobre
📘 Português (conceito):

Define como a função vai olhar os dados

🔹 PARTITION BY
📘 Inglês: partição
📘 Português:

Dividir em grupos sem juntar linhas

🔹 ORDER BY
📘 Inglês: ordenar por
📘 Português:

Define a ordem para o cálculo

-- Exersicio
CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    vendedor TEXT,
    valor NUMERIC
);
INSERT INTO vendas (vendedor, valor) VALUES
('Ana', 300),
('Ana', 150),
('Bruno', 200),
('Bruno', 200),
('Carlos', 100);
SELECT
    vendedor,
    valor,
    ROW_NUMBER() OVER (ORDER BY valor DESC) AS numero_linha
FROM vendas;
SELECT
    vendedor,
    valor,
    ROW_NUMBER() OVER (
        PARTITION BY vendedor
        ORDER BY valor DESC
    ) AS numero_linha
FROM vendas;