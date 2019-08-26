SET TERM ^ ;

CREATE OR ALTER procedure get_bairro_conv (
    nomebairro varchar(60))
returns (
    codigo integer)
as
BEGIN
    SELECT FIRST(1) CODIGO
    FROM BAIRRO
    WHERE UPPER(BAIRRO.NOME) = UPPER(:NOMEBAIRRO)
    INTO :CODIGO;
    IF (:CODIGO IS NULL) THEN
    BEGIN
        SELECT RETORNO
        FROM GET_CODIGO('BAIRRO')
        INTO :CODIGO;
        INSERT INTO BAIRRO (CODIGO, NOME) VALUES (:CODIGO, :NOMEBAIRRO);
    END
    SUSPEND;
END^

SET TERM ; ^

