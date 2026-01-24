create table produto (
    id_produto serial primary key,
    produto varchar(50) not null,
    qtd int not null check(qtd>0)
)