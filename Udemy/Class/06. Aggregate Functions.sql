-- COUNT

SELECT COUNT(*) FROM BOOKS;

select count(distinct author_fname)
from books;

select count(title)
from books
where title
like '%the%';

-- GROUP BY

select concat(author_fname, ' ', author_lname)
as author, count(*) as books
from books
group by author
order by books desc, author; 

select released_year, count(released_year) as qty
from books
group by released_year
order by qty desc;

-- MIN and MAX

SELECT MIN(released_year)
FROM books;

SELECT MAX(pages)
FROM books;

-- SUBQUERIES

SELECT title, pages
FROM books
where pages = (select max(pages) from books);

-- GROUPING BY MULTIPLE COLUMNS

select
    concat(author_fname,
    author_lname) as author,
    count(*) as books_written,
    min(released_year) as earliest,
    max(released_year) as latest,
    max(pages) as longest_book
from books
group by author;

select
    concat(author_fname,
    author_lname) as author,
    max(pages) as longest_page_count
from books
group by author;

