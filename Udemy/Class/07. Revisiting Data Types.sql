-- CHAR vs VARCHAR
-- INT, TINYINT, BIGINT, etc
-- DECIMAL
DECIMAL(5,2) -- total number of digits, digits after decimal
-- FLOAT & DOUBLE
-- DATE
YYYY-MM-DD
-- TIME
HH:MM:SS 
-- DATETIME
YYYY-MM-DD HH:MM:SS 

-- WORKING WITH DATES

create table people (
    name VARCHAR(100),
    birthdate date,
    birthtime time,
    birthdt datetime
);

insert into people values
('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:0'),
('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10'),
('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

-- CURDATE, CURTIME and NOW

CURDATE() -- returns current date
CURTIME() -- returns current time
NOW()     -- returns currente date and time

insert into people values
('Hazel', CURDATE(), CURTIME(), NOW());

-- DATE FUNCTIONS

DAY()
DAYOFWEEK()
DAYOFYEAR()
MONTH()
MONTHNAME()

select birthdt, year(birthdt)
from people;

-- TIME FUNCTIONS

HOUR()
MINUTE()
SECOND()

select birthdt, second(birthdt)
from people;

