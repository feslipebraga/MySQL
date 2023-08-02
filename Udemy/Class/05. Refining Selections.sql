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

