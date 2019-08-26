SET TERM ^ ;

CREATE OR ALTER procedure set_cliforcontato_conv (
    cnpj varchar(18),
    numero varchar(30),
    nome varchar(60),
    email varchar(60),
    enviarnfe varchar(1),
    enviardanfe varchar(1),
    enviarboleto varchar(1),
    enviarpedido varchar(1))
as
declare variable codigoclifor integer;
declare variable contcliforcontato integer;
BEGIN
    SELECT FIRST(1) CODIGO
    FROM CLIFOR
    WHERE CLIFOR.CNPJ = :CNPJ
    AND CLIFOR.IM = 'CONVERTIDO'
    ORDER BY ATIVO DESC
    INTO :CODIGOCLIFOR;

    IF (:CODIGOCLIFOR IS NOT NULL) THEN
    BEGIN
        SELECT COUNT(*)
        FROM CLIFORCONTATO
        WHERE CLIFORCONTATO.NUMERO = :NUMERO
        AND CLIFORCONTATO.CLIFOR = :CODIGOCLIFOR
        AND CLIFORCONTATO.NOME = :NOME
        AND CLIFORCONTATO.EMAIL = :EMAIL
        AND CLIFORCONTATO.ENVIARNFE = :ENVIARNFE
        AND CLIFORCONTATO.ENVIARDANFE = :ENVIARDANFE
        AND CLIFORCONTATO.ENVIARBOLETO = :ENVIARBOLETO
        AND CLIFORCONTATO.ENVIARPEDIDO = :ENVIARPEDIDO
        INTO :CONTCLIFORCONTATO;

        IF (:CONTCLIFORCONTATO = 0) THEN
        BEGIN
            INSERT INTO CLIFORCONTATO
            (
                CLIFOR,
                NUMERO,
                NOME,
                EMAIL,
                ENVIARNFE,
                ENVIARDANFE,
                ENVIARBOLETO,
                ENVIARPEDIDO
            ) VALUES
            (
                :CODIGOCLIFOR,
                :NUMERO,
                :NOME, 
                :EMAIL,
                :ENVIARNFE,
                :ENVIARDANFE, 
                :ENVIARBOLETO,
                :ENVIARPEDIDO
            );
        END
    END
END^

SET TERM ; ^

