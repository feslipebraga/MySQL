-- 1.
select nome from gafanhotos where sexo = 'F';

-- 2.
select * from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31'
order by nascimento;

-- 3.
select nome, profissao from gafanhotos
where profissao = 'Programador' and sexo = 'M';

-- 4.
select * from gafanhotos
where nacionalidade = 'Brasil' and sexo = 'F' and nome like 'J%';

-- 5.
select nome, nacionalidade from gafanhotos
where sexo = 'M' and nome like '%_ilva%' and nacionalidade != 'Brasil' and peso < 100;

-- 6.
select max(altura) from gafanhotos
where sexo = 'M';

-- 7.
select avg(peso) from gafanhotos;

-- 8.
select min(peso) from gafanhotos
where nacionalidade != 'Brasil' and sexo = 'F' and nascimento between '1990-01-01' and '2000-12-31';

-- 9.
select count(altura) from gafanhotos
where sexo = 'F' and altura > 1.90;