-- Encontre a data mais antiga em que um usuário se juntou.

SELECT DATE_FORMAT(MIN(createdAt), "%M %D %Y") as 'earliest date'
FROM users;

-- encontrar o e-mail do primeiro usuário.

SELECT * FROM users
WHERE createdAt = (SELECT MIN(createdAt) FROM users);

-- Quantidade de usuários cadastros por cada mês.

SELECT MONTHNAME(createdAt) as month, COUNT(*) as count FROM USERS
GROUP BY month
order by count desc;

-- Número de usuários com o domínio de email yahoo.

SELECT COUNT(*) AS 'yahoo users' FROM users
WHERE email like '%yahoo.com';

-- Número total de users por cada provedor de email.

SELECT
    SUBSTRING_INDEX((SUBSTRING_INDEX(email, '@', -1)), '.', 1) AS dominio,
    COUNT(*) AS total
FROM USERS
GROUP BY dominio
ORDER BY total DESC;

-- ou

SELECT CASE 
         WHEN email LIKE '%@gmail.com' THEN 'gmail' 
         WHEN email LIKE '%@yahoo.com' THEN 'yahoo' 
         WHEN email LIKE '%@hotmail.com' THEN 'hotmail' 
         ELSE 'other' 
       end      AS provider, 
       Count(*) AS total_users 
FROM   users 
GROUP  BY provider 
ORDER  BY total_users DESC; 
