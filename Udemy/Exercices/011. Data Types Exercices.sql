create table inventory(
	item_name varchar(50),
	price decimal(8,2),
	quantity int 
);

-- print out the current time

SELECT CURTIME();

-- print out the current date

SELECT CURDATE();

-- print out the current day of the week as a number

SELECT DAYOFWEEK(CURDATE()) as 'DAY OF WEEK';

-- the day name

SELECT DAYNAME(CURDATE()) as 'DAY NAME';

-- print out the current day and time using this format: mm/dd/yyyy

SELECT DATE_FORMAT (CURDATE(), '%m/%d/%Y');

-- print out the current day and time using this format: January 2nd at 3:15

SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

-- create a twret table

CREATE TABLE tweets (
    tweetContent varchar(140),
    username varchar(15),
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tweets (tweetContent, username) VALUES('this is my second tweet', 'coltscat');