-- MODIFICAR CONTEUDO DE UMA LINHA

update nomedatabela
set colunaasermudada = '#novoconteudo'
where colunacomchaveprimaria = '#registrodachaveprimarianalinha'
limit 1;

-- EX:
update cursos
set descricao = 'BSI 22'
where idcurso = '10';