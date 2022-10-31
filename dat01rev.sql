create table rev_students(

	student_id char(5) primary key,
	student_name text,
	student_age numeric(2),
	email_address varchar not null
	
)

insert into rev_students values('11111', 'Ali Veli', 16, 'av@gmail.com');
insert into rev_students values('11112', 'Ali B', 16, 'av@gmail.com');
insert into rev_students values('11113', 'Ali C', 16, 'av@gmail.com');
insert into rev_students values('11114', 'Ali D', 16, 'av@gmail.com');
insert into rev_students values('11115', 'Ali E', 16, 'av@gmail.com');

select * from rev_students;

update rev_students
set student_age = 19
where student_age = 16;

update rev_students
set email_address = 'ab@gmail.com'
where student_name = 'Ali B';
update rev_students
set email_address = 'ac@gmail.com'
where student_name = 'Ali C';
update rev_students
set email_address = 'ad@gmail.com'
where student_name = 'Ali D';
update rev_students
set email_address = 'ae@gmail.com'
where student_name = 'Ali E';

create table rev_parents(

	parent_id char(5) primary key,
	parent_name text,
	parent_address text,
	parent_dob date,
	student_id char(5)
	
)
insert into rev_parents values('21111', 'Osman Veli', 'Poland', '1987-2-13','1111');
insert into rev_parents values('21112', 'Osman B', 'Germany', '1982-12-23', '11112');
insert into rev_parents values('21113', 'Osman C', 'France', '1980-4-3', '11113');
insert into rev_parents values('21114', 'Osman D', 'Netherlands', '1977-6-14', '11114');
insert into rev_parents values('21115', 'Osman E', 'Sweeden', '1975-1-18', '11115');

select * from rev_parents;

update rev_parents
set parent_address = 'Turkey'
where parent_address = 'France';
update rev_parents
set parent_dob = '1993-11-29'
where parent_address = 'Turkey';
update rev_parents
set parent_dob = (select min(parent_dob) from rev_parents);

create table rev_pupils(
	
	student_id char(5) primary key,
	pupil_name text,
	email_address text not null,
	pupil_age numeric(2) check(pupil_age>0),
	phone_number char(10) unique,
	constraint student_id_fk foreign Key (student_id) references rev_parents(parent_id)

)





















