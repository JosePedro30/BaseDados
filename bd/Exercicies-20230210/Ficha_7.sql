use company;

-- Number of employees for each department 
SELECT department_id, COUNT(employee_id) AS num_employees
FROM employee
GROUP BY department_id;

-- Number of employees for each department (name of department) 
SELECT department.name, COUNT(employee.employee_id) AS num_employees
FROM department
INNER JOIN employee ON department.department_id = employee.department_id
GROUP BY department.department_id, department.name;

-- Average salary by department
select avg(salary) as "Salary Average",department_id
from employee
group by employee.department_id;

-- Average salary by department (name of department)
SELECT AVG(employee.salary) AS "Salary Average", department.name
FROM employee
right JOIN department ON employee.department_id = department.department_id
GROUP BY department.department_id, department.name;

--  Id and name of each employee, followed by the designation of the department 
select employee.employee_id,employee.employee_name,department.name
from employee
left join department on employee.department_id=department.department_id;

-- Id and name of the employees in the Contabilidade department
select employee.employee_id,employee.employee_name,department.name
from employee
left join department on employee.department_id=department.department_id
where department.name="Accounting";

-- List of employees (id, name, nif, postalcode, locality) sorted by location and sub-ordinate by employee name 
select employee.employee_id,employee.employee_name,employee.nif,employee.postalcode_id,postalcode.locality
from employee
left join postalcode on employee.postalcode_id=postalcode.postalcode_id
order by postalcode.locality,employee.employee_name;

-- Total salaries by department (id and department designation)
SELECT department.department_id, department.name, SUM(employee.salary) AS total_salaries
FROM department
RIGHT JOIN employee ON department.department_id = employee.department_id
GROUP BY department.department_id, department.name;

-- List number of employees in the department Produção 
select count(*)
from employee
left join department on employee.department_id=department.department_id
where department.name="Production";

-- List employee data (id, name, postalcode and location, including the code and designation of each department; list sorted by department. 
select employee_id,employee_name,postalcode.postalcode_id,postalcode.locality,department.department_id,department.name
from employee
left join postalcode on employee.postalcode_id=postalcode.postalcode_id
left join department on employee.department_id=department.department_id
order by department.name;

--  List sum of the amount payable to Social Security (11% of salary), by department (departmental designation)
select sum(salary*0.11),department.name
from employee
left join department on employee.department_id=department.department_id
group by department.name;

-- List of employees (id, name and nif) of the Produção and Recursos Humanos departments
SELECT employee.employee_id, employee.employee_name, employee.nif, department.name
FROM employee
LEFT JOIN department ON employee.department_id = department.department_id
WHERE department.name = "Production" OR department.name = "Logistics";
