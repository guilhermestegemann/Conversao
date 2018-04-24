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
    salvar: TMenuItem;
    btnCliente: TButton;
    Label1: TLabel;
    LblQtde: TLabel;
    procedure AjustaGauge(Inicio, Fim : Integer);
    function  Numericos(st: string):string;
    function MascaraCnpjCpf(Value : string):String;
    function  VerificaCnpj(cnpj: string):boolean;
    function MascaraCnpj(cnpj: string):String;
    function MascaraCpf(cpf: string):String;
    function  TratarCaracteresEsteciais(st: string):string;
    function AjustaData(data : String):String;
    procedure salvarClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarPlanilhas(Index : Integer);
    procedure ConverterClientes;
    procedure FecharPlanilha;
  public
    { Public declarations }

  end;

const
  cNomeFantasia : Integer = 1;
  cNomeRazao : Integer = 2;
  cCNPJ : Integer = 3;
  cCPF : Integer = 4;
  cEmail : Integer = 5;
  cCEP : Integer = 6;
  cEstado : Integer = 7;
  cCidade : Integer = 8;
  cEndereco : Integer = 9;
  cBairro : Integer = 10;
  cNumero : Integer = 11;
  cComplemento : Integer = 12;
  cTelefone : Integer = 13;
  cContato : Integer = 14;
  cDataFundacao : Integer = 15;

var
  Form1: TForm1;
  Excel, Planilha : OleVariant;
  InicioPlanilha, FimPlanilha, GeralQtde : Integer;

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

procedure TForm1.AjustaGauge(Inicio, Fim : Integer);
begin
  Gauge1.Progress := Inicio;
  Gauge1.MaxValue := Fim;
end;

procedure TForm1.btnClienteClick(Sender: TObject);
var
  I : Integer;
begin
  GeralQtde := 0;
  ListBox1.Clear;
  AjustaGauge(0, 178);
  for I := 0  to 4 do
  begin
    try
      CarregarPlanilhas(I);
      ConverterClientes;
    finally
      FecharPlanilha;
    end;
  end;
  ListBox1.Items.Add(Format('UPDATE CLIFORCONTATO SET ENVIARNFE = %s, ENVIARDANFE = %s WHERE EMAIL LIKE %s;',[QuotedStr('S'), QuotedStr('S'), QuotedStr('%@%')]));
  ListBox1.Items.Add(Format('UPDATE CLIFORCONTATO SET EMAIL = NULL WHERE EMAIL LIKE %s;',[QuotedStr('')]));
  ListBox1.Items.Add(Format('UPDATE CLIFORCONTATO SET EMAIL = LOWER(EMAIL) WHERE EMAIL LIKE %s;',[QuotedStr('%@%')]));
end;

procedure TForm1.ConverterClientes;
var
  NomeFantasia, NomeRazao, CNPJ, IE, Email, CEP, Estado, Cidade, Endereco, Bairro, Numero, Complemento, Telefone, Contato, SQLClifor : String;
  I : Integer;

begin
  SQLClifor := 'EXECUTE PROCEDURE SET_CLIFOR(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';

  for I := InicioPlanilha to FimPlanilha do
    begin
      NomeFantasia := TratarCaracteresEsteciais(Trim((Planilha.cells[i,cNomeFantasia]))).ToUpper;
      NomeRazao := TratarCaracteresEsteciais(Trim((Planilha.cells[i,cNomeRazao]))).ToUpper;
      CNPJ := Trim((Planilha.cells[i,cCNPJ])).ToUpper;
      IE := Trim((Planilha.cells[i,cCPF])).ToUpper;
      Email := Trim((Planilha.cells[i,cEmail])).ToLower;
      CEP := Numericos(Trim((Planilha.cells[i,cCEP]))).ToUpper;
      Estado := Trim((Planilha.cells[i,cEstado])).ToUpper;
      Cidade := TratarCaracteresEsteciais(Trim((Planilha.cells[i,cCidade]))).ToUpper;
      Endereco := TratarCaracteresEsteciais(Trim((Planilha.cells[i,cEndereco]))).ToUpper;
      Bairro := TratarCaracteresEsteciais(Trim((Planilha.cells[i,cBairro]))).ToUpper;
      Numero := Trim((Planilha.cells[i,cNumero])).ToUpper;
      Complemento := Trim((Planilha.cells[i,cComplemento])).ToUpper;
      Telefone := Numericos(Trim((Planilha.cells[i,cTelefone])).ToUpper);
      Contato := TratarCaracteresEsteciais(Trim((Planilha.cells[i,cContato]))).ToUpper;


      ListBox1.Items.Add(Format(SQLClifor,[QuotedStr(NomeFantasia), QuotedStr(NomeRazao), QuotedStr(CNPJ), QuotedStr(IE), QuotedStr(Email), QuotedStr(CEP), QuotedStr(Estado),
                             QuotedStr(Cidade), QuotedStr(Endereco), QuotedStr(Bairro), QuotedStr(Numero), QuotedStr(Complemento), QuotedStr(Telefone), QuotedStr(Contato)]));
      Application.ProcessMessages;
      Gauge1.AddProgress(1);
      Inc(GeralQtde);
      LblQtde.Caption := IntToStr(GeralQtde);
    end;

end;

procedure TForm1.FecharPlanilha;
begin
  Excel.Quit;
end;

procedure TForm1.CarregarPlanilhas(Index: Integer);
begin
  case Index of
    0:
    begin
      Excel := CreateOleObject('Excel.Application');
      Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Tatui\BOITUVA.xls');
      Planilha := Excel.WorkSheets[1];
      InicioPlanilha := 2;
      FimPlanilha := 42;
    end;
    1:
    begin
      Excel := CreateOleObject('Excel.Application');
      Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Tatui\PORTO FELIZ.xls');
      Planilha := Excel.WorkSheets[1];
      InicioPlanilha := 2;
      FimPlanilha := 18;
    end;
    2:
    begin
      Excel := CreateOleObject('Excel.Application');
      Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Tatui\TATUI.xls');
      Planilha := Excel.WorkSheets[1];
      InicioPlanilha := 2;
      FimPlanilha := 10;
    end;
    3:
    begin
      Excel := CreateOleObject('Excel.Application');
      Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Tatui\TIETE.xls');
      Planilha := Excel.WorkSheets[1];
      InicioPlanilha := 2;
      FimPlanilha := 74;
    end;
    4:
    begin
      Excel := CreateOleObject('Excel.Application');
      Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Tatui\CERQUILHO.xls');
      Planilha := Excel.WorkSheets[1];
      InicioPlanilha := 2;
      FimPlanilha := 44;
    end;

  end;
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

function TForm1.TratarCaracteresEsteciais(st: string): string;
const
     A = ['Б','А','Д','В','Г'];
     E = ['Й','И','Л','К'];
     I = ['Н','М','П','О'];
     O = ['У','Т','Ц','Ф','Х'];
     U = ['Ъ','Щ','Ь','Ы'];
     Am = ['б','а','д','в','г'];
     Em = ['й','и','л','к'];
     Im = ['н','м','п','о'];
     Om = ['у','т','ц','ф','х'];
     Um = ['ъ','щ','ь','ы'];
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
            if st[j] = 'є' then r := r + 'o' else
            if st[j] = '°' then r := r + 'o' else
            if st[j] = 'Є' then r := r + 'a' else
            if st[j] = '/' then r := r + '-' else
            if st[j] = '<' then r := r + '&lt;' else
            if st[j] = '>' then r := r + '&gt;' else
            if st[j] = '&' then r := r + '&amp;' else
            if st[j] = '"' then r := r + '&quot;' else
            if st[j] = '''' then r := r + '' else
            if st[j] = 'Э' then r := r + 'Y' else
            if st[j] = 'э' then r := r + 'y' else
            if st[j] = 'я' then r := r + 'y' else
            if st[j] = 'С' then r := r + 'N' else
            if st[j] = 'с' then r := r + 'n' else
            if st[j] = 'З' then r := r + 'C' else
            if st[j] = 'з' then r := r + 'c' else
            if st[j] = 'ї' then r := r + ' ' else
            if st[j] = 'µ' then r := r + 'u' else
            if st[j] = 'ґ' then r := r + '&#39;' else
            //Tratar Acentuaзгo
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
