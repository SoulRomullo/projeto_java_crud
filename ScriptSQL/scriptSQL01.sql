-- Comentários 

-- a linha abaixo cria um banco de dados
create database dbinfox;

-- a linha abaixo escolhe o banco de dados
use dbinfox;

-- o bloco de instruções abaixo cria uma tabela
-- Alterando o campo senha para entrar uma senha codificada com a função MD5()
create table tbusuarios(
	iduser int primary key, 
    usuario varchar(50) not null,
    fone varchar(15),
    -- unique verifica se existe um mesmo login cadastrado no banco de dados
    login varchar(15) not null unique,
    senha varchar(32) not null
);
-- o camando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- Create -> insert
insert into tbusuarios(iduser, usuario, fone, login, senha)
values (1, 'Administrador', '9999-9999', 'admin', md5('admin'));
-- a linha abaico exibe os dados da tabela (CRUD)
-- read -> select
select * from tbusuarios;

insert into tbusuarios(iduser, usuario, fone, login, senha)
values(2, 'José de Assis', '9999-9999', 'joseassis', md5('123'));
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3, 'Bill Gates', '9999-9999', 'bill', md5('123'));

-- a linha abaixo modifica dados na tabela (CRUD)
-- update -> update
update tbusuarios set fone='8888-8888' where iduser=2; 

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete -> delete
delete from tbusuarios where iduser=3;

select * from tbusuarios;

create table tbclientes(
	idcli int primary key auto_increment,
    nomecli varchar(50) not null,
    endcli varchar(100),
    fonecli varchar(50) not null,
    emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli, endcli, fonecli, emailcli)
values ('Linus Torvalds', 'Rua Tux, 2015', '9999-9999', 'Linus@gmail.com');

select * from tbclientes;

use dbinfox;

create table tbos(
	os int primary key auto_increment,
    data_os timestamp default current_timestamp,
    equipamento varchar(150) not null,
    defeito varchar(150) not null,
    servico varchar(150),
    tecnico varchar(30),
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos (equipamento, defeito, servico, tecnico, valor, idcli)
values (
	'Notebook', 'Não liga', 'Troca de fonte', 'Zé', 87.50, 1
);

select * from tbusuarios;
select * from tbclientes;
select * from tbos;

-- O código abaixo traz informações de duas tabelas

select 
O.os, equipamento, defeito, servico, valor,
C.nomecli, fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);