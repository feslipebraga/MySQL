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

-- Left Join With Group By

select c.first_name, c.last_name, IFNULL(sum(o.amount), 0)
from customers c
    left join orders o on c.id = o.customer_id
group by
    c.first_name, c.last_name;

-- RIGHT JOIN

select c.first_name, c.last_name, o.order_date, o.amount
from orders o
right join customers c on o.customer_id = c.id;

-- On Delete Cascade: Delete tuples where the deleted customer was.
FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE