CREATE TABLE rev_workers
(
worker_id SMALLINT,
worker_name VARCHAR(50),
worker_salary SMALLINT,
CONSTRAINT  rev_worker_id_pk PRIMARY KEY(worker_id)
)

INSERT INTO rev_workers VALUES(101, 'Ali Can', 12000 );
INSERT INTO rev_workers VALUES(102, 'Veli Han', 2000 );
INSERT INTO rev_workers VALUES(103, 'Ayse Kan', 7000 );
INSERT INTO rev_workers VALUES(104, 'Angie Ocean', 12000 );

select * from rev_workers;

--Increase the salary of Veli Han to 20 percent less than the highest salary 
update rev_workers
set worker_salary = (select max(worker_salary)*0.8 from rev_workers)
where worker_id = 102;

--Decrease the salary of Ali Can to 30 percent more than the lowest salary

update rev_workers
set worker_salary = (select min(worker_salary)*1.3 from rev_workers)
where worker_id = 101;

--Increase the salaries by 1000 if the salaries are less then the average salary

update rev_workers
set worker_salary = worker_salary + 1000
where worker_salary < (select avg (worker_salary) from rev_workers);

--Make the salaries equal to the average salary if the salaries are less then the average salary

update rev_workers
set worker_salary = (select avg(worker_salary) from rev_workers)
where worker_salary < (select avg(worker_salary) from rev_workers);

CREATE TABLE rev_people
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)     
)

INSERT INTO rev_people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO rev_people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO rev_people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO rev_people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO rev_people(ssn, address) VALUES(567890123, 'California');
INSERT INTO rev_people(ssn, name) VALUES(567890123, 'California');

select * from rev_people;
--Change null names to "Name will be inserted later"

update rev_people
set name = 'Name will be inserted later'
where name is null;

--Change null addresses to "Address will be inserted later"

update rev_people
set address = 'Address will be inserted later'
where address is null;

--Delete records which do not have name

delete from rev_people
where name = 'Name will be inserted later';

select * from rev_people;

--Delete all records whose name is null or address is null

delete from rev_people
where name is null or address = 'Address will be inserted later';

--Delete all records whose SSN is greater than 123456789 and less than 345678901

delete from rev_people
where ssn > 123456789 and ssn< 345678901;

--Delete all records whose name is not null 

delete from rev_people
where name is NOT null;

truncate table rev_workers;

CREATE TABLE rev_workers
(
    id SMALLINT,
    name VARCHAR(50),
    salary SMALLINT,
    CONSTRAINT id4_pk PRIMARY KEY(id)
) 

INSERT INTO rev_workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO rev_workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO rev_workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO rev_workers VALUES(10004, 'Angie Ocean', 8500); 

drop table rev_workers;
select * from rev_workers;

--How to get specific field from a table:
select name
from rev_workers;

--How to get specific multiple fields

select name, salary
from rev_workers;

--How to get specific record

select *
from rev_workers
where id = 10001;

--How to get multiple specific record

select * 
from rev_workers
where id < 10003;

--Get records whose salary is 2000 or 7000 or 12000

select *
from rev_workers
where salary = 2000 or salary = 7000 or salary = 12000;

select * 
from rev_workers
where salary in(2000,7000,12000);
--How to select specific cell

select name
from rev_workers
where id = 10001;

--Interview Question: How to select record whose salary is the highest

select *
from rev_workers
where salary = (select max(salary) from rev_workers);

--Interview Question: How to select worker name whose salary is the lowest

select name
from rev_workers
where salary = (select min (salary) from rev_workers);

--Interview Question: How to select records whose salary is the lowest and the highest

select *
from rev_workers
where salary in ((select max(salary) from rev_workers), (select min(salary) from rev_workers));

--Select maximum salary
--By using 'AS' you can put temporary field names for your table on the console. 

select max (salary) as maximum_salary
from rev_workers;

--Select minimum salary

select min(salary) as minimum_salary
from rev_workers;

--Select average salary

select avg (salary) as average_salary
from rev_workers;

--Select number of workers

select count(name) as number_of_workers
from rev_workers;

--Find the sum of the salaries

select sum(salary) as sum_of_salaries
from rev_workers;

--The Best Interview Question: Select the second highest salary

select max(salary) as second_max
from rev_workers
where salary < (select max(salary) from rev_workers);


--The Best Interview Question: Select the second lowest salary

select min (salary) as second_lowest
from rev_workers
where salary > (select min(salary) from rev_workers);








