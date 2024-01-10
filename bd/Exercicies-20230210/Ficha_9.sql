use video_platform;

-- Create a view named filmsWithClassificationView with data from the films (id_filme, titulo, ano) and classification (desc_classificacao); 
create view filmsWithClassificationView as
select filme.id_filme,filme.titulo,filme.ano,classificacao.desc_classificacao
from filme
left join classificacao on filme.id_classificacao=classificacao.id_classificacao;

--  Select, from the previous view, the films rated M6 and M12;
SELECT *
FROM filmsWithClassificationView
WHERE desc_classificacao = "M6" OR desc_classificacao = "M12";

-- Create a view named filmsWithGenresView with the films (id_filme, titulo, ano, duracao) and respective genres (desc_genero);
create view filmsWithGenresView as
select filme.id_filme,filme.titulo,filme.ano,filme.duracao,genero.desc_genero
from filme
left join genero_filme on filme.id_filme=genero_filme.id_filme
left join genero on genero_filme.id_genero=genero.id_genero;

-- Obtain, from the previous view, the number of films by genre (desc_genero)
select count(*) ,desc_genero
from filmsWithGenresView
group by desc_genero;

-- Obtain, from the previous view, the average duration of films by genre; 
select avg(duracao) ,desc_genero
from filmsWithGenresView
group by desc_genero;

-- Remove the views created in the meantime
drop view filmsWithClassificationView;
drop view filmsWithGenresView;

-- Create a view named filmsComedyView with films (id_filme, titulo, ano) related with the genre “comédia” The view that does not allow violating data integrity restrictions. Select the data from this view; 
create view filmsComedyView as
select filme.id_filme,filme.titulo,filme.ano
from filme
left join genero_filme on filme.id_filme=genero_filme.id_filme
left join genero on genero_filme.id_genero=genero.id_genero
where genero.desc_genero="comédia";

-- Create a view named filmsClassifTodosView with films (id_filme, titulo, ano, desc_classificação) with classification “Todos” The view that does not allow violating data integrity restrictions. Select the data from this view; 
create view filmsClassifTodosView as
select filme.id_filme,filme.titulo,filme.ano,classificacao.desc_classificacao
from filme,classificacao
where classificacao.desc_classificacao="Todos";