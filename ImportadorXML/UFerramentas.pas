unit UFerramentas;

interface

uses
  DBClient, DBCtrls, Buttons, ExtCtrls, Classes, Controls, DB,
  SConnect, SysUtils, Forms, Windows, Registry, StdCtrls, Printers, Variants,
  WinSock, Menus, Graphics, ComObj, Dialogs, qrctrls, StrUtils, ACBRNFe, pcnNFe;

  function Numericos(st: string): string;
  // Mensagem de aviso mostrada ao usuário Btn(OK)
  procedure Aviso(Mens: String);
  // Define a mensagem que será mostrada ao usuário na tela(Erro, Confirmação...)
  function Mensagem(Mens, Titulo: String; Tipo: byte): byte;
  // Mensagem de confirmação mostrada ao usuário Btn(OK / Cancelar)
  function Confirma(Mens: String; Default: boolean = True): boolean;
  function ConfirmaDN(Mens: String): boolean;
  //Mascarar CNPJ
  function MascaraCnpj(cnpj: string):String;
  //Mascarar CPF
  function MascaraCpf(cpf: string):String;
  Procedure Open_SQL(cds: TClientDataSet; SQL: String); overload;
  function GravarMaster(Tabela: TClientDataSet; UndoLastChange: Boolean; Mensagem:String; ARaiseException : boolean = false):Boolean;
  // Retorna se a tabela esta em modo de edição ou inserção
  function  State_Insert(Tabela: TDataSet):Boolean;
  function Substituir(str:string; compara, troca:Char):string;
  procedure calcula_PercentualValor(tab: TClientDataSet; Percentual, Valor: String; total: Real; tipo: Char);
  function ObterXML(NomeXML:String): WideString;
  function GetInfAdicional(AobsContCollection : TobsContCollection; ACampo : String) : String;
  function Novo_Codigo(Tabela, Filial: OleVariant): OleVariant; safecall;
  procedure Executar_SQL(SQL: OleVariant);safecall;
  function TratarCaracteresEsteciais(st: string):string;
  function QuotedFirebirdDate(ADate: TDateTime):String;overload;
  function GetValorPerc(ATotal : Double; APerc : Double) : Double;

implementation

uses uDMDados, UData;

function GetValorPerc(ATotal : Double; APerc : Double) : Double;
begin
  Result := ATotal * (1 - (APerc / 100));
end;

function QuotedFirebirdDate(ADate: TDateTime):String;overload;
begin
  Result := TData.AsQuotedFirebirdDate(ADate);
end;

function TratarCaracteresEsteciais(st: string):string;
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
            if st[j] = 'º' then r := r + 'o' else
            if st[j] = '°' then r := r + 'o' else
            if st[j] = 'ª' then r := r + 'a' else
            if st[j] = '/' then r := r + '-' else
            if st[j] = '<' then r := r + '&lt;' else
            if st[j] = '>' then r := r + '&gt;' else
            if st[j] = '&' then r := r + '&amp;' else
            if st[j] = '"' then r := r + '&quot;' else
            if st[j] = '''' then r := r + '&#39;' else
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


function Numericos(st: string): string;
const
  Nums = ['0' .. '9'];
var
  i: integer;
  r: String;
begin
  r := '';
  If length(st) > 0 then
    For i := 0 to length(st) do
      if st[i] in Nums then
        r := r + st[i];
  result := r;
end;

procedure Aviso(Mens: String);
begin
  Mensagem(Mens, 'Aviso', 1);
end;

function Mensagem(Mens, Titulo: String; Tipo: byte): byte;
var
  Botoes: integer;
begin
  Botoes := mb_Ok;
  case Tipo of
    0:      Botoes := Mb_YesNo + mb_IconQuestion;
    1:      Botoes := mb_Ok + mb_IconExclamation;
    2:      Botoes := mb_Ok + mb_IconStop;
    3:      Botoes := mb_Ok + mb_IconInformation;
    4:      Botoes := Mb_YesNoCancel + mb_IconQuestion;
    5:      Botoes := Mb_YesNo + mb_IconQuestion + MB_DEFBUTTON2;
  end;
  result := Application.MessageBox(PChar(Mens), PChar(Titulo), Botoes);
end;

function Confirma(Mens: String; Default: boolean): boolean;
begin
  if Default then
    result := Mensagem(Mens, 'Confirmação', 0) = IDYES
  else
    result := Mensagem(Mens, 'Confirmação', 5) = IDYES
end;

function ConfirmaDN(Mens: String): boolean;
begin
  result := MessageDlg(Mens, mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrYes;
end;

function MascaraCnpj(cnpj: string): String;
begin
  cnpj := Numericos(cnpj);
  result := cnpj[1] + cnpj[2] + '.' + cnpj[3] + cnpj[4] + cnpj[5] + '.' + cnpj
    [6] + cnpj[7] + cnpj[8] + '/' + cnpj[9] + cnpj[10] + cnpj[11] + cnpj[12]
    + '-' + cnpj[13] + cnpj[14];
end;

function MascaraCpf(cpf: string): String;
begin
  cpf := Numericos(cpf);
  result := cpf[1] + cpf[2] + cpf[3] + '.' + cpf[4] + cpf[5] + cpf[6]
    + '.' + cpf[7] + cpf[8] + cpf[9] + '-' + cpf[10] + cpf[11];
end;

Procedure Open_SQL(cds: TClientDataSet; SQL: String);
begin
  cds.Close;
  cds.DataRequest(SQL);
  cds.Open;
end;

function GravarMaster(Tabela: TClientDataSet; UndoLastChange: Boolean; Mensagem:String; ARaiseException : boolean) : Boolean;
Var
   Erros: Integer;
 begin
   if State_Insert(Tabela) then
   begin
     Tabela.Post;
     Erros := Tabela.ApplyUpdates(-1);
     if Erros <> 0 then
     begin
       if UndoLastChange then
       begin
         Tabela.UndoLastChange(True)
       end
       else
         Tabela.Edit;
       if ARaiseException then
         raise Exception.Create(Mensagem)
       else
         Aviso(Mensagem);
       result := false;
     end
     else
       result := True;
   end
   else
     result := True;
 end;

 function State_Insert(Tabela: TDataSet): Boolean;
begin
  Result := (Tabela.State in [dsEdit,dsInsert]) or Tabela.Modified;
end;

function Substituir(str: string; compara, troca: Char): string;
var
  i: integer;
begin
  If length(str) > 0 then
    For i := 0 to length(str) do
      if str[i] = compara then
        str[i] := troca;
  result := str;
end;

procedure calcula_PercentualValor(tab: TClientDataSet;
  Percentual, Valor: String; total: Real; Tipo: Char);
var
  Indice, Val: Real;
begin
  if Tipo = 'V' then
  begin
    with tab do
      if FieldByName(Percentual).IsNull then
      begin
        FieldByName(Percentual).AsFloat := 0;
        FieldByName(Valor).AsFloat := 0;
      end
      else
      begin
        Indice := 1 - (FieldByName(Percentual).Value / 100);
        // FieldByName(valor).AsFloat := Total - (Total * Indice);
        FieldByName(Valor).AsString := FormatFloat('0.00',
          (total - (total * Indice)));
      end;
  end
  else
  begin
    with tab do
      if (FieldByName(Valor).IsNull) or (FieldByName(Valor).Value = 0) then
      begin
        FieldByName(Percentual).AsFloat := 0;
        FieldByName(Valor).AsFloat := 0;
      end
      else
      begin
        Val := FieldByName(Valor).Value;
        if total > 0 then
          FieldByName(Percentual).AsFloat := (100 * Val) / total
        else
          FieldByName(Percentual).AsFloat := 0;
      end;
  end;
end;

function ObterXML(NomeXML: String): WideString;
Var
   xml : File;
   NumRead, i: integer;
   buf: Char;
   S: WideString;
   F: TStringList;
 begin
   result := '';
   if FileExists(NomeXML) then
   begin
     F := TStringList.Create;
     F.LoadFromFile(NomeXML);
     S := F.GetText;
     result := S;
   end;
 end;

function GetInfAdicional(AobsContCollection: TobsContCollection; ACampo: String): String;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to AobsContCollection.Count - 1 do
    if UpperCase(AobsContCollection.Items[I].xCampo) = UpperCase(ACampo) then
      Result := AobsContCollection.Items[I].xTexto;
end;

function Novo_Codigo(Tabela, Filial: OleVariant): OleVariant;
var
   Tab, Sql, Fil: String;
   Proximo, F: Integer;
begin
  try
    F := Filial;
  except
    F := 0;
  end;
  tab := QuotedStr(AnsiUpperCase(String(Tabela)));
  if F > 0 then
    Fil := ' AND FILIAL = ' + QuotedStr(IntToStr(F))
  else
    Fil := '';
  SQL := 'SELECT FIRST 10 *  FROM CODIGO WHERE TABELA = ' + tab + Fil + ' ORDER BY CODIGO';
  try
    DMDados.QueryGeral.Close;
    Open_SQL(DmDados.cdQueryGeral, SQL);
    DMDados.cdQueryGeral.Open;
    DMDados.cdQueryGeral.Last;
    case DMDados.cdQueryGeral.RecNo of
      0:
        begin
          result := 1;
          SQL := 'INSERT INTO CODIGO(TABELA, CODIGO) VALUES(' + tab + ', 2)';
          if F > 0 then
            SQL :=
              'INSERT INTO CODIGO(TABELA, CODIGO, FILIAL) VALUES(' +
              tab + ', 2, ' + IntToStr(F) + ')';
        end;
      1:
        begin
          result := DMDados.cdQueryGeral.FieldByName('CODIGO').AsInteger;
          Proximo := DMDados.cdQueryGeral.FieldByName('CODIGO').AsInteger;
          Inc(Proximo);
          SQL := 'UPDATE CODIGO SET CODIGO = ' + IntToStr(Proximo)
            + ' WHERE TABELA = ' + tab;
          if F > 0 then
            SQL := 'UPDATE CODIGO SET CODIGO = ' + IntToStr(Proximo)
              + ' WHERE TABELA = ' + tab + Fil;
        end;
    else
      begin
        DMDados.cdQueryGeral.First;
        result := DMDados.cdQueryGeral.FieldByName('CODIGO').AsInteger;
        Proximo := DMDados.cdQueryGeral.FieldByName('CODIGO').AsInteger;
        SQL := 'DELETE FROM CODIGO WHERE TABELA = ' + tab + ' AND CODIGO = ' +
          IntToStr(Proximo);
        if F > 0 then
          SQL := 'DELETE FROM CODIGO WHERE TABELA = ' + tab +
            ' AND CODIGO = ' + IntToStr(Proximo) + Fil;
      end;
    end;
    DMDados.cdQueryGeral.Close;
    Executar_SQL(SQL);
  Except
  end;
end;

procedure Executar_SQL(SQL: OleVariant);
begin
  try
    DMDados.QueryGeral.Close;
    DMDados.QueryGeral.SQL.Text := SQL;
    DMDados.QueryGeral.ExecSQL;
    DMDados.QueryGeral.Close;
  except
    DMDados.QueryGeral.Close;
  end;
end;

end.
