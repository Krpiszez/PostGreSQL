CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;

--//1.Example: Update the number of employees to 9999 if the company name is IBM by using prepared statement

update companies
set number_of_employees = 9999
where company = 'IBM'

--////2.Example: Update the number of employees to 5555 if the company name is GOOGLE by using prepared statement

update companies
set number_of_employees = 5555
where company = 'GOOGLE'

--//1.Example: Create a function which uses 2 parameters and return the sum of the parameters

CREATE or replace FUNCTION additionF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN

RETURN x+y;

END
$$

select * from additionF(2,3) as "Addition"

CREATE or replace FUNCTION additionF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN

RETURN (3.14*x*x*y)/3;

END
$$








