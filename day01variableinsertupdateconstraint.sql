-- How to delete table from database
drop table students;

--How to create a table.

CREATE TABLE students(

	student_id CHAR(5) primary key,
	student_name VARCHAR,
	email_address varchar not null,
	student_age numeric(2) check(student_age > 0),
	phone_number char(10) unique
	
)
-- Before running highlight the code and dont run a code more than once.
-- How to see the table 
select * from students;

-- How to insert data in to a table.
insert into students values('11111', 'Tom Hanks', 'th@gmail.com', 15, '1234567890');
insert into students values('11112', 'Brad Pitt', 'bp@gmail.com', 22, '2345678901');
insert into students values('113', 'Tom Hanks', 'th@gmail.com', 12, '3456789012');

--How to insert data into a table for specific fields

insert into students(student_id, email_address, phone_number) values('11114', 'abc@gmail.com', '4567890123');
insert into students(email_address, phone_number, student_id) values('xyz@gmail.com', '5678901234', '11115');

--How to update existing data in a table
-- in programming language set means update here we use set also to update a row(record)
-- Example 1 Change 113 student id to 11113
update students
set student_id = '11113'
where student_id = '113';
--Example 2 Change Tom Hanks to Anthony Quinn
update students
set student_name = 'Anthony Quinn'
where student_name = 'Tom Hanks';
--EXAMPLE 3: Change bp@gmail.com to null
--constraints are taking role in insert and update operations.
--Following code will give error because email_address has NOT_NULL constraints.
update students
set email_address = null
where email_address = 'bp@gmail.com';
--EXAMPLE 4: Update all students’ age to the maximum age
update students
set student_age = (select max(student_age) from students);

select * from students;

--create another table
--EXAMPLE 5: Create parents table with the parent_id, parent_name, student_id, parent_address, parent_dob fields
create table parents(

	parent_id char(5) Primary key,
	parent_name text,
	student_id char(5) ,
	parent_address text,
	parent_dob date

)

select * from parents;
--EXAMPLE 6: Insert 6 records into the parents table (edited) 
insert into parents values('21111', 'Mark Hanks', '11111', 'Miami, FL', '1994-10-23');
insert into parents values('21112', 'Angie Pitt', '11112', 'New York, USA', '1987-2-13');
insert into parents values('21113', 'John Walker', '11113', 'Berlin, Germany', '1975-12-5');
insert into parents values('21114', 'May Star', '11114', 'Istanbul, Turkey', '1975-12-1');
--EXAMPLE 7: Change all date of births to the minimum date of birth
update parents
set parent_dob = (select min(parent_dob) from parents);

CREATE TABLE pupils (

	student_id CHAR(5) primary key,
	pupil_name VARCHAR,
	email_address varchar not null,
	pupil_age numeric(2) check(pupil_age > 0),
	phone_number char(10) unique,
	constraint student_id_fk foreign key(student_id) references parents(parent_id)
	
)







