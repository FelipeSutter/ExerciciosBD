
-- 1. Nome do autor que tem livro com estoque zerado.

select
	l.titulo_livro, a.nome_autor, l.estoque
from autor a
inner join escreve e on
	a.id_autor = e.id_autor 
inner join livro l on
	e.id_livro = l.id_livro
where l.estoque = 0;

-- 2. Nomes dos clientes que compraram o livro "Pequeno Principe"

select 
	l.titulo_livro, l.id_livro 
from cliente c
inner join venda v on
	c.id_cliente = v.id_cliente 
inner join itemvenda i on
	v.id_venda = i.id_venda 
inner join livro l on
	i.id_livro = l.id_livro;

-- 3. Que gênero o autor "Clarice Lispector" escreve?

select 
	g.descricao, l.titulo_livro 
from autor a 
inner join escreve e on
	a.id_autor = e.id_autor 
inner join livro l on
	e.id_livro = l.id_livro 
inner join genero g on
	l.id_genero = g.id_genero
where a.nome_autor like 'Clarice Lispector'
group by g.id_genero;

-- 4. Nomes dos Cliente que compraram livros do autor "Paulo Coelho"

select 
	c.nome_cliente, l.titulo_livro
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
where a.nome_autor like 'Paulo Coelho';



