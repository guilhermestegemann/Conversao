unit uClassIdentifica;

interface

type
   {Identificação da Nota Fiscal eletrônica}
   TIde = class
   private
      fChaveAcesso : String; {Chave de Acesso da NF-e}
      fcUF : String; {6-Código da UF do emitente do Documento Fiscal}
      fcNF : String; {7-Código Númérico que compôe a Chave de Acesso}
      fnatOp : String; {8-Descrição da Natureza da Operação}
      findPag : String; {9-Indicador da forma de pagamento}
      fmodelo : string; {10-Código do Modelo do Documento Fiscal}
      fserie : string; {11-Série do Documento Fiscal}
      fnNF : string; {12-Número do Documento Fiscal}
      fdEmi : string; {13-Data de emissão do Documento Fiscal}
      fdSaiEnt : string; {14-Data de Saída ou da Entrada da Mercadoria}
      fhSaiEnt : string; {14a-Hora de Saida ou da Entrada da Mercadoria/Produto}
      ftpNF : string; {15-Tipo do Documento Fiscal}
      fcMunFG : string; {16-Código do Municipio de Ocorrência do Fato Gerador}
      fAAMM : string; {20-Ano e Mês de emissão da NF-e}
      ftpImp : string; {25-Formato de Impressão do DANFE}
      ftpEmis : string; {26-Forma de emissão da NF-e}
      fcDV : String; {27-Digito Verificador da Chave de Acesso da NF-e}
      ftpAmb : string; {28-Identificação do Ambiente}
      ffinNFe : string; {29-Finalidade de emissão da NF-e}
      fprocEmi : String; {29a-Processo de emissão da NF-e}
      fverProc : String; {29b-Versão do Processo de emissão da NF-e}
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
