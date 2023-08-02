-- APAGAR DADOS DA TABELA

delete from #nomedatabela
where #chaveprimaria = '#valordachave'

EX:
delete from cursos
where idcurso = '8';