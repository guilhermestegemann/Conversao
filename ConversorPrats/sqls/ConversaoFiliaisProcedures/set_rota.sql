SET TERM ^ ;

CREATE OR ALTER procedure set_rota_conv (
    codigo integer,
    nome varchar(60),
    tipo varchar(1),
    cnpjvendedor varchar(18),
    reordenar varchar(1),
    filial integer)
as
declare variable codigovendedor integer;
BEGIN
		
	CODIGO = :FILIAL || '00' || :CODIGO;	

    SELECT CODIGO
    FROM FUNCIONARIO
    WHERE FUNCIONARIO.CPF = :CNPJVENDEDOR
    INTO :CODIGOVENDEDOR;

    INSERT INTO ROTA
    (
        CODIGO,
        NOME,
        TIPOROTA,
        FUNCIONARIO,
        REORDENAR,
        FILIAL
    ) VALUES
    (
        :CODIGO,
        :NOME,
        :TIPO,
        :CODIGOVENDEDOR,
        :REORDENAR,
        :FILIAL
    );

END^

SET TERM ; ^

