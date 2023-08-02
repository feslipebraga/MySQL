-- TO ADD A FOREIGN KEY

alter table tablename add foreign key (column-which-will-receive-the-foreign)
references other-tablename(pkey-of-the-other-table);

-- EXAMPLE:

alter table gafanhotos add foreign key (cursopreferido)
references cursos(idcurso);