-- 1. Encontrar os cinco usuários mais antigos.

select * from users
order by createdAt
limit 5;

+----+------------------+---------------------+
| id | username         | createdAt           |
+----+------------------+---------------------+
| 80 | Darby_Herzog     | 2016-05-06 00:14:21 |
| 67 | Emilio_Bernier52 | 2016-05-06 13:04:30 |
| 63 | Elenor88         | 2016-05-08 01:30:41 |
| 95 | Nicole71         | 2016-05-09 17:30:22 |
| 38 | Jordyn.Jacobson2 | 2016-05-14 07:56:26 |
+----+------------------+---------------------+

-- 2. Em que dia da semana a maioria dos usuários se registra?

select
dayofweek(createdAt)as day,
dayname(createdAt) as dayname,
count(*) as count from users
group by day, dayname
order by count desc;

+------+-----------+-------+
| day  | dayname   | count |
+------+-----------+-------+
|    5 | Thursday  |    16 |
|    1 | Sunday    |    16 |
|    6 | Friday    |    15 |
|    3 | Tuesday   |    14 |
|    2 | Monday    |    14 |
|    4 | Wednesday |    13 |
|    7 | Saturday  |    12 |
+------+-----------+-------+

-- 3. Encontre os usuários que nunca postaram uma foto.

select users.id, username from users
left join photos on users.id = photos.userID
where userID IS NULL
order by id;

-- 4. Qual usuário tem mais likes em 1 única foto?

select
    u.username,
    p.imageUrl,
    count(l.photoId) as num_likes
from
    users u
join
    photos p on p.userId = u.id
join
    likes l on l.photoId = p.id
group by u.id, p.id
order by num_likes desc
limit 1;

+---------------+---------------------+-----------+
| username      | imageUrl            | num_likes |
+---------------+---------------------+-----------+
| Zack_Kemmer93 | https://jarret.name |        48 |
+---------------+---------------------+-----------+

