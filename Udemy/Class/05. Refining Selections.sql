-- DISTINCT

SELECT DISTINCT author_lname FROM books;
 
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
 
SELECT DISTINCT author_fname, author_lname FROM books;

-- ORDER BY

SELECT * FROM books
ORDER BY author_lname;
 
SELECT * FROM books
ORDER BY author_lname DESC;

SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY 2 desc;

-- LIMIT

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,3;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10,1;

-- LIKE

select title from books
where title like 't%';

select title from books
where title like '%:%';

select * from books
where author_fname like '___e';

select * from books
where title like '%\%%';        -- to find characteres with % or _