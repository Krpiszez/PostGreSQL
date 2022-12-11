--//1.Example: Find the company and number_of_employees whose number_of_employees is the second highest from the companies table
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

select company, number_of_employees from companies order by number_of_employees desc offset 1 row fetch next 1 row only

select company, number_of_employees from companies where number_of_employees = (select max(number_of_employees) from companies where number_of_employees < (select max(number_of_employees) from companies))

--//2.Example: Find the company names and number of employees whose number of employees is less than the average number of employees

select company, number_of_employees from companies where number_of_employees < (select avg(number_of_employees) from companies)

--//1.Example: Update the number of employees to 16000 if the number of employees is less than the average number of employees

update companies set number_of_employees = 16000 where number_of_employees < (select avg (number_of_employees) from companies)

drop table companies




