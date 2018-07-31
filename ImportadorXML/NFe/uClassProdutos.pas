unit uClassProdutos;

interface
uses
    Classes, Contnrs;

type
   {Detalhamento especifico de DI}
   TDI = class
   private
      fnDI : string; {118-I19-Número do Documento de Importação DI/DSI/DA}
      fdDI : string; {119-I20-Data de Registro da DI/DSI/DA}
      fxLocDesemb : string; {120-I21-Local de desembaraço}
      fUFDesemb : string; {121-I22-Sigla da UF onde ocorreu o Desembaraço Aduaneiro}
      fdDesemb : string; {122-I23-Data do Desembaraço Aduaneiro}
      fcExportador : string; {123-I24-Código do exportador}
   published
      property nDI : String read fnDI write fnDI;
      property dDI : String read fdDI write fdDI;
      property xLocDesemb : String read fxLocDesemb write fxLocDesemb;
      property UFDesemb : String read fUFDesemb write fUFDesemb;
      property dDesemb : String read fdDesemb write fdDesemb;
      property cExportador : String read fcExportador write fcExportador;
   end;
   {Detalhamento especifico de DI-Adicao}
   TAdi = class
   public
      procedure Assign(adi: Tadi);
   private
      fnAdicao : string; {125-I26-Numero da adição}
      fnSeqAdic : string; {126-I27-Numero seqüencial do item dentro da adição}
      fcFabricante : string; {127-I28-Código do fabricante estrangeiro}
      fvDescDI : string; {128-I29-Valor do desconto do item da DI – adição}
   published
      property nAdicao : String read fnAdicao write fnAdicao;
      property nSeqAdic : String read fnSeqAdic write fnSeqAdic;
      property cFabricante : String read fcFabricante write fcFabricante;
      property vDescDI : String read fvDescDI write fvDescDI;
   end;
   {Representa uma lista de Itens(Objetos do tipo TItem)}
   TAdiList = class(TObjectList)
   protected
      function GetItem(Index: Integer): TAdi; {Retorna o objeto TAdi que está na posição definida por Index}
      procedure SetItem(Index: Integer; adi : TAdi); {Altera o objeto TAdi que está na posição definida por Index}
   public
      constructor Create;
      function Add(adi : TAdi) : integer; {Insere o item no final da coleção}
      function Remove(adi : Tadi): Integer; {Remove da coleção o item}
      function IndexOf(adi : Tadi): Integer; {Retorna a posição onde está localizado o item na coleção}
      procedure Insert(Index: Integer; adi : Tadi); {Insere o item na posição indicada por Index}
      property Items[Index : integer] : Tadi read GetItem write SetItem; default;
   end;
   {Detalhamento especifico de Medicamento}
   TMed = class
   public
      procedure Assign(med: TMed);
   private
      fnLote : string; {153-K02-Número do Lote do medicamento}
      fqLote : string; {154-K03-Quantidade do produto no Lote do medicamento}
      fdFab : string; {155-K04-Data de fabricacao}
      fdVal : string; {156-K05-Data de validade}
      fvPMC : string; {157-K06-Preço máximo consumidor}
   published
      property nLote : String read fnLote write fnLote;
      property qLote : String read fqLote write fqLote;
      property dFab : String read fdFab write fdFab;
      property dVal : String read fdVal write fdVal;
      property vPMC : String read fvPMC write fvPMC;
   end;
   {Representa uma lista de Itens(Objetos do tipo TItem)}
   TMedList = class(TObjectList)
   protected
      function GetItem(Index: Integer): TMed; {Retorna o objeto TMed que está na posição definida por Index}
      procedure SetItem(Index: Integer; med : TMed); {Altera o objeto TMed que está na posição definida por Index}
   public
      constructor Create;
      function Add(med : TMed) : integer; {Insere o item no final da coleção}
      function Remove(med : TMed): Integer; {Remove da coleção o item}
      function IndexOf(med : TMed): Integer; {Retorna a posição onde está localizado o item na coleção}
      procedure Insert(Index: Integer; med : TMed); {Insere o item na posição indicada por Index}
      property Items[Index : integer] : TMed read GetItem write SetItem; default;
   end;
   {ICMS}
   TICMS = class
   private
      forig : string; {166-N11-Origem da Mercadoria}
      fCST : string; {167-N12-Tributação do ICMS}
      fmodBC : string; {168-N13-Modalidade de determinação da BC do ICMS}
      fvBC : string; {169-N14-Valor da BC do ICMS}
      fpICMS : string; {170-N15-Aliquota do Imposto}
      fvICMS : string; {171-N15-Valor do ICMS}
      fmodBCST : string; {179-N18-Modalidade de determinação da BC do ICMS ST}
      fpMVAST : string; {180-N19-Percentua da margem de valor adicionado do ICMS ST}
      fpRedBCST : string; {181-N20-Percentua da redução de BC do ICMS ST}
      fvBCST : string; {182-N21-Valor da BC do ICMS ST}
      fpICMSST : string; {173-N22-Aliquota do Imposto do ICMS ST}
      fvICMSST : string; {174-N23-Valor do ICMS ST}
      fpRedBC : string; {189-N14-Percentua da redução de BC}
      fmotDesICMS : string; {204.02-N28-Motivo da desoneração do ICMS}
      fvBCSTRet : string; {216-N26-Valor da BC do ICMS ST retido}
      fvICMSSTRet : string; {217-N27-Valor do ICMS ST retido}
      fpCredSN : string; {245.27-N29-Aliquota aplicável de cálculo do crédito(Simples Nacional)}
      fvCredICMSSN : string; {245.28-N30-Valor crédito do ICMS nos termos do art. 23 da LC 123(Simples Nacional)}
   published
      property orig : String read forig write forig;
      property CST : String read fCST write fCST;
      property modBC : String read fmodBC write fmodBC;
      property vBC : String read fvBC write fvBC;
      property pICMS : String read fpICMS write fpICMS;
      property vICMS : String read fvICMS write fvICMS;
      property modBCST : String read fmodBCST write fmodBCST;
      property pMVAST : String read fpMVAST write fpMVAST;
      property pRedBCST : String read fpRedBCST write fpRedBCST;
      property vBCST : String read fvBCST write fvBCST;
      property pICMSST : String read fpICMSST write fpICMSST;
      property vICMSST : String read fvICMSST write fvICMSST;
      property pRedBC : String read fpRedBC write fpRedBC;
      property motDesICMS : String read fmotDesICMS write fmotDesICMS;
      property vBCSTRet : String read fvBCSTRet write fvBCSTRet;
      property vICMSSTRet : String read fvICMSSTRet write fvICMSSTRet;
      property pCredSN : String read fpCredSN write fpCredSN;
      property vCredICMSSN : String read fvCredICMSSN write fvCredICMSSN;
   end;
   {IPI}
   TIPI = class
   private
      fCST : string; {253-O09-Código da situação tributária do IPI}
      fvBC : string; {254-010-Valor da BC do IPI}
      fqUnid : string; {255-011-Quantidade total na unidade padrão para tributação}
      fvUnid : string; {256-012-Valor por unidade tributável}
      fpIPI : string; {257-O13-Aliquota do IPI}
      fvIPI : string; {259-014-Valor do IPI}
   published
      property CST : String read fCST write fCST;
      property vBC : String read fvBC write fvBC;
      property qUnid : String read fqUnid write fqUnid;
      property vUnid : String read fvUnid write fvUnid;
      property pIPI : String read fpIPI write fpIPI;
      property vIPI : String read fvIPI write fvIPI;
   end;
   {II}
   TII = class
   private
      fvBC      : string; {263-P01-Valor da BC do Imposto de Importação}
      fvDespAdu : string; {264-P02-Valor das despesas aduaneiras}
      fvII      : string; {265-P03-Valor do Imposto de Importação}
      fvIOF     : string; {266-P04-Valor do Imposto sobre Operações Financeiras}
   published
      property vBC : String read fvBC write fvBC;
      property vDespAdu : String read fvDespAdu write fvDespAdu;
      property vII : String read fvII write fvII;
      property vIOF : String read fvIOF write fvIOF;
   end;
   {PIS}
   TPIS = class
   private
      fCST : string; {269-Q06-Código de Situação Tributária do PIS}
      fvBC : string; {270-Q07-Valor da Base de Cálculo do PIS}
      fpPIS : string; {271-Q08-Aliquota do PIS (em percentual)}
      fvPIS : string; {272-Q09-Valor do PIS}
      fvPautaPIS : String;{277-Q09-Valor do PIS por Pauta}
   published
      property CST : String read fCST write fCST;
      property vBC : String read fvBC write fvBC;
      property pPIS : String read fpPIS write fpPIS;
      property vPIS : String read fvPIS write fvPIS;
      property vPautaPIS : String read fvPautaPIS write fvPautaPIS;
   end;
   {COFINS}
   TCOFINS = class
   private
      fCST : string; {295-S06-Código de Situação Tributária do COFINS}
      fvBC : string; {296-S07-Valor da Base de Cálculo do COFINS}
      fpCOFINS : string; {297-S08-Aliquota do COFINS (em percentual)}
      fvCOFINS : string; {298-S09-Valor do COFINS}
      fvPautaCOFINS : String; {303-S11-Valor do Cofins por Pauta NF}
   published
      property CST : String read fCST write fCST;
      property vBC : String read fvBC write fvBC;
      property pCOFINS : String read fpCOFINS write fpCOFINS;
      property vCOFINS : String read fvCOFINS write fvCOFINS;
      property vPautaCOFINS : String read fvPautaCOFINS write fvPautaCOFINS;
   end;
   // add Fabianne ISSQN
   {ISSQN}
   TISSQN = class
   private
      fvBC : string; {320-U02-Valor da Base de Cálculo do ISSQN}
      fvAliq : string; {321-U03-Aliquota do ISSQN}
      fvISSQN  : string;{322-U04-Valor do ISSQN}
      fcMunFG : string;{323-U05-Cod. municipio ocorrencia fato gerador do ISSQN}
      fcListServ : string; {324-U06-Item da lista de servicos}
      fcSitTrib  : string; {324a-U07-Cod. de tributacao do ISSQN}
   published
      property vBC : String read fvBC write fvBC;
      property vAliq   : String read fvAliq write fvAliq;
      property vISSQN : String read fvISSQN write fvISSQN;
      property cMunFG : String read fcMunFG write fcMunFG;
      property cListServ : String read fcListServ write fcListServ;
      property cSitTrib : String read fcSitTrib write fcSitTrib;
   end;
   // fim add Fabianne ISSQN
   {Detalhamento de Produto/Serviço}
   TItem = class
   public
      di   : TDI;
      adis : TAdiList;
      meds : TMedList;
      ICMS : TICMS;
      IPI : TIPI;
      II  : TII;
      PIS : TPIS;
      COFINS : TCOFINS;
      ISSQN  : TISSQN;
      constructor Create;
      procedure Assign(item: TItem);
   private
      fnItem : string; {99-H02-Número do Item}
      fcProd : String; {101-I02-Código do Produto}
      fcEAN : String; {102-I03-GTIN do Produto}
      fxProd : String; {103-I04-Descrição do Produto}
      fNCM : String; {104-I05-Código NCM}
      fEXTIPI : String; {105-I06-Código EX da TIPI}
      fgenero : String; {106-I07-Gênero do Produto ou Serviço - Tabela de Capítulos da NCM}
      fCFOP : String; {107-I08-Código Fiscal de Operações e Prestações}
      fuCom : String; {108-I09-Unidade comercial}
      fqCom : String; {109-I10-Quantidade comercial}
      fvUnCom : String; {109a-I10a-Valor Unitário de comercialização}
      fvProd : String; {110-I11-Valor Total Bruto dos Produtos ou Serviços}
      fcEANTrib : String; {111-I12-GTIN da unidate tributável}
      fuTrib : String; {112-I13-Unidade Tributável}
      fqTrib : String; {113-I14-Quantidade Tributável}
      fvUnTrib : String; {114-I15-Valor Unitário de tributação}
      fvFrete : String; {115-I16-Valor Total do Frete}
      fvSeg : String; {116-I17-Valor Total do Seguro}
      fvDesc : String; {117-I18-Valor do Desconto}
      fvOutro : String; {116a-I17a-Outras despesas acessárias}
      findTot : String; {116b-I17b-Indica se valor do produto entra no valor total da NF-e}
      finfAdProd : String; {H01-Informações Adicionais do Produto}
   published
      property nItem : String read fnItem write fnItem;
      property cProd : String read fcProd write fcProd;
      property cEAN : String read fcEAN write fcEAN;
      property xProd : String read fxProd write fxProd;
      property NCM : String read fNCM write fNCM;
      property EXTIPI : String read fEXTIPI write fEXTIPI;
      property genero : String read fgenero write fgenero;
      property CFOP : String read fCFOP write fCFOP;
      property uCom: String read fuCom write fuCom;
      property qCom: String read fqCom write fqCom;
      property vUnCom: String read fvUnCom write fvUnCom;
      property vProd: String read fvProd write fvProd;
      property cEANTrib: String read fcEANTrib write fcEANTrib;
      property uTrib: String read fuTrib write fuTrib;
      property qTrib: String read fqTrib write fqTrib;
      property vUnTrib: String read fvUnTrib write fvUnTrib;
      property vFrete: String read fvFrete write fvFrete;
      property vSeg: String read fvSeg write fvSeg;
      property vDesc: String read fvDesc write fvDesc;
      property vOutro: String read fvOutro write fvOutro;
      property indTot: String read findTot write findTot;
      property infAdProd: String read finfAdProd write finfAdProd;
   end;
   {Representa uma lista de Itens(Objetos do tipo TItem)}
   TItemList = class(TObjectList)
   protected
      function GetItem(Index: Integer): TItem; {Retorna o objeto TItem que está na posição definida por Index}
      procedure SetItem(Index: Integer; item : TItem); {Altera o objeto TItem que está na posição definida por Index}
   public
      constructor Create;
      function Add(item : TItem) : integer; {Insere o item no final da coleção}
      function Remove(item : TItem): Integer; {Remove da coleção o item}
      function IndexOf(item : TItem): Integer; {Retorna a posição onde está localizado o item na coleção}
      procedure Insert(Index: Integer; item : TItem); {Insere o item na posição indicada por Index}
      property Items[Index : integer] : TItem read GetItem write SetItem; default;
   end;

implementation

{ TItemList }
function TItemList.Add(item: TItem): integer;
var
   NovoItem : TItem;
begin
     NovoItem := TItem.Create;
     NovoItem.Assign(item);
     Result := inherited Add(NovoItem);
end;

constructor TItemList.Create;
begin
     inherited Create;
end;

function TItemList.GetItem(Index: Integer): TItem;
begin
     Result := inherited Items[Index] as TItem;
end;

function TItemList.IndexOf(item: TItem): Integer;
begin
     Result := inherited IndexOf(item);
end;

procedure TItemList.Insert(Index: Integer; item: TItem);
begin
     inherited Insert(Index, item);
end;

function TItemList.Remove(item: TItem): Integer;
begin
     Result := inherited Remove(item);
end;

procedure TItemList.SetItem(Index: Integer; item: TItem);
begin
     inherited Items[Index] := item;
end;

{ TItem }
procedure TItem.Assign(item: TItem);
begin
     nItem := item.nItem;
     cProd := item.cProd;
     cEAN := item.cEAN;
     xProd := item.xProd;
     NCM := item.NCM;
     EXTIPI := item.EXTIPI;
     genero := item.genero;
     CFOP := item.CFOP;
     uCom := item.uCom;
     qCom := item.qCom;
     vUnCom := item.vUnCom;
     vProd := item.vProd;
     cEANTrib := item.cEANTrib;
     uTrib := item.uTrib;
     qTrib := item.qTrib;
     vUnTrib := item.vUnTrib;
     vFrete := item.vFrete;
     vSeg := item.vSeg;
     vDesc := item.vDesc;
     vOutro := item.vOutro;
     indTot := item.indTot;
     infAdProd := item.infAdProd;
     di   := item.di;
     adis := item.adis;
     meds := item.meds;
     ICMS := item.ICMS;
     IPI := item.IPI;
     II  := item.II;
     PIS := item.PIS;
     COFINS := item.COFINS;
     ISSQN  := item.ISSQN;
end;

constructor TItem.Create;
begin
     inherited Create;
     //indTot := '1';  alt. Fabianne para servico indtot = 0
     DI   := TDI.Create;
     ICMS := TICMS.Create;
     IPI  := TIPI.Create;
     II   := TII.Create;
     PIS  := TPIS.Create;
     COFINS := TCOFINS.Create;
     ISSQN  := TISSQN.Create;
end;

{ TMedList }
function TMedList.Add(med: TMed): integer;
var
   NovoMed : TMed;
begin
     NovoMed := TMed.Create;
     NovoMed.Assign(med);
     Result := inherited Add(NovoMed);
end;

constructor TMedList.Create;
begin
     inherited Create;
end;

function TMedList.GetItem(Index: Integer): TMed;
begin
     Result := inherited Items[Index] as TMed;
end;

function TMedList.IndexOf(med: TMed): Integer;
begin
     Result := inherited IndexOf(med);
end;

procedure TMedList.Insert(Index: Integer; med: TMed);
begin
     inherited Insert(Index, med);
end;

function TMedList.Remove(med: TMed): Integer;
begin
     Result := inherited Remove(med);
end;

procedure TMedList.SetItem(Index: Integer; med: TMed);
begin
     inherited Items[Index] := med;
end;

{ TMed }
procedure TMed.Assign(med: TMed);
begin
     nLote := med.nLote;
     qLote := med.qLote;
     dFab := med.dFab;
     dVal := med.dVal;
     vPMC := med.vPMC;
end;

// add Fabianne
{ TAdiList }
function TAdiList.Add(adi: TAdi): integer;
var
   NovoAdi : TAdi;
begin
     NovoAdi := TAdi.Create;
     NovoAdi.Assign(adi);
     Result := inherited Add(NovoAdi);
end;

constructor TAdiList.Create;
begin
     inherited Create;
end;

function TAdiList.GetItem(Index: Integer): TAdi;
begin
     Result := inherited Items[Index] as TAdi;
end;

function TAdiList.IndexOf(Adi: TAdi): Integer;
begin
     Result := inherited IndexOf(Adi);
end;

procedure TAdiList.Insert(Index: Integer; Adi: TAdi);
begin
     inherited Insert(Index, Adi);
end;

function TAdiList.Remove(Adi: TAdi): Integer;
begin
     Result := inherited Remove(Adi);
end;

procedure TAdiList.SetItem(Index: Integer; Adi: TAdi);
begin
     inherited Items[Index] := Adi;
end;

{ TAdi }
procedure TAdi.Assign(Adi: TAdi);
begin
     nAdicao := Adi.nAdicao;
     nSeqAdic := adi.nSeqAdic;
     cFabricante := adi.cFabricante;
     vDescDI := adi.vDescDI;
end;


end.
