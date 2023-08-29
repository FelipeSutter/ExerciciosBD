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
	
	