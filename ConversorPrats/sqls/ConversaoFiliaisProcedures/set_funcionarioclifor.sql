SET TERM ^ ;

CREATE OR ALTER procedure set_funcionarioclifor_conv (
    cnpjcpfvendedor varchar(18),
    cnpjclifor varchar(18))
as
declare variable codigoclifor integer;
declare variable codigovendedor integer;
declare variable contfuncionarioclifor integer;
BEGIN
    SELECT FIRST(1) CODIGO
    FROM CLIFOR
    WHERE CLIFOR.CNPJ = :CNPJCLIFOR
    ORDER BY ATIVO DESC
    INTO :CODIGOCLIFOR;
    IF (:CODIGOCLIFOR IS NOT NULL) THEN
    BEGIN
        SELECT CODIGO
        FROM FUNCIONARIO
        WHERE FUNCIONARIO.CPF = :CNPJCPFVENDEDOR
        INTO :CODIGOVENDEDOR;

        SELECT COUNT(*)
        FROM FUNCIONARIOCLIFOR
        WHERE FUNCIONARIOCLIFOR.CLIFOR = :CODIGOCLIFOR
        AND FUNCIONARIOCLIFOR.FUNCIONARIO = :CODIGOVENDEDOR
        INTO :CONTFUNCIONARIOCLIFOR;
        IF (:CONTFUNCIONARIOCLIFOR = 0) THEN
        BEGIN
            INSERT INTO FUNCIONARIOCLIFOR
            (
                FUNCIONARIO,
                CLIFOR
            ) VALUES
            (
                :CODIGOVENDEDOR,
                :CODIGOCLIFOR
            );
        END
    END
END^

SET TERM ; ^

