-- INNER JOINS
-- RETORNA TODOS OS CLIENTES QUE TIVEREM FEITO COMPRA

select c.first_name, c.last_name, o.order_date, o.amount
from orders o
join customers c on o.customer_id = c.id;

-- INNER JOIN WITH GROUP BY

SELECT c.first_name, c.last_name, SUM(o.amount) as total
FROM orders o
JOIN customers c ON o.customer_id = c.id
GROUP BY c.first_name, c.last_name;

-- LEFT JOIN
-- RETORNA TODOS OS CLIENTES + NULL CASO NÃO TENHAM FEITO COMPRAS

select c.first_name, c.last_name, o.order_date, o.amount
from customers c
left join orders o on c.id = o.customer_id;

-- RETORNA TODOS AS COMPRAS E SEUS RESPECTIVOS USUARIOS, RETORNA NULL CASO NÃO TENHA CUSTOMER_ID.

select c.first_name, c.last_name, o.order_date, o.amount
from orders o
left join customers c on o.customer_id = c.id;