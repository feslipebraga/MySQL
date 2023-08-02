-- CONCAT
SELECT
    CONCAT (x, y, z)
FROM
    tableName;

SELECT
    CONCAT (author_fname, ' ', author_lname)
FROM
    books;

-- CONCAT_WS
SELECT
    CONCAT_WS(' - ', author_fname, author_lname)
FROM
    books;

-- SUBSTRING
SELECT
    SUBSTRING('Hello World', 1, 4);

SELECT
    SUBSTRING('Hello World', 7);

SELECT
    SUBSTRING('Hello World', -3);

SELECT
    SUBSTRING(title, 1, 10) AS 'short title'
FROM
    books;

SELECT
    SUBSTR(title, 1, 10) AS 'short title'
FROM
    books;

-- COMBING STRING FUNCTIONS
select
    concat(
        substr(author_fname, 1, 1),
        '. ',
        author_lname
    ) as AUTHORS
from
    books;

SELECT
    CONCAT (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM
    books;

-- REPLACE
SELECT
    REPLACE ('cheese bread coffee milk', ' ', ' and ');

SELECT
    REPLACE (title, ' ', '-')
FROM
    books;

-- REVERSE
SELECT
    REVERSE('natan');

SELECT
    CONCAT(author_fname, ' - ', reverse(author_fname))
FROM
    books;

-- CHAR_LENGTH

SELECT
    LENGTH('Hello');

SELECT
    book_id, LENGTH(title)
FROM
    books;

-- UPPER AND LOWER CASE

SELECT
    UPPER('Hello World');

SELECT
    CONCAT(UPPER(author_lname), '. ', author_fname)
FROM
    books;

-- INSERT

SELECT
    INSERT('Hello Bobby!', 6, 0, ' There,');

-- LEFT and RIGHT

SELECT LEFT('omghahalol'), 3;  -- returns omg

SELECT RIGHT('omghahalol'), 3; -- returns lol

-- REPEAT

SELECT REPEAT('MySQL', 3);  -- returns MySQLMySQLMySQL

-- TRIM (removes spaces, or whatever.)

SELECT TRIM('     world      ')

SELECT TRIM(BOTH '.' FROM '........san antonio...');

