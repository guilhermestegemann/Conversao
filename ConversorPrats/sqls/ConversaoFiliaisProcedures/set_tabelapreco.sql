SET TERM ^ ;

CREATE OR ALTER procedure set_tabelapreco_conv (
    codigo integer,
    filial integer,
    nome varchar(60),
    indice numeric(8,4),
    base varchar(1),
    promocao varchar(1),
    datainicial date,
    datafinal date,
    exportar varchar(1),
    valorminimo numeric(8,2),
    comissao numeric(8,2),
    atualizarvalorvenda varchar(1),
    atualizarvalorminimo varchar(1),
    atualizardescontomaximo varchar(1),
    bloquear varchar(1),
    vincularcliforautomaticamente varchar(1),
    comissaofixa varchar(1),
    incluirprodutoautomatico varchar(1),
    valormaximo numeric(15,2),
    valorminimoinicial numeric(8,2))
as
BEGIN
    IF (:FILIAL = 2) THEN
        CODIGO = 200 || :CODIGO;
    IF (:FILIAL = 3) THEN
        CODIGO = 300 || :CODIGO;

    INSERT INTO TABELAPRECO
    (
        CODIGO,
        FILIAL,
        NOME,
        INDICE,
        BASE,
        PROMOCAO,
        DATAINICIAL,
        DATAFINAL,
        EXPORTAR,
        VALORMINIMO,
        COMISSAO,
        ATUALIZARVALORVENDA,
        ATUALIZARVALORMINIMO,
        ATUALIZARDESCONTOMAXIMO,
        BLOQUEAR,
        VINCULARCLIFORAUTOMATICAMENTE,
        COMISSAOFIXA,
        INCLUIRPRODUTOAUTOMATICO,
        VALORMAXIMO,
        VALORMINIMOINICIAL
    ) VALUES
    (
        :CODIGO,
        :FILIAL,
        :NOME,
        :INDICE,
        :BASE,
        :PROMOCAO,
        :DATAINICIAL,
        :DATAFINAL,
        :EXPORTAR,
        :VALORMINIMO,
        :COMISSAO,
        :ATUALIZARVALORVENDA,
        :ATUALIZARVALORMINIMO,
        :ATUALIZARDESCONTOMAXIMO,
        :BLOQUEAR,
        :VINCULARCLIFORAUTOMATICAMENTE,
        :COMISSAOFIXA,
        :INCLUIRPRODUTOAUTOMATICO,
        :VALORMAXIMO,
        :VALORMINIMOINICIAL
    );
END^

SET TERM ; ^

