CREATE TABLE workers
(
    id SMALLINT,
    name VARCHAR(50),
    salary SMALLINT,
    CONSTRAINT id5_pk PRIMARY KEY(id)
);  
    
INSERT INTO workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO workers VALUES(10004, 'Angie Ocean', 8500);


select min(salary) as third_min
from workers
where salary > (select min(salary)
				from workers
				where salary > (select min(salary) from workers));
				
				
select *
from workers
where salary = (select max(salary) from workers where salary < (select max(salary) from workers));

select *
from workers
order by salary desc
offset 1 row
fetch next 1 row only;

select *
from workers
order by salary
offset 1 row
fetch next 1 row only;

select *
from workers
order by salary desc
offset 2 row
fetch next 1 row only;

CREATE TABLE customers_products
( 
  product_id INT,
  customer_name VARCHAR(50),
  product_name VARCHAR(50)
);
 
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');         

select *
from customers_products
where product_name in('Orange', 'Apple', 'Palm');

select *
from customers_products
where product_name not in('Orange', 'Apple', 'Palm');

select *
from customers_products
where product_id between 20 and 30;

select * 
from customers_products
where product_id not between 20 and 25;

CREATE TABLE customers_likes
( 
  product_id CHAR(10),
  customer_name VARCHAR(50),
  liked_product VARCHAR(50)
);


INSERT INTO customers_likes VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES (60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES (30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');
select * from customers_likes;
update customers_likes
set customer_name = 'No Name'
where exists(select customer_name from customers_likes where customer_name = 'Lary'); 

update customers_likes
set customer_name = 'No Name'
where exists (select customer_name from customers_likes where liked_product in ('Orange', 'Pineapple', 'Avocado'));

delete
from customers_likes
where exists (select liked_product from customers_likes where liked_product in ('Orange'))

CREATE TABLE employees 
(  
  id CHAR(9), 
  name VARCHAR(50), 
  state VARCHAR(50), 
  salary SMALLINT,
  company VARCHAR(20)
);

INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM employees;

CREATE TABLE companies 
(  
  company_id CHAR(9), 
  company VARCHAR(20),
  number_of_employees SMALLINT
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies;

select name, company
from employees
where company in (select company from companies where number_of_employees > 15000);

select company_id, company
from companies
where company in (select company from employees where state = 'Florida')

select name, state
from employees
where company in(select company from companies where company_id > '100')





