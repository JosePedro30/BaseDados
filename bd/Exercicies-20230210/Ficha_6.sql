use company_test;
-- Insert 10 more sample records into the employee table
INSERT INTO employee (employee_name, birth_date, salary, postalcode_id, admission_date, nif, department_id) VALUES
    ('Samuel Harris', '1990-03-28', 2800, '123456', '2018-02-14', 685461987, 2),
    ('Sophia Miller', '1986-07-15', 2700, '789012', '2015-05-22', 789912345, 3),
    ('Ethan Baker', '1995-01-09', 2400, '345678', '2020-10-18', 321098065, 1),
    ('Ava Wilson', '1992-11-30', 2900, '123456', '2019-07-07', 987654321, 2),
    ('Caleb Turner', '1988-04-05', 2400, '789012', '2017-01-25', 123456789, 3),
    ('Isabella Brown', '1993-09-20', 2500, '345678', '2022-03-12', 456789012, 1),
    ('Mason Clark', '1991-05-14', 2000, '123456', '2021-08-08', 987666321, 2),
    ('Emma Lewis', '1987-12-09', 2600, '789012', '2016-12-01', 789812345, 3),
    ('Logan Wright', '1994-08-02', 2700, '345678', '2021-01-20', 321097665, 1),
    ('Aiden Martinez', '1989-02-25', 2800, '123456', '2018-05-15', 123675890, 2);
    
-- Insert 1 more sample records into the employee table
INSERT INTO employee (employee_name, birth_date, salary, postalcode_id, admission_date, nif, department_id) VALUES
    ('Samuel Poor', '1990-03-21', 1000, '123456', '2018-02-14', 164259764, 2);
    
    -- Insert 1 more sample records into the employee table
INSERT INTO employee (employee_name, birth_date, salary, postalcode_id, admission_date, nif, department_id) VALUES
    ('Samuel Meio Rico', '1990-03-21', 1600, '123456', '2018-02-14', 122222222, 2);
    
-- 8.1 All employees of the company (all attributes)
select * from employee;
    
-- 8.2 All employees (only name and department_id) 
select employee_name,department_id
from employee;
    
-- 8.3 Employees (employee_id and employee_name) with salary higher than € 1.500
select employee_id,employee_name
from employee
where employee.salary>1500;
    
-- 8.4 Employees (employee_id and employee_name) with salary between € 1.500 and € 2.000 
select employee_id,employee_name
from employee
where employee.salary>1500 and salary<2000;
    
-- 8.5 Employees (employee_id and employee_name) with salary between € 1.500 and € 2.000 and belonging to department 1 or 3 
select employee_id,employee_name
from employee
where employee.salary>1500 and salary<2000
and (employee.department_id=1 or employee.department_id=3);

-- 8.6 Employees (all attributes) belonging to departments 1 and 3
select *
from employee
where employee.department_id=1 or employee.department_id=3;

-- 8.7 Employees (all attributes) that do not belong to departments 2 or 3. 
select *
from employee
where employee.department_id!=2 or employee.department_id!=3;

-- 8.8 Employees (all attributes) whose date of admission is between 2015-01-01 and 2018-01-01 
select * 
from employee
WHERE employee.admission_date BETWEEN '2015-01-01' AND '2018-01-01';

-- 8.9 Employee_id and name of employees whose postalcode starts at 123 
select employee_id,employee_name
from employee
where employee.postalcode_id like "123%";

-- 8.10 List postalcodes associated with the location of "Sample City 1"
select postalcode_id
from postalcode
where postalcode.locality="Sample City 1";

-- 8.11 List employee records whose name begins with "Sam” or “Samu”
select *
from employee
where employee_name like "Sam%" or employee_name like "Samu%";

-- 8.12 List employees whose name begins with "M"
select *
from employee
where employee_name like "M%";

-- 8.13 Get number of employees in department_id 2 
select count(*) 
from employee
where employee.department_id=2;

-- 8.14 Get number of employees admitted in the years 2016 or 2019 
SELECT COUNT(*)
FROM employee
WHERE employee.admission_date >= '2016-01-01' AND employee.admission_date < '2019-01-01';

-- 8.15 Names of employees whose name includes "muel"
select employee_name
from employee
where employee.employee_name like "%muel%";

-- 8.16 Average value of the budget in all departments 
select avg(budget)
from department;

-- 8.17 Average salary of employees in departments 1 and 2

select avg(salary)
from employee
where employee.department_id=1 or employee.department_id=2;

-- 8.18 Number of employees in which the postalcode begins with 123
select count(*) 
from employee
where employee.postalcode_id like "123%"; 

-- 8.19 Get the higher salary of department 1 
select max(salary)
from employee
where employee.department_id=1;