CREATE TABLE workers 
(  
  id CHAR(2), 
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2) 
);

INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

SELECT * FROM workers;

--ALTER TABLE
--The ALTER TABLE statement is used to add, delete, or modify columns in an existing table. 
--The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

--1) We can add a column to an existing table
ALTER TABLE workers
ADD company_industry VARCHAR(20);

--2) How to add a field with default value
ALTER TABLE workers
ADD worker_address VARCHAR(80) DEFAULT 'Miami, FL, USA';

--3) How to add multiple fields into a table
ALTER TABLE workers
ADD COLUMN number_of_workers CHAR(5) DEFAULT 0,
ADD COLUMN name_of_ceo VARCHAR(20);

--4)How to drop fields from a table
ALTER TABLE workers
DROP COLUMN name_of_ceo;

--5)How to rename a field/column
ALTER TABLE workers
RENAME COLUMN company_industry TO company_profession;


--6)How to rename table
ALTER TABLE workers
RENAME TO employees;

--7)How to modify(Add constraints, change data type, change the size) a field

--Note:1)When you add a constraint into a field be careful about existing data

--a)How to add constraint
--a1)Add "NOT NULL" constraint to number_of_workers field
ALTER TABLE employees
ALTER COLUMN number_of_workers SET NOT NULL;

select * from employees;
--a2)Add "UNIQUE" constraint to company_profession field
ALTER TABLE employees
ADD CONSTRAINT company_profession_unique UNIQUE(company_profession);--UNIQUE accepts repeated null data

--a3)Add "UNIQUE" constraint to worker_address field
ALTER TABLE employees
ADD CONSTRAINT worker_address_unique UNIQUE(worker_address);--Unique Constraint cannot be assigned because the existing data is repetitive.

--b)How to change data size of a field
--b1)Change the data type of the company_profession field to CHAR(5)

--Note:2)When you modify a field, new size must be greater than or equal to the maximum existing size

--b2)Change the data type of the worker_address field to CHAR(5)
ALTER TABLE employees
ALTER COLUMN worker_address TYPE CHAR(5);--Cannot decrease column length because some value is too big

--b3)Change the data type of the worker_address field to CHAR(30)
ALTER TABLE employees
ALTER COLUMN worker_address TYPE CHAR(30);

SELECT * FROM employees;



--How to write Function:

--A function is created to do some tasks faster. (Averaging etc.)
--A function can be created for CRUD operation.
--In SQL, every function returns a data as a return type.
--Operations that do not return data as return type are called "Procedure".

CREATE OR REPLACE FUNCTION addf (x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
     BEGIN

     RETURN x+y;

     END
$$


SELECT * FROM addf(-3,3) AS "Addition";


--Write a function that calculates the volume of the cone.

CREATE OR REPLACE FUNCTION volume_of_cone (r NUMERIC, h NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
     BEGIN

     RETURN 3.14*r*r*h*1/3;

     END
$$


SELECT * FROM volume_of_cone(3,6) AS "Volume";

SELECT to_char(volume_of_cone(3,6), '00.0');