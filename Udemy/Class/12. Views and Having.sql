-- CREATE VIEWS     poupa tempo reescrevendo o codigo com join diversas vezes
-- view é uma tabela virtual que você cria e pode unir diversas tabelas e fazer consultas a partir dela ao inves de fazer varios joins.
SELECT title, released_year, genre, rating, concat(first_name, ' ', last_name) as reviewer
FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id
ORDER BY reviewer, title;
 
-- cria a view:
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, concat(first_name, ' ', last_name) as reviewer
FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id
ORDER BY reviewer, title;
 
-- agora ela funciona como uma tabela virtual:
SELECT * FROM full_reviews;

-- Replacing/Altering Views

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;
 
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;
 
ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;
 
DROP VIEW ordered_series;

-- HAVING       utiliza-se somente para GROUP BY. É a mesma coisa que o WHERE

select title
from full_reviews
group by title
having title like 'a%';

SELECT title, AVG(rating), COUNT(rating) AS review_count
FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1;

-- WITH ROLL UP     conta a partir de todas as unidades apresentadas no codigo. Só funciona com GROUP BY.

select title, count(rating) from full_reviews group by title with rollup;