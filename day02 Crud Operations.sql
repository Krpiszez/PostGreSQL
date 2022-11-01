--Create workers table whose fields are worker_id, worker_name, worker_salary.
--worker_id will have primary key with the name worker_id_pk
--Insert 4 records into the workers table
--See the table on the console

CREATE TABLE workers
(
worker_id SMALLINT,
worker_name VARCHAR(50),
worker_salary SMALLINT,
CONSTRAINT  worker_id_pk PRIMARY KEY(worker_id)
)

INSERT INTO workers VALUES(101, 'Ali Can', 12000 );
INSERT INTO workers VALUES(102, 'Veli Han', 2000 );
INSERT INTO workers VALUES(103, 'Ayse Kan', 7000 );
INSERT INTO workers VALUES(104, 'Angie Ocean', 12000 );


--Increase the salary of Veli Han to 20 percent less than the highest salary 
UPDATE workers
SET worker_salary = (SELECT MAX(worker_salary)*0.8 FROM workers)
WHERE worker_id = 102;


--Decrease the salary of Ali Can to 30 percent more than the lowest salary
UPDATE workers
SET worker_salary = (SELECT MIN(worker_salary)*1.3 FROM workers)
WHERE worker_id = 101;


--Increase the salaries by 1000 if the salaries are less then the average salary
UPDATE workers
SET worker_salary = worker_salary+1000
WHERE worker_salary < (SELECT AVG(worker_salary) FROM workers);

--Make the salaries equal to the average salary if the salaries are less then the average salary
UPDATE workers
SET worker_salary = (SELECT AVG(worker_salary) FROM workers)
WHERE worker_salary < (SELECT AVG(worker_salary) FROM workers);

SELECT * FROM workers;


--IS NULL CONDITION

CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)     
)

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');

--Change null names to "Name will be inserted later"
UPDATE people
SET name = 'Name will be inserted later'
WHERE name IS NULL;--Do not use '= NULL'

--Change null addresses to "Address will be inserted later"
UPDATE people
SET address = 'Address will be inserted later'
WHERE address IS NULL;


--HOW TO DELETE Record FROM A TABLE
DELETE FROM people
WHERE ssn = 234567890;

--Delete records which do not have name
DELETE FROM people
WHERE name ='Name will be inserted later';

--Delete all records
--Delete command deletes just records, it does not destroy the table.
DELETE FROM people;

--Delete all records whose name is null or address is null
DELETE FROM people
WHERE name IS NULL OR address IS NULL;--Do not use '= NULL'

--Delete all records whose SSN is greater than 123456789 and less than 345678901
DELETE FROM people
WHERE ssn>123456789 AND ssn<345678901;

--Delete all records whose name is not null 
DELETE FROM people 
WHERE name IS NOT NULL;


--TRUNCATE Command removes all records everytime.

--What are the differences between TRUNCATE and DELETE?
--1) In DELETE FROM, you can use WHERE Clause to filter data, but in TRUNCATE you can not.
--2) If you remove records by using DELETE FROM, the records can be rolled back, but if you remove records by using TRUNCATE
-- the records can not be rolled back.

TRUNCATE TABLE people;

--How to remove table from schema?
DROP TABLE people;

SELECT * FROM people;

--DQL: It is language for reading data. We will use "SELECT".
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


--How to select all records:
SELECT * FROM workers;

--How to get specific field from a table:
SELECT name
FROM workers;


--How to get specific multiple fields
SELECT name, salary
FROM workers;

--How to get specific record
SELECT *
FROM workers
WHERE id = 10001;

--How to get multiple specific record
SELECT *
FROM workers
WHERE id <10003;

--Get records whose salary is 2000 or 7000 or 12000

--1st Way:
SELECT *
FROM workers
WHERE salary = 2000 OR salary = 7000 OR salary = 12000;

--2nd Way:
SELECT *
FROM workers
WHERE salary IN(2000,7000,12000);--IN() is used for repeated OR

--How to select specific cell
SELECT name
FROM workers
WHERE id = 10002;

--Interview Question: How to select record whose salary is the highest
SELECT *
FROM workers
WHERE salary = (SELECT MAX(salary) FROM workers);


--Interview Question: How to select worker name whose salary is the lowest
SELECT *
FROM workers
WHERE salary = (SELECT MIN(salary) FROM workers);

--Interview Question: How to select records whose salary is the lowest and the highest
--1st Way:
SELECT *
FROM workers
WHERE salary = (SELECT MIN(salary) FROM workers) OR salary = (SELECT MAX(salary) FROM workers);

--2nd WAy:
SELECT *
FROM workers
WHERE salary IN ((SELECT MIN(salary) FROM workers), (SELECT MAX(salary) FROM workers));

--Select maximum salary
--By using 'AS' you can put temporary field names for your table on the console. 
SELECT MAX(salary) AS maximum_salary
FROM workers;

--Select minimum salary
SELECT MIN(salary) AS minimum_salary
FROM workers;

--Select average salary
SELECT AVG(salary) AS average_salary
FROM workers;

--Select number of workers
SELECT COUNT(name) AS number_of_workers
FROM workers;

--Find the sum of the salaries
SELECT SUM(salary) AS total_salary
FROM workers;

--The Best Interview Question: Select the second highest salary
SELECT MAX(salary) AS second_max
FROM workers
WHERE salary < (SELECT MAX(salary) FROM workers);


--The Best Interview Question: Select the second lowest salary
SELECT MIN(salary) AS second_min
FROM workers
WHERE salary > (SELECT MIN(salary) FROM workers);