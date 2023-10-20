-- Aluno: Felipe Sutter 

-- Questão 1 - Escreva um comando SQL para listar os nomes de 1,0 (1,5)
-- todos os atores que atuaram no filme com o título "The Shawshank Redemption".

select
	concat(a.first_name, ' ', a.last_name) as "Nome Ator"
from actor a 
inner join film_actor fa on
	a.actor_id = fa.actor_id 
inner join film f on
	fa.film_id = f.film_id
where f.title like 'The Shawshank Redemption'
group by a.actor_id;

-- RESPOSTA:

select
	concat(a.first_name, ' ', a.last_name) as "Nome Ator"
from actor a 
inner join film_actor fa on
	a.actor_id = fa.actor_id 
inner join film f on
	fa.film_id = f.film_id
where f.title like 'The Shawshank Redemption';

-- Quando está no enunciado liste TODOS, não é pra ter o group by, só tem group by quando
-- quer separar por cada entidade, cada cliente, cada categoria, etc.

-- Questão 2 - (2,0 pontos) Encontre os filmes que foram alugados mais vezes, 
-- listando em primeiro o filme que foi mais alugado e assim sucessivamente. 1,5

select 
	f.title as "Título", count(r.rental_id) as "Qtd aluguel"
from rental r
inner join inventory i on
	r.inventory_id = i.inventory_id
inner join film f on
	i.film_id = f.film_id
group by f.film_id, r.rental_id
order by r.rental_id desc;

-- RESPOSTA:

select 
	f.title as "Título", count(r.rental_id) as "Qtd aluguel"
from rental r
inner join inventory i on
	r.inventory_id = i.inventory_id
inner join film f on
	i.film_id = f.film_id
group by f.film_id
order by count(r.rental_id) desc;

-- O rental_id entrava no order by como um count para ordenar por qtd de aluguéis

-- Questão 3 - (2,0 pontos) Encontre os filmes com taxa de aluguel inferior a US$1.00 
-- e pelo menos 50 aluguéis. 1,5

select 
	 f.title as "Título Filme", f.rental_rate as "Preço Aluguel", count(r.rental_id) as "Qtd Alugada" 
from film f
inner join inventory i on
	f.film_id = i.film_id
inner join rental r on
	i.inventory_id = r.inventory_id
where f.rental_rate < 1.00
group by f.film_id
having count(r.rental_id) >= 50;

-- RESPOSTA:

select 
	 f.title as "Título Filme", f.rental_rate as "Preço Aluguel", count(r.rental_id) as "Qtd Alugada" 
from film f
inner join inventory i on
	f.film_id = i.film_id
inner join rental r on
	i.inventory_id = r.inventory_id
group by f.film_id
having f.rental_rate < 1.00 and count(r.rental_id) >= 50

-- as duas cláusulas eram no having, pois as duas pertenciam ao film

-- Questão 4 - (1,5 ponto) Escreva um comando SQL que aumente o preço de aluguel de 
-- todos os filmes que têm uma classificação (rating) "PG" para $3.00. 1,0

update film 
set rental_rate = rental_rate + 3.00
where rating like 'PG';

-- RESPOSTA:

update film 
set rental_rate = 3.00
where rating like 'PG';

-- Aumentar PARA 3.00, não em 3.00. Esse foi o erro

-- Questão 5 - (1,5 ponto) Encontre os clientes junto com o número de filmes que cada cliente alugou, 
-- incluindo os clientes que nunca alugaram. 0,5

select
	concat(c.first_name, ' ', c.last_name) as "Cliente", count(f.film_id) as "Qtd alugada p/ cliente"
from customer c 
right join rental r on
	c.customer_id = r.customer_id 
inner join inventory i on
	r.inventory_id = i.inventory_id
inner join film f on
	i.film_id = f.film_id
group by c.customer_id;

-- RESPOSTA:

select
	concat(c.first_name, ' ', c.last_name) as "Cliente", count(f.film_id) as "Qtd alugada p/ cliente"
from customer c 
left join rental r on
	c.customer_id = r.customer_id 
left join inventory i on
	r.inventory_id = i.inventory_id
left join film f on
	i.film_id = f.film_id
group by c.customer_id;

-- Já que era pra pegar os clientes mesmo que não tivessem aluguéis, usa-se o left join para pegar os 
-- valores nulos no cliente.



-- Questão 6 - (1,5 ponto) Escreva um comando SQL que liste todas as categorias juntamente com os 
-- títulos dos filmes associados que tenham língua original em inglês (English). 
-- Inclua todas as categorias, mesmo que não haja filmes associados. 0,5

select 
	f.title as "Título Filme", c.name as "Categoria" 
from language l  
inner join film f on
	l.language_id  = f.language_id 
right join film_category fc on
	f.film_id = fc.film_id
inner join category c on
	fc.category_id = c.category_id
where l.name like 'English'
group by f.film_id, c."name";

-- RESPOSTA:

SELECT 
	c.name AS "Categoria", f.title AS "Título Filme"
FROM category c
LEFT JOIN film_category fc ON 
	c.category_id = fc.category_id
LEFT JOIN film f ON 
	fc.film_id = f.film_id
LEFT JOIN language l ON 
	f.language_id = l.language_id
WHERE l.name = 'English';

-- Quando está no enunciado liste TODOS, não é pra ter o group by, só tem group by quando
-- quer separar por cada entidade, cada cliente, cada categoria, etc.

-- Nesse caso, era pra incluir as categorias mesmo que não tivessem filmes associados a ela
-- O mais correto é fazer o left join do que eu quero mostrar os nulos com o resto da consulta
-- Caso eu queira exibir todos os dados, tem que usar o left join em todos, normalmente é usado em todos.

-- se não tiver film cadastrado na categoria vai mostrar null, além de mostrar os que têm cadastro tb
-- já que o film_category já tem o id de film e de category
