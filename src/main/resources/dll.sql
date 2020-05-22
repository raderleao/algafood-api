create table forma_pagamento (
	id bigint not null auto_increment, 
	nome varchar(60) not null,
	primary key (id)
 ) engine=InnoDB charset=utf8;
 
create table grupo (
	id bigint not null auto_increment, 
	nome varchar(80) not null, 
	primary key (id)
) engine=InnoDB charset=utf8;

create table grupo_permissao (
	grupo_id bigint not null, 
    permissao_id bigint not null
) engine=InnoDB charset=utf8;

create table permissao (
	id bigint not null auto_increment, 
    descricao varchar(80), 
    nome varchar(80), 
    primary key (id)
) engine=InnoDB charset=utf8;

create table produto (
	id bigint not null auto_increment, 
    ativo bit not null, 
    descricao varchar(80) not null, 
    nome varchar(80) not null, 
    preco decimal(19,2) not null, 
    restaurante_id bigint, 
    primary key (id)
) engine=InnoDB charset=utf8;

create table restaurante (
	id bigint not null auto_increment, 
    data_atualizacao datetime not null, 
    data_cadastro datetime not null, 
    endereco_bairro varchar(80), 
    endereco_cep varchar(30), 
    endereco_complemento varchar(60), 
    endereco_logradouro varchar(80), 
    endereco_numero varchar(20),
    nome varchar(60) not null, 
    taxa_frete decimal(10,2) not null, 
    cozinha_id bigint not null, 
    endereco_cidade_id bigint, primary key (id)
) engine=InnoDB charset=utf8;

create table restaurante_forma_pagamento (
	restaurante_id bigint not null, 
    forma_pagamento_id bigint not null
) engine=InnoDB charset=utf8;

create table usuario (
	id bigint not null auto_increment, 
    data_cadastro datetime not null, 
    email varchar(120) not null, 
    nome varchar(80) not null, 
    senha varchar(150) not null, 
    primary key (id)
) engine=InnoDB charset=utf8;

alter table cidade add constraint FKcidade_estado foreign key (estado_id) references estado (id);
alter table grupo_permissao add constraint FKgrupopermissaoId foreign key (permissao_id) references grupo (id);
alter table grupo_permissao add constraint FKpermissaogrupoId foreign key (grupo_id) references usuario (id);
alter table produto add constraint FKproduto_restauranteId foreign key (restaurante_id) references restaurante (id);
alter table restaurante add constraint FKrestaurante_cozinhaId foreign key (cozinha_id) references cozinha (id);
alter table restaurante add constraint FKrestaurante_enderecoId foreign key (endereco_cidade_id) references cidade (id);
alter table restaurante_forma_pagamento add constraint FKrestaurante_formaPagamentoId foreign key (forma_pagamento_id) references forma_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKformaPagamento_restauranteId foreign key (restaurante_id) references restaurante (id);

