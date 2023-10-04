
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


-- 5. Qual gênero(s) o cliente "Camila Silva" gosta de ler?

select
	g.descricao, g.id_genero 
from cliente c 
inner join venda v on
	c.id_cliente = v.id_cliente 
inner join itemvenda i on
	v.id_venda = i.id_venda 
inner join livro l on
	i.id_livro = l.id_livro 
inner join genero g on
	l.id_genero = g.id_genero 
where c.nome_cliente like 'Camila Silva'
group by g.id_genero;
	
-- 6. Quais livros DO autor "Jorge Amado" tem em estoque?

select 
	l.estoque, l.titulo_livro
from livro l 
inner join escreve e on
	l.id_livro = e.id_livro 
inner join autor a on
	e.id_autor = a.id_autor 
where a.nome_autor like 'Jorge Amado' and l.estoque > 0;

-- 7. Que cliente já comprou livros da editora "Elsevier"?

select 
	c.nome_cliente, c.id_cliente 
from cliente c 
inner join venda v on
	c.id_cliente = v.id_cliente 
inner join itemvenda i on
	v.id_venda = i.id_venda 
inner join livro l on
	i.id_livro = l.id_livro 
where l.editora like 'Elsevier'
group by c.id_cliente;

-- 8. Quais autores venderam 2 ou mais exemplares de seu livro numa única venda?

select 
	a.nome_autor, l.titulo_livro, i.id_itemVenda 
from autor a 
inner join escreve e on
	a.id_autor = e.id_autor 
inner join livro l on
	e.id_livro = l.id_livro 
inner join itemvenda i on
	l.id_livro = i.id_livro 
where i.quantidade > 1
group by a.id_autor;

-- 9. Qual livro teve o maior número de exemplares vendidos de uma só vez?

select 
	 l.titulo_livro, max(i.quantidade), l.id_livro, i.id_itemVenda 
from livro l 
inner join itemvenda i on
	l.id_livro = i.id_livro
group by l.id_livro, i.id_itemVenda 
having max(i.quantidade) = 3;

-- versão alternativa

select 
	 l.titulo_livro, l.id_livro, max(i.quantidade)  
from livro l
inner join itemvenda i on
	l.id_livro = i.id_livro 
where i.quantidade = (select max(quantidade) from itemvenda)
group by l.id_livro ;
   
   select 
     l.titulo_livro, l.id_livro, max(i.quantidade)
from livro l
inner join itemvenda i on
    l.id_livro = i.id_livro 
    group by l.id_livro, i.id_itemVenda
    having max(i.quantidade)
    order by i.quantidade desc
    limit 1;
   
-- 10. Quem comprou o livro mais caro?
   
select 
   	c.nome_cliente, round(max(l.preco_livro))
from cliente c 
inner join venda v on
	c.id_cliente = v.id_cliente 
inner join itemvenda i on
	v.id_venda = i.id_venda 
inner join livro l on
	i.id_livro = l.id_livro 
where l.preco_livro = (select max(preco_livro) from livro);
group by c.id_cliente;

-- 11. Qual autor tem o livro mais barato?

select 
	a.nome_autor, min(l.preco_livro)
from autor a 
inner join escreve e on
	a.id_autor = e.id_autor 
inner join livro l on
	e.id_livro = l.id_livro 
where l.preco_livro = (select min(preco_livro) from livro);

-- 12. Quantos titulos da editora "Rocco" estão cadastrados na loja?

select 
	count(l.id_livro), l.titulo_livro, l.editora  
from livro l 
where l.editora like 'Rocco'
group by l.id_livro;

-- 13. Qual a média de preço dos livros "Técnico" (genero)?

select 
	round(avg(l.preco_livro), 2), l.titulo_livro, g.descricao  
from genero g 
inner join livro l on
	g.id_genero = l.id_genero 
where g.descricao like 'Técnico';

-- 14. Qual seria o valor total para se comprar um exemplar de cada livro da editora "Rocco"?

select 
	round(SUM(l.preco_livro),2), l.titulo_livro 
from genero g 
inner join livro l on
	g.id_genero = l.id_genero 
where l.editora like 'Rocco';

-- 15. Qual o cliente, titulo do livro e autor da venda mais antiga?

select 
	
from cliente c 
inner join 




