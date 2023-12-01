-- 1. (2,0 pontos) Crie um usuário que possa realizar todas as operações de DML nas 
-- tabelas cliente, venda e itemvenda.

create user new_user@localhost;

grant insert, update, delete
on table livraria.cliente, livraria.venda, livraria.itemvenda
to new_user@localhost;

-- 2. (2,0 pontos) Faça uma consulta para encontrar o nome dos clientes que compraram mais
-- livros do mesmo autor do livro “Pequeno Pincipe” ordenando o resultado pelo nome.

select c.nome_cliente, a.nome_autor, i.quantidade  
from cliente c 
inner join venda v on
	c.id_cliente = v.id_cliente 
inner join itemvenda i on
	v.id_venda = i.id_venda 
inner join livro l on
	i.id_livro = l.id_livro 
inner join escreve e on
	l.id_livro = e.id_livro 
inner join autor a on
	e.id_autor = a.id_autor
where a.nome_autor = 
	(select nome_autor
	from autor a2
	inner join escreve e2 on
		a2.id_autor = e2.id_autor
	inner join livro l2 on
		e2.id_livro = l2.id_livro
	where l2.titulo_livro like 'Pequeno Príncipe')
order by c.nome_cliente;

-- 3. (2,0 pontos) Crie uma view que obtenha a média de vendas por autor, excluindo os autores que nunca
-- tiveram vendas de seus livros. Apresente o resultado de forma ordenada. 
-- Descreva também o comando que executa a view.

create view media_por_autor as
select avg(i.id_venda) as media_venda, a.nome_autor
from autor a 
inner join escreve e on
	a.id_autor = e.id_autor 
inner join livro l on
	e.id_livro = l.id_livro 
inner join itemvenda i on
	l.id_livro = i.id_livro 
group by a.id_autor
having avg(i.id_venda) > 0
order by avg(i.id_venda) desc;

-- Executando a view: 

select * from media_por_autor;

-- 4. (2,0 pontos) Faça triggers que, ao ser feita a inserção ou atualização de um livro 
-- do gênero Drama, define o preço em 40.00 para livros da editora Elsevier, 
-- 30.00 para livros da editora Rocco e 10.00 para os demais. 
-- Além disso, faça uma trigger que ao excluir um livro, as vendas associadas a este livro
-- devem ser excluídas.

-- Insert

create trigger trg_livro_genero_insert
before insert on livro
for each row
begin 
	declare nome_genero varchar(255);

	select g.descricao into nome_genero
	from genero g 
	inner join livro l on
		g.id_genero = l.id_genero
	where g.descricao = nome_genero;

	if nome_genero like 'Drama' then
		if new.editora = 'Elsevier' then
			set new.preco_livro = 40;
		elseif new.editora = 'Rocco' then
			set new.preco_livro = 30;
		else 
			set new.preco_livro = 10;
		end if;
	end if;
end;

-- Update

create trigger trg_livro_genero_update
before update on livro
for each row
begin 
	declare nome_genero varchar(255);

	select g.descricao into nome_genero
	from genero g 
	inner join livro l on
		g.id_genero = l.id_genero
	where g.descricao = nome_genero;

	if nome_genero like 'Drama' then
		if new.editora = 'Elsevier' then
			set new.preco_livro = 40;
		elseif new.editora = 'Rocco' then
			set new.preco_livro = 30;
		else 
			set new.preco_livro = 10;
		end if;
	end if;
end;

-- Delete 

create trigger trg_excluir_livro
before delete on livro
for each row
begin
    delete from itemvenda where id_livro = old.id_livro;
end;

-- 5. (2,0 pontos) Crie uma procedure para inserir uma nova venda e associá-la a um livro
-- e cliente existentes. Deve ser passado como parâmetro os dados associados a venda,
-- id do cliente do livro e o id do livro. Deve ser validado se o livro existe no banco de dados
-- antes de realizar estas operações, caso não exista deve mostrar 
-- uma mensagem para o usuário e cancelar a operação. 
-- Descreva também o comando que executa a procedure.

create procedure InserirNovaVenda(v_data date, v_idCliente int, v_idLivro int, v_idVenda int, v_qtd int)
begin
	declare livro_existe int;
	declare cliente_existe int;

	-- verifica se livro existe
	select count(*) into livro_existe
	from livro l 
	where l.id_livro = livro_existe;

	-- verifica se cliente existe
	select count(*) into cliente_existe
	from cliente c 
	where c.id_cliente = cliente_existe;
	
	if livro_existe = 0 then
		signal sqlstate '45000'
		set message_text = 'Livro não encontrado. Tente novamente.';
	elseif cliente_existe = 0 then
		signal sqlstate '45000'
		set message_text = 'Cliente não encontrado. Tente novamente.';
	else
		insert into venda (data_venda, id_cliente, quantidade)
		values (v_data, v_idCliente, v_qtd);
	
		insert into itemvenda (id_venda, id_livro)
		values (v_idVenda, v_idLivro);
	end if;
end;

-- Chamando Procedure: 

call InserirNovaVenda('2023-12-01', 2, 123, 2, 10);



