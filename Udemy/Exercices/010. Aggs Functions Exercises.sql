-- print the total number of books in the database 
select
    count(*) as total_books
from books;

-- print out how many books were released by each year.

select
    released_year,
    count(*)
from books
group by released_year;

--  print out the total number of books in stock.

select sum(stock_quantity) from books;

-- find the average released year for each author.

select
    concat(author_fname, author_lname) as author,
    avg(released_year)
from books
group by author;

-- find the full name of the author who wrote the longest book.

select
    concat(author_fname,
    ' ',
    author_lname) as author
from books
where pages = (
    select max(pages)
    from books);

-- How many books were released in that year and the average number of pages in those books.

select
    released_year as year,
    count(*) as '# books',
    avg(pages) as 'avg pages'
from books
group by year
order by year;

