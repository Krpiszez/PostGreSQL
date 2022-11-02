CREATE TABLE workers
(
    id SMALLINT,
    name VARCHAR(50),
    salary SMALLINT,
    CONSTRAINT id4_pk PRIMARY KEY(id)
);  
    
INSERT INTO workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO workers VALUES(10004, 'Angie Ocean', 8500);


SELECT * FROM workers;

--1) Select the second highest salary from workers table
SELECT MAX(salary) AS maximum_salary
FROM workers
WHERE salary < (SELECT MAX(salary) 
                FROM workers);

--2) Select the second lowest salary from workers table
SELECT MIN(salary) AS second_minimum_salary
FROM workers
WHERE salary > (SELECT MIN(salary) 
                FROM workers);

--3) Select the third highest salary from workers table

SELECT MAX(salary) AS third_max_salary
FROM workers
WHERE salary < (SELECT MAX(salary) AS maximum_salary
               FROM workers
               WHERE salary < (SELECT MAX(salary) 
                               FROM workers));
               
--4) Select the third lowest salary from workers table

SELECT MIN(salary) AS third_lowest_salary
FROM workers
WHERE salary > (SELECT MIN(salary) AS second_minimum_salary
                FROM workers
                WHERE salary > (SELECT MIN(salary) 
                                FROM workers));
                
--5) Interview Question: Select all data about the worker whose salary is the second highest
--1st Way:
SELECT *
FROM workers
WHERE salary = (SELECT MAX(salary) AS maximum_salary
                FROM workers
                WHERE salary < (SELECT MAX(salary) 
                                FROM workers));
                
--2nd Way:
SELECT *
FROM workers
ORDER BY salary DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

--6) Interview Question: Select all data about the worker whose salary is the second lowest 

--1st Way: This works for all SQLs
SELECT *
FROM workers
WHERE salary = (SELECT MIN(salary)
                FROM workers
                WHERE salary > (SELECT MIN(salary) 
                                FROM workers));
                
                
--2nd Way: 
SELECT *
FROM workers
ORDER BY salary
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;


--7) Challenge: Select all data whose salary is the third highest salary from workers table

--1st Way:
SELECT *
FROM workers
WHERE salary = (SELECT MAX(salary)
                FROM workers
                WHERE salary < (SELECT MAX(salary)
                FROM workers
                WHERE salary < (SELECT MAX(salary) 
                                FROM workers)));


--2nd Way:
SELECT *
FROM workers
ORDER BY salary DESC
OFFSET 2 ROW
FETCH NEXT 1 ROW ONLY;




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
                

--8) Select records whose product name is Orange or Apple or Palm

--1st Way: Not recommended beacause of the repetition
SELECT *
FROM customers_products
WHERE product_name = 'Orange' OR product_name = 'Apple' OR product_name = 'Palm';

--2nd Way: Recommended

SELECT *
FROM customers_products
WHERE product_name IN('Orange','Apple','Palm');



--NOT IN Condition
-- != means <> in SQL
--9) Select records whose product name is not Orange or Apple or Palm

SELECT *
FROM customers_products
WHERE product_name NOT IN('Orange','Apple','Palm');


--BETWEEN Condition

--10) Select records whose product id is less than or equal to 30 and greater than or equal to 20

--1st Way: Not recommended beacause of the repetition
SELECT *
FROM customers_products
WHERE product_id <= 30 AND product_id>=20;

--2nd Way: Recommended
SELECT *
FROM customers_products
WHERE product_id BETWEEN 20 AND 30;-- 20 and 30 are inclusive (Use smaller first)

--NOT BETWEEN Condition
--11) Select records whose product id is less than 20, greater than 25

--1st Way:
SELECT *
FROM customers_products
WHERE product_id <20 OR product_id>25;


--2nd Way:
SELECT *
FROM customers_products
WHERE product_id NOT BETWEEN 20 AND 25;--in NOT BETWEEN 20 and 25 are exclusive

SELECT * FROM customers_products;


--EXISTS Condition: EXISTS Condition is used with Subqueries.
--                  If the subquery returns any record Outer Query will be executed.
--                  If the subquery does not return any record Outer Query will not be executed.
--                  It can be used in SELECT, INSERT, UPDATE and DELETE commands.


                
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

SELECT * FROM customers_likes;

--12) Update names to "No name" if there is Lary among names in customers_likes table

UPDATE customers_likes
SET customer_name ='No Name'
WHERE EXISTS (SELECT customer_name FROM customers_likes WHERE customer_name = 'Lary');


--13) Update names to "No name" if there is any liked product whose name is Orange or Pineapple or Avocado in customers_likes table

UPDATE customers_likes
SET  customer_name = 'No Name'
WHERE EXISTS (SELECT customer_name FROM customers_likes WHERE liked_product IN('Orange','Pineapple','Avocado'));


--14) Update names to "No name" whose liked product name is Orange or Pineapple or Avocado
UPDATE customers_likes
SET  customer_name = 'No Name'
WHERE liked_product IN ('Orange','Pineapple','Avocado');

--15) Delete records if there is 'Orange' as product_name in customers_likes table

DELETE FROM customers_likes
WHERE EXISTS (SELECT product_id FROM customers_likes WHERE liked_product='Orange');


SELECT * FROM customers_likes;

--SUBQUERY

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

--16)Find the employee and company names whose company has more than 15000 employees
SELECT name, company
FROM employees
WHERE company IN (SELECT company FROM companies WHERE number_of_employees > 15000);

--17)Find the company ids and company names which are in Florida

SELECT company_id, company
FROM companies
WHERE company IN (SELECT company FROM employees WHERE state = 'Florida');

--18)Find the employee name and state which has companies whose company ids are greater than 100
SELECT name, state
FROM employees
WHERE company IN(SELECT company FROM companies WHERE company_id > '100');

SELECT * FROM employees;
SELECT * FROM companies;