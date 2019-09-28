SET TERM ^ ;

CREATE OR ALTER procedure set_comodato_conv (
    filial integer,
    clifor integer,
    produto integer,
    qtde integer,
    funcionario integer,
    dataemissao date,
    obs varchar(120))
as
declare variable codigocomodato integer;
declare variable codigoproduto integer;
BEGIN
    
    SELECT PRODUTO.CODIGO
    FROM PRODUTO
    WHERE PRODUTO.PRAZOVALIDADE = :PRODUTO
    INTO :CODIGOPRODUTO;
    IF (:CODIGOPRODUTO IS NULL) THEN
        EXCEPTION EXCEPTION_PRODUTOINVALIDO;


    SELECT COALESCE(MAX(CODIGO)+1,0) AS CODIGO
    FROM COMODATO
    INTO :CODIGOCOMODATO;

    INSERT INTO COMODATO 
    (
        CODIGO,
        DATAEMISSAO,
        CLIFOR,
        FUNCIONARIO, 
        OBS,
        FILIAL
    ) VALUES
    (
        :CODIGOCOMODATO,
        :DATAEMISSAO, 
        :CLIFOR,
        :FUNCIONARIO,
        :OBS,
        :FILIAL
    );
    
    INSERT INTO ITEMCOMODATO
    (
        COMODATO,
        PRODUTO,
        QTDE
    ) VALUES
    (
        :CODIGOCOMODATO,
        :CODIGOPRODUTO,
        :QTDE
    );
END^

SET TERM ; ^

