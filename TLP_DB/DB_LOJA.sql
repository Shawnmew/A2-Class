create database loja;
use loja;
create table Cliente(
		ID int Primary Key,
        Nome varchar(30),
        morada varchar(30),
        idade int,
        genero char,
        email varchar(100)
        );
Create table encomenda(
	Id int primary key,
    estado varchar(45),
    valor float,
    data date null
    );
    
Create table Produto(
id_produto int primary key auto_increment,
nome varchar (50) not null,
descricao text,
preco float,
qtd int
);

alter table encomenda add id_cliente int references cliente (id);
Drop tables produto, encomenda;

insert into cliente(ID, nome, morada, idade, genero) values (69, 'Antonio', 'Viana', null, 'M');
insert into cliente(ID, nome, morada, idade, genero) values (45, 'Joao', 'Viana', 18, 'M');
insert into cliente(ID, nome, morada, idade, genero) values (142, 'Ana', 'Viana', 22, 'F');
insert into cliente(ID, nome, morada, idade, genero) values (18, 'Manuel', 'Cazenga', 23, 'M');
select * from cliente;

update cliente set email = 'ana@email.com' where id =142;
update cliente set email = 'joao@email.com' where id =45;
update cliente set email = 'antonio@email.com' where id =69;
update cliente set email = 'manuel@email.com' where id =18;

insert into encomenda(id, id_cliente, estado, valor) values
	(100, 69, 'Pendente', 15000),
    (101, 18, 'Em Processamento', 30000),
    (102, 142, 'Cancelada', 12500),
    (103, 18, 'Processada', 500),
    (104, 18, 'Processada', 18500),
    (105, 142, 'Processada', 20000),
    (106, 142, 'Em Processamento', 55000);
    
    alter table encomenda add foreign key (id_cliente) references cliente(id);
    select * from encomenda;
    select * from produto;
    describe encomenda;
    describe produto;
    update encomenda set valor = 5000 where id=103;
    alter table produto modify preco float;
    
    create table ProdutosEncomendas(
				id int auto_increment,
                primary key(id),
                descriçao varchar (100),
                idproduto int,
                idencomenda int,
                foreign key (idproduto) references produto(id_produto),
                foreign key (idencomenda) references encomenda(id),
                qtd int,
                valor int
                );
                
                insert into produto(id_produto, nome, descricao, preco, qtd)
                values
                (1, 'Coca-cola', 'refri', 500, 2000),
                (2, 'Agua', 'agua', 1000, 4000),
                (3, 'Vinho', 'ALC', 100, 400),
                (4, 'Camiseta basica', 'camiseta basica de algudao basico para uso diario', 29.99, 800),
                (5, 'Calça Jeans', 'Calça Jeans de corte recto e lavagem clara', 99.99, 9),
                (6, 'tenis desportivo', 'tenis desportivo leve e confortavel para corrida', 79.99, 10),
                (7, 'relogio de pulso', 'relogio analogico de pulso com pulseira de couro', 99.99, 14),
                (8, 'mochila escolar', 'mochila resistente com multiplos compartimentos', 39.99, 33),
                (9, 'oculos de sol', 'oculos de sol com protecao uve armaçao de acetato', 59.99, 23);
                
                insert into ProdutosEncomendas(descriçao, idproduto, idencomenda, qtd*valor)
                values
					('Coca',1,100,10*500),
                    ('Agua',2,100,10*1000),
                    ('Vinho',3,101,200*100),
                    ('Agua',1,101,10*100),
                    ('Tenis',6,102,70*79.99),
                    ('Relogio',7,102,69*99.99),
                    ('Vinho',3,103,50*100),
                    ('Agua',2,104,18*1000),
                    ('Relogio',7,104,5*99.99),
                    ('Vinho',3,105,100*100),
                    ('Coca',1,105,20*59*500),
                    ('Oculos',9,106,200*59.99),
                    ('Relogios',7,106,500*99.99),
                    ('Mochila',8,106,76*39.99);
                    
                    update ProdutosEncomendas set valor=500*99.99 where id='13';
				alter table ProdutosEncomendas modify valor float;
                select * from ProdutosEncomendas;