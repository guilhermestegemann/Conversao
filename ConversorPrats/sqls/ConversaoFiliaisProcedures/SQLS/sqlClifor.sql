SELECT
CLIFOR.CODIGO AS CLIFOR
, 3 AS FILIAL
, CLIFOR.FANTASIA AS FANTASIA
, CLIFOR.NOME AS NOME
, CLIFOR.CNPJ AS CNPJ
, CLIFOR.IE AS IE
, CLIFOR.DATA AS DATACADASTRO
, CLIFOR.DATANASC AS DATANASC
, CLIFOR.NOMEPAI AS NOMEPAI
, CLIFOR.NOMEMAE AS NOMEMAE
, CLIFOR.TIPOESTABELECIMENTO AS TIPOESTABELECIMENTO
, CLIFOR.ENDERECO AS ENDERECO
, CLIFOR.NUMERO AS NUMERO
, CIDADE.CODIGOFISCAL AS CIDADE
, BAIRRO.NOME AS NOMEBAIRRO
, CLIFOR.COMPLEMENTO AS COMPLEMENTO
, CLIFOR.CEP AS CEP
, CLIFOR.SIMPLES AS SIMPLES
, CLIFOR.LATITUDE AS LATITUDE
, CLIFOR.LONGITUDE AS LONGITUDE
, CLIFOR.INDICADORIE AS INDICADORIE
, CLIFOR.LIMITECREDITO AS LIMITECREDITO
, CLIFOR.CONDICAOPAGAMENTO AS CONDICAOPAGAMENTO
, CLIFOR.ATIVO AS ATIVO
, CLIFOR.DATAMOVIMENTO AS DATAMOVIMENTO
, CLIFOR.DATAINATIVADO AS DATAINATIVADO
, CAST(CLIFOR.OBS AS VARCHAR(400)) AS OBS
, CLIFOR.TIPO AS TIPO
FROM CLIFOR
INNER JOIN CIDADE ON CIDADE.CODIGO = CLIFOR.CIDADE
INNER JOIN BAIRRO ON BAIRRO.CODIGO = CLIFOR.BAIRRO
WHERE CLIFOR.FILIAL = 1