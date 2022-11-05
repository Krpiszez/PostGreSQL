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

-- select the words whose first character is 's' or 'a' or 'y'

select word
from words
where regexp_like (word, '^[say]') ;

-- select words whose last character is 'm' or 'a' or 'f'

select word
from words
where regexp_like (word, '[maf]$');

-- select words whose first char is 's' and last char is 'a'

select word
from words
where regexp_like (word, '^[s].*[a]$');

-- select words which have 'a' in any position 

select word
from words
where regexp_like (word, 'a');

-- select words which have char from 'd' to 't' at the beginng and followed by any char and then followed by 'l'.

select word
from words
where regexp_like (word, '^[d-t].[l]');

-- select words which have char from 'd' to 't' at the begnng followed by any two char and the followed by 'e'.

select word
from words
where regexp_like (word, '^[d-t]..[e]');

-- Select words which do NOT have 'h' in any position

select word
from words
where word not like '%h%';

-- select words which do not end with 't' and do not and with with 'f'

select word
from words
where word not like '%t'and word not like '%f';

-- select words which start with any character, not followed by 'a', not followed by 'e'

select word
from words
where word not like '_a%' and word not like '_e%'; 

-- put the records in ascending order by using number_of_letters.

select *
from words
order by number_of_letters;

-- put the recors in desscending order by using number_of_letters

select *
from words
order by number_of_letters desc;


