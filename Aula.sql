SELECT name, countrycode, population 
FROM city 
WHERE population > 100000
AND countrycode = "PRT"
Order by population asc;

select * 
from country
where continent='Europe';

select code, name
from country
where continent='Europe'
order by name;

select city.name, city.population
from city, country
where city.Countrycode=country.Code
and country.Name='Spain'
and city.population > 100000
order by city.population asc;

select language
from countrylanguage, country
where countrycode=code
and name='Afghanistan';

select code
from country, countrylanguage
where country.code=countrylanguage.countrycode
and countrylanguage.language='Portuguese'
and IsOfficial='T';

select *
from countrylanguage
where language='Portuguese'
and IsOfficial='T';

select city.name as 'City', country.name as 'Country'
from city, country, countrylanguage
where city.countrycode=country.code
and country.code=countrylanguage.countrycode
and language='Portuguese'
and IsOfficial='T';

select Name,Continent 
from country
where Continent="Europe"
or Continent="Asia";

select Name,Continent 
from country
where Continent not in("Europe","Asia");

select Name
from country
where country.IndepYear is null;

select Name,Population
from country
where Population>500000 and Population<1000000;

#All countrys who have population between this values
select Name,Population
from country
where Population between 500000 and 1000000;

#All Countries with Republic in Government
select Name,GovernmentForm
from country
where GovernmentForm = "Republic";
#Other Way better
select Name,GovernmentForm
from country
where GovernmentForm like "%Republic%";

#All countries outside America
select Name,Continent
from country
where Continent not like "%America%";

#Count the countrys in Europe
select count(Continent) 
from country
where Continent like "Europe";

#Count the regions of the world
select count(distinct Region)
as "Number of Regions"
from country;

#All Population in Europe
select sum(Population)
from country
where Continent like "Europe";

#Average Life in Europe
select AVG(LifeExpectancy)
from country
where Continent like "Europe";

#Max and Min Surface Area in Europe
select max(SurfaceArea),min(SurfaceArea)
from country
where Continent like "Europe";

select Continent,avg(LifeExpectancy) as "Average Life Expectancy",sum(LifeExpectancy) as "Sum Life Expectancy"
from country
group by Continent;

select Continent,avg(LifeExpectancy) as "Average Life Expectancy"
from country
group by Continent
having Continent like "%America%";

select Name,Continent,SurfaceArea
from country
order by Continent asc, SurfaceArea desc;

select Name,SurfaceArea
from country;

#Select the name of the city with most population
select Name,Population
from city
where Population=
(select max(Population) from city);

#Cities of Portugal
select ID,Name 
from city
where CountryCode=
(select Code
	from country
where Name="Portugal");

#Cities and their countries where official language is english
select city.Name as "City", country.name as "Country"
from city, country
where city.CountryCode=country.Code
and country.Code in
	(select CountryCode
    from countryLanguage
where Language="English" and isOfficial="T")
order by Country,city;

-- 9 new version
select city.Name as "City", EnglishCountries.Country as "Country"
from city, (select Code, Name as Country
	from country as c, countryLanguage as cl
    where c.Code = cl.CountryCode
    and cl.Language="English"
    and cl.isOfficial = "T"
) as EnglishCountries
where city.CountryCode = EnglishCountries.Code;

# Countries which have a city in a district whose name Includes South
select Name as Country
from country
where exists
(select *
from city
where city.CountryCode = country.Code
and District like "%South%");

#Insert
#select max(ID) from city
#Add a new city

insert into City
values(9999,"Guimarães", "PRT", "Braga","15000");

#Add a new city-specify fields
insert into city
(Name,Country,Code,Population)
values ("Guimarães", "PRT", "10000"); 

#Update
update city
set Population=160000
where name ="Guimarães";

#Cities of Portugal
select ID,Name 
from city
where CountryCode=
(select Code
	from country
where Name="Portugal");


insert into city (Name,Country,Code,Population) values ("Guimarães", "PRT", "10000");

-- Views--------------
-- 5 create a view with the portuguese cities
create view PortugueseCities as
Select ID, Name, CountryCode, District, Population
from city
where CountryCode=
(select Code
from Country
where Name="Portugal");

-- Use the PortugueseCities view to display data
select * from PortugueseCities;