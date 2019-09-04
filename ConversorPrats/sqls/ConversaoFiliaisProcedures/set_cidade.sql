SET TERM ^ ;

CREATE OR ALTER procedure set_cidade_conv (
    nome varchar(40),
    estado integer,
    codigofiscal varchar(7),
    populacao integer)
as
declare variable codigocidade integer;
BEGIN
    SELECT CIDADE.CODIGO
    FROM CIDADE
    WHERE CIDADE.CODIGOFISCAL = :CODIGOFISCAL
    INTO :CODIGOCIDADE;
    IF (:CODIGOCIDADE IS NULL) THEN
    BEGIN
        SELECT RETORNO
        FROM GET_CODIGO('CIDADE')
        INTO :CODIGOCIDADE;
        INSERT INTO CIDADE
        (
            CODIGO,
            NOME,
            POPULACAO,
            REGIAOVENDA,
            COMISSAOENTREGA,
            ESTADO,
            VALORFRETEADICIONAL,
            CODIGOFISCAL
        ) VALUES
        (
            :CODIGOCIDADE,
            :NOME,
            :POPULACAO,
            'S',
            0,
            :ESTADO,
            0,
            :CODIGOFISCAL
        );
    END
END^

SET TERM ; ^

