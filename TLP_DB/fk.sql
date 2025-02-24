create database itel;
drop database itel;
 use itel;
 create table alunos(
		id int primary key auto_increment,
        p_nome varchar(30) not null,
        u_nome varchar(30) not null,
        provincia varchar(30) default 'luanda',
        bairro varchar(30),
        idade int,
        genero char,
        bi varchar(13) unique
);

alter table alunos add email varchar(25);

create table notas(
	id int primary key,
    nota int,
	idalunos int,
    foreign key(idalunos) references alunos(id)
);

alter table alunos modify genero varchar(10);
alter table alunos drop email;


insert into alunos(id,u_nome,p_nome,provincia,bairro,idade,genero,bi)values(1,'tumba','paulo','zaire','kitona',17,'f','123');
insert into alunos(p_nome,u_nome,idade,genero,bi)values('Makiese','Lutonda',15,'f','234'),('Ruth','Kimbele',30,'f','345');

select * from alunos;

update alunos set genero = 'm' where id = 1;
delete from alunos where id = 1;






describe alunos;
describe notas;

drop table alunos;
drop table notas;        
