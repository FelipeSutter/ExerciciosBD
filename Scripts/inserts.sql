-- Insert da tabela autor

insert into autor (nome_autor,data_nasc_autor)
values
	('Jorge Amado', '19820810'),
	('Machado de Assis', '18390621'),
	('Paulo Coelho', '19470824'),
	('Clarice Lispector', '19201210'),
	('Abraham Silberschatz', '19540203'),
	('Henry F. Korth S.', '19650130'),
	('S. Sudarshan', '19671011'),
	('Peter Baer Galvin', '19600923'),
	('Greg Gagne', '19750415');

-- Insert da tabela genero

insert into genero (descricao) 
values
	('Romance'),
	('Ficção'),
	('Drama'),
	('Suspense'),
	('Infanto-Juvenil'),
	('Técnico');

-- Insert da tabela Livro

insert into livro(id_livro,titulo_livro,preco_livro,estoque,editora,id_genero)
values
	(135, 'O Alquimista', '13.90' ,25, 'Planeta', 2),
	(234, 'Onze Minutos', '11.90' ,0, 'Pergaminho', 3),
	(345, 'Manuscrito Encontrado em Accra', '24.99' ,31, 'Sextante', 2),
	(421, 'A Hora da Estrela', '13.80' ,12, 'Rocco', 1),
	(567, 'Água Viva', '15.90' ,0, 'Rocco', 1),
	(236, 'O mistério do coelho pensante e outros contos', '26.40' ,20, 'Rocco', 5),
	(622, 'Gabriela, Cravo e Canela', '17.00' ,15, 'Companhia das Letras', 1),
	(715, 'Dom Casmurro', '15.00' ,45, 'Globo Editora', 1),
	(368, 'Sistema de Banco de Dados, 6e', '219.90' ,48, 'Elsevier', 6),
	(123, 'Sistemas Operacionais com Java', '101.99' ,27, 'Elsevier', 6),
	(908, 'Sistema de Banco de Dados', '86.50' ,15, 'Elsevier', 6),
	(775, 'Fundamentos de Sistemas Operacionais', '130.15' ,25, 'LTC', 6);
	

-- Insert da tabela escreve

INSERT INTO escreve (id_autor, id_livro) 
VALUES
	(3, 135), 
	(3, 234), 
	(3, 345), 
	(4, 421), 
	(4, 567), 
	(4, 236), 
	(1, 622), 
	(2, 715),
	(5, 368), 
	(6, 368), 
	(7, 368), 
	(5, 123), 
	(8, 123), 
	(9, 123), 
	(5, 908), 
	(6, 908),
	(7, 908), 
	(5, 775), 
	(8, 775), 
	(9, 775);

-- Insert da tabela cliente

INSERT INTO cliente (id_cliente, nome_cliente, data_nasc_cliente, email_cliente, telefone) 
VALUES
	(1, 'Ana Souza', '1972-06-10', 'anass@uul.com.br', '24932321178'),
	(2, 'Camila Silva', '1982-10-31', 'csilva@doc.com.br', '24923234455'),
	(3, 'Paulo Matos', '1967-08-24', NULL, '24933115678'),
	(4, 'Vicente Castro', '1975-12-05', NULL, NULL),
	(5, 'Viviane Batista', '1995-08-15', NULL, '24944221234'),
	(6, 'Cinthia Silva', '1998-05-27', 'cinthia_s@dcc.br', NULL),
	(7, 'Mateus Nunes', '1994-04-04', NULL, '24922235678');

-- Insert da tabela venda

INSERT INTO venda (id_venda, data_venda, id_cliente) 
VALUES
	(1, '2014-06-23', 4),
	(2, '2014-07-05', 2),
	(3, '2014-08-10', 3),
	(4, '2014-08-20', 1),
	(5, '2014-08-23', 7),
	(6, '2014-09-02', 5),
	(7, '2014-09-11', 6),
	(8, '2014-09-11', 3),
	(9, '2014-09-20', 7);

-- Insert da tabela itemVenda

INSERT INTO itemVenda (id_venda, id_livro, quantidade) 
VALUES
	(1, 135, 1),
	(1, 234, 2),
	(2, 345, 1),
	(3, 622, 2),
	(4, 715, 3),
	(5, 368, 1),
	(5, 123, 1),
	(5, 908, 1),
	(6, 908, 1),
	(6, 775, 2),
	(7, 135, 2),
	(7, 421, 1),
	(7, 123, 1),
	(7, 368, 1),
	(8, 421, 1),
	(9, 135, 1),
	(9, 715, 1);

	