-- NOT EQUAL !=
select title, released_year from books where released_year != 2003 order by released_year;

-- not like

select * from books where title not like '% %';

-- greater than

select * from books where pages > 500

-- less than

SELECT * FROM books WHERE released_year < 2000;
 
-- less than or equal to

SELECT * FROM books WHERE released_year <= 1985;

-- AND

SELECT title FROM books WHERE released_year > 2010 AND author_lname = 'Eggers';

-- OR

SELECT title, author_lname FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Gaiman';

-- BETWEEN

SELECT title, released_year FROM books WHERE released_year BETWEEN 2000 AND 2023 ORDER BY released_year;

-- COMPARING DATES

SELECT * FROM people WHERE HOUR(birthtime) BETWEEN 8 AND 16;

-- IN

SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

-- % 1 = ÍMPARES     % 0 = PARES
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 = 0;

-- CASE

SELECT title, released_year,
CASE
    WHEN released_year >= 2000 THEN 'livro moderno'
    ELSE 'classico'
END as genero
FROM BOOKS;

-- IS NULL

SELECT * FROM BOOKS WHERE title IS NULL;