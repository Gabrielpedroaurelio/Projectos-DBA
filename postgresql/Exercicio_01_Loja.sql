create database loja;
create schema estoque;
create schema faturamento;
create table faturamento.clientes(
    id_cliente serial primary key,
    nome varchar(50) not null,
    email varchar(100) not null unique,
   datanascimento date not null check(EXTRACT(YEAR FROM age(datanascimento))>=18)
    

);
create table estoque.produtos(
    id_produto serial primary key,
    produto varchar(150) not null,
    preco decimal(8,2) not null check(preco<0)

);
create table faturamento.pedidos(
    id_pedido bigserial primary key,
    id_cliente int references faturamento.clientes(id_cliente)
);
create table faturamento.pedido_itens(
    id_pedido_item serial,
    id_pedido int references faturamento.pedidos(id_pedido),
    id_produto int references estoque.produtos(id_produto) ,
    quantidade int check(quantidade>0),
    primary key (id_produto,id_pedido)

);