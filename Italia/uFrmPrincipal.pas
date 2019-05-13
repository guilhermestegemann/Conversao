unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.Samples.Gauges;

type
  TFrmPrincipal = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    DBGrid1: TDBGrid;
    BtnConectar: TButton;
    BtnDesconectar: TButton;
    ListBox1: TListBox;
    SaveTextFileDialog1: TSaveTextFileDialog;
    BtnSalvar: TButton;
    Gauge1: TGauge;
    BtnCliFor: TButton;
    BtnRota: TButton;
    BtnFornecedor: TButton;
    BtnProduto: TButton;
    BtnConsumo: TButton;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    procedure BtnConectarClick(Sender: TObject);
    procedure BtnDesconectarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCliForClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnRotaClick(Sender: TObject);
    procedure BtnFornecedorClick(Sender: TObject);
    procedure BtnProdutoClick(Sender: TObject);
    procedure BtnConsumoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
      procedure ConectarDB;
      procedure DesconectarDB;
      procedure AjustaBotoesConexao;
      procedure SalvarArquivo;
      procedure AjustaGauge;
      procedure AbreQuery;
  public
    { Public declarations }
  end;

const
  cNull : String = 'NULL';
  cNao   : String = '''N''';
  cSim  : String = '''S''';

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UFerramentas;

{$R *.dfm}

procedure TFrmPrincipal.AbreQuery;
begin
  FDQuery1.Open();
  FDQuery1.Last;
  FDQuery1.First;
end;

procedure TFrmPrincipal.AjustaBotoesConexao;
begin
  BtnConectar.Enabled := not FDConnection1.Connected;
  BtnDesconectar.Enabled := FDConnection1.Connected;
end;

procedure TFrmPrincipal.AjustaGauge;
begin
  Gauge1.Progress := 0;
  Gauge1.MaxValue := FDQuery1.RecordCount;
end;

procedure TFrmPrincipal.BtnCliForClick(Sender: TObject);
var
  Codigo : Integer;
  Nome, Fantasia, Prazo, FormaPagamento, Endereco, Bairro, Cidade, UF,
  CEP, CNPJ, IE, Telefone, Contato, Vendedor, EnderecoCobranca, Rota, Numero,
  Email, Complemento, Obs, Simples, SQLInsert : String;
begin
  SQLInsert := 'EXECUTE PROCEDURE SET_CLIFOR_CONV(%d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from cliente');
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;

  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('cod').AsInteger;
    Nome := FDQuery1.FieldByName('nome').AsString;
    Fantasia := FDQuery1.FieldByName('fantasia').AsString;
    Prazo := FDQuery1.FieldByName('prazo').AsString;
    FormaPagamento := FDQuery1.FieldByName('formpaga').AsString;
    Endereco := FDQuery1.FieldByName('endereço').AsString;
    Bairro := FDQuery1.FieldByName('bairro').AsString;
    Cidade := FDQuery1.FieldByName('cidade').AsString;
    UF := AnsiUpperCase(FDQuery1.FieldByName('UF').AsString);
    CEP := Numericos(FDQuery1.FieldByName('CEP').AsString);
    CNPJ := Numericos(FDQuery1.FieldByName('CNPJ').AsString);
    IE := Numericos(FDQuery1.FieldByName('Inscr_Est').AsString);
    Telefone := Numericos(FDQuery1.FieldByName('Telefone').AsString);
    Contato := FDQuery1.FieldByName('Contato').AsString;
    Vendedor := FDQuery1.FieldByName('Representante').AsString;
    EnderecoCobranca := FDQuery1.FieldByName('End_cobrança').AsString;
    Rota := FDQuery1.FieldByName('Rota').AsString;
    Numero := FDQuery1.FieldByName('numero').AsString;
    Email := FDQuery1.FieldByName('email').AsString;
    Complemento := FDQuery1.FieldByName('complemento_entrega').AsString;
    Simples := AnsiUpperCase(FDQuery1.FieldByName('simples').AsString);
    Obs := FDQuery1.FieldByName('obs').AsString;


    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), QuotedStr(Fantasia), Prazo, QuotedStr(FormaPagamento), QuotedStr(Endereco), QuotedStr(Bairro),
                       QuotedStr(Cidade), QuotedStr(UF), QuotedStr(CEP), QuotedStr(CNPJ), QuotedStr(IE), QuotedStr(Telefone), QuotedStr(Contato), QuotedStr(Vendedor),
                       QuotedStr(EnderecoCobranca), Rota, QuotedStr(Numero), QuotedStr(Email), QuotedStr(Complemento), QuotedStr(Simples), QuotedStr(Obs)]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
end;

procedure TFrmPrincipal.BtnConectarClick(Sender: TObject);
begin
  ConectarDB;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.BtnConsumoClick(Sender: TObject);
var
  Documento, Produto, Unitario, Qtde, Clifor, Data, Rota, FormaPagamento, CondicaoPagamento, SQLInsert : String;
begin
  SQLInsert := 'EXECUTE PROCEDURE SET_CONSUMO_CONV(%s, %s, %s, %s, %s, %s, %s, %s, %s);';
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(' select ');
  FDQuery1.SQL.Add(' ip.codpedido as documento, ');
  FDQuery1.SQL.Add(' ip.codproduto as produto, ');
  FDQuery1.SQL.Add(' ip.valorproduto as unitario, ');
  FDQuery1.SQL.Add(' ip.quantproduto as qtde, ');
  FDQuery1.SQL.Add(' ip.codcliente as clifor, ');
  FDQuery1.SQL.Add(' cast(ip.data as date) as data, ');
  FDQuery1.SQL.Add(' ip.rota as rota, ');
  FDQuery1.SQL.Add(' p.formadepagamento as formapagamento, ');
  FDQuery1.SQL.Add(' p.prazo as condicaopagamento ');
  FDQuery1.SQL.Add(' from pedidoproduto1 ip ');
  FDQuery1.SQL.Add(' inner join pedidocliente1 p on p.codpedido = ip.codpedido ');
  FDQuery1.SQL.Add(' where p.formadepagamento <> ''REMESSA'' ');
  FDQuery1.SQL.Add(' and ip.data between ''2019-04-01'' and ''2019-04-30'' ');
  FDQuery1.SQL.Add(' and ip.quantproduto > 0 ');
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  DataSource1.Enabled := False;
  while not FDQuery1.Eof do
  begin
    Documento := FDQuery1.FieldByName('documento').AsString;
    Produto := FDQuery1.FieldByName('produto').AsString;
    Unitario := StringReplace(FDQuery1.FieldByName('unitario').AsString,',','.',[rfReplaceAll]);
    Qtde := StringReplace(FDQuery1.FieldByName('qtde').AsString,',','.',[rfReplaceAll]);
    Clifor := FDQuery1.FieldByName('clifor').AsString;
    Data := AjustaData(FDQuery1.FieldByName('data').AsString);
    Rota := FDQuery1.FieldByName('rota').AsString;
    FormaPagamento := FDQuery1.FieldByName('formapagamento').AsString;
    CondicaoPagamento := FDQuery1.FieldByName('condicaopagamento').AsString;

    ListBox1.Items.Add(Format(SQLInsert,[Documento, QuotedStr(Produto), Unitario, Qtde, Clifor, Data, Rota, QuotedStr(FormaPagamento), CondicaoPagamento]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
    Application.ProcessMessages;
  end;
  DataSource1.Enabled := True;
end;


procedure TFrmPrincipal.BtnDesconectarClick(Sender: TObject);
begin
  DesconectarDB;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.BtnFornecedorClick(Sender: TObject);
var
  Codigo : Integer;
  Nome, Fantasia, Prazo, FormaPagamento, Endereco, Bairro, Cidade, UF,
  CEP, CNPJ, IE, Telefone, Contato, Vendedor, Numero,
  Email, Complemento, SQLInsert : String;
begin
  SQLInsert := 'EXECUTE PROCEDURE SET_FORNECEDOR_CONV(%d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from fornecedores');
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;

  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('cod').AsInteger;
    Nome := FDQuery1.FieldByName('nome').AsString;
    Fantasia := FDQuery1.FieldByName('fantasia').AsString;
    Prazo := FDQuery1.FieldByName('prazo').AsString;
    FormaPagamento := FDQuery1.FieldByName('formpaga').AsString;
    Endereco := FDQuery1.FieldByName('endereço').AsString;
    Bairro := FDQuery1.FieldByName('bairro').AsString;
    Cidade := FDQuery1.FieldByName('cidade').AsString;
    UF := AnsiUpperCase(FDQuery1.FieldByName('UF').AsString);
    CEP := Numericos(FDQuery1.FieldByName('CEP').AsString);
    CNPJ := Numericos(FDQuery1.FieldByName('CNPJ').AsString);
    IE := Numericos(FDQuery1.FieldByName('Inscr_Est').AsString);
    Telefone := Numericos(FDQuery1.FieldByName('Telefone').AsString);
    Contato := FDQuery1.FieldByName('Contato').AsString;
    Vendedor := FDQuery1.FieldByName('Representante').AsString;
    Numero := FDQuery1.FieldByName('numero').AsString;
    Email := FDQuery1.FieldByName('email').AsString;
    Complemento := FDQuery1.FieldByName('complemento_entrega').AsString;

    Codigo := StrToInt('1000'+IntToStr(Codigo));
    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), QuotedStr(Fantasia), Prazo, QuotedStr(FormaPagamento), QuotedStr(Endereco), QuotedStr(Bairro),
                       QuotedStr(Cidade), QuotedStr(UF), QuotedStr(CEP), QuotedStr(CNPJ), QuotedStr(IE), QuotedStr(Telefone), QuotedStr(Contato), QuotedStr(Vendedor),
                       cNull, cNull, QuotedStr(Numero), QuotedStr(Email), QuotedStr(Complemento), cNao, cNull]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
end;

procedure TFrmPrincipal.BtnProdutoClick(Sender: TObject);
var
  Codigo, QtdeCompra : Integer;
  Referencia, Nome, UnMedida, Grupo, CodigoNCM, Fornecedor, Venda, SQLInsert, Barras : String;
  Comissao, Peso, DescontoMaximo, EstoqueAtual : String;
begin
  SQLInsert := 'EXECUTE PROCEDURE SET_PRODUTO_CONV(%d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %d, %d, %s);';
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from produto order by CodProduto');
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  Codigo := 0;
  while not FDQuery1.Eof do
  begin
    Inc(Codigo);
    Referencia := FDQuery1.FieldByName('CodProduto').AsString;
    Nome := FDQuery1.FieldByName('NomeProduto').AsString;
    UnMedida := FDQuery1.FieldByName('Unidade').AsString;
    Grupo := FDQuery1.FieldByName('Grupo').AsString;
    CodigoNCM := FDQuery1.FieldByName('CF').AsString;
    Comissao := StringReplace(FDQuery1.FieldByName('Comissao').AsString,',','.',[rfReplaceAll]);
    Fornecedor := FDQuery1.FieldByName('codfornecedor').AsString;
    Peso := StringReplace(FDQuery1.FieldByName('peso').AsString,',','.',[rfReplaceAll]);
    DescontoMaximo := StringReplace(FDQuery1.FieldByName('perc_desc').AsString,',','.',[rfReplaceAll]);
    EstoqueAtual := StringReplace(FDQuery1.FieldByName('estoque_atual').AsString,',','.',[rfReplaceAll]);
    Barras := FDQuery1.FieldByName('codigo_barras').AsString;
    QtdeCompra := FDQuery1.FieldByName('caixa').AsInteger;
    Venda := FDQuery1.FieldByName('lib_venda').AsString;

    if Barras = '0' then Barras := IntToStr(Codigo);
    if Venda = 'SIM' then Venda := 'S' else Venda := 'N';
    Fornecedor := '1000' + Fornecedor;
    if Peso = EmptyStr then Peso := '0.01';
    if Comissao = EmptyStr then Comissao := '0.00';
    if DescontoMaximo = EmptyStr then DescontoMaximo := '0.00';
    if EstoqueAtual = EmptyStr then EstoqueAtual := '0.00';
    if QtdeCompra = 0 then QtdeCompra := 1;
    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Referencia), QuotedStr(Nome), QuotedStr(UnMedida), QuotedStr(Grupo), QuotedStr(CodigoNCM), Comissao, QuotedStr(Fornecedor),
                       Peso, DescontoMaximo, EstoqueAtual, Barras, QtdeCompra, QuotedStr(Venda)]));
    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
end;

procedure TFrmPrincipal.BtnRotaClick(Sender: TObject);
var
  Codigo : Integer;
  Nome, Vendedor : String;
  SQLInsert : String;
begin
  SQLInsert := 'INSERT INTO ROTA (CODIGO, NOME, TIPOROTA, FUNCIONARIO, REORDENAR, FILIAL) VALUES (%d, %s, %s, (SELECT CODIGO FROM FUNCIONARIO WHERE NOME = %s), %s, %d);';
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from rotas');
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;

   while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('rota').AsInteger;
    Nome := FDQuery1.FieldByName('cidade').AsString;
    Vendedor := FDQuery1.FieldByName('vendedor').AsString;

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), QuotedStr('V'), QuotedStr(Vendedor), cNao, 1]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
end;

procedure TFrmPrincipal.BtnSalvarClick(Sender: TObject);
begin
  SalvarArquivo();
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
  Referencia, SQLInsert, Barras : String;
begin
  SQLInsert := 'UPDATE PRODUTO SET BARRAS = %s WHERE REFERENCIA = %s;';
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from produto order by CodProduto');
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  while not FDQuery1.Eof do
  begin
    Referencia := FDQuery1.FieldByName('CodProduto').AsString;

    Barras := FDQuery1.FieldByName('codigo_barras').AsString;


    if Barras = '0' then Barras := 'CODIGO' else Barras := QuotedStr(Barras);
    ListBox1.Items.Add(Format(SQLInsert,[Barras, QuotedStr(Referencia)]));
    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
end;

procedure TFrmPrincipal.ConectarDB;
begin
  DesconectarDB;
  FDConnection1.Connected := True;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.DesconectarDB;
begin
  FDConnection1.Connected := False;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  ConectarDB();
end;

procedure TFrmPrincipal.SalvarArquivo;
begin
  if SaveTextFileDialog1.Execute then
    ListBox1.Items.SaveToFile(SaveTextFileDialog1.FileName);
end;

end.
