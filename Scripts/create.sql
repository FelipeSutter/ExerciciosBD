create database atividade1;

create table autor(
	id_autor int primary key auto_increment not null,
	nome_autor varchar(45),
	data_nasc_autor date
);

create table cliente(
	id_cliente int primary key auto_increment not null,
	nome_cliente varchar(45),
	data_nasc_cliente date,
	email_cliente varchar(45),
	telefone char(11)
);

create table genero(
	id_genero int primary key auto_increment not null,
	descricao text
);

create table livro(
	id_livro int primary key auto_increment not null,
	titulo_livro varchar(45),
	preco_livro float,
	estoque int,
	editora varchar(45),
	id_genero int,
	foreign key (id_genero) references genero(id_genero)
);

create table escreve(
	id_escreve int primary key auto_increment not null,
	id_autor int,
	id_livro int,
	foreign key (id_autor) references autor(id_autor),
	foreign key (id_livro) references livro(id_livro)
);

create table venda(
	id_venda int primary key auto_increment not null,
	data_venda date,
	id_cliente int,
	foreign key (id_cliente) references cliente(id_cliente)
);

create table itemVenda(
	id_itemVenda int primary key auto_increment not null,
	id_venda int,
	id_livro int,
	quantidade int,
	foreign key (id_venda) references venda(id_venda),
	foreign key (id_livro) references livro(id_livro)
);