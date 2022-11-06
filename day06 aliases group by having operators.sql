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
select * from employees2;

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


-- Aliases is used for having temporary field names
-- select the employee_first_name and state for employee_first_name use "first name" as field name
-- and for state use "employee_state" as field name
select employees2.employee_first_name, addresses.state
from employees2, addresses
where employees2.employee_id = addresses.employee_id;

-- Aliases 
-- How to use aliases for table names
select e.employee_first_name, a.state
from employees2 e, addresses a -- here we are asigning alias(nickname) for tables
where e.employee_id = a.employee_id;

-- How to put multiple fields into a single field and use aliases for the field
-- get the employee_id and use "id" as field name, get first name and 
-- last name put them into same field and use "full name" as field name
select employee_id as id, employee_first_name ||' '|| employee_last_name as "FULL NAME"  -- here || means put 2 column(field) data into 1 column
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

-- Group By statement 
-- Find the total salary for every employee and sort them from high to low
select name, sum(salary) as "Total Salary"
from workers2
group by name 					-- here in this syntax group by gets the different salary field 
order by "Total Salary" desc;	-- for same name field and put them together in a single name field
-- order by statement usually is used after group by because group by put different records together.
-- we should type aliases as field name after group by in order by

-- find the number of employees per state in desc order by employee name.
select state, count (state) as "Number of Employees" 
from workers2
group by state
order by "Number of Employees" desc;

-- find the number of the employees whose salary is more than 2000 per company
select company, count (*) as "Number Of Worker" -- you can use * inside count to avoid conflicts.
from workers2
where salary>2000 								-- we use where only before group by if necessary
group by company;

-- HAVING CLAUSE
-- find the total salary if it is greater than 2500 for every employee
select name, sum(salary) as "Total Salary Greater than 2500"
from workers2
group by name
having sum(salary) > 2500; -- if we need to filter after group by we cant use where we should use "HAVING".
						   -- group by statement group rows that have same values into sum rows 
						   -- after where we cant use aggregate functions; count(), sum(), min(), max(), avg()

-- find the number of employees if it is more than 1 per state
select state, count(state) as num_of_Emp_per_state
from workers2
group by state
having count(state) > 1; -- having is to filter the group by clause
						 -- having clause funct. is same with where clause but it is used with aggregate func.
						 -- after group by.

-- find the minimum salary if it is more than 2000 for every company
select company
from workers2
group by company
having min(salary) > 2000; -- here we dont need to use select to get min from somewhere

-- find the max salary if it is less than 3000 for every state
select state, max(salary) as "Maximum Salary Per State"
from workers2
group by state
having max(salary) < 3000;

-- operators in SQL 
-- 1) Union Operator:  i) is used for joining the result of 2 queries.
				   -- ii) returns unique records everytime, if there are repeated records 
				   --	  it removes the repeated ones
				   --iii) by using union we are able to put different fields into a single field like
				   --	  in the following example.
				   -- iv) *** when you put different fields into a single field by using union operator
				   --	  field must have same data type in the same size for example ==> (20) ***
-- find state or employee names whose salary is greater than 3000, less than 2000 without any duplication
select state as "State or Employee Name", salary 
from workers2
where salary > 3000

union -- union operator unites multiple queries and removes duplicated records.

select name as "State or Employee Name", salary 
from workers2
where salary < 2000;







