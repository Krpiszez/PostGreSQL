CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
)
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);


-- Alter Table
-- Alter Table statement is used to add, delete or modify fields (columns) in an existing table.
-- Alter table statement is also used to add constraints in an existing table

-- 1) We can add a column(field) to an existing table.
alter table workers
add company_industry varchar(20);

-- 2) How to add a field with default values
alter table workers
add worker_address varchar(50) default 'Miami, FL, USA';

-- 3) How to add multiple fields into an existing table
alter table workers
add number_of_workers char(5) default 0,
add name_of_ceo varchar(20);

-- add company_name column with default value 'No Name'
alter table workers
add company_name varchar(20) default 'No Name';

-- 4) How to drop(delete) tables from a table
alter table workers
drop column name_of_ceo;

-- 5) How to rename a field
alter table workers
rename column company_industry to company_profession;

-- 6) How to rename a table
alter table workers
rename to employees;

-- 7) How to modify( i)add constraint, ii)change data type, change data size ...) a field
-- 
-- i) How to add constraint
-- i1) Add 'Unique' Constraint to company_profession field.
alter table employees
add constraint company_profession_unique unique(company_profession);-- unique accepts multiple null data
-- i2) Add 'Unique' Constraint to number_of_workers field.
alter table employees
add constraint number_of_workers_unique unique(number_of_workers);-- unique does not accept duplicated data (except null)

-- i3) Add 'Not null' constraint to worker_address field
alter table employees
alter column worker_address set not null;

-- i4) Add 'Not null' constraint to company_profession field
alter table employees
alter column company_profession set not null; -- cannot be done ==> column "company_profession" of relation "employees" contains null values

--b) How to change data type-size of a field:

--b1)Change the data type of the company_profession to CHAR(5)
ALTER TABLE employees
ALTER COLUMN company_profession TYPE CHAR(5);

--b2) Change the data type of the worker_address to CHAR(5)
ALTER TABLE employees
ALTER COLUMN worker_address TYPE CHAR(5);--ERROR:  value too long for type character(5)

--b3) Change the data type of the worker_address to CHAR(15)
ALTER TABLE employees
ALTER COLUMN worker_address TYPE CHAR(15);

-- How to write function
-- A function is created to do some tasks faster (Averaging ...)
-- A function can be created for CRUD operations
-- In SQL, every function returns a data as return type. 
-- Operations that do not return data  as return type are called "Procedure"

create or replace function addf(x numeric, y numeric) -- here it can only be used with create but if function exist replace will take place.
returns numeric 									  -- return data type must be same as parameter data type
language plpgsql									  -- plpgsql == > Procedural Language Post Gre SQL
as
$$													  -- here $ means opening and closing parenthesis
Begin

return x+y;											  -- whatever you type here the fucntion returns it.

end
$$

select * from addf(6, 4) as "Addition";

create or replace function volumef(r numeric, h numeric)
returns numeric
language plpgsql
as
$$
begin

return  3.14 * r * r * h / 3;

end
$$

select * from volumef(2,5) as "Volume";

select to_char(volumef(2,5), '00.00');




SELECT * FROM employees;










