create table if not exists Topico(
    id_conteudo serial primary key,
Duracao int not null,
Dia varchar(50) not null,
Data date not null unique,
Conteudos text


)
;