SET TERM ^ ;

CREATE OR ALTER procedure set_clifor_conv (
    clifor integer,
    filial integer,
    fantasia varchar(60),
    nome varchar(60),
    cnpj varchar(18),
    ie varchar(18),
    datacadastro date,
    datanasc date,
    nomepai varchar(40),
    nomemae varchar(40),
    tipoestabelecimento integer,
    endereco varchar(60),
    numero varchar(10),
    cidade varchar(7),
    nomebairro varchar(40),
    complemento varchar(100),
    cep varchar(8),
    simples varchar(1),
    latitude varchar(20),
    longitude varchar(20),
    indicadorie integer,
    limitecredito numeric(15,2),
    condicaopagamento integer,
    ativo varchar(1),
    datamovimento date,
    datainativado date,
    obs varchar(400),
    tipo integer)
as
declare variable codigobairro integer;
declare variable im varchar(20);
declare variable codigoclifor integer;
declare variable codigocidade integer;
declare variable condicaopagamentoinsert integer;
BEGIN
    IM = 'CONVERTIDO';

    /*AJUSTE CONDICAO PAGAMENTO */
    CONDICAOPAGAMENTOINSERT = NULL;
    IF (:CONDICAOPAGAMENTO = 1) THEN CONDICAOPAGAMENTOINSERT = 1;
    IF (:CONDICAOPAGAMENTO = 2) THEN CONDICAOPAGAMENTOINSERT = 2;
    IF (:CONDICAOPAGAMENTO = 3) THEN CONDICAOPAGAMENTOINSERT = 3;
    IF (:CONDICAOPAGAMENTO = 7) THEN CONDICAOPAGAMENTOINSERT = 13;
    IF (:CONDICAOPAGAMENTO = 13) THEN CONDICAOPAGAMENTOINSERT = 19;
    IF (:CONDICAOPAGAMENTO = 14) THEN CONDICAOPAGAMENTOINSERT = 14;
    IF (:CONDICAOPAGAMENTO = 15) THEN CONDICAOPAGAMENTOINSERT = 15;
    IF (:CONDICAOPAGAMENTO = 16) THEN CONDICAOPAGAMENTOINSERT = 4;
    IF (:CONDICAOPAGAMENTO = 17) THEN CONDICAOPAGAMENTOINSERT = 5;
    IF (:CONDICAOPAGAMENTO = 18) THEN CONDICAOPAGAMENTOINSERT = 6;
    IF (:CONDICAOPAGAMENTO = 19) THEN CONDICAOPAGAMENTOINSERT = 21;
    IF (:CONDICAOPAGAMENTO = 22) THEN CONDICAOPAGAMENTOINSERT = 22;
    IF (:CONDICAOPAGAMENTO = 23) THEN CONDICAOPAGAMENTOINSERT = 16;
    IF (:CONDICAOPAGAMENTO = 24) THEN CONDICAOPAGAMENTOINSERT = 18;
    IF (:CONDICAOPAGAMENTO = 25) THEN CONDICAOPAGAMENTOINSERT = 25;
    IF ((:CONDICAOPAGAMENTOINSERT IS NULL) AND (:CONDICAOPAGAMENTO IS NOT NULL)) THEN
        EXCEPTION EXCEPTION_VALORCAMPO'CONDICAOPAGAMENTO';

    SELECT FIRST(1) CODIGO
    FROM CLIFOR
    WHERE CLIFOR.CNPJ = :CNPJ
    ORDER BY ATIVO DESC
    INTO :CODIGOCLIFOR;
    IF (:CODIGOCLIFOR IS NOT NULL) THEN
        INSERT INTO CLIFORDEPARA (FILIAL, DE, PARA) VALUES (:FILIAL, :CLIFOR, :CODIGOCLIFOR);
    ELSE IF (:CODIGOCLIFOR IS NULL) THEN
    BEGIN
        SELECT CODIGO
        FROM GET_BAIRRO_CONV(:NOMEBAIRRO)
        INTO :CODIGOBAIRRO;

        SELECT RETORNO
        FROM GET_CODIGO('CLIFOR')
        INTO :CODIGOCLIFOR;

        SELECT CIDADE.CODIGO
        FROM CIDADE
        WHERE CIDADE.CODIGOFISCAL = :CIDADE
        INTO :CODIGOCIDADE;

        IF (:CODIGOCIDADE IS NULL) THEN
            EXCEPTION EXCEPTION_VALORCAMPO'CIDADE';

        INSERT INTO CLIFOR
        (
            CODIGO, 
            FILIAL,
            FANTASIA,
            NOME,
            CNPJ,
            IE,
            DATA,
            DATANASC,
            NOMEPAI,
            NOMEMAE,
            TIPOESTABELECIMENTO,
            ENDERECO,
            NUMERO,
            CIDADE,
            BAIRRO, 
            COMPLEMENTO,
            CEP,
            SIMPLES,
            LATITUDE,
            LONGITUDE, 
            INDICADORIE,
            LIMITECREDITO,
            CONDICAOPAGAMENTO,
            ATIVO,
            DATAMOVIMENTO,
            DATAINATIVADO,
            OBS,
            TIPO,
            IM,
            COMISSAO,
            SPC,
            COMISSAOFIXA,
            VENDARESTRITA,
            CONSUMIDOR,
            DESTACARSTITEM,
            CATEGORIA
        ) VALUES
        (
            :CODIGOCLIFOR,
            :FILIAL,
            :FANTASIA, 
            :NOME,
            :CNPJ,
            :IE,
            :DATACADASTRO,
            :DATANASC,
            :NOMEPAI,
            :NOMEMAE,
            :TIPOESTABELECIMENTO,
            :ENDERECO,
            :NUMERO,
            :CODIGOCIDADE,
            :CODIGOBAIRRO,
            :COMPLEMENTO,
            :CEP,
            :SIMPLES,
            :LATITUDE,
            :LONGITUDE,
            :INDICADORIE,
            :LIMITECREDITO,
            :CONDICAOPAGAMENTOINSERT,
            :ATIVO,
            :DATAMOVIMENTO,
            :DATAINATIVADO,
            :OBS,
            :TIPO,
            :IM,
            0,
            'N',
            'N',
            'N',
            'N',
            'N',
            1
         );

         INSERT INTO CLIFORDEPARA (FILIAL, DE, PARA) VALUES (:FILIAL, :CLIFOR, :CODIGOCLIFOR);
    END
END^

SET TERM ; ^

