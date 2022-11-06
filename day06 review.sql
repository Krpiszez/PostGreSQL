CREATE TABLE employees2
(
employee_id smallint,
employee_first_name varchar(20),
employee_last_name varchar(20)
)                                                                                                                                                                                                                                                                             INSERT INTO employees VALUES(14, 'Chris', ‘Tae’);
INSERT INTO employees2 VALUES(11, 'John', 'Walker');
INSERT INTO employees2 VALUES(12, 'Amy', 'Star');
INSERT INTO employees2 VALUES(13, 'Brad', 'Pitt');
INSERT INTO employees2 VALUES(15, 'Chris', 'Way');
CREATE TABLE addresses
(
employee_id smallint,
street varchar(20),
city varchar(20),
state char(2),
zipcode char(5)
)
INSERT INTO addresses VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES(12, '23rd Rain 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES(14, '3rd Man 12', 'Weston', 'MI', '12345');
INSERT INTO addresses VALUES(15, '11th Chris 12', 'St. Johns', 'FL', '32259');

-- select the employee_first_name and state for employee_first_name use "first name" as field name
-- and for state use "employee_state" as field name
select e.employee_first_name, a.state as "First Name"
from employees2 e, addresses a
where e.employee_id = a.employee_id;

-- get the employee_id and use "id" as field name, get first name and 
-- last name put them into same field and use "full name" as field name
select employee_id as id, employee_first_name ||' '|| employee_last_name as "Full name"
from employees2;

CREATE TABLE workers2
(
id numeric(9),
name varchar(50),
state varchar(50),
salary smallint,
company varchar(20)
)

INSERT INTO workers2 VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers2 VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers2 VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers2 VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers2 VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers2 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers2 VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

-- Find the total salary for every employee and sort them from high to low
select name, sum(salary) as "Total Salary for each empl."
from workers2
group by name
order by "Total Salary for each empl." desc;

-- find the number of employees per state in desc order by employee name.
select name, count(*) as "Num Of Emp."
from workers2
group by name
order by "Num Of Emp." desc;

-- find the number of the employees whose salary is more than 2000 per company
select company, count (*) as "Num Of Emp."
from workers2
where salary > 2000
group by company
order by "Num Of Emp.";

-- find the total salary if it is greater than 2500 for every employee
select name, sum(salary) as "Total Sal"
from workers2
group by name
having sum(salary) > 2500;

-- find the number of employees if it is more than 1 per state
select state, count(state) as "num of emp"
from workers2
group by state
having count(state) >1;

-- find the minimum salary if it is more than 2000 for every company
select company
from workers2
group by company
having min(salary) >2000;
-- find the max salary if it is less than 3000 for every state
select state, max(salary) as "Maximum Salary Per State"
from workers2
group by state
having max(salary) < 3000;

-- find state or employee names whose salary is greater than 3000, less than 2000 without any duplication
select state as "State or Employee Name", salary 
from workers2
where salary > 3000
union
select name as "State or Employee Name", salary 
from workers2
where salary<2000;

