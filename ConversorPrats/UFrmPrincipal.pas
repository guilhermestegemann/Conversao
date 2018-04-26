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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConectarClick(Sender: TObject);
    procedure BtnDesconectarClick(Sender: TObject);
    procedure BtnCondicaoPagamentoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
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
    function BooleanToStr (p : Boolean) : String;
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

function TFrmPrincipal.BooleanToStr(p: Boolean): String;
begin
  Result := QuotedStr('N');
  if p then
    Result := QuotedStr('S');
end;

procedure TFrmPrincipal.BtnCondicaoPagamentoClick(Sender: TObject);
var
  SQLInsert, SQL : String;
  Codigo, Vezes, Intervalo, PrimeiroVcto : Integer;
  Ativo : Boolean;
  Nome, Indicador : String;
begin
  SQL := 'select * from formas_parcelamento';
  SQLInsert := 'INSERT INTO CONDICAOPAGAMENTO (CODIGO, NOME, PRIMEIROVCTO, VEZES, INTERVALO, EXPORTAR, ATIVO, COMISSAO, LIBERARVENDAPENDENCIA, INDICADOR, '+
               'DIVIDIRVALORST, LIBERARVENDALIMITE, CONCEDERDESCONTO, INDICADORNFE, SOLICITARPRIMEIROVENCIMENTO, INDICE, VALORMINIMO, BLOQUEARCLIFORAUTOMATICAMENTE) '+
               'VALUES (%d, %s, %d, %d, %d, %s, %s, %d, %s, %s, %s, %s, %s, %s, %s, %d, %d, %s);';
  VerificaConexao;
  FDQuery1.Open(SQL);
  FDQuery1.First;
  AjustaGauge;
  ListBox1.Clear;
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

procedure TFrmPrincipal.BtnSalvarClick(Sender: TObject);
begin
  SalvarArquivo;
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
