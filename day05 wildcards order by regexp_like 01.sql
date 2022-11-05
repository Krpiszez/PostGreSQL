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

-- select the words whose first character is 's' or 'a' or 'y'
select word
from words
where regexp_like(word, '^[say]'); -- ^ means first character [] means regexp  * means all, everything ?

-- select words whose last character is 'm' or 'a' or 'f'
select word
from words
where regexp_like(word, '[maf]$'); -- $ means last character you put them outside [] and if ^ before if $ after.

-- select words whose first char is 's' and last char is 'a'
select word
from words
where regexp_like(word, '^[s].*[a]$'); -- here it means first char and something between and last char. '.*' means there should be 0 or more character after 
-- first char and before last char

-- select words which have 'a' in any position 
select word
from words
where regexp_like (word, 'a'); --'a' is same with %a% with like.

-- select words which have char from 'd' to 't' at the beginng and followed by any char and then followed by 'l'.
select word
from words
where regexp_like(word, '^[d-t].[l]'); -- here '.' means any char( 1 )

-- select words which have char from 'd' to 't' at the begnng followed by any two char and the followed by 'e'.
select word
from words
where regexp_like(word, '^[d-t]..[e]'); -- here '..' means 2 char after between

-- Select words which do NOT have 'h' in any position
-- NOT LIKE Condition
select word
from words
where word not like '%h%';

-- select words which do not end with 't' and do not and with with 'f'
select word
from words
where word not like '%t' and word not like '%f';

-- select words which start with any character, not followed by 'a', not followed by 'e'
select word
from words
where word not like '_a%' and word not like '_e%';

-- order by function: to put records in ascending or descending order we use order by
--					  order by statement can be used with select clauses.

-- put the records in ascending order by using number_of_letters.
select *
from words
order by number_of_letters asc;

-- put the recors in desscending order by using number_of_letters
select *
from words
order by number_of_letters desc;

--ASC statement  is optional because it is returning us default order (natural order \ numeric data => ASC, char => alphabetical)
--but if the task requires DESC order then put DESC statement explicitly no put desc it will be asc

-- Note In "Order By", instead of field(column) names, we can use field numbers as well.
select *
from words
order by 3 asc; -- here 3 is "number_of_letters". Because it is 3. column(field).

select *
from words
order by 2 desc;

CREATE TABLE points(
name varchar(50),
point smallint
)

INSERT INTO points VALUES ('Ali', 85);
INSERT INTO points VALUES ('Tom', 65);
INSERT INTO points VALUES ('Veli', 55);
INSERT INTO points VALUES ('Kemal', 75);
INSERT INTO points VALUES ('Eddie', 95);
INSERT INTO points VALUES ('Brad', 56);
INSERT INTO points VALUES ('Cynthia', 67);
SELECT * FROM points;

-- put the points of students in descending order. 
select *
from points
order by 2 desc;
-- put the name column in order
select *
from points
order by name;


CREATE TABLE employees2
(
employee_id smallint,
employee_first_name varchar(20),
employee_last_name varchar(20)
)                                                                                                                                                                                                                                                                             INSERT INTO employees VALUES(14, 'Chris', ‘Tae’);
INSERT INTO employees2 VALUES(11, 'John', 'Walker');
INSERT INTO employees2 VALUES(12, 'Amy', 'Star');
INSERT INTO employees2 VALUES(13, 'Brad', 'Pitt');
INSERT INTO employees2 VALUES(15, 'Chris', 'Way');
select * from employees2;

CREATE TABLE addresses
(
employee_id smallint,
street varchar(20),
city varchar(20),
state char(2),
zipcode char(5)
)
INSERT INTO addresses VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES(12, '23rd Rain 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES(14, '3rd Man 12', 'Weston', 'MI', '12345');
INSERT INTO addresses VALUES(15, '11th Chris 12', 'St. Johns', 'FL', '32259');
























