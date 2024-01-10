use company;

-- Name of department with larger budget
SELECT department.name
FROM department
WHERE department.budget = (SELECT MAX(budget) FROM department);

--  Name of department with lower budget
SELECT department.name
FROM department
WHERE department.budget = (SELECT MIN(budget) FROM department);

--  List of employees of department “Production”
select *
from employee
where employee.department_id=
(select department.department_id
from department 
where department.name="Production");

-- List of employees of departments “Production”, “Accounting” and “Sales” 
SELECT *
FROM employee
WHERE employee.department_id IN (
    SELECT department_id
    FROM department
    WHERE name IN ('Production', 'Accounting', 'Sales')
);

-- Number of employees by department
select count(*),department.name
from employee
left join department on employee.department_id=department.department_id
group by department.name;

-- List employees with salary below average salary 
select *
from employee
where employee.salary < (select avg(employee.salary) from employee);

-- insert employee below, through query
INSERT INTO employee (employee_name, birth_date, salary, postalcode_id, admission_date, nif, department_id) VALUES ('Verónica Santos', '1998-02-03', 2100, '4000-100', '2018-02-01', 345678901, 5);

-- Obter o maior department_id
SET @max_department_id = (SELECT MAX(department_id) FROM department);

-- Insert, through query, a new record on table department 
INSERT INTO department (department_id, name, budget)
VALUES (@max_department_id + 1, 'Nome do Departamento', 5000);

-- List departments that do not have employees
select *
from department
where department.department_id not in (select department_id from employee);

-- Edit salary of employees who belong to the Production department, increasing them by 5%
update department
set department.budget=department.budget*1.05
where department.name="Production";

-- Remove the department that you have created earlier (department 6, by SQL statement) 
delete from department
where department.department_id=6;

-- Edit salary of employees admitted in 2008, increasing them by 50€ 
UPDATE employee
SET salary = salary + 50
WHERE YEAR(admission_date) = 2008;