﻿delete from clifortabelapreco; commit;
delete from itemtabelapreco; commit;
delete from tabelapreco; commit;
delete from estoque; commit;
delete from produtoclifor; commit;
delete from produto; commit;
delete from unidademedida; commit;
delete from grupo; commit;
delete from tipoproduto; commit;
delete from marca; commit;
delete from classificacao; commit;
delete from cliforcontato; commit;
delete from funcionarioclifor; commit;
delete from alteraclifor; commit; 
delete from clifor; commit;
DELETE FROM CIDADE WHERE CODIGO NOT IN (SELECT CIDADE FROM TRANSPORTADOR) AND CODIGO NOT IN (SELECT CIDADE FROM FILIAL); COMMIT;
DELETE FROM BAIRRO WHERE NOME <> 'CENTRO'; COMMIT;
delete from condicaopagamento; commit;
delete from tipoestabelecimento; commit;
delete from cargofuncionario; commit;
delete from funcionario; commit;

