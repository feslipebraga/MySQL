-- ADICIONAR NOVA COLUNA NA TABELA (add)

alter table #nomedatabela
add column #nomedacolunaquevcqueiraadicionar varchar(x);


-- REMOVER COLUNA (drop)

alter table #nomedatabela
drop column #nomedacoluna; 


-- ADICIONAR NOVA COLUNA NA TABELA EM UMA POSICAO ESPECIFICA (add after)

alter table #nomedatabela
add column #nomedacolunaquevcqueiraadicionar varchar(x) AFTER #nomedealgumregistro;


-- ADICIONAR NO INICIO (add first)

alter table #nomedatabela
add column #nomedacolunaquevcqueiraadicionar varchar(x) FIRST;


-- MODIFICAR DADOS DA COLUNA (tipos primitivos e constraints)(modify)

alter table #nomedatabela
modify #nomedacoluna varchar(20);


-- MODIFICAR DADOS DA COLUNA (nome da coluna, tipos primitivos e constraints)(change)

alter table #nomedatabela
change #nomevelho #nomenovo;


-- MODIFICAR O NOME DA TABELA (rename)

alter table #nomedatabelaatual
rename to #nomenovo


-- ADICIONAR CHAVE PRIMARIA EM UM CAMPO. (add primary key())

alter table #nomedatabela
add primary key(#nomedoregistro);


-- APAGAR UMA TABELA

drop table #nomedatabela;