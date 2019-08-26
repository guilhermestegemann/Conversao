SET TERM ^ ;

create or alter procedure set_clitabpreco_conv (
    filial integer,
    cnpjclifor varchar(18),
    tabelapreco integer,
    padrao varchar(1))
as
declare variable contclitabpreco integer;
declare variable codigoclifor integer;
BEGIN
    IF (:FILIAL = 2) THEN
        TABELAPRECO = 200 || :TABELAPRECO;
    IF (:FILIAL = 3) THEN
        TABELAPRECO = 300 || :TABELAPRECO;

    SELECT FIRST(1) CODIGO
    FROM CLIFOR
    WHERE CLIFOR.CNPJ = :CNPJCLIFOR
    ORDER BY ATIVO DESC
    INTO :CODIGOCLIFOR;

    SELECT COUNT(*)
    FROM CLIFORTABELAPRECO
    WHERE CLIFOR = :CODIGOCLIFOR
    AND TABELAPRECO = :TABELAPRECO
    INTO :CONTCLITABPRECO;

    IF (:CONTCLITABPRECO = 0) THEN
    BEGIN
        INSERT INTO CLIFORTABELAPRECO
        (
            TABELAPRECO,
            CLIFOR,
            PADRAO
        ) VALUES
        (
            :TABELAPRECO,
            :CODIGOCLIFOR,
            :PADRAO
        );
    END
END^

SET TERM ; ^

