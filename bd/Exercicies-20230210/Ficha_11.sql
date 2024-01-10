use video_platform;

-- List the genres of films available in the database 
SELECT DISTINCT genero.desc_genero
FROM genero
JOIN genero_filme ON genero.id_genero = genero_filme.id_genero
JOIN filme ON genero_filme.id_filme = filme.id_filme;

-- List films (id, title, duration) lasting less than 100 minutes
select id_filme,titulo,duracao
from filme
where filme.duracao<100;

-- List films (id, title, duration) that have a duration between 100 and 130 minutes
select id_filme,titulo,duracao
from filme
where filme.duracao between 100 and 130;

-- List films (id and title) rated M6 and films rated M12
select id_filme,titulo
from filme
left join classificacao on filme.id_classificacao=classificacao.id_classificacao
where classificacao.desc_classificacao="M6" or classificacao.desc_classificacao="M12";

-- List the number of films rated M6 or M12
select count(*)
from filme
left join classificacao on filme.id_classificacao=classificacao.id_classificacao
where classificacao.desc_classificacao="M6" or classificacao.desc_classificacao="M12";

-- List films (id and title) with id_genero 1 or 3 or 6 or 7. 
select filme.id_filme,filme.titulo
from filme
left join genero_filme on filme.id_filme=genero_filme.id_filme
where genero_filme.id_genero=1 or genero_filme.id_genero=3 or genero_filme.id_genero=6 or genero_filme.id_genero=7;

-- Obtaining films with the Comedy genre 
select filme.id_filme,filme.titulo
from filme
left join genero_filme on filme.id_filme=genero_filme.id_filme
left join genero on genero_filme.id_genero=genero.id_genero
where genero.desc_genero="Comedia";

-- Obtain number of films available by rating (desc_classificacao)
select count(filme.id_classificacao),classificacao.desc_classificacao
from filme,classificacao
where filme.id_classificacao=classificacao.id_classificacao
group by filme.id_classificacao
order by count(filme.id_classificacao) desc;

-- Obtain the film title with a longer duration 
select titulo
from filme
where filme.duracao=(select max(filme.duracao) from filme);

-- Obtain the average duration of the existing films in the BD 
select avg(duracao)
from filme;

-- List films where between actor Harrison Ford 
select filme.id_filme,filme.titulo
from filme
left join ator_filme on filme.id_filme=ator_filme.id_filme
left join ator on ator_filme.id_ator=ator.id_ator
where ator.ator="Harrison Ford";

-- List films (id and title) of the genre Action 
select filme.id_filme,filme.titulo
from filme
left join genero_filme on filme.id_filme=genero_filme.id_filme
left join genero on genero_filme.id_genero=genero.id_genero
where genero.desc_genero="Acao";

-- List movie_id, title, duration, desc_classification of BD films, ordered by desc_classification 
select filme.id_filme,filme.titulo,filme.duracao,classificacao.desc_classificacao
from filme,classificacao
order by desc_classificacao asc;

-- List films (id, title, year) produced in 2015, 2014 or 2013, ordered by year and sub-ordered by title (descending)
select id_filme,titulo,duracao,ano
from filme
where ano=2015 or ano=2014 or ano=2013
order by ano,titulo desc;

--  List films that will be available in the period 2020-1-1 and 2020-2-28 
select *
from filme
WHERE DATE(filme.data_limite) BETWEEN '2020-01-01' AND '2020-02-28';

-- List films that will not be available in the period 2020-1-1 and 2020-2-28
select *
from filme
WHERE DATE(filme.data_limite) not BETWEEN '2020-01-01' AND '2020-02-28';

-- List films where the director begins with "Steven" 
select *
from filme
where filme.diretor like "Steven%";

-- List films in which the director includes “Al”
select *
from filme
where filme.diretor like "%Al%";

-- Obtain number of films available by genre (desc_genero) 
SELECT count(*),genero.desc_genero
FROM filme
left JOIN genero_filme ON filme.id_filme = genero_filme.id_filme
left JOIN genero ON genero_filme.id_genero = genero.id_genero
group by desc_genero;

-- Edit film with id_film 101, changing the duration of the movie to 98 
update filme
set duracao=98
where filme.id_filme=101;

-- Edit classification table, changing classification M6 to M06 
update classificacao
set desc_classificacao="M06"
where desc_classificacao="M6";

-- Insert, in the genre table, a record with id_genero 8 and desc_genero Thriller 
insert into genero values(8,"Thriller");

-- Remove films where the deadline for viewing is before 2020-02-28 
DELETE FROM genero_filme
WHERE id_filme IN (SELECT id_filme FROM filme WHERE DATE(data_limite) < '2020-07-01');

DELETE FROM ator_filme
WHERE id_filme IN (SELECT id_filme FROM filme WHERE DATE(data_limite) < '2020-07-01');

-- Remove filmes onde a data limite é antes de 2020-02-28
DELETE FROM filme
WHERE DATE(data_limite) < '2020-07-01';

-- Edit films with id_film 116, 117 and 118 (in a single sql command) changing the viewing deadline to 2020-12-31 
update filme
set data_limite="2020-12-31 00:00:00"
where id_filme=116 or id_filme=117 or id_filme=118;

select * from ator;
select * from classificacao;
select * from genero;
select * from filme;