unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.StrUtils,
  Vcl.Samples.Gauges, Vcl.Menus, Vcl.ExtDlgs, ComObj;

type
  TfrmPrincipal = class(TForm)
    btnConverter: TButton;
    Gauge1: TGauge;
    PopupMenu1: TPopupMenu;
    Salvar1: TMenuItem;
    SaveTextFileDialog1: TSaveTextFileDialog;
    btnConverter1: TButton;
    btnCidade: TButton;
    ListBox1: TListBox;
    btnBairro: TButton;
    btnTipoEstabelecimento: TButton;
    btnRota: TButton;
    btnVendedor: TButton;
    btntabela: TButton;
    btnProduto: TButton;
    btnProdutosTxt: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure btnConverterClick(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure btnConverter1Click(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
    procedure btnBairroClick(Sender: TObject);
    procedure btnTipoEstabelecimentoClick(Sender: TObject);
    procedure btnRotaClick(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure btntabelaClick(Sender: TObject);
    function RemoveEspaco(str : String) : String;
    function RemoveAspas(str : String) : String;
    function validaNCM(ncm : String) : String;
    procedure btnProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Excel, Planilha : OleVariant;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnBairroClick(Sender: TObject);
var
  arq : TStringList;
  I, X : Integer;
  Bairro, SQL, SQLPronto : String;
  achei : Boolean;
begin
  SQL := 'INSERT INTO BAIRRO (CODIGO, NOME) VALUES ((SELECT MAX(CODIGO)+1 FROM BAIRRO), %s);';
  ListBox1.Clear;
  arq := TStringList.Create;
  try
    arq.LoadFromFile('E:\Conversao\arquivoClientes.txt');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    for I := 1 to arq.Count -2 do
    begin

      Bairro := Trim(Copy(arq.Strings[I], 117, 20));
      SQLPronto := Format(SQL,[QuotedStr(Bairro)]);
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
    FreeAndNil(arq);
  end;
end;

procedure TfrmPrincipal.btnCidadeClick(Sender: TObject);
var
  arq : TStringList;
  I, X : Integer;
  Cidade, Estado, SQL, SQLPronto : String;
  achei : Boolean;
begin
  SQL := 'INSERT INTO CIDADE (NOME, ESTADO) VALUES (%s, (SELECT CODIGO FROM ESTADO WHERE UF = %s));';
  ListBox1.Clear;
  arq := TStringList.Create;
  try
    arq.LoadFromFile('E:\Conversao\arquivoClientes.txt');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    for I := 1 to arq.Count -2 do
    begin

      Cidade := Trim(Copy(arq.Strings[I], 167, 27));
      Estado := Copy(arq.Strings[I], 195, 2);
      SQLPronto := Format(SQL,[QuotedStr(Cidade), QuotedStr(Estado)]);
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
    FreeAndNil(arq);
  end;
end;

procedure TfrmPrincipal.btnConverter1Click(Sender: TObject);
var
  arq : TStringList;
  I : Integer;
  SQLClifor, SQLCliforContato, SQLCliforTabelaPreco, SQLFuncionarioClifor : String;
  Codigo, Razao, TipoEstabelecimento, Endereco, Numero, Bairro, Cep, Cidade, Comprador, Telefone, Telefone1, Telefone2, Cnpj, IE, Vendedor, Fantasia, TabelaPreco : String;
begin
  ListBox1.Clear;
  arq := TStringList.Create;
  SQLClifor := 'INSERT INTO CLIFOR (CODIGO, NOME, TIPOESTABELECIMENTO, ENDERECO, NUMERO, BAIRRO, CEP, CIDADE, CNPJ, IE, FANTASIA)'
             + ' VALUES (%s, %s, (SELECT CODIGO FROM TIPOESTABELECIMENTO WHERE NOME = %s), %s, %s, (SELECT CODIGO FROM BAIRRO WHERE NOME = %s), %s, (SELECT CODIGO FROM CIDADE WHERE NOME = %s), %s, %s, %s);';
  SQLCliforContato := 'INSERT INTO CLIFORCONTATO (CLIFOR, NUMERO, NOME, ENVIARDANFE, ENVIARNFE, ENVIARBOLETO, ENVIARPEDIDO)'
                    + ' VALUES (%s, %s, %s, %s, %s, %s, %s);';
  SQLCliforTabelaPreco := 'INSERT INTO CLIFORTABELAPRECO (CLIFOR, TABELAPRECO, PADRAO) VALUES (%s, %s, %s);';
  SQLFuncionarioClifor := 'INSERT INTO FUNCIONARIOCLIFOR (CLIFOR, FUNCIONARIO) VALUES (%s, %s);';
  try
    arq.LoadFromFile('E:\Conversao\arquivoClientes.txt');
    Gauge1.Progress := 1;
    Gauge1.MaxValue := arq.Count -2;
    for I := 1 to arq.Count - 2 do
    begin
      Codigo := Trim(Copy(arq.Strings[I], 0, 10));
      Razao := Trim(Copy(arq.Strings[I], 10, 32));
      TipoEstabelecimento := Trim(Copy(arq.Strings[I], 42, 32));
      Endereco := Trim(Copy(arq.Strings[I], 85, 25));
      Numero := Trim(Copy(arq.Strings[I], 110, 7));
      Bairro := Trim(Copy(arq.Strings[I], 117, 20));
      Cep := Trim(Copy(arq.Strings[I], 138, 8));
      Cidade := Trim(Copy(arq.Strings[I], 167, 27));
      Comprador := Trim(Copy(arq.Strings[I], 199, 17));
      Telefone1 := Trim(Copy(arq.Strings[I], 216, 7));
      Telefone2 := Trim(Copy(arq.Strings[I], 223, 8));
      Telefone := Telefone1 + Telefone2;
      Telefone := RemoveEspaco(telefone);
      //Telefone := Trim(Copy(arq.Strings[I], 216, 6)) + Trim(Copy(arq.Strings[I], 223, 8));
      Cnpj := Trim(Copy(arq.Strings[I], 246, 21));
      IE := Trim(Copy(arq.Strings[I], 267, 22));
      Vendedor := Trim(Copy(arq.Strings[I], 289, 4));
      Fantasia := Trim(Copy(arq.Strings[I], 327, 30));
      TabelaPreco := Trim(Copy(arq.Strings[I], 362, 3));
      ListBox1.Items.Add(Format(SQLClifor, [Codigo, QuotedStr(Razao), QuotedStr(TipoEstabelecimento.ToUpper), QuotedStr(Endereco), QuotedStr(Numero), QuotedStr(Bairro),
                         QuotedStr(Cep), QuotedStr(Cidade), QuotedStr(Cnpj), QuotedStr(IE), QuotedStr(Fantasia)]));
      if ((Telefone <> '0000000') and (Telefone <> '47 0000000'))  then
        ListBox1.Items.Add(Format(SQLCliforContato, [Codigo, QuotedStr(Telefone), QuotedStr(Comprador),
                          QuotedStr('N'), QuotedStr('N'), QuotedStr('N'), QuotedStr('N')]));

      if TabelaPreco <> EmptyStr then
        ListBox1.Items.Add(Format(SQLCliforTabelaPreco, [Codigo, TabelaPreco, QuotedStr('S')]));

      if Vendedor <> EmptyStr then
        ListBox1.Items.Add(Format(SQLFuncionarioClifor, [Codigo, Vendedor]));
      Gauge1.AddProgress(1);
    end;

  finally
    FreeAndNil(arq);
  end;
end;

procedure TfrmPrincipal.btnConverterClick(Sender: TObject);
const
  arrayNum : array[0..9] of string = ('0','1','2','3','4','5','6','7','8','9');
var
  arq : TStringList;
  linha : String;
  I: Integer;
begin
  ListBox1.Clear;
  arq := TStringList.Create;

  try
    arq.LoadFromFile('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\BoaMesa\CLIENTES ATIVOS BOA MESA.TXT');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    ListBox1.Items.Add(arq.Strings[3] + arq.Strings[4] + arq.Strings[5] + arq.Strings[6]);
    for I := 0 to arq.Count - 1 do
    begin
      if MatchStr(Copy(arq.Strings[I], 9, 1), arrayNum) then
      begin
        Linha := arq.Strings[I] + arq.Strings[I+1] + arq.Strings[I+2] + arq.Strings[I+3] + arq.Strings[I+4];
        ListBox1.Items.Add(Linha);
      end;
      Gauge1.AddProgress(1);
    end;
  finally
    FreeAndNil(arq);
  end;



end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
var
  I: Integer;
  Codigo, Nome, Grupo, NCM, Barras, SQL : String;
begin
  SQL := 'INSERT INTO PRODUTO (CODIGO, NOME, GRUPO, CODIGONCM, BARRAS) VALUES (%s, %s, (SELECT CODIGO FROM GRUPO WHERE NOME = %s), %s, %s);';
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\BoaMesa\Listagem de Produtos 02.xlsx');
  Planilha := Excel.WorkSheets[1];
  ListBox1.Clear;
  gauge1.Progress := 5;
  gauge1.MaxValue := 570;
  try
    for I := 5  to 570 do
    begin
      Codigo := Trim((Planilha.cells[i,1]));
      Nome := Trim((Planilha.cells[i,2]));
      Grupo := Trim((Planilha.cells[i,3]));
      NCM := Trim((Planilha.cells[i,31]));
      ncm := validaNcm(NCM);
      Barras := Trim((Planilha.cells[i,39]));
      if Barras = '0' then Barras := Codigo;
      
      ListBox1.Items.Add(Format(SQL,[Codigo, QuotedStr(nome), QuotedStr(Grupo), QuotedStr(NCM), QuotedStr(Barras)]));
      Gauge1.AddProgress(1);
    end;
  finally
    Excel.Quit;
  end;

end;

procedure TfrmPrincipal.btnRotaClick(Sender: TObject);
var
  arq : TStringList;
  I, X : Integer;
  Rota, Vendedor, SQL, SQLPronto : String;
  achei : Boolean;
begin
  SQL := 'INSERT INTO ROTA (CODIGO, NOME, FUNCIONARIO) VALUES (%s, %s, %s);';
  ListBox1.Clear;
  arq := TStringList.Create;
  try
    arq.LoadFromFile('E:\Conversao\arquivoClientes.txt');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    for I := 1 to arq.Count -2 do
    begin

      Rota := Trim(Copy(arq.Strings[I], 293, 9));
      Vendedor := Trim(Copy(arq.Strings[I], 289, 4));
      SQLPronto := Format(SQL,[Rota, QuotedStr(Rota), Vendedor]);
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
    FreeAndNil(arq);
  end;
end;

procedure TfrmPrincipal.btntabelaClick(Sender: TObject);
var
  arq : TStringList;
  I, X : Integer;
  Tabela, SQL, SQLPronto : String;
  achei : Boolean;
begin
  SQL := 'INSERT INTO TABELAPRECO (CODIGO, NOME) VALUES (%s, %s);';
  ListBox1.Clear;
  arq := TStringList.Create;
  try
    arq.LoadFromFile('E:\Conversao\arquivoClientes.txt');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    for I := 1 to arq.Count -2 do
    begin

      Tabela := Trim(Copy(arq.Strings[I], 357, 20));
      SQLPronto := Format(SQL,[Tabela, QuotedStr(Tabela.ToUpper)]);
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
    FreeAndNil(arq);
  end;
end;

procedure TfrmPrincipal.btnTipoEstabelecimentoClick(Sender: TObject);
var
  arq : TStringList;
  I, X : Integer;
  TipoEstabelecimento, SQL, SQLPronto : String;
  achei : Boolean;
begin
  SQL := 'INSERT INTO TIPOESTABELECIMENTO (CODIGO, NOME) VALUES ((SELECT MAX(CODIGO)+1 FROM TIPOESTABELECIMENTO), %s);';
  ListBox1.Clear;
  arq := TStringList.Create;
  try
    arq.LoadFromFile('E:\Conversao\arquivoClientes.txt');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    for I := 1 to arq.Count -2 do
    begin

      TipoEstabelecimento := Trim(Copy(arq.Strings[I], 42, 32));
      SQLPronto := Format(SQL,[QuotedStr(TipoEstabelecimento.ToUpper)]);
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
    FreeAndNil(arq);
  end;
end;

procedure TfrmPrincipal.btnVendedorClick(Sender: TObject);
var
  arq : TStringList;
  I, X : Integer;
  Vendedor, SQL, SQLPronto : String;
  achei : Boolean;
begin
  SQL := 'INSERT INTO FUNCIONARIO (CODIGO, NOME) VALUES (%s, %s);';
  ListBox1.Clear;
  arq := TStringList.Create;
  try
    arq.LoadFromFile('E:\Conversao\arquivoClientes.txt');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    for I := 1 to arq.Count -2 do
    begin

      Vendedor := Trim(Copy(arq.Strings[I], 289, 4));
      SQLPronto := Format(SQL,[Vendedor, QuotedStr(Vendedor)]);
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
    FreeAndNil(arq);
  end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
const
  arrayNum : array[0..9] of string = ('0','1','2','3','4','5','6','7','8','9');
var
  arq : TStringList;
  linha : String;
  I: Integer;
begin
  ListBox1.Clear;
  arq := TStringList.Create;

  try
    arq.LoadFromFile('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\BoaMesa\Listagem de Produtos 01.TXT');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    ListBox1.Items.Add(arq.Strings[4]);
    for I := 0 to arq.Count - 1 do
    begin
      if MatchStr(Copy(arq.Strings[I], 10, 1), arrayNum) then
      begin
        Linha := arq.Strings[I];
        ListBox1.Items.Add(Linha);
      end;
      Gauge1.AddProgress(1);
    end;
  finally
    FreeAndNil(arq);
  end;



end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  arq : TStringList;
  I, X : Integer;
  CodigoFornecedor, NomeFornecedor, SQL, SQLPronto : String;
  achei : Boolean;
begin
  SQL := 'INSERT INTO CLIFOR (CODIGO, NOME, TIPO) VALUES (%s, %s, 2);';
  ListBox1.Clear;
  arq := TStringList.Create;
  try
    arq.LoadFromFile('E:\Conversao\produtosajustados.txt');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    for I := 1 to arq.Count -2 do
    begin

      CodigoFornecedor := Trim(Copy(arq.Strings[I], 62, 4));
      CodigoFornecedor := '1000' + CodigoFornecedor;
      NomeFornecedor := Trim(Copy(arq.Strings[I], 66, 32));
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
      if not achei then
        ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;
  finally
    FreeAndNil(arq);
  end;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
var
  arq : TStringList;
  I : Integer;
  CodigoProduto, UnCompra, CodNoFornecedor, CodFornecedor, QtdeCompra, SQL, SQLPronto : String;
begin
  SQL := 'UPDATE PRODUTO SET UNCOMPRA = %s, QTDECOMPRA = %s, CODIGOFORNECEDOR = %s, CLIFOR = %s WHERE PRODUTO.CODIGO = %s;';
  ListBox1.Clear;
  arq := TStringList.Create;
  try
    arq.LoadFromFile('E:\Conversao\produtosajustados.txt');
    Gauge1.Progress := 0;
    Gauge1.MaxValue := arq.Count;
    for I := 1 to arq.Count -1 do
    begin
      CodigoProduto := Trim(Copy(arq.Strings[I], 5, 7));
      UnCompra := Trim(Copy(arq.Strings[I], 43, 2));
      QtdeCompra := Trim(Copy(arq.Strings[I], 126, 7));
      QtdeCompra := StringReplace(QtdeCompra, ',','.',[rfReplaceAll]);
      CodNoFornecedor := Trim(Copy(arq.Strings[I], 102, 24));
      CodFornecedor := Trim(Copy(arq.Strings[I], 60, 6));
      CodFornecedor := '1000' + CodFornecedor;
      SQLPronto := Format(SQL,[QuotedStr(UnCompra), QtdeCompra, QuotedStr(CodNoFornecedor), CodFornecedor, CodigoProduto]);

      ListBox1.Items.Add(SQLPronto);
      Gauge1.AddProgress(1);
    end;
  finally
    FreeAndNil(arq);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Excel.Quit;
end;

function TfrmPrincipal.RemoveAspas(str: String): String;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(str) do
  begin
    if str[I] <> '''' then
      Result := Result + Str[I];
  end;
end;

function TfrmPrincipal.RemoveEspaco(str: String): String;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(str) do
  begin
    if str[I] <> ' ' then
      Result := Result + Str[I];
  end;
end;

procedure TfrmPrincipal.Salvar1Click(Sender: TObject);
begin
  if SaveTextFileDialog1.Execute then
    ListBox1.Items.SaveToFile(SaveTextFileDialog1.FileName);

end;

function TfrmPrincipal.validaNCM(ncm: String): String;

begin
  Result := ncm;
  if Length(ncm) = 7 then
    Result := '0' + ncm;

end;

end.
