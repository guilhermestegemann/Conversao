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
    btnProduto: TButton;
    btnEstoque: TButton;
    btnCódigoRelacionado: TButton;
    procedure AjustaGauge(Inicio, Fim : Integer);
    function  Numericos(st: string):string;
    function MascaraCnpjCpf(Value : string):String;
    function  VerificaCnpj(cnpj: string):boolean;
    function MascaraCnpj(cnpj: string):String;
    function MascaraCpf(cpf: string):String;
    function  TratarCaracteresEsteciais(st: string):string;
    function AjustaData(data : String):String;
    procedure salvarClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarPlanilha;
    procedure ConverterProdutos;
    procedure FecharPlanilha;
  public
    { Public declarations }

  end;

const
  cCodigo : Integer = 1;
  cCodigoNCM : Integer = 2;
  cTributacaoICMS : Integer = 3;
  cGrupo : Integer = 4;
  cTipoProduto : Integer = 5;
  cMarca : Integer = 6;
  cClifor : Integer = 7;
  cClassificacao : Integer = 8;
  cCategoria : Integer = 9;
  cTributacaoPis : Integer = 10;
  cTributacaoCofins : Integer = 11;
  cTributacaoIPI : Integer = 12;
  cUnCompra : Integer = 13;
  cQtdeCompra : Integer = 14;
  cUnVenda : Integer = 15;
  cQtdeVenda : Integer = 16;
  cUnCarga : Integer = 17;
  cQtdeCarga : Integer = 18;
  cCodigoRelacionado : Integer = 19;
  cNomeProduto : Integer = 20;
  cEAN : Integer = 21;
  cDUN : Integer = 22;
  cPesoLiquido : Integer = 23;
  cPesoBruto : Integer = 23;

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

procedure TForm1.btnProdutoClick(Sender: TObject);
begin
  try
    CarregarPlanilha;
    ConverterProdutos;
  finally
    FecharPlanilha;
  end;
end;

procedure TForm1.ConverterProdutos;
var
  Codigo, CodigoNCM, TributacaoICMS, Grupo, TipoProduto, Marca, Clifor, Classificacao, Categoria, TributacaoPis, TributacaoCofins, TributacaoIPI,
  UnCompra, QtdeCompra, UnVenda, QtdeVenda, UnCarga, QtdeCarga, CodigoRelacionado, NomeProduto, EAN, DUN, PesoLiquido, PesoBruto : String;
  SQLProduto, SQLEstoque, SQLEstoqueCambe, SQLProdutoClifor : String;
  I : Integer;

begin
  SQLProduto := 'INSERT INTO PRODUTO (CODIGO, CODIGONCM, TRIBUTACAO, GRUPO, TIPOPRODUTO, MARCA, CLIFOR, CLASSIFICACAO, CATEGORIAPRODUTO, UNCOMPRA, QTDECOMPRA, ' +
                'UNVENDA, QTDEVENDA, UNCARREGAMENTO, QTDECARREGAMENTO, NOME, BARRAS, DUN, PESOLIQUIDO, PESOBRUTO) VALUES '+
                '(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
  SQLEstoque := 'UPDATE ESTOQUE SET TRIBUTACAOPIS = %s, TRIBUTACAOCOFINS = %s, TRIBUTACAOIPI = %s WHERE PRODUTO = %s;';
  SQLEstoqueCambe := 'UPDATE ESTOQUE SET ATIVO = %s WHERE FILIAL = 3 AND PRODUTO = %s;';
  SQLProdutoClifor := 'INSERT INTO PRODUTOCLIFOR (PRODUTO, CLIFOR, CODIGORELACIONADO, QTDE, COMPRA, VENDA, CAMPOBUSCA) '+
                      'VALUES (%s, %s, %s, %s, %s, %s, %s);';
  AjustaGauge(InicioPlanilha, FimPlanilha);
  for I := InicioPlanilha to FimPlanilha do
    begin
      Codigo := Trim((Planilha.cells[i,cCodigo]));
      CodigoNcm := Trim((Planilha.cells[i,cCodigoNCM]));
      TributacaoICMS := Trim((Planilha.cells[i,cTributacaoICMS]));
      Grupo := Trim((Planilha.cells[i,cGrupo]));
      TipoProduto := Trim((Planilha.cells[i,cTipoProduto]));
      Marca := Trim((Planilha.cells[i,cMarca]));
      Clifor := Trim((Planilha.cells[i,cClifor]));
      Classificacao := Trim((Planilha.cells[i,cClassificacao]));
      Categoria := Trim((Planilha.cells[i,cCategoria]));
      TributacaoPis := Trim((Planilha.cells[i,cTributacaoPis]));
      TributacaoCofins := Trim((Planilha.cells[i,cTributacaoCofins]));
      TributacaoIPI := Trim((Planilha.cells[i,cTributacaoIPI]));
      UnCompra := Trim((Planilha.cells[i,cUnCompra]));
      QtdeCompra := Trim((Planilha.cells[i,cQtdeCompra]));
      UnVenda := Trim((Planilha.cells[i,cUnVenda]));
      QtdeVenda := Trim((Planilha.cells[i,cQtdeVenda]));
      UnCarga := Trim((Planilha.cells[i,cUnCarga]));
      QtdeCarga := Trim((Planilha.cells[i,cQtdeCarga]));
      CodigoRelacionado := Trim((Planilha.cells[i,cCodigoRelacionado]));
      NomeProduto := Trim((Planilha.cells[i,cNomeProduto]));
      EAN := Trim((Planilha.cells[i,cEAN]));
      DUN := Trim((Planilha.cells[i,cDUN]));
      PesoLiquido := StringReplace(Trim((Planilha.cells[i,cPesoLiquido])),',','.',[rfReplaceAll]);
      PesoBruto := StringReplace(Trim((Planilha.cells[i,cPesoBruto])),',','.',[rfReplaceAll]);


      ListBox1.Items.Add(Format(SQLProduto, [Codigo, QuotedStr(CodigoNCM), TributacaoICMS, Grupo, TipoProduto, Marca, Clifor, Classificacao, Categoria,
                        QuotedStr(UnCompra), QtdeCompra, QuotedStr(UnVenda), QtdeVenda, QuotedStr(UnCarga), QtdeCarga, QuotedStr(NomeProduto),
                        QuotedStr(EAN), QuotedStr(DUN), PesoLiquido, PesoBruto]));
      ListBox1.Items.Add(Format(SQLEstoque,[TributacaoPis, TributacaoCofins, TributacaoIPI, Codigo]));
      ListBox1.Items.Add(Format(SQLEstoqueCambe,[QuotedStr('N'), Codigo]));
      ListBox1.Items.Add(Format(SQLProdutoClifor,[Codigo, Clifor, QuotedStr(CodigoRelacionado), QtdeCompra, QuotedStr('S'), QuotedStr('N'), QuotedStr('cProd')]));
      Application.ProcessMessages;
      Gauge1.AddProgress(1);
    end;

end;

procedure TForm1.FecharPlanilha;
begin
  Excel.Quit;
end;

procedure TForm1.CarregarPlanilha;
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open('C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\Dinho\Alpargatas_Dinho.xlsx');
  Planilha := Excel.WorkSheets[1];
  InicioPlanilha := 2;
  FimPlanilha := 386;
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
            if st[j] = '&' then r := r + '&amp;' else
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
