-- 1. Encontrar os cinco usuários mais antigos.

select * from users
order by createdAt
limit 5;

-- 2. Em que dia da semana a maioria dos usuários se registra?

select
dayofweek(createdAt)as day,
dayname(createdAt) as dayname,
count(*) as count from users
group by day, dayname
order by count desc;

-- 3. Encontre os usuários que nunca postaram uma foto.

select users.id, username from users
left join photos on users.id = photos.userID
where userID IS NULL
order by id;

-- 4. Qual usuário tem mais likes em 1 única foto?

select u.username, l.photoID, count(photoId) as likes
from likes l
join photos p on p.id = l.photoId
join users u on u.id = p.userId
group by l.photoId
order by likes desc
limit 1;

-- 5. Qual a média entre fotos postadas e usuários?

SELECT (SELECT count(*) FROM photos) / (SELECT count(*) FROM users) as avg;

-- 6. Quais são as 5 hashtags mais usadas?

select tagname, tagID, count(tagID) as count from phototags pt
join tags t on pt.tagID = t.id
group by tagID
order by count desc
limit 5;

-- 7. Encontre os usuários que curtiram TODAS as fotos.

select u.username, l.userID, count(l.userId) as count from likes l
join users u on u.id = l.userid
group by l.userID
having count = (select count(*) from photos)
order by count desc;
