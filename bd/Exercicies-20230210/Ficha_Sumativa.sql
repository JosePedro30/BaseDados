use geography;

-- Listar todos os países com esperança de vida (lifeExpectancy) entre 75 e 80 anos (incluindo estes limites), ordenados por ordem descendente de esperança de vida;
select * 
from country
where country.LifeExpectancy between 75 and 80
order by country.LifeExpectancy desc;

-- Listar países (id_country e name) com continent North ou South america, e ano de independência (indepYear) posterior a 1980;
select country.code,country.name
from country
where (country.continent="North America" or country.continent="South America") and country.IndepYear>1980;

-- Listar países (id_country, name, name_continent) que pertençam aos continentes Europe ou Asia ou Africa, ordenados por continente (ordem ascendente) e sub-ordenados por nome de país (ordem descendente);
select code,name,continent
from country
where country.continent="Europe" or country.continent="Asia" or country.continent="Africa"
order by country.continent asc,country.name desc;

select * from country;

-- Listar países (id_country e name) que tenham a língua (Language) Portuguese
select code,name
from country
left join countryLanguage on country.code=countryLanguage.countrycode
where countryLanguage.language="Portuguese";

-- Obter o número de países por continente
SELECT COUNT(*) as num_countries, continent
FROM country
GROUP BY continent
ORDER BY num_countries DESC, continent ASC;

--  Obter o nome do país com maior população em Africa;
SELECT name
FROM country
WHERE population = (SELECT MAX(population) FROM country WHERE continent = 'Africa');

-- Obter valor médio da esperança de vida (lifeExpectancy) por continente
SELECT Avg(lifeExpectancy), continent
FROM country
group by continent;

-- Obter valor médio da esperança de vida (lifeExpectancy) na Europa
select avg(lifeExpectancy),continent
from country
where country.continent="Europe";

-- Listar cidades com mais de 5000000 de habitantes, localizadas em países da Europa (continente Europe)
select city.name,city.population
from city
inner join country on city.id_country=country.id_country
inner join continent on country.id_continent=continent.id_continent
where city.population>5000000 and continent.name_continent="Europe";

-- Listar as cidades cujo nome comece por A e termine com a (p.e. Alvorada)
select *
from city
where city.name like "A%a";

-- Inserir na entidade countrylanguage um registo com os seguintes dados: Id_country: ARG;  Language: English;  Percentage: 1.7 
insert into countrylanguage(id_Country,language,percentage) values("ARG","English",1.7);

--  Editar os dados da cidade Tilburg, incrementando a sua população em 5%
update city
set city.population=city.population * 1.05
where city.name="Tilburg";

