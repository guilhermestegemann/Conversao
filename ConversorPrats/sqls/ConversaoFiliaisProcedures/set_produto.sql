SET TERM ^ ;

CREATE OR ALTER procedure set_produto_conv (
    filial integer,
    codigo integer,
    nome varchar(60),
    barras varchar(20),
    tipoproduto integer,
    marca integer,
    classificacao integer,
    pesoliquido numeric(15,4),
    pesobruto numeric(15,4),
    data date,
    uncompra varchar(5),
    codigoncm varchar(8),
    ordem integer,
    grupo integer,
    cest varchar(10),
    pesoembalagem numeric(15,4),
    qtdereferencia numeric(15,6),
    unreferencia varchar(6),
    qtdemultiplaembalagem integer,
    volume numeric(8,2),
    profundidade numeric(8,2),
    largura numeric(8,2),
    altura numeric(8,2),
    vendacontrolada varchar(1),
    qtdetroca integer,
    untroca varchar(5),
    qtdemultipla numeric(15,3),
    qtdepadrao integer,
    tributacao integer,
    qtdecarregamento numeric(15,3),
    uncarregamento varchar(5),
    qtdevenda integer,
    unvenda varchar(5),
    qtdecompra integer,
    indicadorescala varchar(1),
    prazovalidade integer,
    bloquearentradavalidade integer)
as
declare variable varinserirproduto varchar(1);
declare variable varcodigoproduto integer;
declare variable vargrupo integer;
declare variable varmarca integer;
declare variable varclassificacao integer;
BEGIN
    VARINSERIRPRODUTO = 'S';

    IF (:BARRAS <> :CODIGO) THEN
    BEGIN
        SELECT PRODUTO.CODIGO
        FROM PRODUTO
        WHERE PRODUTO.BARRAS = :BARRAS
        INTO :VARCODIGOPRODUTO;
        IF (:VARCODIGOPRODUTO IS NOT NULL) THEN
        BEGIN
            VARINSERIRPRODUTO = 'N';
            INSERT INTO PRODUTODEPARA (FILIAL, DE, PARA) VALUES (:FILIAL, :CODIGO, :VARCODIGOPRODUTO);
        END
    END

    IF (:VARINSERIRPRODUTO = 'S') THEN
    BEGIN
        SELECT RETORNO
        FROM GET_CODIGO('PRODUTO')
        INTO :VARCODIGOPRODUTO;
        IF (:BARRAS = :CODIGO) THEN
            BARRAS = :VARCODIGOPRODUTO;

        /*AJUSTE GRUPO*/
        VARGRUPO = 9999;
        IF (:GRUPO = 17) THEN VARGRUPO = 17;
        IF (:GRUPO = 19) THEN VARGRUPO = 19;

        /*AJUSTE MARCA*/
        IF (:MARCA = 1) THEN VARMARCA = 1;

        /*AJUSTE CLASSIFICACAO*/
        IF (:CLASSIFICACAO = 1) THEN VARCLASSIFICACAO = 1;
        IF (:CLASSIFICACAO = 2) THEN VARCLASSIFICACAO = 2;
        IF (:CLASSIFICACAO = 3) THEN VARCLASSIFICACAO = 4;
        IF (:CLASSIFICACAO = 4) THEN VARCLASSIFICACAO = 6;
        IF (:CLASSIFICACAO = 5) THEN VARCLASSIFICACAO = 7;
        IF (:CLASSIFICACAO = 6) THEN VARCLASSIFICACAO = 5;

        INSERT INTO PRODUTO
        (
            CODIGO,
            NOME,
            BARRAS,
            TIPOPRODUTO,
            MARCA,
            CLASSIFICACAO,
            PESOLIQUIDO,
            PESOBRUTO,
            DATA,
            UNCOMPRA,
            CODIGONCM,
            ORDEM,
            GRUPO,
            CEST,
            PESOEMBALAGEM,
            QTDEREFERENCIA,
            UNREFERENCIA,
            QTDEMULTIPLAEMBALAGEM,
            VOLUME,
            PROFUNDIDADE,
            LARGURA,
            ALTURA,
            VENDACONTROLADA,
            QTDETROCA,
            UNTROCA,
            QTDEMULTIPLA,
            QTDEPADRAO,
            TRIBUTACAO,
            QTDECARREGAMENTO,
            UNCARREGAMENTO,
            QTDEVENDA,
            UNVENDA,
            QTDECOMPRA,
            INDICADORESCALA,
            PRAZOVALIDADE,
            BLOQUEARENTRADAVALIDADE
        ) VALUES
        (
            :VARCODIGOPRODUTO,
            :NOME,
            :BARRAS,
            :TIPOPRODUTO, 
            :VARMARCA,
            :VARCLASSIFICACAO,
            :PESOLIQUIDO,
            :PESOBRUTO,
            :DATA,
            :UNCOMPRA,
            :CODIGONCM,
            :ORDEM,
            :VARGRUPO,
            :CEST,
            :PESOEMBALAGEM,
            :QTDEREFERENCIA,
            :UNREFERENCIA,
            :QTDEMULTIPLAEMBALAGEM,
            :VOLUME,
            :PROFUNDIDADE,
            :LARGURA,
            :ALTURA,
            :VENDACONTROLADA,
            :QTDETROCA,
            :UNTROCA,
            :QTDEMULTIPLA,
            :QTDEPADRAO,
            :TRIBUTACAO,
            :QTDECARREGAMENTO,
            :UNCARREGAMENTO,
            :QTDEVENDA,
            :UNVENDA,
            :QTDECOMPRA,
            :INDICADORESCALA,
            :PRAZOVALIDADE,
            :BLOQUEARENTRADAVALIDADE
        );
        INSERT INTO PRODUTODEPARA (FILIAL, DE, PARA) VALUES (:FILIAL, :CODIGO, :VARCODIGOPRODUTO);
    END


END^

SET TERM ; ^

