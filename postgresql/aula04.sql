create schema csv;
set search_path to csv;
create table actividades(
    id serial primary key,
    Data varchar(25),
    DiadaSemana varchar(25),
    Horario varchar(25),
    Topico text
    )
-- importacao no servidor
copy actividades(Data, DiadaSemana, Horario, Topico) from 'C:\Users\VICENTE\Documents\Projecto-DBA\postgresql\csv\actividades_semanal.csv' DELIMITER ';' CSV HEADER;
-- importacao no cliente
\copy actividades(Data, DiadaSemana, Horario, Topico) from 'C:\Users\VICENTE\Documents\Projecto-DBA\postgresql\csv\actividades_semanal.csv' DELIMITER ';' CSV HEADER;





