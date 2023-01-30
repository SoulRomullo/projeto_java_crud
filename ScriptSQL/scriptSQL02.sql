use dbinfox;

select * from tbusuarios;

insert into tbusuarios (iduser, usuario, fone, login, senha)
values (3,'Leandro Ramos','9999-9999', 'leandro', md5('123'));

select * from tbusuarios;

-- A linha abaixo adiciona uma coluna na tabela
alter table tbusuarios add column perfil varchar(20) not null;

-- a linha abaixo remove uma coluna de uma tabela
alter table tbusuarios drop column perfil;

update tbusuarios set perfil='admin' where iduser=1;
update tbusuarios set perfil='admin' where iduser=2;
update tbusuarios set perfil='user' where iduser=3;

