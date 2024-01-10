use video_platform;


-- Create a trigger (tInsertFilmYearLess2000) that prevents the insertion of films (entity filme) prior to the year 2000 (if attribute ano contains a value less than 2000, set this attribute to 2000). 
DELIMITER $$
CREATE TRIGGER tInsertFilmYearLess2000
BEFORE INSERT ON filme
FOR EACH ROW
BEGIN
    IF NEW.ano < 2000 THEN
        SET NEW.ano = 2000;
    END IF;
END;
$$
DELIMITER ;

INSERT INTO filme VALUES (119, "TESTE", 1990,"a","Fred Silva", 101, "2020-12-31 00:00:00", 1);

-- Create a trigger (tInsertFilmCurrentYear) that, before inserting a record on the filme table, validates the value of the year (ano) attribute: if it is higher than the cur-rent year, it must assume the current year by default. 
DELIMITER $$
CREATE TRIGGER tInsertFilmCurrentYear
BEFORE INSERT ON filme
FOR EACH ROW
BEGIN
    IF NEW.ano > YEAR(NOW()) THEN
        SET NEW.ano = Year(NOW());
    END IF;
END;
$$
DELIMITER ;

INSERT INTO filme VALUES (120, "TESTE2", 2050,"a","Fred Silva", 101, "2020-12-31 00:00:00", 1);

-- Create a trigger (tInsertFilmDataLimite) that every time you insert a film in the database (entity filme), the viewing deadline (data_limite attribute) is the current date + 30 days. 
DELIMITER $$
CREATE TRIGGER tInsertFilmDataLimite
BEFORE INSERT ON filme
FOR EACH ROW
BEGIN
   set new.data_limite=DATE_ADD(NOW(), INTERVAL 30 DAY);
END;
$$
DELIMITER ;

INSERT INTO filme VALUES (121, "TESTE3", 2050,"a","Fred Silva", 101, "2021-01-01 00:00:00", 1);

--  When editing a movie, trigger (tUpdateFilmDuracao) an event that validates if the attribute duracao is less than 30 or greater than and 180 (minutes), is assumes these limit values. 
DELIMITER $$
CREATE TRIGGER tUpdateFilmDuracao
BEFORE update ON filme
FOR EACH ROW
BEGIN
   if new.duracao<30 then
		set new.duracao=30;
	elseif new.duracao>100 then
		set new.duracao=100;
	end if;
END;
$$
DELIMITER ;

UPDATE filme SET duracao = 110 WHERE id_filme = 121;

-- Create a set of triggers that allow you to record in a log_table entity all the operations for inserting, editing and removing data in the filme table. 
select * from filme where id_filme=121;