unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.IniFiles, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Samples.Gauges, Vcl.ExtDlgs;

type
  TFrmPrincipal = class(TForm)
    FDQuery1: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnection1: TFDConnection;
    EditDatabase: TEdit;
    Label1: TLabel;
    BtnConectar: TButton;
    BtnDesconectar: TButton;
    DBGrid1: TDBGrid;
    BtnCondicaoPagamento: TButton;
    DataSource1: TDataSource;
    ListBox1: TListBox;
    Gauge1: TGauge;
    BtnSalvar: TButton;
    SaveTextFileDialog1: TSaveTextFileDialog;
    BtnTipoEstabelecimento: TButton;
    BtnBairro: TButton;
    BtnCidade: TButton;
    BtnFuncionario: TButton;
    BtnClifor: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConectarClick(Sender: TObject);
    procedure BtnDesconectarClick(Sender: TObject);
    procedure BtnCondicaoPagamentoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnTipoEstabelecimentoClick(Sender: TObject);
    procedure BtnBairroClick(Sender: TObject);
    procedure BtnCidadeClick(Sender: TObject);
    procedure BtnFuncionarioClick(Sender: TObject);
    procedure BtnCliforClick(Sender: TObject);
  private
    procedure ConectarDB;
    procedure DesconectarDB;
    procedure CarregarIni;
    procedure SalvarIni;
    procedure AjustaBotoesConexao;
    procedure VerificaConexao;
    procedure AjustaGauge;
    procedure SetHorizontalScrollBar(lb : TListBox);
    procedure SalvarArquivo;
    procedure AbreQuery;
    function BooleanToStr (p : Boolean) : String;
    function  AdjustRight(st: string;tam:integer;ch:char):string;
    function AjustaData(Data : String) : String;
    function  Numericos(st: string):string;
  published

  public
  end;

const
  cNull : String = 'NULL';
  cNao   : String = '''N''';
  cSim  : String = '''S''';
var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.AbreQuery;
begin
  FDQuery1.Open();
  FDQuery1.Last;
  FDQuery1.First;
end;

function TFrmPrincipal.AdjustRight(st: string; tam: integer; ch: char): string;
begin
     while Length(st) < tam do st:= ch+st;
     result := st;
end;

procedure TFrmPrincipal.AjustaBotoesConexao;
begin
  BtnConectar.Enabled := not FDConnection1.Connected;
  BtnDesconectar.Enabled := FDConnection1.Connected;
end;

function TFrmPrincipal.AjustaData(Data: String): String;
begin
  Result := 'NULL';
  if Length(Data) = 10 then
    Result := QuotedStr(StringReplace(Data, '/', '.', [rfReplaceAll]));

end;

procedure TFrmPrincipal.AjustaGauge;
begin
  Gauge1.Progress := 0;
  Gauge1.MaxValue := FDQuery1.RecordCount;
end;

function TFrmPrincipal.BooleanToStr(p: Boolean): String;
begin
  Result := QuotedStr('N');
  if p then
    Result := QuotedStr('S');
end;

procedure TFrmPrincipal.BtnBairroClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo : Integer;
  Nome : String;
begin
  FDQuery1.SQL.Add('select nome_bairro ');
  FDQuery1.SQL.Add('from bairros ');
  FDQuery1.SQL.Add('where nome_bairro <> ''CENTRO'' ');
  FDQuery1.SQL.Add('group by nome_bairro ');
  FDQuery1.SQL.Add('order by nome_bairro ');

  SQLInsert := 'INSERT INTO BAIRRO (CODIGO, NOME) '+
               'VALUES (%d, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  Codigo := 2;
  while not FDQuery1.Eof do
  begin
    Nome := FDQuery1.FieldByName('nome_bairro').AsString;

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome)]));
    Inc(Codigo);
    FDQuery1.Next;
    Gauge1.AddProgress(1);
    SetHorizontalScrollBar(ListBox1);
  end;
end;

procedure TFrmPrincipal.BtnCidadeClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Estado, Populacao : Integer;
  Nome, CodigoFiscal : String;
begin
  FDQuery1.SQL.Add('select cidades.id as codigo, cidades.nome_cidade as nome, ');
  FDQuery1.SQL.Add('estados.codigo_ibge as estado, cidades.cod_ibge, cidades.populacao ');
  FDQuery1.SQL.Add('from cidades ');
  FDQuery1.SQL.Add('inner join estados on estados.sigla = cidades.estado ');
  FDQuery1.SQL.Add('where cidades.cod_ibge > 0 ');

  SQLInsert := 'INSERT INTO CIDADE (CODIGO, NOME, CODIGOFISCAL, POPULACAO, REGIAOVENDA, COMISSAOENTREGA, ESTADO, VALORFRETEADICIONAL) '+
               'VALUES (%d, %s, %s, %d, %s, %d, %d, %d);';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    Nome := FDQuery1.FieldByName('nome').AsString;
    Estado := FDQuery1.FieldByName('estado').AsInteger;
    CodigoFiscal := FDQuery1.FieldByName('cod_ibge').AsString;
    Populacao := FDQuery1.FieldByName('populacao').AsInteger;

    if Populacao = 0 then Populacao := 1;
    
    CodigoFiscal := IntToStr(Estado) + AdjustRight(CodigoFiscal, 5, '0');

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), QuotedStr(CodigoFiscal), Populacao, cSim, 0, Estado, 0]));
    FDQuery1.Next;
    Gauge1.AddProgress(1);
    SetHorizontalScrollBar(ListBox1);
    Application.ProcessMessages;
  end;
end;

procedure TFrmPrincipal.BtnCliforClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Cidade : Integer;
  Fantasia, Nome, Cpf, Rg, Data, DataNasc, Endereco, NomeBairro, Complemento, Cep, Telefone, Email : String;
  Vendedor : Boolean;
begin
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('terceiros.tipo_vendedor as vendedor, ');
  FDQuery1.SQL.Add('terceiros.id as codigo, ');
  FDQuery1.SQL.Add('terceiros.nome as fantasia, ');
  FDQuery1.SQL.Add('terceiros.razao_social as nome, ');
  FDQuery1.SQL.Add('terceiros.cpf_cnpj as cpf, ');
  FDQuery1.SQL.Add('terceiros.rg_ie as rg, ');
  FDQuery1.SQL.Add('terceiros.data_cadastro as data, ');
  FDQuery1.SQL.Add('terceiros.data_nascimento as datanasc, ');
  FDQuery1.SQL.Add('logradouros.nome_completo as endereco, ');
  FDQuery1.SQL.Add('terceiros.numero as numero, ');
  FDQuery1.SQL.Add('terceiros.id_cidade as cidade, ');
  FDQuery1.SQL.Add('bairros.nome_bairro as nomebairro, ');
  FDQuery1.SQL.Add('terceiros.complemento as complemento, ');
  FDQuery1.SQL.Add('terceiros.cep, ');
  FDQuery1.SQL.Add('terceiros.fone as telefone, ');
  FDQuery1.SQL.Add('terceiros.email as email ');
  FDQuery1.SQL.Add('from terceiros ');
  FDQuery1.SQL.Add('left join logradouros on logradouros.id = terceiros.id_logradouro ');
  FDQuery1.SQL.Add('left join bairros on bairros.id = terceiros.id_bairro ');
  FDQuery1.SQL.Add('where ((terceiros.tipo_vendedor = true) or (terceiros.tipo_funcionario = true)) ');

  SQLInsert := 'INSERT INTO FUNCIONARIO (CODIGO, FANTASIA, NOME, CPF, RG, DATA, DATANASC, ENDERECO, CIDADE, BAIRRO, COMPLEMENTO, CEP, TELEFONE, EMAIL, GERARPEDIDOBLOQUEADO, '+
               'COMISSAOFIXA, UTILIZAGEOLOCALIZACAO, AFVLIBERARFORAROTA, ENVIARAUTOMATICO, AFVPRONTAENTREGA, COMISSAO, EXPORTAR, ATIVO, RECEBEMENSAGEM, GERARCOMISSAO, FLEX, GERARFLEX, '+
               'UTILIZAROTA, AFVTEMPOSINCRONIZAR, LIMITEFLEX) VALUES (%d, %s, %s, %s, %s, %s, %s, %s, %d, (SELECT FIRST(1) CODIGO FROM BAIRRO WHERE NOME = %s), '+
               '%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %d, %s, %s, %s, %s, %d, %s, %s, %d, %d);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  ListBox1.Items.Add('DELETE FROM CLIFOR; COMMIT;');
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    Fantasia := FDQuery1.FieldByName('fantasia').AsString;
    Nome := Copy(FDQuery1.FieldByName('nome').AsString, 0, 40);
    Cpf := FDQuery1.FieldByName('cpf').AsString;
    Rg := FDQuery1.FieldByName('rg').AsString;
    Data := AjustaData(FDQuery1.FieldByName('data').AsString);
    DataNasc := AjustaData(FDQuery1.FieldByName('datanasc').AsString);
    Endereco := FDQuery1.FieldByName('endereco').AsString + ', ' + FDQuery1.FieldByName('numero').AsString;
    Cidade := FDQuery1.FieldByName('cidade').AsInteger;
    NomeBairro := FDQuery1.FieldByName('nomebairro').AsString;
    Complemento := FDQuery1.FieldByName('complemento').AsString;
    Cep := Numericos(FDQuery1.FieldByName('cep').AsString);
    Telefone := Numericos(FDQuery1.FieldByName('telefone').AsString);
    Email := FDQuery1.FieldByName('email').AsString;
    Vendedor := FDQuery1.FieldByName('vendedor').AsBoolean;

    if NomeBairro = EmptyStr then NomeBairro := 'CENTRO';


    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Fantasia), QuotedStr(Nome), QuotedStr(Cpf), QuotedStr(Rg), Data, DataNasc, QuotedStr(Endereco), Cidade, QuotedStr(NomeBairro),
                       QuotedStr(Complemento), QuotedStr(Cep), QuotedStr(Telefone), QuotedStr(Email), cNao, cNao, cNao, cNao, cNao, cNao, 0, cSim, cSim, cSim, BooleanToStr(Vendedor),
                       0, cNao, cNao, 0, 0]));
    if Vendedor then
      ListBox1.Items.Add(Format('INSERT INTO CARGOFUNCIONARIO (FUNCIONARIO, CARGO, DATA) VALUES (%d, %d, %s);',[Codigo, 1, Data]));
    FDQuery1.Next;
    Gauge1.AddProgress(1);
    SetHorizontalScrollBar(ListBox1);
  end;
end;

procedure TFrmPrincipal.BtnCondicaoPagamentoClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Vezes, Intervalo, PrimeiroVcto : Integer;
  Ativo : Boolean;
  Nome, Indicador : String;
begin
  FDQuery1.SQL.Add('select * from formas_parcelamento');
  SQLInsert := 'INSERT INTO CONDICAOPAGAMENTO (CODIGO, NOME, PRIMEIROVCTO, VEZES, INTERVALO, EXPORTAR, ATIVO, COMISSAO, LIBERARVENDAPENDENCIA, INDICADOR, '+
               'DIVIDIRVALORST, LIBERARVENDALIMITE, CONCEDERDESCONTO, INDICADORNFE, SOLICITARPRIMEIROVENCIMENTO, INDICE, VALORMINIMO, BLOQUEARCLIFORAUTOMATICAMENTE) '+
               'VALUES (%d, %s, %d, %d, %d, %s, %s, %d, %s, %s, %s, %s, %s, %s, %s, %d, %d, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  ListBox1.Items.Add('DELETE FROM CONDICAOPAGAMENTO; COMMIT;');
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('id').AsInteger;
    Nome := FDQuery1.FieldByName('desc_forma_parc').AsString;
    PrimeiroVcto := FDQuery1.FieldByName('interv_dias').AsInteger;
    Vezes := FDQuery1.FieldByName('qtde_parcelas').AsInteger;
    Intervalo := FDQuery1.FieldByName('interv_dias').AsInteger;
    Ativo := FDQuery1.FieldByName('ativa').AsBoolean;

    if Intervalo > 1  then Indicador := QuotedStr('1') else Indicador := QuotedStr('0');
    if Vezes = 0 then Vezes := 1;
    if PrimeiroVcto = 0 then PrimeiroVcto := 1;

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), PrimeiroVcto, Vezes, Intervalo, cSim, BooleanToStr(Ativo), 0, cNao, Indicador, cSim, cNao, cNao, Indicador,
                       cNao, 1, 0, cNao]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
    SetHorizontalScrollBar(ListBox1);
  end;
end;

procedure TFrmPrincipal.BtnConectarClick(Sender: TObject);
begin
  ConectarDB;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.BtnDesconectarClick(Sender: TObject);
begin
  DesconectarDB;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.BtnFuncionarioClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Cidade : Integer;
  Fantasia, Nome, Cpf, Rg, Data, DataNasc, Endereco, NomeBairro, Complemento, Cep, Telefone, Email : String;
  Vendedor : Boolean;
begin
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('terceiros.tipo_vendedor as vendedor, ');
  FDQuery1.SQL.Add('terceiros.id as codigo, ');
  FDQuery1.SQL.Add('terceiros.nome as fantasia, ');
  FDQuery1.SQL.Add('terceiros.razao_social as nome, ');
  FDQuery1.SQL.Add('terceiros.cpf_cnpj as cpf, ');
  FDQuery1.SQL.Add('terceiros.rg_ie as rg, ');
  FDQuery1.SQL.Add('terceiros.data_cadastro as data, ');
  FDQuery1.SQL.Add('terceiros.data_nascimento as datanasc, ');
  FDQuery1.SQL.Add('logradouros.nome_completo as endereco, ');
  FDQuery1.SQL.Add('terceiros.numero as numero, ');
  FDQuery1.SQL.Add('terceiros.id_cidade as cidade, ');
  FDQuery1.SQL.Add('bairros.nome_bairro as nomebairro, ');
  FDQuery1.SQL.Add('terceiros.complemento as complemento, ');
  FDQuery1.SQL.Add('terceiros.cep, ');
  FDQuery1.SQL.Add('terceiros.fone as telefone, ');
  FDQuery1.SQL.Add('terceiros.email as email ');
  FDQuery1.SQL.Add('from terceiros ');
  FDQuery1.SQL.Add('left join logradouros on logradouros.id = terceiros.id_logradouro ');
  FDQuery1.SQL.Add('left join bairros on bairros.id = terceiros.id_bairro ');
  FDQuery1.SQL.Add('where ((terceiros.tipo_vendedor = true) or (terceiros.tipo_funcionario = true)) ');

  SQLInsert := 'INSERT INTO FUNCIONARIO (CODIGO, FANTASIA, NOME, CPF, RG, DATA, DATANASC, ENDERECO, CIDADE, BAIRRO, COMPLEMENTO, CEP, TELEFONE, EMAIL, GERARPEDIDOBLOQUEADO, '+
               'COMISSAOFIXA, UTILIZAGEOLOCALIZACAO, AFVLIBERARFORAROTA, ENVIARAUTOMATICO, AFVPRONTAENTREGA, COMISSAO, EXPORTAR, ATIVO, RECEBEMENSAGEM, GERARCOMISSAO, FLEX, GERARFLEX, '+
               'UTILIZAROTA, AFVTEMPOSINCRONIZAR, LIMITEFLEX) VALUES (%d, %s, %s, %s, %s, %s, %s, %s, %d, (SELECT FIRST(1) CODIGO FROM BAIRRO WHERE NOME = %s), '+
               '%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %d, %s, %s, %s, %s, %d, %s, %s, %d, %d);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  ListBox1.Items.Add('DELETE FROM FUNCIONARIO; COMMIT;');
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    Fantasia := FDQuery1.FieldByName('fantasia').AsString;
    Nome := Copy(FDQuery1.FieldByName('nome').AsString, 0, 40);
    Cpf := FDQuery1.FieldByName('cpf').AsString;
    Rg := FDQuery1.FieldByName('rg').AsString;
    Data := AjustaData(FDQuery1.FieldByName('data').AsString);
    DataNasc := AjustaData(FDQuery1.FieldByName('datanasc').AsString);
    Endereco := FDQuery1.FieldByName('endereco').AsString + ', ' + FDQuery1.FieldByName('numero').AsString;
    Cidade := FDQuery1.FieldByName('cidade').AsInteger;
    NomeBairro := FDQuery1.FieldByName('nomebairro').AsString;
    Complemento := FDQuery1.FieldByName('complemento').AsString;
    Cep := Numericos(FDQuery1.FieldByName('cep').AsString);
    Telefone := Numericos(FDQuery1.FieldByName('telefone').AsString);
    Email := FDQuery1.FieldByName('email').AsString;
    Vendedor := FDQuery1.FieldByName('vendedor').AsBoolean;

    if NomeBairro = EmptyStr then NomeBairro := 'CENTRO';


    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Fantasia), QuotedStr(Nome), QuotedStr(Cpf), QuotedStr(Rg), Data, DataNasc, QuotedStr(Endereco), Cidade, QuotedStr(NomeBairro),
                       QuotedStr(Complemento), QuotedStr(Cep), QuotedStr(Telefone), QuotedStr(Email), cNao, cNao, cNao, cNao, cNao, cNao, 0, cSim, cSim, cSim, BooleanToStr(Vendedor),
                       0, cNao, cNao, 0, 0]));
    if Vendedor then
      ListBox1.Items.Add(Format('INSERT INTO CARGOFUNCIONARIO (FUNCIONARIO, CARGO, DATA) VALUES (%d, %d, %s);',[Codigo, 1, Data]));
    FDQuery1.Next;
    Gauge1.AddProgress(1);
    SetHorizontalScrollBar(ListBox1);
  end;
end;

procedure TFrmPrincipal.BtnSalvarClick(Sender: TObject);
begin
  SalvarArquivo;
end;

procedure TFrmPrincipal.BtnTipoEstabelecimentoClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo : Integer;
  Nome : String;
begin
  FDQuery1.SQL.Add('select * from tipologias');
  SQLInsert := 'INSERT INTO TIPOESTABELECIMENTO (CODIGO, NOME, SEGMENTO, ATIVO, EXPORTAR, REVENDA) '+
               'VALUES (%d, %s, %d, %s, %s, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  ListBox1.Items.Add('DELETE FROM TIPOESTABELECIMENTO; COMMIT;');
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('id').AsInteger;
    Nome := FDQuery1.FieldByName('desc_tipologia').AsString;

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), 1, cSim, cSim, cSim]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
    SetHorizontalScrollBar(ListBox1);
  end;
end;

procedure TFrmPrincipal.CarregarIni;
var
  INI : TIniFile;
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conversor.ini');
  EditDataBase.Text := INI.ReadString('Geral', 'database', EmptyStr);
end;

procedure TFrmPrincipal.ConectarDB;
begin
  DesconectarDB;
  FDPhysPgDriverLink1.VendorHome := ExtractFilePath(Application.ExeName);
  FDPhysPgDriverLink1.VendorLib := 'libpq.dll';
  FDConnection1.Params.Values['database'] := EditDatabase.Text;
  FDConnection1.Connected := True;
end;

procedure TFrmPrincipal.DesconectarDB;
begin
  FDConnection1.Connected := False;

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvarIni;
  DesconectarDB;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  CarregarIni;
  AjustaBotoesConexao;
end;

function TFrmPrincipal.Numericos(st: string): string;
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

procedure TFrmPrincipal.SalvarArquivo;
begin
  if SaveTextFileDialog1.Execute then
    ListBox1.Items.SaveToFile(SaveTextFileDialog1.FileName);
end;

procedure TFrmPrincipal.SalvarIni;
var
  INI : TIniFile;
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conversor.ini');
  INI.WriteString('Geral', 'database', EditDatabase.Text);
end;

procedure TFrmPrincipal.VerificaConexao;
begin
  if not FDConnection1.Connected then
    raise Exception.Create('Não conectado ao banco de dados!');
end;

procedure TFrmPrincipal.SetHorizontalScrollBar(lb : TListBox);
var
  j, MaxWidth: integer;
begin
  MaxWidth := 0;
  for j := 0 to lb.Items.Count - 1 do
    if MaxWidth < lb.Canvas.TextWidth(lb.Items[j]) then
      MaxWidth := lb.Canvas.TextWidth(lb.Items[j]) ;

  SendMessage(lb.Handle, LB_SETHORIZONTALEXTENT,
  MaxWidth + 5, 0) ;
end;

end.
