SET TERM ^ ;

create or alter procedure set_rotaclifor_conv (
    codigorota integer,
    cnpjclifor varchar(18),
    ordem integer,
    filial integer)
as
declare variable codigoclifor integer;
BEGIN

	CODIGOROTA = :FILIAL || '00' || :CODIGOROTA;

    SELECT FIRST(1) CODIGO
    FROM CLIFOR
    WHERE CLIFOR.CNPJ = :CNPJCLIFOR
    ORDER BY ATIVO DESC
    INTO :CODIGOCLIFOR;

    INSERT INTO ROTACLIFOR
    (
        ROTA,
        CLIFOR,
        ORDEM
    ) VALUES
    (
        :CODIGOROTA,
        :CODIGOCLIFOR,
        :ORDEM
    );
END^

SET TERM ; ^

