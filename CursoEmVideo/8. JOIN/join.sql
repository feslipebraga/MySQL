-- INNER JOIN AS EXAMPLE (inner join or join)

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos
inner join cursos
on cursos.idcurso = gafanhotos.cursopreferido;
/* ON RELACIONA A CHAVE PRIMARIA COM SUA CHAVE ESTRANGEIRA*/

-- AS 

select gf.nome, gf.cursopreferido, cs.nome, cs.ano
from gafanhotos as gf
inner join cursos as cs
on cs.idcurso = gf.cursopreferido;

-- LEFT JOIN (ou left outer join)

select gf.nome, gf.cursopreferido, cs.nome, cs.ano
from gafanhotos as gf
left join cursos as cs
on cs.idcurso = gf.cursopreferido;

-- RIGHT JOIN (ou right outer join)

select gf.nome, gf.cursopreferido, cs.nome, cs.ano
from gafanhotos as gf
right join cursos as cs
on cs.idcurso = gf.cursopreferido;

-- JOIN COM UMA TABELA-RELACIONAMENTO
/* G = gafanhotos
A = assiste
C = cursos */

select g.id, g.nome, a.idcurso, c.nome from gafanhotos g
join gf_assiste_cs a
on g.id = a.idgafanhoto
join cursos c
on c.idcurso = a.idcurso
order by g.id;