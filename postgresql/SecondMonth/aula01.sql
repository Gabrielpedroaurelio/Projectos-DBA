Ideia-chave do dia:

UNION

Junta resultados

Remove duplicados

Mais lento

UNION ALL

Junta resultados

Não remove duplicados

Muito mais rápido

📌 Regra de ouro:

Se você não precisa remover duplicados, use UNION ALL.



CREATE TABLE vendas_2024 (
    id SERIAL PRIMARY KEY,
    cliente TEXT,
    valor NUMERIC
);

CREATE TABLE vendas_2025 (
    id SERIAL PRIMARY KEY,
    cliente TEXT,
    valor NUMERIC
);

INSERT INTO vendas_2024 (cliente, valor) VALUES
('Ana', 100),
('Bruno', 200),
('Carlos', 150);

INSERT INTO vendas_2025 (cliente, valor) VALUES
('Ana', 100),
('Daniel', 300),
('Carlos', 150);
-- Mais rápido 
set search_path to fevereiro;
SELECT cliente, valor FROM vendas_2024
UNION all
SELECT cliente, valor FROM vendas_2025;
set search_path to fevereiro;
-- Mais lento pos realiza um remorçao de duplicata
SELECT cliente, valor FROM vendas_2024
UNION 
SELECT cliente, valor FROM vendas_2025;


