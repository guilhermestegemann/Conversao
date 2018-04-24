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
    Button1: TButton;
    Button2: TButton;
    Gauge1: TGauge;
    SaveTextFileDialog1: TSaveTextFileDialog;
    Button3: TButton;
    salvar: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure CarregarExcel;
    function  Numericos(st: string):string;
    function MascaraCnpjCpf(Value : string):String;
    function  VerificaCnpj(cnpj: string):boolean;
    function MascaraCnpj(cnpj: string):String;
    function MascaraCpf(cpf: string):String;
    procedure salvarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    Excel, Planilha : OleVariant;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Cnpj, Email, Telefone,SQL : String;
  I: Integer;
begin
  SQl := 'INSERT INTO CLIFORCONTATO (CLIFOR, NUMERO, EMAIL, ENVIARNFE, ENVIARDANFE, ENVIARPEDIDO, ENVIARBOLETO) '
       + 'VALUES ((SELECT CODIGO FROM CLIFOR WHERE CNPJ = %s), %s, %s, %s, %s, %s, %s);' ;
  try
    CarregarExcel;
    ListBox1.Clear;
    for I := 2  to 354 do
    begin
      Cnpj := Trim((Planilha.cells[i,2]));
      if Length(Cnpj) = 10 then  Cnpj := '0' + Cnpj;

      Cnpj := MascaraCnpjCpf(Cnpj);

      Email := Trim((Planilha.cells[i,3]));
      Telefone := Trim((Planilha.cells[i,4]));
      if ((Email <> EmptyStr) or (Telefone <> EmptyStr)) then
        ListBox1.Items.Add(Format(SQL, [QuotedStr(Cnpj), QuotedStr(Email), QuotedStr(Numericos(Telefone)), QuotedStr('N'), QuotedStr('N'), QuotedStr('N'), QuotedStr('N')]));
    end;
    ListBox1.Items.Add(Format('UPDATE CLIFORCONTATO SET ENVIARNFE = %s, ENVIARDANFE = %s WHERE EMAIL LIKE %s;',[QuotedStr('S'), QuotedStr('S'), QuotedStr('%@%')]));
  finally
    Excel.Quit;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  SQL, Vendedor, CNPJ : String;
  I : Integer;
begin
  SQl := 'INSERT INTO FUNCIONARIOCLIFOR (CLIFOR, FUNCIONARIO) '
       + 'VALUES ((SELECT CODIGO FROM CLIFOR WHERE CNPJ = %s), %s);' ;
  try
    CarregarExcel;
    for I := 2  to 354 do
    begin
      Cnpj := Trim((Planilha.cells[i,2]));
      if Length(Cnpj) = 10 then  Cnpj := '0' + Cnpj;

      Cnpj := MascaraCnpjCpf(Cnpj);

      Vendedor := Trim((Planilha.cells[i,6]));
      ListBox1.Items.Add(Format(SQL, [QuotedStr(Cnpj), Vendedor]));
    end;

  finally

  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  SQL, Data, CNPJ : String;
  I : Integer;
begin
  SQl := 'UPDATE CLIFOR SET DATA = %s WHERE CODIGO = (SELECT CODIGO FROM CLIFOR WHERE CNPJ = %s);' ;
  try
    CarregarExcel;
    for I := 2  to 354 do
    begin
      Cnpj := Trim((Planilha.cells[i,2]));
      if Length(Cnpj) = 10 then  Cnpj := '0' + Cnpj;

      Cnpj := MascaraCnpjCpf(Cnpj);

      Data := Trim((Planilha.cells[i,5]));
      Data := StringReplace(Data, '/', '.', [rfReplaceAll]);
      ListBox1.Items.Add(Format(SQL, [QuotedStr(Data), QuotedStr(Cnpj)]));
    end;

  finally

  end;
end;

procedure TForm1.CarregarExcel;
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\FerreiraJaragua\Cópia de clientes e respectivos vendedores-1.xls');
  Planilha := Excel.WorkSheets[1];
end;

function TForm1.MascaraCnpj(cnpj: string): String;
begin
//  Result := TPessoa.GetCNPJ(cnpj);
     cnpj:= Numericos(cnpj);
     Result := cnpj[1]+cnpj[2]+'.'+cnpj[3]+cnpj[4]+cnpj[5]+'.'+cnpj[6]+cnpj[7]+cnpj[8]+'/'+cnpj[9]+cnpj[10]+cnpj[11]+cnpj[12]+'-'+cnpj[13]+cnpj[14];
end;

function TForm1.MascaraCnpjCpf(Value: string): String;
begin
  if VerificaCnpj(Numericos(Value)) then
    Result := MascaraCnpj(Numericos(Value))
  else
    Result := MascaraCPF(Numericos(Value));
end;

function TForm1.MascaraCpf(cpf: string): String;
begin
//  Result := TPessoa.GetCPF(cpf);
     cpf := Numericos(cpf);
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
