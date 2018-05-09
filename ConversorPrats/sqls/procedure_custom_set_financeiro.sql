create or alter procedure custom_set_financeiro (
    tipo char(1),
    filial integer,
    clifor integer,
    documento integer,
    ordem varchar(20),
    dataemissao date,
    datavcto date,
    databaixa date,
    valor numeric(8,2),
    obs varchar(500),
    juro numeric(8,2),
    desconto numeric(8,2),
    valorbaixa numeric(8,2),
    dataagendamento date,
    multa numeric(8,2),
    imprimir char(1),
    impresso char(1),
    id varchar(12))
as
declare variable count_financeiro integer;
BEGIN
    SELECT COUNT(*)
    FROM FINANCEIRO
    WHERE FILIAL = :FILIAL
    AND ORDEM = :ORDEM
    AND CLIFOR = :CLIFOR
    AND DATAEMISSAO = :DATAEMISSAO
    INTO :COUNT_FINANCEIRO;
    IF (:COUNT_FINANCEIRO > 0) THEN
        :ORDEM = SUBSTRING(:ORDEM FROM 1 FOR 16) || ID;

    INSERT INTO FINANCEIRO (
        TIPO,
        FILIAL,
        CLIFOR,
        DOCUMENTO,
        ORDEM,
        DATAEMISSAO,
        DATAVCTO,
        DATABAIXA,
        VALOR,
        OBS,
        JURO,
        DESCONTO,
        VALORBAIXA,
        DATAAGENDAMENTO,
        MULTA,
        IMPRIMIR,
        IMPRESSO)
    VALUES (
        :TIPO,
        :FILIAL,
        :CLIFOR,
        :DOCUMENTO,
        :ORDEM,
        :DATAEMISSAO,
        :DATAVCTO,
        :DATABAIXA,
        :VALOR,
        :OBS,
        :JURO,
        :DESCONTO,
        :VALORBAIXA,
        :DATAAGENDAMENTO,
        :MULTA,
        :IMPRIMIR,
        :IMPRESSO);
END