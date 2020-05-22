########## Cozinha ##########
insert into cozinha (nome) values ('Tailandesa');
insert into cozinha (nome) values ('Indianaaaa');
insert into cozinha (nome) values ('Japoneza');
insert into cozinha (nome) values ('Brasileira');

########## Formas de Pagamento ##########
insert into forma_pagamento (id, nome) values (1, 'Dinheiro'), (2, 'Cartão Débito'), (3, 'Cartão Crédito'), (4, 'Cheque');

###########  Estado ##########
insert into estado (id, nome) values (1, 'Maranhão'), (2, 'Piauí'), (3, 'Tocantins'), (4, 'Pará'),(5, 'Ceará');

###########  Cidade ##########
insert into cidade (id, nome, estado_id) values (1, 'São Luís', 1), (2, 'Imperatriz', 1), (3, 'Teresina', 2), (4, 'Belém', 4);

########## Restaurante ##########
insert into restaurante (nome, taxa_frete, cozinha_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro, data_cadastro, data_atualizacao) values ('Thai Gourmet', 10, 1, 1, '38400-999', 'Rua João Pinheiro', '1000', 'Centro', utc_timestamp, utc_timestamp);
insert into restaurante (nome, taxa_frete, cozinha_id, endereco_cidade_id, endereco_cep, endereco_logradouro, endereco_numero, endereco_bairro, data_cadastro, data_atualizacao) values ('Cabana do Sol', 11, 1, 1, '65036330', 'Rua General Luso Torres', '8', 'Vila Ivar Saldanha', utc_timestamp, utc_timestamp);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao ) values ('Barriga Verde', 20.58,1, utc_timestamp, utc_timestamp);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao ) values ('Cheiro Verde', 20.58,2, utc_timestamp, utc_timestamp);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao ) values ('Mateus Delivery', 0,2, utc_timestamp, utc_timestamp);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao ) values ('Choquito Delivery', 0,2, utc_timestamp, utc_timestamp);
insert into restaurante (nome, taxa_frete, cozinha_id, data_cadastro, data_atualizacao ) values ('Vanda Restaurante', 0,2, utc_timestamp, utc_timestamp);

###########  Restaurante/Forma de Pagamento ##########
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 3), (2, 4), (3, 1);

########## Permissao ##########
insert into permissao (nome, descricao) values ('CADASTRO_RESTAURANTE', 'Permite o cadastro do Restaurante');
insert into permissao (nome, descricao) values ('CONSULTA_RESTAURANTE', 'Permite a consulta do Restaurante');
insert into permissao (nome, descricao) values ('CADASTRO_COZINHA', 'Permite o cadastro da cozinha');
insert into permissao (nome, descricao) values ('CONSULTA_COZINHA', 'Permite a consulta da cozinha');

########## Produtos ##########
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
insert into produto (nome, descricao, preco, ativo, restaurante_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);




