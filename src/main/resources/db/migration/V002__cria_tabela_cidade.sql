create table cidade (
	id bigint not null auto_increment,
	nome_cidade varchar(80) not null,
	nome_estado varchar(80) not null,
primary key (id)
) engine=InnoDB default charset=utf8;

#insert into cidade (nome_cidade, nome_estado) values ('São Luís', 'Maranhão'), ('Teresina', 'Piauí'), ('Fortaleza', 'Ceará');