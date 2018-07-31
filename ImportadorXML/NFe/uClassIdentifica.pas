unit uClassIdentifica;

interface

type
   {Identifica��o da Nota Fiscal eletr�nica}
   TIde = class
   private
      fChaveAcesso : String; {Chave de Acesso da NF-e}
      fcUF : String; {6-C�digo da UF do emitente do Documento Fiscal}
      fcNF : String; {7-C�digo N�m�rico que comp�e a Chave de Acesso}
      fnatOp : String; {8-Descri��o da Natureza da Opera��o}
      findPag : String; {9-Indicador da forma de pagamento}
      fmodelo : string; {10-C�digo do Modelo do Documento Fiscal}
      fserie : string; {11-S�rie do Documento Fiscal}
      fnNF : string; {12-N�mero do Documento Fiscal}
      fdEmi : string; {13-Data de emiss�o do Documento Fiscal}
      fdSaiEnt : string; {14-Data de Sa�da ou da Entrada da Mercadoria}
      fhSaiEnt : string; {14a-Hora de Saida ou da Entrada da Mercadoria/Produto}
      ftpNF : string; {15-Tipo do Documento Fiscal}
      fcMunFG : string; {16-C�digo do Municipio de Ocorr�ncia do Fato Gerador}
      fAAMM : string; {20-Ano e M�s de emiss�o da NF-e}
      ftpImp : string; {25-Formato de Impress�o do DANFE}
      ftpEmis : string; {26-Forma de emiss�o da NF-e}
      fcDV : String; {27-Digito Verificador da Chave de Acesso da NF-e}
      ftpAmb : string; {28-Identifica��o do Ambiente}
      ffinNFe : string; {29-Finalidade de emiss�o da NF-e}
      fprocEmi : String; {29a-Processo de emiss�o da NF-e}
      fverProc : String; {29b-Vers�o do Processo de emiss�o da NF-e}
      fdhCont : String; {29c-data e hora da entrada em contingencia}
      fxJust : String; {29d-justificativa da entrada em contingencia}
   published
      property ChaveAcesso : String read fChaveAcesso write fChaveAcesso;
      property cUF : String read fcUF write fcUF;
      property cNF : String read fcNF write fcNF;
      property natOp : String read fnatOp write fnatOp;
      property indPag : string read findPag write findPag;
      property modelo : String read fmodelo write fmodelo;
      property serie : String read fserie write fserie;
      property nNF : String read fnNF write fnNF;
      property dEmi : String read fdEmi write fdEmi;
      property dSaiEnt : String read fdSaiEnt write fdSaiEnt;
      property hSaiEnt : String read fhSaiEnt write fhSaiEnt;
      property tpNF : String read ftpNF write ftpNF;
      property cMunFG : String read fcMunFG write fcMunFG;
      property AAMM : String read fAAMM write fAAMM;
      property tpImp : String read ftpImp write ftpImp;
      property tpEmis : String read ftpEmis write ftpEmis;
      property cDV : String read fcDV write fcDV;
      property tpAmb : String read ftpAmb write ftpAmb;
      property finNFe : String read ffinNFe write ffinNFe;
      property procEmi : String read fprocEmi write fprocEmi;
      property verProc : String read fverProc write fverProc;
      property dhCont : String read fdhCont write fdhCont;
      property xJust : String read fxJust write fxJust;
   end;

implementation

end.
