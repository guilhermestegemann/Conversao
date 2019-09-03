SET TERM ^ ;

CREATE OR ALTER procedure get_cidade_conv (
    codigofiscal varchar(7))
returns (
    codigo integer)
as
BEGIN
    SELECT CODIGO
    FROM CIDADE
    WHERE CIDADE.CODIGOFISCAL = :CODIGOFISCAL
    INTO :CODIGO;
    IF (:CODIGOFISCAL IS NULL) THEN 
        EXCEPTION EXCEPTION_VALORCAMPO' CIDADE';
    SUSPEND;
END^

SET TERM ; ^

