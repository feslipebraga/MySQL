-- OPERADORES

= -- Equal
> -- Greater than
< -- Less than
>= -- Greater than or equal
<= -- Less than or equal
<> -- Not equal. Note: In some versions of SQL this operator may be written as !=
BETWEEN	-- Between a certain range
LIKE -- Search for a pattern
NOT LIKE -- Search for lines that haven't the paramenter.
IN -- To specify multiple possible values for a column

-- SELECIONAR TUDO

SELECT * FROM tablename;

-- SELECIONAR COLUNAS ESPECIFICAS

SELECT colum_1, colum_2...
FROM tablename;

-- LIKE

select * from tablename
where column
-- Examples
like '%a'
like 'a%'
like '%a%'
like 'p__%_'

-- DISTINCT

select distinct column from tablename;

-- FUNCOES DE AGREGACAO

count, min, max, sum, avg/*media*/. 

-- GROUP BY 

/*It'll show you the nacionality and the amount of people who live in each country.*/
select nacionalidade, count(nome) /*count(*)*/ from gafanhotos
group by nacionalidade;

-- HAVING

/*It's like "where" for select, it makes you get specific items from the table.*/
select ano, count(*) from cursos
group by ano
having ano > 2015;