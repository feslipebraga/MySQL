-- select all the books written before 1980 (non inclusive)

select * from books where released_year < 1980;

-- select all the books written by with the last name of the author Eggers or Chabon.

select * from books where author_lname in ('eggers', 'chabon');

-- Select all the books written by Lahiri that were published after the year 2000.

select * from books where author_lname = 'lahiri' and released_year > 2000;

-- select all books that have a page count between 100 and 200.

select title, pages from books where pages between 100 and 200 order by pages;

-- Select all books where the author's last name starts with a C or an S.

select * from books where author_lname like 'c%' or author_lname like 's%' order by author_lname;

--

select title, author_lname, 
case
    when title like '%stories%' then 'Short Stories'
    when title = 'Just Kids' or title = 'A Heartbreaking Work of Staggering Genius' then 'Memoir'
    else 'Novel'
END as 'TYPE'
from books;

-- how many books each author has written.

select author_fname, author_lname,
case
    when count(*) = 1 then '1 book'
    else concat(count(*), ' books')
end as count
from books
where author_lname is not null
and author_fname is not null
group by author_fname, author_lname;