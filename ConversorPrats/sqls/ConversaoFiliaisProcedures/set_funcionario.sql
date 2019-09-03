SET TERM ^ ;

CREATE OR ALTER procedure set_funcionario_conv (
    filial integer,
    codigo integer,
    fantasia varchar(60),
    nome varchar(60),
    cpf varchar(18),
    rg varchar(18),
    data date,
    datanasc date,
    endereco varchar(60),
    codigofiscal varchar(7),
    nomebairro varchar(40),
    complemento varchar(100),
    cep varchar(8),
    telefone varchar(40),
    email varchar(60))
as
declare variable codigocidade integer;
declare variable codigobairro integer;
declare variable contfuncionario integer;
BEGIN
    SELECT COUNT(*)
    FROM FUNCIONARIO
    WHERE FUNCIONARIO.CPF = :CPF
    INTO CONTFUNCIONARIO;
    IF (:CONTFUNCIONARIO = 0) THEN
    BEGIN
        SELECT CODIGO
        FROM GET_CIDADE_CONV(:CODIGOFISCAL)
        INTO :CODIGOCIDADE;
    
        SELECT CODIGO
        FROM GET_BAIRRO_CONV(:NOMEBAIRRO)
        INTO :CODIGOBAIRRO;
    
        IF (:FILIAL = 2) THEN
            CODIGO = 2000 || :CODIGO;
        IF (:FILIAL = 3) THEN
            CODIGO = 3000 || :CODIGO;
    
        INSERT INTO FUNCIONARIO
        (
            CODIGO,
            FANTASIA,
            NOME,
            CPF,
            RG,
            DATA,
            DATANASC,
            ENDERECO,
            CIDADE,
            BAIRRO,
            COMPLEMENTO,
            CEP,
            TELEFONE,
            EMAIL,
            LIMITEFLEX,
            GERARPEDIDOBLOQUEADO,
            COMISSAOFIXA,
            UTILIZAGEOLOCALIZACAO,
            AFVLIBERARFORAROTA,
            ENVIARAUTOMATICO,
            AFVPRONTAENTREGA,
            COMISSAO,
            EXPORTAR,
            ATIVO,
            RECEBEMENSAGEM,
            GERARCOMISSAO,
            FLEX,
            GERARFLEX,
            UTILIZAROTA,
            AFVTEMPOSINCRONIZAR
        ) VALUES
        (
            :CODIGO,
            :FANTASIA,
            :NOME,
            :CPF, 
            :RG, 
            :DATA, 
            :DATANASC,
            :ENDERECO,
            :CODIGOCIDADE,
            :CODIGOBAIRRO,
            :COMPLEMENTO,
            :CEP,
            :TELEFONE,
            :EMAIL,
            0,
            'N',
            'N',
            'N',
            'N',
            'N',
            'N',
            0,
            'S',
            'S',
            'S',
            'S',
            0,
            'N',
            'N',
            0
        );
    END
END^

SET TERM ; ^

