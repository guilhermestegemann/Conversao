﻿UPDATE PRODUTO SET NOME = 'SUCO DE LARANJA INTEGRAL PET 330 ML' , BARRAS = '7898953148015' , CODIGONCM = '20091900' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 1;
UPDATE PRODUTO SET NOME = 'SUCO DE LARANJA INTEGRAL PET 900 ML' , BARRAS = '7898953148169' , CODIGONCM = '20091900' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 1279;
UPDATE PRODUTO SET NOME = 'SUCO DE LARANJA INTEGRAL PET 4 L' , BARRAS = '7898953148176' , CODIGONCM = '20091900' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 1384;
UPDATE PRODUTO SET NOME = 'SUCO DE UVA PET 330 ML' , BARRAS = '7898953148213' , CODIGONCM = '20096100' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 1438;
UPDATE PRODUTO SET NOME = 'SUCO DE UVA PET 900 ML' , BARRAS = '7898953148220' , CODIGONCM = '20096100' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 1557;
UPDATE PRODUTO SET NOME = 'SUCO DE UVA PET 4 L' , BARRAS = '7898953148237' , CODIGONCM = '20096100' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 1558;
UPDATE PRODUTO SET NOME = 'LIMONADA ADOCADA PET 330 ML' , BARRAS = '7898953148268' , CODIGONCM = '20093100' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 1980;
UPDATE PRODUTO SET NOME = 'LIMONADA ADOCADA PET 900 ML' , BARRAS = '7898953148275' , CODIGONCM = '20093100' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 1981;
UPDATE PRODUTO SET NOME = 'SUCO MISTO GOIABA E MACA PET 330 ML' , BARRAS = '7898953148428' , CODIGONCM = '20099000' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 4128;
UPDATE PRODUTO SET NOME = 'SUCO MISTO GOIABA E MACA PET 900 ML' , BARRAS = '7898953148435' , CODIGONCM = '20099000' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 4129;
UPDATE PRODUTO SET NOME = 'SUCO DE LARANJA INTEGRAL PET 1,7 L' , BARRAS = '7898953148541' , CODIGONCM = '20091900' , CEST = '1701000', UNVENDA = 'UN' WHERE CODIGO = 9421;


UPDATE PRODUTO SET 
    PESOLIQUIDO = 0.33,
    PESOBRUTO = 0.33
WHERE (CODIGO = 1);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 0.9,
    PESOBRUTO = 0.9
WHERE (CODIGO = 1279);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 4,
    PESOBRUTO = 4
WHERE (CODIGO = 1384);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 0.33,
    PESOBRUTO = 0.33
WHERE (CODIGO = 1438);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 0.9,
    PESOBRUTO = 0.9
WHERE (CODIGO = 1557);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 4,
    PESOBRUTO = 4
WHERE (CODIGO = 1558);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 0.33,
    PESOBRUTO = 0.33
WHERE (CODIGO = 1980);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 0.9,
    PESOBRUTO = 0.9
WHERE (CODIGO = 1981);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 0.33,
    PESOBRUTO = 0.33
WHERE (CODIGO = 4128);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 0.9,
    PESOBRUTO = 0.9
WHERE (CODIGO = 4129);

UPDATE PRODUTO SET 
    PESOLIQUIDO = 1.7,
    PESOBRUTO = 1.7
WHERE (CODIGO = 9421);


COMMIT WORK;


