unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtDlgs, ComObj,
  Vcl.Samples.Gauges;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    SaveTextFileDialog1: TSaveTextFileDialog;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    PopupMenu1: TPopupMenu;
    Salvar1: TMenuItem;
    Gauge1: TGauge;
    procedure CarregarExcel;
    procedure Button1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    function Numericos(Str : String) : String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  cCodigo              : Integer = 1;
  cRazao               : Integer = 2;
  cFantasia            : Integer = 3;
  cCnpj                : Integer = 5;
  cIE                  : Integer = 6;
  cCEP                 : Integer = 8;
  cEndereco            : Integer = 9;
  cNumero              : Integer = 10;
  cComplemento         : Integer = 11;
  cBairro              : Integer = 12;
  cCidade              : Integer = 13;
  cEstado              : Integer = 14;
  cTelefone            : Integer = 16;
  cEmail               : Integer = 17;
  cTipoEstabelecimento : Integer = 18;
  cDataFundacao        : Integer = 20;
  cUltimaCompra        : Integer = 21;


var
  Form1: TForm1;
  Excel, Planilha : OleVariant;
implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  I, X : Integer;
  achei : boolean;
  Bairro, SQL, SQLPronto : String;
begin
  ListBox1.Clear;
  SQL := 'INSERT INTO BAIRRO (CODIGO, NOME) VALUES ((SELECT MAX(CODIGO)+1 FROM BAIRRO), %s);';
  try
    CarregarExcel;
    for I := 2 to 1577 do
    begin
      Bairro := Trim((Planilha.cells[i,cBairro]));
      SQLPronto := Format(SQL,[QuotedStr(Bairro.ToUpper)]);
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
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I, X : Integer;
  achei : boolean;
  Cidade, Estado, SQL, SQLPronto : String;
begin
  ListBox1.Clear;
  SQL := 'INSERT INTO CIDADE (NOME, ESTADO) VALUES (%s, (SELECT CODIGO FROM ESTADO WHERE UF = %s));';
  try
    CarregarExcel;
    for I := 2 to 1577 do
    begin
      Cidade := Trim((Planilha.cells[i,cCidade]));
      Estado := Trim((Planilha.cells[i,cEstado]));
      SQLPronto := Format(SQL,[QuotedStr(Cidade.ToUpper), QuotedStr(Estado.ToUpper)]);
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
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I, X : Integer;
  achei : boolean;
  TipoEstabelecimento, SQL, SQLPronto : String;
begin
  ListBox1.Clear;
  SQL := 'INSERT INTO TIPOESTABELECIMENTO (CODIGO, NOME) VALUES ((SELECT MAX(CODIGO)+1 FROM TIPOESTABELECIMENTO), %s);';
  try
    CarregarExcel;
    for I := 2 to 1577 do
    begin
      TipoEstabelecimento := Trim((Planilha.cells[i,cTipoEstabelecimento]));
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
    end;

  finally
    Excel.Quit;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var

  Codigo              : String;
  Razao               : String;
  Fantasia            : String;
  Cnpj                : String;
  IE                  : String;
  CEP                 : String;
  Endereco            : String;
  Numero              : String;
  Complemento         : String;
  Bairro              : String;
  Cidade              : String;
  Telefone            : String;
  Email               : String;
  TipoEstabelecimento : String;
  DataFundacao        : String;
  UltimaCompra        : String;
  I : Integer;
  SQLClifor, SqlCliforContato : String;
begin
  ListBox1.Clear;

  SQLClifor := 'INSERT INTO CLIFOR (CODIGO, NOME, FANTASIA, CNPJ, IE, CEP, ENDERECO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, TIPOESTABELECIMENTO, DATAINICIOATIVIDADES, DATAMOVIMENTO)'
             + ' VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %S, (SELECT CODIGO FROM BAIRRO WHERE NOME = %s), (SELECT CODIGO FROM CIDADE WHERE NOME = %s), (SELECT CODIGO FROM TIPOESTABELECIMENTO WHERE NOME = %s), %s, %s);';
  SQLCliforContato := 'INSERT INTO CLIFORCONTATO (CLIFOR, NUMERO, ENVIARDANFE, ENVIARNFE, ENVIARBOLETO, ENVIARPEDIDO)'
                    + ' VALUES (%s, %s, %s, %s, %s, %s);';
  try
    Gauge1.Progress := 2;
    Gauge1.Maxvalue := 1577;
    CarregarExcel;
    for I := 2 to 1577 do
    begin
      Codigo := Trim((Planilha.cells[i,cCodigo]));
      Razao := Trim((Planilha.cells[i,cRazao]));
      Fantasia := Trim((Planilha.cells[i,cFantasia]));
      Cnpj := Trim((Planilha.cells[i,cCnpj]));
      IE := Trim((Planilha.cells[i,cIE]));
      CEP := Numericos(Trim((Planilha.cells[i,cCEP])));
      Endereco := Trim((Planilha.cells[i,cEndereco]));
      Numero := Trim((Planilha.cells[i,cNumero]));
      Complemento := Trim((Planilha.cells[i,cComplemento]));
      Bairro := Trim((Planilha.cells[i,cBairro]));
      Cidade := Trim((Planilha.cells[i,cCidade]));
      Telefone := Numericos(Trim((Planilha.cells[i,cTelefone])));
      Email := Trim((Planilha.cells[i,cEmail]));
      TipoEstabelecimento := Trim((Planilha.cells[i,cTipoEstabelecimento]));
      DataFundacao := StringReplace(Trim((Planilha.cells[i,cDataFundacao])),'/','.',[rfReplaceAll]);
      UltimaCompra := StringReplace(Trim((Planilha.cells[i,cUltimaCompra])),'/','.',[rfReplaceAll]);

      if IE = '-' then IE := EmptyStr;
      if Complemento = '-' then Complemento := EmptyStr;
      if Email = '-' then IE := EmptyStr;
      if DataFundacao = '-' then DataFundacao := 'NULL' else DataFundacao := QuotedStr(DataFundacao);
      if UltimaCompra = '-' then UltimaCompra := 'NULL' else UltimaCompra := QuotedStr(UltimaCompra);
      if Telefone = '-' then Telefone := EmptyStr;
      if TipoEstabelecimento = 'INDÚSTRIA E COMÉRCIO DE MATERIAIS DENTÁRIOS' then TipoEstabelecimento := 'IND E COM DE MAT. DENTÁRIOS';
      Bairro := Bairro.ToUpper;
      Cidade := Cidade.ToUpper;

      ListBox1.Items.Add(Format(SQLClifor, [Codigo, QuotedStr(Razao), QuotedStr(Fantasia), QuotedStr(Cnpj), QuotedStr(IE), QuotedStr(CEP), QuotedStr(Endereco), QuotedStr(Numero),
                               QuotedStr(Complemento), QuotedStr(Bairro), QuotedStr(Cidade), QuotedStr(TipoEstabelecimento), DataFundacao, UltimaCompra]));
      if Telefone <> EmptyStr then
        ListBox1.Items.Add(Format(SqlCliforContato,[Codigo, QuotedStr(telefone), QuotedStr('N'), QuotedStr('N'), QuotedStr('N'), QuotedStr('N')]));
      Gauge1.AddProgress(1);
    end;
    ListBox1.Items.Add(Format('update cliforcontato set enviarnfe = %s, enviardanfe = %s where email like %s;',[QuotedStr('S'), QuotedStr('S'), QuotedStr('%@%')]));
  finally
    Excel.Quit;
  end;
end;

procedure TForm1.CarregarExcel;
begin
  try
    Excel := CreateOleObject('Excel.Application');
    Excel.WorkBooks.Open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\HD\FM - Clientes Base Principal Top.xlsx');
    Planilha := Excel.WorkSheets[1];
  finally

  end;
end;

function TForm1.Numericos(Str: String): String;
var
   i: integer;
   r: String;
begin
     r:= '';
     If length(str) > 0 then
        For i := 0 to length(str) do
            if (CharInSet(str[i],['0'..'9'])) then  r := r + str[i];
     result := r;
end;

procedure TForm1.Salvar1Click(Sender: TObject);
begin
  if SaveTextFileDialog1.Execute then
   ListBox1.Items.SaveToFile(SaveTextFileDialog1.FileName);
end;

end.
