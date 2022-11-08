CREATE TABLE my_companies
(
company_id numeric(9),
company_name varchar(20)
)
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;
CREATE TABLE orders
(
order_id numeric(9),
company_id numeric(9),
order_date date
)
INSERT INTO orders VALUES(11, 101, '17-Apr-2020');
INSERT INTO orders VALUES(22, 102, '18-Apr-2020');
INSERT INTO orders VALUES(33, 103, '19-Apr-2020');
INSERT INTO orders VALUES(44, 104, '20-Apr-2020');
INSERT INTO orders VALUES(55, 105, '21-Apr-2020');
SELECT * FROM orders;
CREATE TABLE workers
(
id numeric(9),
name varchar(50),
state varchar(50),
salary numeric(20),
company varchar(20)
)
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;

-- Union Operator
-- find the state whose salary is greater than 3000 and employee names whose salary is less than 2000 with duplication
select state as "State or Employee", salary
from workers
where salary > 3000
union all -- here we use all to see duplicated data if we had just used union we wont see any data more than once.
select name as "State or Employee", salary
from workers
where salary < 2000;

-- Intersect operator i) returns the common records of 2 querries ii) Returns unique data
-- Find all common employee names whose salary is greater than 2000 and company name is IBM, APPLE or MICROSOFT
select name 
from workers
where salary > 2000
intersect  -- here we have different selections of data and some of the records are common in both selection
		   -- intersect brings the common records of selection by removing duplications (unique data).
select name
from workers
where company in('IBM', 'APPLE', 'MICROSOFT');

-- Minus operator:       i) returns the records which are not common between 2 tables contrary to intersect
-- EXCEPT IN PostgreSQL ii) order of minus is important, the data which is not common will come from the selection you make above.
-- Find the employee names whose salary is less than 3000 and not working for google
select name
from workers
where salary < 3000

except  -- there is a kind of unique issue here if the record from first selection happens to be anywhere in second selection
		-- it will be removed from first selection however ==> (all) can be used to see it.
select name
from workers
where company = 'GOOGLE';

--JOINS: It is very important in SQL. Joins are used for 2 different table data. 
-- 		 1) Inner Join: Returns the common data.
-- 			It is a bit like union returns the whole common data from 2 tables.
-- 		 2) Left Join: Returns all common data from first table.
--			It returns common also because common datas are belong to first table as well. xd
--		 3) Right Join: Returns all common data and data from the second table.
--	     4) Full Join: Returns whole data from both tables.
--			It returns the whole data from both tables without duplication ?
--		 5) Self Join: Returns the single table data by copying table itself.
--			It returns a copy of table itself, sometimes there may be several data with same name for
--			example a man work in 2 place, to pick its workplace distinctly ??
-- INNER JOIN - it is used with on
-- Select company name, order id, order date for common companies

select company_name, order_id, order_date
from my_companies mc inner join orders o
on mc.company_id = o.company_id;

-- Left Join
-- Get order id and order date for the companies in my_companies table
select order_id, company_name, order_date
from my_companies mc left join orders o
on o.company_id = mc.company_id; -- here in the left join all data selected from first table will be returned but
								 -- if the part in filter(on) is not satisfied for specific record it will not return
								 -- the data about this record from the second table.
-- Right Join
-- Get order id and order date for the companies in orders table
select mc.company_name, o.order_id, o.order_date
from my_companies mc right join orders o
on o.company_id = mc.company_id; -- here it does the same for the second table as first table does in left join.

-- Full Join
-- Get order id and order date for every company
select company_name, order_id, order_date
from my_companies mc full join orders o 
on mc.company_id = o.company_id; -- here it is a combination of left and right join it is like you get left and right 
								 -- joins together without duplication.
CREATE TABLE workers
(
id numeric(2),
name varchar(20),
title varchar(60),
manager_id numeric(2)
)
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT * FROM workers;

--SELF JOIN
--Create a table that displays the manager of employees
select w1.name as "Employee Name", w2.name as "Manager Name"
from workers w1 inner join workers w2  
on w1.manager_id = w2.id;				-- here using inner join on 1 table means self join self join is used inside
										-- inner join because there is only 1 table. A copy of the table is created then
										-- it gets the data from original table match and return result accordingly.









