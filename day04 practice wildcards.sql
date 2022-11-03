
CREATE TABLE companies 
(  
  company_id CHAR(9), 
  company VARCHAR(20),
  number_of_employees SMALLINT
)

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies;

----Find the employee name and state which has companies whose companies ids are greater than 100.
select name, state
from employees
where company in (select company from companies where companies.company_id > '100');

--Find the employee and company names has more than 1500 employees
select name, company
from employees
where company in(select company from companies where number_of_employees > 15000);

--Find company ids and company names which are in Florida
select company_id, company
from companies
where company in (select company from employees where employees.state = 'Florida');

--Find the company name, number of employees and average salary for every company.
select company, number_of_employees, (select avg(salary) from employees where companies.company=employees.company)
from companies;

--Find the name of the companies, company ids, maximum and minimum salaries per company.
select company, company_id, (select max(salary) from employees where companies.company=employees.company) as maximum_salary, (select min(salary) from employees where companies.company=employees.company) as minimum_salary
from companies;

-- WildCard %: It represents zero or more characters
-- LIKE condition: It is used with WildCards

-- select employee names which starts with 'E'
select name
from employees
where name like 'E%';

-- select employee names which ends with 'e'
select name
from employees
where name like '%e';

-- select the employee names which starts with 'B' and ends with 't'
select name 
from employees
where name like 'B%t';

-- select the employee names which as a in any position
select name
from employees
where name like '%a%';

-- select the employee names which has 'e' and 'r' in any position
select name
from employees
where name like '%e%r%' or name like '%r%e%';

-- 2) _ WildCard: It represents a single character

-- select state whose second character is 'e' and forth character is 'n'
select state
from employees
where state like '_e_n%';

--Select states which has 'i' in any position after second character
SELECT state
FROM employees
WHERE state LIKE '__%i%';
--3)REGEXP_LIKE Condition: You can use Regular Expressions with REGEXP_LIKE Condition
CREATE TABLE words
(
word_id SMALLINT UNIQUE,
word varchar(50) NOT NULL,
number_of_letters SMALLINT
)
INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
SELECT * FROM words;
--Select words whose first character is 'h', the last character is 't' and second character is 'o', or 'a' or 'i'
--1.way:
SELECT word
From words
WHERE word LIKE 'hot' OR word LIKE 'hat' OR word LIKE 'hit';
--2.way:
SELECT word
FROM words
WHERE REGEXP_LIKE (word, 'h[oai]t');
--Select words whose first character is 'h', last character is 't' and second character can be any character from 'a' to 'e'.
SELECT word
FROM words
WHERE REGEXP_LIKE (word, 'h[a-e]t');--[a-e] menas that starting from 'a' to 'e'


