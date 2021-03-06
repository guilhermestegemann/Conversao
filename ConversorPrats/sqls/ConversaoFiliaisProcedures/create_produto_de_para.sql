CREATE TABLE PRODUTODEPARA (
    FILIAL INTEGER NOT NULL,
    DE INTEGER NOT NULL,
    PARA INTEGER NOT NULL);

ALTER TABLE PRODUTODEPARA
ADD CONSTRAINT PK_PRODUTODEPARA
PRIMARY KEY (FILIAL,DE,PARA);

ALTER TABLE PRODUTODEPARA
ADD CONSTRAINT FK_PRODUTODEPARA_1
FOREIGN KEY (FILIAL)
REFERENCES FILIAL(CODIGO)
ON DELETE CASCADE
ON UPDATE CASCADE
USING INDEX FK_PRODUTODEPARA_1;

ALTER TABLE PRODUTODEPARA
ADD CONSTRAINT FK_PRODUTODEPARA_2
FOREIGN KEY (PARA)
REFERENCES PRODUTO(CODIGO)
ON DELETE CASCADE
ON UPDATE CASCADE
USING INDEX FK_PRODUTODEPARA_2;


