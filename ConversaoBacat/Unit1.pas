unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.Samples.Gauges,
  Vcl.StdCtrls, Vcl.Menus, ComObj;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    PopupMenu1: TPopupMenu;
    Gauge1: TGauge;
    SaveTextFileDialog1: TSaveTextFileDialog;
    btnBairro: TButton;
    salvar: TMenuItem;
    btnRota: TButton;
    btnCidade: TButton;
    btnFuncionario: TButton;
    btnCliente: TButton;
    btnFornecedor: TButton;
    btnUnidadeMedida: TButton;
    btnTipoProduto: TButton;
    btnGrupo: TButton;
    btnProduto: TButton;
    btnClasse: TButton;
    btnEstoque: TButton;
    btnContasAPagar: TButton;
    btnContasAReceber: TButton;
    procedure CarregarExcelCliente;
    procedure CarregarExcelProduto;
    procedure CarregarExcelContasAPagar;
    procedure CarregarExcelContasAReceber;
    procedure AjustaGauge(Inicio, Fim : Integer);
    function  Numericos(st: string):string;
    function MascaraCnpjCpf(Value : string):String;
    function  VerificaCnpj(cnpj: string):boolean;
    function MascaraCnpj(cnpj: string):String;
    function MascaraCpf(cpf: string):String;
    function  TratarCaracteresEspeciais(st: string):string;
    function AjustaData(data : String):String;
    function AjustaDireita(st : String; tam : Integer; char : String): String;
    procedure salvarClick(Sender: TObject);
    procedure btnFuncionarioClick(Sender: TObject);
    procedure btnBairroClick(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
    procedure btnRotaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnUnidadeMedidaClick(Sender: TObject);
    procedure btnTipoProdutoClick(Sender: TObject);
    procedure btnGrupoClick(Sender: TObject);
    procedure btnClasseClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
    procedure btnContasAPagarClick(Sender: TObject);
    procedure btnContasAReceberClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  //Cliente
  cCodigoClifor : Integer = 1;
  cRazao : Integer = 2;
  cFantasia : Integer = 3;
  cEndereco : Integer = 4;
  cNumeroEndereco : Integer = 5;
  cCidade : Integer = 8;
  cCep : Integer = 9;
  cBairro : Integer = 11;
  cTelefone : Integer = 12;
  cCNPJ : Integer = 13;
  cIE : Integer = 14;
  cTipoEstabelecimento : Integer = 15;
  cDataCadastro : Integer = 16;
  cCondicaoPagamentoPadrao : Integer = 17;
  cFormaPagamentoPadrao : Integer = 18;
  cCondBloquear1 : Integer = 19;
  cCondBloquear2 : Integer = 20;
  cCondBloquear3 : Integer = 21;
  cCondBloquear4 : Integer = 22;
  cCondBloquear5 : Integer = 23;
  cCondBloquear6 : Integer = 24;
  cCondBloquear7 : Integer = 25;
  cCondBloquear8 : Integer = 26;
  cCondBloquear9 : Integer = 27;
  cCondBloquear10 : Integer = 28;
  cCondBloquear11 : Integer = 29;
  cCondBloquear12 : Integer = 30;
  cCondBloquear13 : Integer = 31;
  cCondBloquear14 : Integer = 32;
  cCondBloquear15 : Integer = 33;
  cCondBloquear16 : Integer = 34;
  cCondBloquear17 : Integer = 35;
  cCondBloquear18 : Integer = 36;
  cCondBloquear19 : Integer = 37;
  cVendedor : Integer = 38;

  CInicioCliente : Integer = 3;
  cFimCliente : Integer = 2327;

  //produto
  cCodigoProduto : Integer       = 2;
  cDataCadastroProduto : Integer = 4;
  cNomeProduto : Integer         = 6;
  cCodigoFornecedor : Integer    = 7;
  cNomeFornecedor : Integer      = 8;
  cUnVenda : Integer             = 10;
  cUnCompra : Integer            = 11;
  cQtdeCompra : Integer          = 12;
  cEstoqueMinimo : Integer       = 13;
  cValorCusto : Integer          = 15;
  cValorVenda : Integer          = 19;
  cCodigoTipoProduto : Integer   = 26;
  cNomeTipoProduto : Integer     = 27;
  cCodigoGrupo : Integer         = 28;
  cNomeGrupo : Integer           = 29;
  cCodigoClasse : Integer        = 30;
  cNomeClasse : Integer          = 31;
  cPesoBruto : Integer           = 35;
  cDescontoMaximo : Integer      = 58;
  cTipoItem : Integer            = 64;
  cCodigoNCM : Integer           = 94;
  cCest : Integer                = 197;
  cInicioProduto : Integer       = 2;
  cFimProduto : Integer          = 114;

  //financeiro
  cFinClifor            : Integer = 1;
  cFinRazaoClifor       : Integer = 2;
  cFinOrdem             : Integer = 3;
  cFinVencimento        : Integer = 4;
  cFinValor             : Integer = 5;
  cFinEmissao           : Integer = 6;
  cFinValorJuro         : Integer = 7;
  cFinValorDesconto     : Integer = 8;
  cFinValorPendente     : Integer = 9;
  cFinValorPago         : Integer = 10;
  cFinQuitado           : Integer = 11;
  cFinDataQuitado       : Integer = 12;
  cFinEmpresa           : Integer = 13;
  cFinObs               : Integer = 14;
  cFinValorOriginal     : Integer = 15;
  cFinCancelado         : Integer = 16;
  cFinSequencial        : Integer = 17;
  cInicioContasAPagar   : Integer = 2;
  cFimContasAPagar      : Integer = 2267;
  cInicioContasAReceber : Integer = 0;
  cFimContasAReceber    : Integer = 0;
var
  Form1: TForm1;
    Excel, Planilha : OleVariant;

implementation

{$R *.dfm}

function TForm1.AjustaData(data: String): String;
var
  Splited : TArray<String>;
begin
  Result := 'NULL';
  if Length(data) = 10 then
  begin
    Splited := data.Split(['-']);
    if StrToInt(Splited[0]) > 2017 then Splited[0] := '2017';
    if StrToInt(Splited[0]) = 1882 then Splited[0] := '1982';
    Result := QuotedStr(Splited[2] + '.' + Splited[1] + '.' + Splited[0]);
  end;
end;

function TForm1.AjustaDireita(st: String; tam: Integer; char: String): String;
begin
     while Length(st) < tam do st:= st+char;
     result := st;
end;

procedure TForm1.AjustaGauge(Inicio, Fim : Integer);
begin
  Gauge1.Progress := Inicio;
  Gauge1.MaxValue := Fim;
end;

procedure TForm1.btnFornecedorClick(Sender: TObject);
var
  SQL, SQLPronto, CodigoFornecedor, NomeFornecedor : String;
  I, X : Integer;
  achei : boolean;
begin
  SQl := 'INSERT INTO CLIFOR (CODIGO, NOME, TIPO, BAIRRO, CIDADE, CLASSIFICACAOCLIFOR) VALUES (%s, %s, 2, 1, 1, 1);';
  ListBox1.Clear;
  try
    CarregarExcelProduto;
    AjustaGauge(cInicioProduto, cFimProduto);
    for I := cInicioProduto  to cFimProduto do
    begin
      CodigoFornecedor := Trim(Planilha.cells[i,cCodigoFornecedor]);
      NomeFornecedor := Trim(Planilha.cells[i,cNomeFornecedor]);
      CodigoFornecedor := '1000'+CodigoFornecedor;
      SQLPronto := Format(SQL,[CodigoFornecedor, QuotedStr(NomeFornecedor)]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if not achei  and ((NomeFornecedor <> EmptyStr) {or (CodigoFornecedor <> '1000')})then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnFuncionarioClick(Sender: TObject);
var
  SQL, SQLPronto, Vendedor, CodigoVendedor : String;
  I, X : Integer;
  achei : boolean;
begin
  SQl := 'INSERT INTO FUNCIONARIO (CODIGO, NOME) VALUES (%s, %s);';
  ListBox1.Clear;
  AjustaGauge(cInicioCliente, cFimCliente);
  try
    CarregarExcelCliente;
    for I := CInicioCliente  to cFimCliente do
    begin
      //CodigoVendedor := Trim(Planilha.cells[i,cVendedor]);
      //SVendedor := Trim(Planilha.cells[i,cNomeVendedor]);

      SQLPronto := Format(SQL,[CodigoVendedor, QuotedStr(Vendedor)]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if not achei  and ((Vendedor <> EmptyStr) or (CodigoVendedor <> EmptyStr))then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnGrupoClick(Sender: TObject);
var
  SQL, SQLPronto, Codigo, Nome : String;
  I, X : Integer;
  achei : boolean;
begin
  SQl := 'INSERT INTO GRUPO (CODIGO, NOME) ' +
         ' VALUES (%s, %s);';
  ListBox1.Clear;
  try
    CarregarExcelProduto;
    AjustaGauge(cInicioProduto, cFimProduto);
    for I := cInicioProduto  to cFimProduto do
    begin
      Codigo := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cCodigoGrupo]));
      Nome := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cNomeGrupo]));

      SQLPronto := Format(SQL,[Codigo, QuotedStr(Nome)]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if ((not achei) and (Nome <> EmptyStr)) then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnProdutoClick(Sender: TObject);
var
  SQL : String;
  CodigoProduto, DataCadastroProduto, NomeProduto, UnVenda, UnCompra, QtdeCompra, TipoProduto, Grupo, Classe, PesoBruto, CodigoNCM, Cest : String;
  I : Integer;

begin
  SQl := 'INSERT INTO PRODUTO (CODIGO, DATA, NOME, UNVENDA, UNCOMPRA, QTDECOMPRA, TIPOPRODUTO, GRUPO, CLASSE, PESOBRUTO, CODIGONCM, CEST) ' +
         ' VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
  ListBox1.Clear;
  try
    CarregarExcelProduto;
    AjustaGauge(cInicioProduto, cFimProduto);
    for I := cInicioProduto  to cFimProduto do
    begin
      CodigoProduto := Trim(Planilha.cells[i,cCodigoProduto]);
      DataCadastroProduto := AjustaData(TratarCaracteresEspeciais(Trim(Planilha.cells[i,cDataCadastroProduto])));
      NomeProduto := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cNomeProduto]));
      UnVenda := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cUnVenda]));
      UnCompra := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cUnCompra]));
      QtdeCompra := Trim(Planilha.cells[i,cQtdeCompra]);
      TipoProduto := Trim(Planilha.cells[i,cCodigoTipoProduto]);
      Grupo := (Trim(Planilha.cells[i,cCodigoGrupo]));
      Classe := (Trim(Planilha.cells[i,cCodigoClasse]));
      PesoBruto := (Trim(Planilha.cells[i,cPesoBruto]));
      CodigoNCM := Numericos(Trim(Planilha.cells[i,cCodigoNCM]));
      Cest := Numericos(Trim(Planilha.cells[i,cCest]));

      //ajustes
      if ((QtdeCompra = '0') or (QtdeCompra = EmptyStr)) then QtdeCompra := '1';
      if TipoProduto = EmptyStr then TipoProduto := 'NULL';
      if Grupo = EmptyStr then Grupo := 'NULL';
      if Classe = EmptyStr then Classe := 'NULL';
      PesoBruto := StringReplace(PesoBruto, ',', '.', [rfReplaceAll]);

      if NomeProduto <> EmptyStr then
         ListBox1.Items.Add(Format(SQL, [CodigoProduto, DataCadastroProduto, QuotedStr(NomeProduto), QuotedStr(UnVenda), QuotedStr(UnCompra), QtdeCompra,
                        TipoProduto, Grupo, Classe, PesoBruto, QuotedStr(CodigoNCM), QuotedStr(Cest)]));

      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnBairroClick(Sender: TObject);
var
  SQL, SQLPronto, NomeBairro : String;
  I, X : Integer;
  achei : boolean;
begin
  SQl := 'INSERT INTO BAIRRO (CODIGO, NOME) VALUES ((SELECT MAX(CODIGO) +1 FROM BAIRRO), %s);';
  ListBox1.Clear;
  AjustaGauge(cInicioCliente, cFimCliente);
  try
    CarregarExcelCliente;
    for I := CInicioCliente  to cFimCliente do
    begin
      //NomeBairro := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cBairro]));

      SQLPronto := Format(SQL,[QuotedStr(NomeBairro)]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if not achei then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnClasseClick(Sender: TObject);
var
  SQL, SQLPronto, Codigo, Nome : String;
  I, X : Integer;
  achei : boolean;
begin
  SQl := 'INSERT INTO CLASSE (CODIGO, NOME) ' +
         ' VALUES (%s, %s);';
  ListBox1.Clear;
  try
    CarregarExcelProduto;
    AjustaGauge(cInicioProduto, cFimProduto);
    for I := cInicioProduto  to cFimProduto do
    begin
      Codigo := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cCodigoClasse]));
      Nome := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cNomeClasse]));

      SQLPronto := Format(SQL,[Codigo, QuotedStr(Nome)]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if ((not achei) and (Nome <> EmptyStr)) then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnClienteClick(Sender: TObject);
var
  CodigoClifor, Razao, Fantasia, Endereco, NumeroEndereco, Cidade, Cep, Bairro, Telefone, CNPJ, IE, TipoEstabelecimento, DataCadastro,
  CondicaoPagamentoPadrao, FormaPagamentoPadrao, Vendedor : String;
  CondBloquear1, CondBloquear2, CondBloquear3, CondBloquear4, CondBloquear5, CondBloquear6, CondBloquear7, CondBloquear8, CondBloquear9, CondBloquear10,
  CondBloquear11, CondBloquear12, CondBloquear13, CondBloquear14, CondBloquear15, CondBloquear16, CondBloquear17, CondBloquear18, CondBloquear19 : String;
  SQLClifor : String;
  I : Integer;

begin
  SQLClifor := 'EXECUTE PROCEDURE PROCEDURE_CUSTOM_INS_CLIFOR(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s); COMMIT WORK;';
  AjustaGauge(cInicioCliente, cFimCliente);
  try
    ListBox1.Clear;
    CarregarExcelCliente;
    for I := cInicioCliente to cFimCliente do
    begin
      CodigoClifor := Numericos(Trim(Planilha.cells[i,cCodigoClifor]));
      Razao := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cRazao]));
      Fantasia := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cFantasia]));
      Endereco := Trim(Planilha.cells[i,cEndereco]);
      NumeroEndereco := Trim(Planilha.cells[i,cNumeroEndereco]);
      Cidade := Numericos(Trim(Planilha.cells[i,cCidade]));
      Cep := Numericos(Trim(Planilha.cells[i,cCep]));
      Bairro := Numericos(Trim(Planilha.cells[i,cBairro]));
      Telefone := Numericos(Trim(Planilha.cells[i,cTelefone]));
      Vendedor := Numericos(Trim(Planilha.cells[i,cVendedor]));
      CNPJ := MascaraCnpjCpf(Trim(Planilha.cells[i,cCNPJ]));
      IE := Trim(Planilha.cells[i,cIE]);
      TipoEstabelecimento := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cTipoEstabelecimento]));
      DataCadastro := Trim(Planilha.cells[i,cDataCadastro]);
      CondicaoPagamentoPadrao := Trim(Planilha.cells[i,cCondicaoPagamentoPadrao]);
      FormaPagamentoPadrao := Trim(Planilha.cells[i,cFormaPagamentoPadrao]);
      CondBloquear1 := Numericos(Trim(Planilha.cells[i,cCondBloquear1]));
      CondBloquear2 := Numericos(Trim(Planilha.cells[i,cCondBloquear2]));
      CondBloquear3 := Numericos(Trim(Planilha.cells[i,cCondBloquear3]));
      CondBloquear4 := Numericos(Trim(Planilha.cells[i,cCondBloquear4]));
      CondBloquear5 := Numericos(Trim(Planilha.cells[i,cCondBloquear5]));
      CondBloquear6 := Numericos(Trim(Planilha.cells[i,cCondBloquear6]));
      CondBloquear7 := Numericos(Trim(Planilha.cells[i,cCondBloquear7]));
      CondBloquear8 := Numericos(Trim(Planilha.cells[i,cCondBloquear8]));
      CondBloquear9 := Numericos(Trim(Planilha.cells[i,cCondBloquear9]));
      CondBloquear10 := Numericos(Trim(Planilha.cells[i,cCondBloquear10]));
      CondBloquear11 := Numericos(Trim(Planilha.cells[i,cCondBloquear11]));
      CondBloquear12 := Numericos(Trim(Planilha.cells[i,cCondBloquear12]));
      CondBloquear13 := Numericos(Trim(Planilha.cells[i,cCondBloquear13]));
      CondBloquear14 := Numericos(Trim(Planilha.cells[i,cCondBloquear14]));
      CondBloquear15 := Numericos(Trim(Planilha.cells[i,cCondBloquear15]));
      CondBloquear16 := Numericos(Trim(Planilha.cells[i,cCondBloquear16]));
      CondBloquear17 := Numericos(Trim(Planilha.cells[i,cCondBloquear17]));
      CondBloquear18 := Numericos(Trim(Planilha.cells[i,cCondBloquear18]));
      CondBloquear19 := Numericos(Trim(Planilha.cells[i,cCondBloquear19]));
      //ajustes
      Razao := Copy(Razao, 1, 60);
      TipoEstabelecimento := TipoEstabelecimento.ToUpper;
      if TipoEstabelecimento = 'RESTAURANTE-PIZZARIA' then TipoEstabelecimento := 'RESTAURANTE';
      if TipoEstabelecimento = 'SUPERMERCADOS 1 A 4' then TipoEstabelecimento := 'SM 2 A 4 CHECK-OUTS (MERCADO)';
      if TipoEstabelecimento = 'PADARIA-CONFEITARIA' then TipoEstabelecimento := 'PADARIA';
      if TipoEstabelecimento = 'LOJA DE CONVENIENCIA' then TipoEstabelecimento := 'LOJA DE CONVENIENCIAS';
      if TipoEstabelecimento = 'FARMACIA' then TipoEstabelecimento := 'OUTROS';


      NumeroEndereco := Copy(NumeroEndereco, 0, 10);
      Endereco := Copy(Endereco, 0, 60);
      ListBox1.Items.Add(Format(SQLClifor,[CodigoClifor, QuotedStr(Razao), QuotedStr(Fantasia), QuotedStr(Endereco), QuotedStr(NumeroEndereco), Cidade, QuotedStr(Cep), Bairro,
                          QuotedStr(Telefone), Vendedor, QuotedStr(CNPJ), QuotedStr(IE), QuotedStr(TipoEstabelecimento), QuotedStr(DataCadastro), CondicaoPagamentoPadrao, FormaPagamentoPadrao,
                          CondBloquear1, CondBloquear2, CondBloquear3, CondBloquear4, CondBloquear5, CondBloquear6, CondBloquear7, CondBloquear8, CondBloquear9, CondBloquear10,
                          CondBloquear11, CondBloquear12, CondBloquear13, CondBloquear14, CondBloquear15, CondBloquear16, CondBloquear17, CondBloquear18, CondBloquear19]));
      Application.ProcessMessages;
      Gauge1.AddProgress(1);
     end;
  finally
    Excel.Quit;
  end;



end;

procedure TForm1.btnContasAPagarClick(Sender: TObject);
var
  SQL : String;
  Clifor, Ordem, Documento, Vencimento, Emissao, Quitado, Obs, Cancelado, ValorDesconto, ValorOriginal, DataQuitado, ValorJuro, ValorPago, Valor, ValorPendente, ValorInsert, Sequencial : String;
  I : Integer;
begin
//'INSERT INTO FINANCEIRO (FILIAL, TIPO, CLIFOR, ORDEM, DOCUMENTO, DATAVCTO, VALOR, DATAEMISSAO, JURO, DESCONTO, VALORBAIXA, DATABAIXA, OBS, VALORORIGINAL, CANCELADO) ' +
  SQl := 'EXECUTE PROCEDURE CONVERSAO_FINANCEIRO(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
  ListBox1.Clear;
  try
    CarregarExcelContasAPagar;
    AjustaGauge(cInicioContasAPagar, cFimContasAPagar);
    for I := cInicioContasAPagar  to cFimContasAPagar do
    begin
      Clifor := Trim(Planilha.cells[i,cFinClifor]);
      Ordem := Trim(Planilha.cells[i,cFinOrdem]);
      Documento := Copy(Numericos(Trim(Planilha.cells[i,cFinOrdem])),0,9);
      Vencimento := StringReplace(Trim(Planilha.cells[i,cFinVencimento]),'/','.',[rfReplaceAll]);
      Valor := StringReplace(Trim(Planilha.cells[i,cFinValor]),',','.',[rfReplaceAll]);
      Emissao := StringReplace(Trim(Planilha.cells[i,cFinEmissao]),'/','.',[rfReplaceAll]);
      ValorJuro := StringReplace(Trim(Planilha.cells[i,cFinValorJuro]),',','.',[rfReplaceAll]); //null
      ValorDesconto := StringReplace(Trim(Planilha.cells[i,cFinValorDesconto]),',','.',[rfReplaceAll]); //null
      ValorPendente := StringReplace(Trim(Planilha.cells[i,cFinValorPendente]),',','.',[rfReplaceAll]);
      ValorPago := StringReplace(Trim(Planilha.cells[i,cFinValorPago]),',','.',[rfReplaceAll]); //null
      Quitado := Trim(Planilha.cells[i,cFinQuitado]);
      DataQuitado := StringReplace(Trim(Planilha.cells[i,cFinDataQuitado]),'/','.',[rfReplaceAll]);
      Obs := Trim(Planilha.cells[i,cFinObs]).ToUpper;
      ValorOriginal := StringReplace(Trim(Planilha.cells[i,cFinValorOriginal]),',','.',[rfReplaceAll]);
      Cancelado := Trim(Planilha.cells[i,cFinCancelado]);
      Sequencial := Trim(Planilha.cells[i,cFinSequencial]);

      if (Copy(Valor, 0, 1) <> '-') then // só lança valor positivo
      begin
        //ajustes
        if Quitado = '0' then ValorInsert := ValorPendente else ValorInsert := Valor;
        if ((ValorJuro = '0') or (ValorJuro = '\N')) then ValorJuro := 'NULL';
        if ((ValorDesconto = '0') or (ValorDesconto = '\N')) then ValorDesconto := 'NULL';
        if ValorPago = '0' then ValorPago := 'NULL';
        if ValorOriginal = '\N' then  ValorOriginal := ValorInsert;
        if Documento = '' then Documento := '1';
        
        if Cancelado = '1' then Cancelado := 'S' else Cancelado := 'N';
        if DataQuitado = '\N' then DataQuitado := 'NULL' else DataQuitado := QuotedStr(DataQuitado);

        ListBox1.Items.Add(Format(SQL,['1', QuotedStr('D'), Clifor, QuotedStr(Ordem), Documento, QuotedStr(Vencimento), ValorInsert, QuotedStr(Emissao), ValorJuro, ValorDesconto, ValorPago,
                                       DataQuitado, QuotedStr(Obs), ValorOriginal, QuotedStr(Cancelado), QuotedStr(Sequencial)]));
      end;
      if (I mod 20) = 0 then
        Application.ProcessMessages;
      Gauge1.AddProgress(1);


    end;
  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnContasAReceberClick(Sender: TObject);
var
  SQL : String;
  Clifor, Ordem, Documento, Vencimento, Emissao, Quitado, Obs, Cancelado, ValorDesconto, ValorOriginal, DataQuitado, ValorJuro, ValorPago, Valor, ValorPendente, ValorInsert, Sequencial : String;
  I : Integer;
begin
//'INSERT INTO FINANCEIRO (FILIAL, TIPO, CLIFOR, ORDEM, DOCUMENTO, DATAVCTO, VALOR, DATAEMISSAO, JURO, DESCONTO, VALORBAIXA, DATABAIXA, OBS, VALORORIGINAL, CANCELADO) ' +
  SQl := 'EXECUTE PROCEDURE CONVERSAO_FINANCEIRO(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
  ListBox1.Clear;
  ListBox1.PopupMenu := nil;
  try
    CarregarExcelContasAReceber;
    AjustaGauge(cInicioContasAReceber, cFimContasAReceber);
    for I := cInicioContasAReceber  to cFimContasAReceber do
    begin
      Clifor := Trim(Planilha.cells[i,cFinClifor]);
      Ordem := Trim(Planilha.cells[i,cFinOrdem]);
      Documento := Copy(Numericos(Trim(Planilha.cells[i,cFinOrdem])),0,6);
      Vencimento := StringReplace(Trim(Planilha.cells[i,cFinVencimento]),'/','.',[rfReplaceAll]);
      Valor := StringReplace(Trim(Planilha.cells[i,cFinValor]),',','.',[rfReplaceAll]);
      Emissao := StringReplace(Trim(Planilha.cells[i,cFinEmissao]),'/','.',[rfReplaceAll]);
      ValorJuro := StringReplace(Trim(Planilha.cells[i,cFinValorJuro]),',','.',[rfReplaceAll]); //null
      ValorDesconto := StringReplace(Trim(Planilha.cells[i,cFinValorDesconto]),',','.',[rfReplaceAll]); //null
      ValorPendente := StringReplace(Trim(Planilha.cells[i,cFinValorPendente]),',','.',[rfReplaceAll]);
      ValorPago := StringReplace(Trim(Planilha.cells[i,cFinValorPago]),',','.',[rfReplaceAll]); //null
      Quitado := Trim(Planilha.cells[i,cFinQuitado]);
      DataQuitado := StringReplace(Trim(Planilha.cells[i,cFinDataQuitado]),'/','.',[rfReplaceAll]);
      Obs := Trim(Planilha.cells[i,cFinObs]).ToUpper;
      ValorOriginal := StringReplace(Trim(Planilha.cells[i,cFinValorOriginal]),',','.',[rfReplaceAll]);
      Cancelado := Trim(Planilha.cells[i,cFinCancelado]);
      Sequencial := Trim(Planilha.cells[i,cFinSequencial]);

      if (Copy(Valor, 0, 1) <> '-') then // só lança valor positivo
      begin
        //ajustes
        if Quitado = '0' then ValorInsert := ValorPendente else ValorInsert := Valor;
        if ((ValorJuro = '0') or (ValorJuro = '\N')) then ValorJuro := 'NULL';
        if ((ValorDesconto = '0') or (ValorDesconto = '\N')) then ValorDesconto := 'NULL';
        if ValorPago = '0' then ValorPago := 'NULL';
        if ValorOriginal = '\N' then  ValorOriginal := ValorInsert;
        if Documento = '' then Documento := '1';

        if Cancelado = '1' then Cancelado := 'S' else Cancelado := 'N';
        if DataQuitado = '\N' then DataQuitado := 'NULL' else DataQuitado := QuotedStr(DataQuitado);

        ListBox1.Items.Add(Format(SQL,['1', QuotedStr('C'), Clifor, QuotedStr(Ordem), Documento, QuotedStr(Vencimento), ValorInsert, QuotedStr(Emissao), ValorJuro, ValorDesconto, ValorPago,
                                       DataQuitado, QuotedStr(Obs), ValorOriginal, QuotedStr(Cancelado), QuotedStr(Sequencial)]));
      end;
      Application.ProcessMessages;
      Gauge1.AddProgress(1);
    end;
    ListBox1.PopupMenu := PopupMenu1;
  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnEstoqueClick(Sender: TObject);
var
  SQL : String;
  CodigoProduto, EstoqueMinimo, ValorCusto, ValorVenda, DescontoMaximo, TipoItem : String;
  I : Integer;

begin
  SQl := 'UPDATE ESTOQUE SET ESTOQUEMINIMO = %s, VALORCUSTO = %s, VALORVENDA = %s, VALORCUSTOTABELA = %s, VALORMEDIO = %s, DESCONTOMAXIMO = %s, TIPOITEM = %s WHERE PRODUTO = %s;';
  ListBox1.Clear;
  try
    CarregarExcelProduto;
    AjustaGauge(cInicioProduto, cFimProduto);
    for I := cInicioProduto  to cFimProduto do
    begin
      CodigoProduto := Trim(Planilha.cells[i,cCodigoProduto]);
      EstoqueMinimo := Trim(Planilha.cells[i,cEstoqueMinimo]);
      ValorCusto := StringReplace(Trim(Planilha.cells[i,cValorCusto]),',','.',[rfReplaceAll]);
      ValorVenda := StringReplace(Trim(Planilha.cells[i,cValorVenda]),',','.',[rfReplaceAll]);
      DescontoMaximo := Trim(Planilha.cells[i,cDescontoMaximo]);
      TipoItem := Trim(Planilha.cells[i,cTipoItem]);

      //ajustes
      if ValorCusto = EmptyStr then ValorCusto := '0';
      if DescontoMaximo = EmptyStr then DescontoMaximo := '0';
      if EstoqueMinimo = EmptyStr then EstoqueMinimo := '0';
      if ValorVenda = EmptyStr then ValorVenda := '0';
      
      
      if TipoItem = 'Material Uso e Consumo' then
        TipoItem := '7'
      else
        TipoItem := '0';


      ListBox1.Items.Add(Format(SQL, [EstoqueMinimo, ValorCusto, ValorVenda, ValorCusto, ValorCusto, DescontoMaximo, TipoItem, CodigoProduto]));

      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnRotaClick(Sender: TObject);
var
  SQL, SQLPronto, NomeRota, Vendedor : String;
  I, X : Integer;
  achei : boolean;
begin
  SQl := 'INSERT INTO ROTA (CODIGO, NOME, FUNCIONARIO) VALUES ((SELECT MAX(CODIGO) +1 FROM ROTA), %s, %s);';
  ListBox1.Clear;
  AjustaGauge(cInicioCliente, cFimCliente);
  try
    CarregarExcelCliente;
    for I := CInicioCliente  to cFimCliente do
    begin
     // NomeRota := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cNomeRota]));
     // Vendedor := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cCodigoVendedor]));
      if ((Vendedor = EmptyStr) and (NomeRota <> EmptyStr)) then
        raise Exception.Create('Erro Rota Linha'+IntToStr(I));


      SQLPronto := Format(SQL,[QuotedStr(NomeRota), Vendedor]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if not achei then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnTipoProdutoClick(Sender: TObject);
var
  SQL, SQLPronto, Codigo, Nome : String;
  I, X : Integer;
  achei : boolean;
begin
  SQl := 'INSERT INTO TIPOPRODUTO (CODIGO, NOME, TIPO) VALUES (%s, %s, %s);';
  ListBox1.Clear;
  try
    CarregarExcelProduto;
    AjustaGauge(cInicioProduto, cFimProduto);
    for I := cInicioProduto  to cFimProduto do
    begin
      Codigo := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cCodigoTipoProduto]));
      Nome := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cNomeTipoProduto]));

      SQLPronto := Format(SQL,[Codigo, QuotedStr(Nome), QuotedStr('O')]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if ((not achei) and (Nome <> EmptyStr)) then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnUnidadeMedidaClick(Sender: TObject);
var
  SQL, SQLPronto, Sigla, Nome : String;
  I, X : Integer;
  achei : boolean;
begin
  SQl := 'INSERT INTO UNIDADEMEDIDA (CODIGO, NOME) VALUES (%s, %s);';
  ListBox1.Clear;
  AjustaGauge(cInicioProduto, (cFimProduto*2));
  try
    CarregarExcelProduto;
    //UNVENDA
    for I := cInicioProduto  to cFimProduto do
    begin
      Sigla := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cUnVenda]));
      Nome := Sigla;

      SQLPronto := Format(SQL,[QuotedStr(Sigla), QuotedStr(Nome)]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if not achei then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

    //UNCOMPRA
    for I := cInicioProduto  to cFimProduto do
    begin
      Sigla := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cUnCompra]));
      Nome := Sigla;

      SQLPronto := Format(SQL,[QuotedStr(Sigla), QuotedStr(Nome)]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if not achei then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.btnCidadeClick(Sender: TObject);
var
  SQL, SQLPronto, NomeCidade, UF, CodigoFiscal : String;
  I, X : Integer;
  achei : boolean;
begin
  SQl := 'INSERT INTO CIDADE (CODIGO, NOME, CODIGOFISCAL, ESTADO) VALUES ((SELECT MAX(CODIGO) +1 FROM CIDADE), %s, %s, (SELECT CODIGO FROM ESTADO WHERE UF = %s));';
  ListBox1.Clear;
  AjustaGauge(cInicioCliente, cFimCliente);
  try
    CarregarExcelCliente;
    for I := CInicioCliente  to cFimCliente do
    begin
      NomeCidade := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cCidade]));
     // UF := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cUF]));
     // CodigoFiscal := TratarCaracteresEspeciais(Trim(Planilha.cells[i,cCodigoFiscalCidade]));

      SQLPronto := Format(SQL,[QuotedStr(NomeCidade), QuotedStr(CodigoFiscal), QuotedStr(UF)]);
      achei := False;
      for X := 0 to ListBox1.Count -1 do
      begin
        if SQLPronto = ListBox1.Items.Strings[X] then
        begin
          achei := True;
          Break;
        end;
      end;
      if not achei then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.CarregarExcelCliente;
begin
  Excel := CreateOleObject('Excel.Application');
  //Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Bacat\CLIENTE E FORNECEDOR - 01032018.xlsx');
  //Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\ConversaoDinho\Clientes, tabulado.xlsx');
  Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Lumar\lumar.xlsx');
  Planilha := Excel.WorkSheets[1];
end;

procedure TForm1.CarregarExcelContasAPagar;
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Bacat\contasapagar 20180410.xlsx');
  Planilha := Excel.WorkSheets[1];
end;

procedure TForm1.CarregarExcelContasAReceber;
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Bacat\contasareceber 20180410.xlsx');
  Planilha := Excel.WorkSheets[1];
end;

procedure TForm1.CarregarExcelProduto;
begin
  Excel := CreateOleObject('Excel.Application');
  //Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Bacat\PRODUTO - 01032018.xlsx');
  Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Bacat\Novo\produtos 27 04 2018.xlsx');
  Planilha := Excel.WorkSheets[1];
end;

function TForm1.MascaraCnpj(cnpj: string): String;
begin
//  Result := TPessoa.GetCNPJ(cnpj);
     cnpj:= Numericos(cnpj);
     Cnpj := AjustaDireita(Cnpj, 14, '0');
     Result := cnpj[1]+cnpj[2]+'.'+cnpj[3]+cnpj[4]+cnpj[5]+'.'+cnpj[6]+cnpj[7]+cnpj[8]+'/'+cnpj[9]+cnpj[10]+cnpj[11]+cnpj[12]+'-'+cnpj[13]+cnpj[14];
end;

function TForm1.MascaraCnpjCpf(Value: string): String;
begin
  if Length(Numericos(Value)) = 14 then
    Result := MascaraCnpj(Numericos(Value))
  else if Length(Numericos(Value)) = 11 then
    Result := MascaraCPF(Numericos(Value))
  else
    raise Exception.Create('CNPJ Invalido ' + Value);
end;

function TForm1.MascaraCpf(cpf: string): String;
begin
//  Result := TPessoa.GetCPF(cpf);
     cpf := Numericos(cpf);
     Cpf := AjustaDireita(Cpf, 11, '0');
     Result := cpf[1]+cpf[2]+cpf[3]+'.'+cpf[4]+cpf[5]+cpf[6]+'.'+cpf[7]+cpf[8]+cpf[9]+'-'+cpf[10]+cpf[11];
end;

function TForm1.Numericos(st: string): string;
const
     Nums = ['0'..'9'];
var
   i: integer;
   r: String;
begin
     r:= '';
     If length(st) > 0 then
        For i := 0 to length(st) do
            if st[i] in Nums then r := r + st[i];
     result := r;
end;

procedure TForm1.salvarClick(Sender: TObject);
begin
  if SaveTextFileDialog1.Execute then
    ListBox1.Items.SaveToFile(SaveTextFileDialog1.FileName);
end;

function TForm1.TratarCaracteresEspeciais(st: string): string;
const
     A = ['Á','À','Ä','Â','Ã'];
     E = ['É','È','Ë','Ê'];
     I = ['Í','Ì','Ï','Î'];
     O = ['Ó','Ò','Ö','Ô','Õ'];
     U = ['Ú','Ù','Ü','Û'];
     Am = ['á','à','ä','â','ã'];
     Em = ['é','è','ë','ê'];
     Im = ['í','ì','ï','î'];
     Om = ['ó','ò','ö','ô','õ'];
     Um = ['ú','ù','ü','û'];
var
   j : integer;
   r : String;
begin
     r:= '';
     If length(st) > 0 then
        For j := 1 to length(st) do begin
            //Caracteres Especiais
            if st[j] = #$A then r := r + ' ' else
            if st[j] = #$D then r := r + ' ' else
            if st[j] = 'º' then r := r + 'o' else
            if st[j] = '°' then r := r + 'o' else
            if st[j] = 'ª' then r := r + 'a' else
            if st[j] = '/' then r := r + '-' else
            if st[j] = '<' then r := r + '&lt;' else
            if st[j] = '>' then r := r + '&gt;' else
            if st[j] = '&' then r := r + 'E' else
            if st[j] = '"' then r := r + '&quot;' else
            if st[j] = '''' then r := r + '' else
            if st[j] = 'Ý' then r := r + 'Y' else
            if st[j] = 'ý' then r := r + 'y' else
            if st[j] = 'ÿ' then r := r + 'y' else
            if st[j] = 'Ñ' then r := r + 'N' else
            if st[j] = 'ñ' then r := r + 'n' else
            if st[j] = 'Ç' then r := r + 'C' else
            if st[j] = 'ç' then r := r + 'c' else
            if st[j] = '¿' then r := r + ' ' else
            if st[j] = 'µ' then r := r + 'u' else
            if st[j] = '´' then r := r + '&#39;' else
            if st[j] = '*' then r := r + '' else
            //Tratar Acentuação
            if st[j] in A then r := r + 'A' else
            if st[j] in E then r := r + 'E' else
            if st[j] in I then r := r + 'I' else
            if st[j] in O then r := r + 'O' else
            if st[j] in U then r := r + 'U' else
            if st[j] in Am then r := r + 'a' else
            if st[j] in Em then r := r + 'e' else
            if st[j] in Im then r := r + 'i' else
            if st[j] in Om then r := r + 'o' else
            if st[j] in Um then r := r + 'u' else
               r := r + st[j];
        end;
     result := r;
end;

function TForm1.VerificaCnpj(cnpj: string): boolean;
var
   n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,d1,d2: integer;
   digitado, calculado: string;
begin
  //Result := TPessoa.VerificaCnpj(cnpj);
     cnpj:= Numericos(cnpj);
     if Length(cnpj) = 14 then begin
        n1 := StrToInt(cnpj[1]);
        n2 := StrToInt(cnpj[2]);
        n3 := StrToInt(cnpj[3]);
        n4 := StrToInt(cnpj[4]);
        n5 := StrToInt(cnpj[5]);
        n6 := StrToInt(cnpj[6]);
        n7 := StrToInt(cnpj[7]);
        n8 := StrToInt(cnpj[8]);
        n9 := StrToInt(cnpj[9]);
        n10 := StrToInt(cnpj[10]);
        n11 := StrToInt(cnpj[11]);
        n12 := StrToInt(cnpj[12]);
        d1 := n12*2 + n11*3 + n10*4 + n9*5 + n8*6 + n7*7 + n6*8 + n5*9 + n4*2 + n3*3 + n2*4 + n1*5;
        d1 := 11 - (d1 mod 11);
        if d1 >= 10 then d1 := 0;
        d2 := d1*2 + n12*3 + n11*4 + n10*5 + n9*6 + n8*7 + n7*8 + n6*9 + n5*2 + n4*3 + n3*4 + n2*5 + n1*6;
        d2 := 11 - (d2 mod 11);
        if d2 >= 10 then d2 := 0;
        calculado := IntToStr(d1) + IntToStr(d2);
        digitado := cnpj[13] + cnpj[14];
        Result := calculado = digitado;
     end else result := false;
end;

end.
