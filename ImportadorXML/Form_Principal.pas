unit Form_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, FileCtrl, ExtCtrls, xmldom, XMLIntf,
  msxmldom, XMLDoc, Gauges, DbxFirebird, DBClient, DB;

type
  TFormPrincipal = class(TForm)
    XMLDocument: TXMLDocument;
    PageControlSepararXML: TPageControl;
    TabSheetImportaXMLNFe: TTabSheet;
    Gauge1: TGauge;
    rgOrigem: TRadioGroup;
    FileListBoxNFe: TFileListBox;
    Button1: TButton;
    sbCan: TButton;
    Button3: TButton;
    RGServico: TRadioGroup;
    RGAtualizada: TRadioGroup;
    RGImpressa: TRadioGroup;
    Memo1: TMemo;
    sbProc: TButton;
    sbInu: TButton;
    GroupBoxVerificaNF: TGroupBox;
    DateTimePickerData: TDateTimePicker;
    ButtonVerificarNFe: TButton;
    LabeledEditFilial: TLabeledEdit;
    LabeledEditTabelaPReco: TLabeledEdit;
    TabSheet3: TTabSheet;
    ListBoxSeparaArquivos: TListBox;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    TabSheetImportaXMLCTe: TTabSheet;
    Panel2: TPanel;
    CheckBoxSepararProc: TCheckBox;
    CheckBoxSepararInu: TCheckBox;
    CheckBoxSepararCan: TCheckBox;
    StaticText1: TStaticText;
    EditProc: TEdit;
    EditInu: TEdit;
    EditCan: TEdit;
    EditNumeracaoInicial: TEdit;
    EditNumeracaoFinal: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Gauge2: TGauge;
    Memo2: TMemo;
    FileListBoxCTe: TFileListBox;
    ButtonListarCTe: TButton;
    ButtonImportatCTe: TButton;
    ButtonProcCTe: TButton;
    ButtonCancCTe: TButton;
    ButtonInutCTe: TButton;
    TabSheetPrincipal: TTabSheet;
    Label4: TLabel;
    EditCaminhoOrigem: TEdit;
    Button4: TButton;
    Label1: TLabel;
    EditTXTCadastrados: TEdit;
    LabeledEditFilialCTe: TLabeledEdit;
    RGTipo: TRadioGroup;
    LabeledEditRemetenteInut: TLabeledEdit;
    LabeledEditNBSPadraoInut: TLabeledEdit;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbCanClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbProcClick(Sender: TObject);
    procedure sbInuClick(Sender: TObject);
    procedure ButtonVerificarNFeClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure ButtonProcCTeClick(Sender: TObject);
    procedure ButtonInutCTeClick(Sender: TObject);
    procedure ButtonListarCTeClick(Sender: TObject);
    procedure ButtonImportatCTeClick(Sender: TObject);
    procedure ButtonCancCTeClick(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
  private
    { Private declarations }
    function GetSqlValidadeItemNFEntrada(AcdItemNFEntrada : TClientDataSet; ALote : String; AValidade : TDate) : String;
    procedure VerificarCadastrarUnMedida(AUnidadeMedida: String);
  public
    function ImportarNFe(AArquivo : String): Boolean;
    procedure Somar;
    procedure Busca(diretorio, pesquisa: string; listaRetorno: Tlistbox);
    function GetNomeArquivo(CaminhoArquivoCompleto: String): String;
    function GetLocalTXTCadastrados: String;
    procedure ListarXML(FileListBox: TFileListBox);
    function ExtraiData(Data : String) : String;
  end;

var
  FormPrincipal: TFormPrincipal;
  Path, SQL, TipoCFOP, FormaPagamento, CondicaoPagamento, Servico, Origem,
  Atualizada, Impressa : String;
  CodigoProduto, Var_Filial: Integer;

implementation

uses uDMDados, ACBrNFe, pcnConversao, UClassNFe, UFerramentas, uClassEmitente,
  uClassDestinatario, UCTeImportacao, System.Types, System.StrUtils;

{$R *.dfm}

procedure TFormPrincipal.Busca(diretorio, pesquisa: string;
  listaRetorno: Tlistbox);
var
  S: String;
  nRet: Integer;
  Search: TSearchRec;
begin
  nRet := FindFirst(diretorio+'*.*',faAnyFile or faArchive or faDirectory,Search);
  while nRet = 0 do
  begin
    if (Trim(Search.Name)<>'.') and (Trim(Search.Name)<>'..') then
    begin
      { Se for um diretório, chama a função para percorrê-lo. }
      if Search.Attr and faDirectory > 0 then
        Busca(IncludeTrailingPathDelimiter(diretorio+Search.Name), pesquisa, listaRetorno)
      { pode-se fazer um if com pos para buscar extensões partes do nome e etc. }
      else
      if (Pos(Pesquisa, Trim(Search.Name)) > 0) and (Pos('-ped-can.xml', Trim(Search.Name)) = 0) then
        ListaRetorno.Items.Add(diretorio+Search.Name);
    end;
    nRet := FindNext(Search);
  end;
end;

procedure TFormPrincipal.Button1Click(Sender: TObject);
begin
  ListarXML(FileListBoxNFe);
  //FileListBoxNFe.FileName := 'C:\Users\Topsystem\Desktop\guilherme\Dados Clientes\ShareFoods\Notas share.xml';
end;

procedure TFormPrincipal.ButtonListarCTeClick(Sender: TObject);
begin
  ListarXML(FileListBoxCTe);
end;

procedure TFormPrincipal.sbCanClick(Sender: TObject);
var
  LACBrNFe : TACBrNFe;
  I: Integer;
   j : Integer;
   NodeCanc,infCanc : IXMLNode;
   Numero, Serie: String;
begin
  {inherited;
  gauge1.MaxValue := FileListBoxNFe.Count - 1;
  for j:=0 to FileListBoxNFe.Count - 1  do
  begin
    try
      XMLDocument.LoadFromFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
      NodeCanc := XMLDocument.DocumentElement.ChildNodes.Nodes[1].ChildNodes.Nodes[0];
      NodeCanc := XMLDocument.DocumentElement.ChildNodes['infCanc'];
      NodeCanc := XMLDocument.DocumentElement.ChildNodes['retEvento'].ChildNodes.FindNode('infEvento');
      NodeCanc := XMLDocument.DocumentElement.ChildNodes.FindNode('retCancNFe').ChildNodes.FindNode('infCanc');
    except
      NodeCanc := XMLDocument.DocumentElement.ChildNodes.FindNode('retEvento').ChildNodes.FindNode('infEvento');
    end;

    if (NodeCanc = nil) then Exit;

    Numero := Copy (NodeCanc.ChildNodes['chNFe'].Text, 26,9);
    Serie  := Copy (NodeCanc.ChildNodes['chNFe'].Text, 23,3);
    Open_SQL(DMDados.CDGeral, Format('SELECT * FROM NFE WHERE NFE.ORIGEM = ''P'' AND NFE.NUMERO = %s AND NFE.SERIE = %d AND NFE.CHAVEACESSO ='
            +QuotedStr(NodeCanc.ChildNodes['chNFe'].Text),[Numero, StrToInt(Serie)]));
    if (not DMDados.CDGeral.IsEmpty) then
    begin
      if  (DMDados.cdGeral.FieldByName('CANCCSTAT').IsNull) and
       ((NodeCanc.ChildNodes['cStat'].Text = '101') OR (NodeCanc.ChildNodes['cStat'].Text = '135') OR (NodeCanc.ChildNodes['cStat'].Text = '151')) then
      begin
        DMDados.CDGeral.Edit;
        DMDados.CDGeral.FieldByName('CANCCSTAT').AsString := NodeCanc.ChildNodes['cStat'].Text;
        if NodeCanc.ChildNodes['dhRecbto'].Text <> '' then
          DMDados.CDGeral.FieldByName('CANCDHRECBTO').AsString := NodeCanc.ChildNodes['dhRecbto'].Text
        else
        if NodeCanc.ChildNodes['dhRegEvento'].Text <> '' then
          DMDados.CDGeral.FieldByName('CANCDHRECBTO').AsString := NodeCanc.ChildNodes['dhRegEvento'].Text;
        DMDados.CDGeral.FieldByName('CANCNPROT').AsString := NodeCanc.ChildNodes['nProt'].Text;;
        DMDados.CDGeral.FieldByName('CANCXML').AsString := ObterXML(Path + '\' +FileListBoxNFe.Items.Strings[j]);
        GravarMaster(DMDados.CDGeral, True, 'Erro de Gravação!(NF-e)');
      end;
      DeleteFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
    end
    else
    begin
      Aviso('NF-e não encontrada: ' + NodeCanc.ChildNodes['chNFe'].Text);
    end;
    gauge1.AddProgress(1);
  end;
  Aviso ('Concluído.'); }


  // lendo arquivo com <procEventoNFe versao="3.10">
  inherited;
  gauge1.MaxValue := FileListBoxNFe.Count - 1;
  for j:=0 to FileListBoxNFe.Count - 1  do
  begin
    LACBrNFe := TACBrNFe.Create(nil);
    try
      LACBrNFe.EventoNFe.LerXML(Path + '\' +FileListBoxNFe.Items.Strings[j]);
      for I := 0 to (LACBrNFe.EventoNFe.Evento.Count - 1) do
      begin
        if LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.tpEvento = teCancelamento then
        begin
          Numero := Copy(LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.chNFe,29,6);
          Open_SQL(DMDados.CDGeral, Format('SELECT * FROM NFE WHERE NFE.ORIGEM = ''P'' AND NFE.CHAVEACESSO = %s AND NUMERO = %s', [QuotedStr(LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.chNFe), Numero]));

          if (not DMDados.CDGeral.IsEmpty) then
          begin
            if  (DMDados.cdGeral.FieldByName('CANCCSTAT').IsNull) and
             ((LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.cStat = 101) OR (LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.cStat = 135) OR (LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.cStat = 151)) then
            begin
              DMDados.CDGeral.Edit;
              DMDados.CDGeral.FieldByName('CANCCSTAT').AsInteger := LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.cStat;
              if LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.dhRegEvento <> null then
                DMDados.CDGeral.FieldByName('CANCDHRECBTO').AsDateTime := LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.dhRegEvento;
              DMDados.CDGeral.FieldByName('CANCNPROT').AsString := LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.nProt;
              DMDados.CDGeral.FieldByName('CANCXML').AsString := ObterXML(Path + '\' +FileListBoxNFe.Items.Strings[j]);
              GravarMaster(DMDados.CDGeral, True, 'Erro de Gravação!(NF-e)');
            end;
            DeleteFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
          end
          else
          begin
            Aviso('NF-e não encontrada: ' + LACBrNFe.EventoNFe.Evento.Items[I].RetInfEvento.chNFe);
          end;
        end;
      end;
    finally
      LACBrNFe.Free;
    end;
    gauge1.AddProgress(1);
  end;
  Aviso ('Concluído.');
end;

procedure TFormPrincipal.sbInuClick(Sender: TObject);
var
   j : Integer;
   NodeInu : IXMLNode;
begin
  inherited;
  gauge1.MaxValue := FileListBoxNFe.Count - 1;
  for j:=0 to FileListBoxNFe.Count - 1  do
  begin
    XMLDocument.LoadFromFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
    //NodeInu := XMLDocument.DocumentElement.ChildNodes['infInut'];
    NodeInu := XMLDocument.DocumentElement.ChildNodes.FindNode('retInutNFe').ChildNodes.FindNode('infInut');
    if (NodeInu = nil) then Exit;

    Open_SQL(DMDados.CDGeral,' SELECT * FROM NFE WHERE NFE.NUMERO ='+NodeInu.ChildNodes['nNFIni'].Text  +
                             ' AND NFE.SERIE = ' + QuotedStr(NodeInu.ChildNodes['serie'].Text));
    if not DMDados.CDGeral.IsEmpty then
    begin
      DMDados.CDGeral.Edit;
      DMDados.CDGeral.FieldByName('AUTORIZADA').AsString := 'N';
      DMDados.CDGeral.FieldByName('INUTCSTAT').AsString := NodeInu.ChildNodes['cStat'].Text;
      DMDados.CDGeral.FieldByName('INUTDHRECBTO').AsString := NodeInu.ChildNodes['dhRecbto'].Text;
      DMDados.CDGeral.FieldByName('INUTNPROT').AsString := NodeInu.ChildNodes['nProt'].Text;
      DMDados.CDGeral.FieldByName('INUTXML').AsString := ObterXML(Path + '\' +FileListBoxNFe.Items.Strings[j]);
      GravarMaster(DMDados.CDGeral, True, 'Erro de Gravação!(NF-e)');
      DeleteFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
    end
    else
    begin
      Aviso('NF-e não encontrada: ' + NodeInu.ChildNodes['chNFe'].Text);
    end;
    gauge1.AddProgress(1);
  end;
  Aviso ('Concluído.');
end;

procedure TFormPrincipal.Button3Click(Sender: TObject);
var
j: Integer;
begin
  Memo1.Clear;
  gauge1.MaxValue := FileListBoxNFe.Count - 1;
  for j:=0 to FileListBoxNFe.Count - 1  do
  begin
    if ImportarNFe(Path + '\' +FileListBoxNFe.Items.Strings[j]) then
      DeleteFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
    gauge1.AddProgress(1);
  end;
  Aviso('Concluído!');
end;

procedure TFormPrincipal.Button4Click(Sender: TObject);
begin
  try
    dmdados.ConexaoBanco(EditCaminhoOrigem.Text, True);
    ShowMessage('Banco conectado!');
  except
    raise;
  end;
end;

procedure TFormPrincipal.ButtonImportatCTeClick(Sender: TObject);
var
  j: Integer;
begin
  Memo1.Clear;
  gauge1.MaxValue := FileListBoxCTe.Count - 1;
  Var_Filial := StrToInt(LabeledEditFilialCTe.Text);
  for j:=0 to FileListBoxCTe.Count - 1  do
  begin
    if TCTeImportacao.Importar(Path + '\' +FileListBoxCTe.Items.Strings[j], Var_Filial) then
      DeleteFile(Path + '\' +FileListBoxCTe.Items.Strings[j]);
    gauge1.AddProgress(1);
  end;
  Aviso('Concluído!');
end;

procedure TFormPrincipal.ButtonProcCTeClick(Sender: TObject);
begin
  Aviso('Não Implementado.')
end;

procedure TFormPrincipal.ButtonCancCTeClick(Sender: TObject);
var
  j: Integer;
begin
  Memo1.Clear;
  gauge1.MaxValue := FileListBoxCTe.Count - 1;
  Var_Filial := StrToInt(LabeledEditFilialCTe.Text);
  for j:=0 to FileListBoxCTe.Count - 1  do
  begin
    if TCTeImportacao.GravarCancelamentoCTe (Path + '\' +FileListBoxCTe.Items.Strings[j], Var_Filial) then
      DeleteFile(Path + '\' +FileListBoxCTe.Items.Strings[j]);
    gauge1.AddProgress(1);
  end;
  Aviso('Concluído!');
end;

procedure TFormPrincipal.ButtonInutCTeClick(Sender: TObject);
var
   j : Integer;
   NodeInu : IXMLNode;
begin
  inherited;
  gauge1.MaxValue := FileListBoxCte.Count - 1;
  for j:=0 to FileListBoxCte.Count - 1  do
  begin
    XMLDocument.LoadFromFile(Path + '\' +FileListBoxCte.Items.Strings[j]);
    //NodeInu := XMLDocument.DocumentElement.ChildNodes['infInut'];
    NodeInu := XMLDocument.DocumentElement.ChildNodes.FindNode('retInutCTe').ChildNodes.FindNode('infInut');
    if (NodeInu = nil) then Exit;

    Open_SQL(DMDados.CDGeral,' SELECT * FROM CT WHERE CT.NUMERO ='+NodeInu.ChildNodes['nCTIni'].Text  +
                             ' AND CT.SERIE = ' + QuotedStr(NodeInu.ChildNodes['serie'].Text) +
                             ' AND CT.FILIAL = ' + LabeledEditFilialCTe.Text);
    if DMDados.cdGeral.IsEmpty then
    begin
      Open_SQL(DMDados.cdCTe, 'SELECT * FROM CT WHERE CT.NUMERO IS NULL');
      DMDados.cdCTe.Append;
      DMDados.cdCTeEMISSAO.AsDateTime := StrToDate(ExtraiData(Copy(NodeInu.ChildNodes['dhRecbto'].Text,0,10)));
      DMDados.cdCTeMODELO.AsInteger := StrToInt(NodeInu.ChildNodes['mod'].Text);
      DMDados.cdCTeSERIE.AsString := NodeInu.ChildNodes['serie'].Text;
      DMDados.cdCTeNUMERO.AsInteger := StrToInt(NodeInu.ChildNodes['nCTIni'].Text);
      DMDados.cdCTeFILIAL.AsInteger := StrToInt(LabeledEditFilialCTe.Text);
      DMDados.cdCTeREMETENTE.AsInteger := StrToInt(LabeledEditRemetenteInut.Text);
      DMDados.cdCTeDESTINATARIO.AsInteger := StrToInt(LabeledEditRemetenteInut.Text);
      DMDados.cdCTeNBS.AsInteger := StrToInt(LabeledEditNBSPadraoInut.Text);
      DMDados.cdCTeDATAPREVISTAENTREGA.AsDateTime := DMDados.cdCTeEMISSAO.AsDateTime;
      DMDados.cdCTeAUTORIZADO.AsString := 'N';
      DMDados.cdCTeINUTILIZADO.AsString := 'S';
      DMDados.cdCTeINUTNPROT.AsString := NodeInu.ChildNodes['nProt'].Text;
      DMDados.cdCTeINUTXML.AsString := ObterXML(Path + '\' +FileListBoxCte.Items.Strings[j]);
      if not GravarMaster(DMDados.cdCTe, true, 'Erro de gravação no CT-e.') then Abort;

    end
    else
    begin
      DMDados.CDGeral.Edit;
      DMDados.CDGeral.FieldByName('AUTORIZADO').AsString := 'N';
      DMDados.CDGeral.FieldByName('INUTILIZADO').AsString := 'S';
      DMDados.CDGeral.FieldByName('INUTNPROT').AsString := NodeInu.ChildNodes['nProt'].Text;
      DMDados.CDGeral.FieldByName('INUTXML').AsString := ObterXML(Path + '\' +FileListBoxCte.Items.Strings[j]);
      GravarMaster(DMDados.CDGeral, True, 'Erro de Gravação!(CT-e)');
    end;
    DeleteFile(Path + '\' +FileListBoxCte.Items.Strings[j]);
    gauge1.AddProgress(1);
  end;
  Aviso ('Concluído.');
end;

procedure TFormPrincipal.ButtonVerificarNFeClick(Sender: TObject);
var
ACBrNFe : TACBrNFe;
auxVersao: String;
begin
  SQL := Format(' SELECT * FROM NF '+
         ' INNER JOIN NFE ON NFE.NUMERO = NF.NUMERO AND NFE.FILIAL = NF.FILIAL AND NFE.SERIE = NF.SERIE AND NFE.ORIGEM = NF.ORIGEM AND NFE.CLIFOR = NF.CLIFOR '+
         ' WHERE NF.ORIGEM = %s AND NF.EMISSAO >= %s AND NFE.CSTAT = %s ',
         [QuotedStr('P'), QuotedStr(FormatDateTime('dd.mm.yyyy', DateTimePickerData.Date)), QuotedStr('100')]) ;
  Open_SQL(DmDados.CDPesquisa,SQL);
  gauge1.MaxValue := DmDados.CDPesquisa.RecordCount;
  DMDados.cdPesquisa.First;
  while not DMDados.cdPesquisa.Eof do
  begin
    try
      ACBrNFe := TACBrNFe.Create(nil);
      if (DMDados.cdPesquisa.FieldByName('XML').AsString <> '') then
      begin
        ACBrNFe.NotasFiscais.LoadFromString(DMDados.cdPesquisa.FieldByName('XML').AsString,true);
        auxVersao := copy(DMDados.cdPesquisa.FieldByName('XML').AsString,pos('versao=',DMDados.cdPesquisa.FieldByName('XML').AsString)+8,4);
        if auxVersao = '3.10' then
        begin
          if (DMDados.cdPesquisa.FieldByName('NUMERO').AsInteger <> ACBrNFe.NotasFiscais[0].NFe.Ide.nNF) then
            raise Exception.Create('Erro Número NF-e:' + DMDados.cdPesquisa.FieldByName('NUMERO').AsString);
          if (DMDados.cdPesquisa.FieldByName('NPROT').AsString <> ACBrNFe.NotasFiscais[0].NFe.procNFe.nProt) then
            raise Exception.Create('Erro Protocolo:' + DMDados.cdPesquisa.FieldByName('NUMERO').AsString);
          if (DMDados.cdPesquisa.FieldByName('CHAVEACESSO').AsString <> ACBrNFe.NotasFiscais[0].NFe.procNFe.chNFe) then
            raise Exception.Create('Erro Chave:' + DMDados.cdPesquisa.FieldByName('NUMERO').AsString);
        end;
        DMDados.cdPesquisa.Next;
        gauge1.AddProgress(1);
      end
      else
        raise Exception.Create('NF Autorizada sem XML:' + DMDados.cdPesquisa.FieldByName('NUMERO').AsString);
    finally
      ACBrNFe.Free;
    end;
  end;
  Aviso('Concluído');
end;

function TFormPrincipal.ExtraiData(Data: String): String;
var
  stringArray : TStringDynArray;
begin
  stringArray := SplitString(Data, '-');
  Result := stringArray[2] + '/' + stringArray[1] + '/' + stringArray[0];
end;

procedure TFormPrincipal.sbProcClick(Sender: TObject);
var
j, i: Integer;
NodeProt : IXMLNode;
ACBrNFe : TACBrNFe;
begin
{  gauge1.MaxValue := FileListBoxNFe.Count - 1;
  for j:=0 to FileListBoxNFe.Count - 1  do
  begin
    XMLDocument.LoadFromFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
    NodeProt := XMLDocument.DocumentElement.ChildNodes['protNFe'].ChildNodes.FindNode('infProt');
    if (NodeProt = nil) then Exit;

    Open_SQL(DMDados.CDGeral, 'SELECT * FROM NFE WHERE CHAVEACESSO = ' + QuotedStr(NodeProt.ChildNodes['chNFe'].Text));
    if not (DMDados.cdGeral.IsEmpty) then
    begin
      DMDados.CDGeral.Edit;
      DMDados.CDGeral.FieldByName('TPAMB').AsString := NodeProt.ChildNodes['tpAmb'].Text;
      DMDados.CDGeral.FieldByName('VERAPLIC').AsString := NodeProt.ChildNodes['verAplic'].Text;
      DMDados.CDGeral.FieldByName('DHRECBTO').AsString := NodeProt.ChildNodes['dhRecbto'].Text;
      DMDados.CDGeral.FieldByName('NPROT').AsString := NodeProt.ChildNodes['nProt'].Text;
      DMDados.CDGeral.FieldByName('DIGVAL').AsString := NodeProt.ChildNodes['digVal'].Text;
      DMDados.CDGeral.FieldByName('CSTAT').AsString := NodeProt.ChildNodes['cStat'].Text;
      DMDados.CDGeral.FieldByName('AUTORIZADA').AsString := 'S';
      GravarMaster(DMDados.CDGeral, True, 'Erro de Gravação!(NF-e)');
      DeleteFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
    end;
    {else
      Aviso('Sem registro de NF-e' + QuotedStr(NodeProt.ChildNodes['chNFe'].Text));
    gauge1.AddProgress(1);
  end;
  Aviso('Concluído!');}



  Gauge1.MaxValue := FileListBoxNFe.Count - 1;
  for j := 0 to FileListBoxNFe.Count - 1 do
  begin
    ACBrNFe := TACBrNFe.Create(nil);
    uClassNFE.TNFe.Create;
    try
      ACBrNFe.NotasFiscais.LoadFromFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
      for i := 0 to ACBrNFe.NotasFiscais.Count - 1 do
      begin
        Open_SQL(DMDados.CDGeral, Format('SELECT * FROM NFE WHERE NUMERO = %s AND SERIE = %s AND ORIGEM = %s',
        [IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.nNF), QuotedStr(IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.serie)), QuotedStr('P')]));
        if not (DMDados.cdGeral.IsEmpty) then
        begin
          DMDados.CDGeral.Edit;
          DMDados.CDGeral.FieldByName('CHAVEACESSO').AsString := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.chNFe;
          DMDados.CDGeral.FieldByName('TPAMB').AsString := TpAmbToStr(ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.tpAmb);
          DMDados.CDGeral.FieldByName('VERAPLIC').AsString := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.verAplic;
          DMDados.CDGeral.FieldByName('DHRECBTO').AsDateTime := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.dhRecbto;
          DMDados.CDGeral.FieldByName('NPROT').AsString := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.nProt;
          DMDados.CDGeral.FieldByName('DIGVAL').AsString := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.digVal;
          DMDados.CDGeral.FieldByName('CSTAT').AsString := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.cStat);
          DMDados.CDGeral.FieldByName('AUTORIZADA').AsString := 'S';
          DMDados.CDGeral.FieldByName('XML').AsString := ObterXML(Path + '\' +FileListBoxNFe.Items.Strings[j]);
          DMDados.CDGeral.FieldByName('PROTXML').AsString := ObterXML(Path + '\' +FileListBoxNFe.Items.Strings[j]);
          GravarMaster(DMDados.CDGeral, True, 'Erro de Gravação!(NF-e)');
          DeleteFile(Path + '\' +FileListBoxNFe.Items.Strings[j]);
        end
        else
          Aviso('Sem registro de NF-e' + ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.chNFe);
      end;
      gauge1.AddProgress(1);
    finally
      ACBrNFe.Free
    end;
  end;
  Aviso('Concluído!');
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
//  Button4Click(self);
end;

function TFormPrincipal.GetLocalTXTCadastrados: String;
var
  ANomeDiretorio: String;
begin
  ANomeDiretorio := EditTXTCadastrados.Text;
  if not DirectoryExists(ANomeDiretorio) then
    ForceDirectories(ANomeDiretorio);
  Result := ANomeDiretorio;
end;

function TFormPrincipal.GetNomeArquivo(CaminhoArquivoCompleto: String): String;
var
i: Integer;
Nome: String;
begin
  Nome := '';
  for I := 0 to Length(CaminhoArquivoCompleto) - 1 do
  begin
    if Copy(CaminhoArquivoCompleto, Length(CaminhoArquivoCompleto)- i) <> ('\'+Nome) then
      Nome := Copy(CaminhoArquivoCompleto, Length(CaminhoArquivoCompleto)- i)
    else
      Break;
  end;
  Result := Nome;
end;

function TFormPrincipal.GetSqlValidadeItemNFEntrada(
  AcdItemNFEntrada: TClientDataSet; ALote: String; AValidade: TDate): String;
begin
  Result := 'SELECT * FROM VALIDADEITEMNF ' +
            ' WHERE                       ' +
            '     NUMERO = %s             ' +
            ' AND SERIE = ''%s''          ' +
            ' AND FILIAL = %s             ' +
            ' AND ORIGEM = ''%s''         ' +
            ' AND CLIFOR = %s             ' +
            ' AND PRODUTO = %s            ' +
            ' AND ITEM = %s               ' +
            ' AND LOTE = ''%s''           ' +
            ' AND VALIDADE = %s           ';
  Result := Format(Result,[AcdItemNFEntrada.FieldByName('NUMERO').AsString,
                           AcdItemNFEntrada.FieldByName('SERIE').AsString,
                           AcdItemNFEntrada.FieldByName('FILIAL').AsString,
                           AcdItemNFEntrada.FieldByName('ORIGEM').AsString,
                           AcdItemNFEntrada.FieldByName('CLIFOR').AsString,
                           AcdItemNFEntrada.FieldByName('PRODUTO').AsString,
                           AcdItemNFEntrada.FieldByName('ITEM').AsString,
                           ALote,
                           QuotedFirebirdDate(AValidade)]);
end;

function TFormPrincipal.ImportarNFe(AArquivo: String): Boolean;
var
ACBrNFe : TACBrNFe;
Emitente : TEmit;
Destinatario : TDest;
i, Index, Fornecedor, Transportador, Produto: Integer;
ChaveAcesso, NomeFornecedor, Condicao, CodigoRelacionado: String;
isFilial : Boolean;

Procedure CarregarDadosEmitente;
begin
  Emitente                     := TEmit.Create;
  if Origem = 'T' then
  begin
    Emitente.CNPJ              := MascaraCnpj(ACBrNFe.NotasFiscais.Items[I].NFe.Emit.CNPJCPF);
    Emitente.xNome             := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.xNome;
    Emitente.xFant             := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.xFant;
    Emitente.IE                := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.IE;
    Emitente.enderEmit.xLgr    := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.xLgr;
    Emitente.enderEmit.nro     := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.nro;
    Emitente.enderEmit.xCpl    := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.xCpl;
    Emitente.enderEmit.xBairro := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.xBairro;
    Emitente.enderEmit.cMun    := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.cMun);
    Emitente.enderEmit.xMun    := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.xMun;
    Emitente.enderEmit.UF      := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.UF;
    Emitente.enderEmit.CEP     := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.CEP);
    Emitente.enderEmit.cPais   := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.cPais);
    Emitente.enderEmit.xPais   := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.xPais;
    Emitente.enderEmit.fone    := ACBrNFe.NotasFiscais.Items[I].NFe.Emit.EnderEmit.fone;
  end
  else
  begin
    Destinatario  := TDest.Create;
    if Length(ACBrNFe.NotasFiscais.Items[I].NFe.Dest.CNPJCPF) = 11 then
      Emitente.CNPJ            := MascaraCPF(ACBrNFe.NotasFiscais.Items[I].NFe.Dest.CNPJCPF)
    else
      Emitente.CNPJ            := MascaraCnpj(ACBrNFe.NotasFiscais.Items[I].NFe.Dest.CNPJCPF);
    Emitente.xNome             := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.xNome;
    Emitente.xFant             := '';
    Emitente.IE                := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.IE;
    Emitente.enderEmit.xLgr    := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.xLgr;
    Emitente.enderEmit.nro     := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.nro;
    Emitente.enderEmit.xCpl    := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.xCpl;
    Emitente.enderEmit.xBairro := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.xBairro;
    Emitente.enderEmit.cMun    := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.cMun);
    Emitente.enderEmit.xMun    := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.xMun;
    Emitente.enderEmit.UF      := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.UF;
    Emitente.enderEmit.CEP     := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.CEP);
    Emitente.enderEmit.cPais   := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.cPais);
    Emitente.enderEmit.xPais   := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.xPais;
    Emitente.enderEmit.fone    := ACBrNFe.NotasFiscais.Items[I].NFe.Dest.EnderDest.fone;
  end;
end;

procedure CadastrarEmitente;
var
Arquivo: TextFile;
NomeArquivoGrava: String;
begin
  Open_SQL(DMDados.cdCliFor, 'SELECT * FROM CLIFOR WHERE CLIFOR.CODIGO IS NULL');
  DMDados.cdCliFor.Append;
  DMDados.cdCliFor.FieldByName('CNPJ').AsString        := Emitente.CNPJ;
  DMDados.cdCliFor.FieldByName('NOME').AsString        := AnsiUpperCase(Emitente.xNome);
  DMDados.cdCliFor.FieldByName('FANTASIA').AsString    := AnsiUpperCase(Emitente.xFant);
  DMDados.cdCliFor.FieldByName('IE').AsString          := Emitente.IE;
  DMDados.cdCliFor.FieldByName('ENDERECO').AsString    := AnsiUpperCase(Emitente.enderEmit.xLgr);
  DMDados.cdCliFor.FieldByName('NUMERO').AsString      := Emitente.enderEmit.nro;
  DMDados.cdCliFor.FieldByName('COMPLEMENTO').AsString := AnsiUpperCase(Emitente.enderEmit.xCpl);
  DMDados.cdCliFor.FieldByName('CEP').AsString         := Emitente.enderEmit.CEP;
  //Inicio Bairro
  SQL := 'SELECT BAIRRO.CODIGO FROM BAIRRO WHERE BAIRRO.NOME = '+QuotedStr(AnsiUpperCase(Emitente.enderEmit.xBairro));
  Open_SQL(DMDados.CDPesquisa, SQL);
  if DMDados.CDPesquisa.IsEmpty then
  begin
    DMDados.cdBairro.Open;
    DMDados.cdBairro.Append;
    DMDados.cdBairro.FieldByName('NOME').AsString := AnsiUpperCase(Emitente.enderEmit.xBairro);
    if not GravarMaster(DmDados.cdBairro, true, '110 - Erro ao cadastrar bairro.') then
    begin
       DMDados.cdBairro.Close;
       Abort;
    end;
    Open_SQL(DMDados.CDPesquisa, SQL);
  end;
  if DMDados.CDPesquisa.IsEmpty then
  begin
    Aviso('111 - Bairro não cadastrado.');
    Abort;
  end;
  DMDados.cdCliFor.FieldByName('BAIRRO').AsString := DMDados.CDPesquisa.FieldByName('CODIGO').AsString;
  //Inicio Cidade
  SQL := 'SELECT CIDADE.CODIGO FROM CIDADE WHERE CIDADE.CODIGOFISCAL = '+QuotedStr(Emitente.enderEmit.cMun);
  Open_SQL(DMDados.CDPesquisa, SQL);
  if DMDados.CDPesquisa.IsEmpty then
  begin
    DMDados.cdCidade.Open;
    DMDados.cdCidade.Append;
    DMDados.cdCidade.FieldByName('NOME').AsString := AnsiUpperCase(Emitente.enderEmit.xMun);
    DMDados.cdCidade.FieldByName('CODIGOFISCAL').AsString := Emitente.enderEmit.cMun;
    DMDados.cdCidade.FieldByName('ESTADO').AsString := Copy(Emitente.enderEmit.cMun,0,2);
    if not GravarMaster(DMDados.cdCidade, true, '120 - Erro ao cadastrar município.') then
    begin
       DMDados.cdCidade.Close;
       Abort;
    end;
    Open_SQL(DMDados.CDPesquisa, SQL);
  end;
  if DMDados.CDPesquisa.IsEmpty then
  begin
    Aviso('121 - Município não cadastrado.');
    Abort;
  end;
  DMDados.cdCliFor.FieldByName('CIDADE').AsString := DmDados.CDPesquisa.FieldByName('CODIGO').AsString;
  if not GravarMaster(DMDados.cdCliFor, true, '130 - Erro ao cadastrar fornecedor.') then
  begin
    Abort;
  end else
  begin
    if Emitente.enderEmit.fone <> '' then
    begin
     DMDados.cdCliforContato.Open;
     DMDados.cdCliforContato.Append;
     DMDados.cdCliforContato.FieldByName('CLIFOR').AsString := DMDados.cdCliFor.FieldByName('CODIGO').AsString;
     DMDados.cdCliforContato.FieldByName('NUMERO').AsString:= Emitente.enderEmit.fone;
     GravarMaster(DMDados.cdCliforContato, true, '140 - Erro ao cadastrar telefone.');
    end;
  end;
  try
    NomeArquivoGrava := GetLocalTXTCadastrados + 'ClientesCadastrados.txt';
    AssignFile(Arquivo, NomeArquivoGrava);
    if not FileExists (NomeArquivoGrava) then
      Rewrite(Arquivo)
    else
      Append(Arquivo);
    Writeln(Arquivo, AnsiUpperCase(Emitente.xNome) + '-' + DMDados.cdCliFor.FieldByName('CNPJ').AsString);
  finally
    CloseFile(Arquivo);
  end;
end;

Function CadastrarTipoCFOP: String;
var
Arquivo: TextFile;
NomeArquivoGrava: String;
begin
  Open_SQL(DMDados.cdTipoCFOP, 'SELECT * FROM TIPOCFOP WHERE CODIGO IS NULL');
  DMDados.cdTipoCFOP.Append;
  DMDados.cdTipoCFOP.FieldByName('NOME').AsString := QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.natOp);
  Result := DMDados.cdTipoCFOP.FieldByName('CODIGO').AsString;
  GravarMaster(DMDados.cdTipoCFOP, false, '200 - Erro ao cadastrar TipoCFOP.', True);
  try
    NomeArquivoGrava := GetLocalTXTCadastrados + 'TipoCFOPCadastrados.txt';
    AssignFile(Arquivo, NomeArquivoGrava);
    if not FileExists (NomeArquivoGrava) then
      Rewrite(Arquivo)
    else
      Append(Arquivo);
    Writeln(Arquivo, (ACBrNFe.NotasFiscais.Items[I].NFe.Ide.natOp));
  finally
    CloseFile(Arquivo);
  end;
end;

Function CadastrarCFOP(CFOP: String): String;
var
Arquivo: TextFile;
NomeArquivoGrava: String;
begin
  Open_SQL(DMDados.cdCFOP, 'SELECT * FROM CFOP WHERE CODIGO IS NULL');
  DMDados.cdCFOP.Append;
  DMDados.cdCFOP.FieldByName('TIPOCFOP').AsString := TipoCFOP;
  DMDados.cdCFOP.FieldByName('NOME').AsString := CFOP;
  DMDados.cdCFOP.FieldByName('CFOP').AsString := CFOP;
  Result := DMDados.cdCFOP.FieldByName('CODIGO').AsString;
  GravarMaster(DMDados.cdCFOP, false, '200 - Erro ao cadastrar CFOP.', True);
  try
    NomeArquivoGrava := GetLocalTXTCadastrados + 'CFOPCadastrados.txt';
    AssignFile(Arquivo, NomeArquivoGrava);
    if not FileExists (NomeArquivoGrava) then
      Rewrite(Arquivo)
    else
      Append(Arquivo);
    Writeln(Arquivo, (CFOP));
  finally
    CloseFile(Arquivo);
  end;
end;

procedure CadastrarProdutoVinculado(vProduto: integer);
begin
  Open_SQL(DMDados.cdProdutoClifor, 'SELECT * FROM PRODUTOCLIFOR WHERE PRODUTOCLIFOR.PRODUTO IS NULL');
  DMDados.cdProdutoClifor.Append;
  DMDados.cdProdutoClifor.FieldByName('PRODUTO').AsInteger := vProduto;
  DMDados.cdProdutoClifor.FieldByName('CLIFOR').AsInteger  := Fornecedor;
  DMDados.cdProdutoClifor.FieldByName('CODIGORELACIONADO').AsString := ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cProd;
  DMDados.cdProdutoClifor.FieldByName('QTDE').AsFloat := 1;
  DMDados.cdProdutoClifor.FieldByName('COMPRA').AsString  := 'S';
  DMDados.cdProdutoClifor.FieldByName('VENDA').AsString  := 'N';
  DMDados.cdProdutoClifor.FieldByName('CAMPOBUSCA').AsString  := 'cProd';
  GravarMaster(DMDados.cdProdutoClifor, false, '200 - Erro ao cadastrar código relacionado.');
end;

procedure CadastrarProduto;
const
  AMsgConfirmacao = 'Deseja cancelar o cadastro do produto?';
  AMsgAbort = 'Importe o xml novamente.';
var
   CodProduto: Integer;
   Arquivo : TextFile;
   NomeArquivoGrava: String;
begin

  VerificarCadastrarUnMedida(AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.uCom));
  VerificarCadastrarUnMedida(AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.uTrib));

  // Valida se não possui cadastro para o código e barras
  if ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cEAN <> '' then
  begin
    Open_SQL(DMDados.CDPesquisa, 'SELECT * FROM PRODUTO WHERE PRODUTO.BARRAS = ' + QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cEAN));
    if not DMDados.CDPesquisa.IsEmpty then
    begin
      if Confirma('O Código de barras do produto ' +#13+
           DMDados.CDPesquisa.FieldByName('CODIGO').AsString + ' - ' + DMDados.CDPesquisa.FieldByName('NOME').AsString +#13+
           'é igual ao código de barras do produto do xml.' +#13+
           'Deseja criar um registro de vinculo na guia "códigos relacionados" para o produto?') then
        CadastrarProdutoVinculado(DMDados.CDPesquisa.FieldByName('CODIGO').AsInteger);
      CodigoProduto := DMDados.CDPesquisa.FieldByName('CODIGO').AsInteger;
      Aviso('Importe o xml novamente.');
      Abort;
    end;
  end;
  Open_SQL(DMDados.cdProduto, 'SELECT * FROM PRODUTO WHERE PRODUTO.CODIGO IS NULL');
  DMDados.cdProduto.Append;
  DMDados.cdProduto.FieldByName('CODIGO').AsString := ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cProd;
  if ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cEAN <> '' then
  begin
     if StringReplace(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cEAN, '0', '', [rfReplaceAll]) <> '' then
        DMDados.cdProdutoBARRAS.AsString := ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cEAN else
        DMDados.cdProdutoBARRAS.AsString := DMDados.cdProdutoCODIGO.AsString;
  end else
     DMDados.cdProdutoBARRAS.AsString := DMDados.cdProdutoCODIGO.AsString;
  CodigoRelacionado                          := ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cProd;
  CodProduto                                 := DMDados.cdProdutoCODIGO.AsInteger;
  DMDados.cdProdutoNOME.AsString             := AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.xProd);
  DMDados.cdProdutoUNCOMPRA.AsString         := AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.uCom);
  DMDados.cdProdutoUNCARREGAMENTO.AsString   := AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.uCom);
  DMDados.cdProdutoUNVENDA.AsString          := AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.uTrib);
  DMDados.cdProdutoUNTROCA.AsString          := AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.uTrib);
  DMDados.cdProdutoCODIGOFORNECEDOR.AsString := ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cProd;
  DMDados.cdProdutoCODIGONCM.AsString        := ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.NCM;
  DMDados.cdProdutoCLIFOR2.AsInteger         := Fornecedor;

  DMDados.cdProdutoGRUPO.AsInteger := 1;
  DMDados.cdProdutoTRIBUTACAO.AsInteger := 1;

  DMDados.cdProdutoQTDEMULTIPLA.AsInteger := 1;
  DMDados.cdProdutoPESOEMBALAGEM.AsFloat  := 0;
  if not GravarMaster(DMDados.cdProduto, true, '200 - Erro ao cadastrar produto.') then
    Abort
  // Seta o campo Controlar Lote da tabela Estoque
  else
  {if ControlarLote then
  begin
    Open_SQL(DMDados.cdEstoque, 'SELECT * FROM ESTOQUE WHERE PRODUTO = ' + IntToStr(CodProduto) + ' AND FILIAL = ' + IntToStr(Var_Filial));
    DMDados.cdEstoque.Edit;
    DMDados.cdEstoqueCONTROLARLOTEVALIDADE.AsString := 'S';
    if not GravarMaster(DMDados.cdEstoque, true, '200 - Erro ao setar informação na tabela Estoque.') then
       Abort;
  end;
  Open_SQL(DMDados.cdEstoque, 'SELECT * FROM ESTOQUE WHERE PRODUTO = ' + IntToStr(CodProduto) + ' AND FILIAL = ' + IntToStr(Var_Filial));
  DMDados.cdEstoque.Edit;

  DMDados.cdEstoqueTRIBUTACAOPIS.AsInteger := TPesquisasUtils.GetValor(Ajustar_Pesquisa.TributacaoPIS,'CODIGO',AMsgAbort,AMsgConfirmacao,'Tributação informada é inválida.');
  if not GravarMaster(DMDados.cdEstoque, true, '200 - Erro ao setar informação na tabela Estoque.') then
    Abort;

  Open_SQL(DMDados.cdEstoque, 'SELECT * FROM ESTOQUE WHERE PRODUTO = ' + IntToStr(CodProduto) + ' AND FILIAL = ' + IntToStr(Var_Filial));
  DMDados.cdEstoque.Edit;

  DMDados.cdEstoqueTRIBUTACAOCOFINS.AsInteger := TPesquisasUtils.GetValor(Ajustar_Pesquisa.TributacaoCOFINS,'CODIGO',AMsgAbort,AMsgConfirmacao,'Tributação informada é inválida.');
  if not GravarMaster(DMDados.cdEstoque, true, '200 - Erro ao setar informação na tabela Estoque.') then
    Abort;

  if Industria then
  begin
    Open_SQL(DMDados.cdEstoque, 'SELECT * FROM ESTOQUE WHERE PRODUTO = ' + IntToStr(CodProduto) + ' AND FILIAL = ' + IntToStr(Var_Filial));
    DMDados.cdEstoque.Edit;
    DMDados.cdEstoqueTRIBUTACAOIPI.AsInteger := TPesquisasUtils.GetValor(Ajustar_Pesquisa.TributacaoIPI,'CODIGO',AMsgAbort,AMsgConfirmacao,'Tributação informada é inválida.');
    if not GravarMaster(DMDados.cdEstoque, true, '200 - Erro ao setar informação na tabela Estoque.') then
        Abort;
  end; }

  //CadastrarProdutoVinculado(DMDados.cdProdutoCODIGO.AsInteger);
  CodigoProduto := DMDados.cdProdutoCODIGO.AsInteger;
  try
    NomeArquivoGrava := GetLocalTXTCadastrados + 'ProdutosCadastrados.txt';
    AssignFile(Arquivo, NomeArquivoGrava);
    if not FileExists (NomeArquivoGrava) then
      Rewrite(Arquivo)
    else
      Append(Arquivo);
    Writeln(Arquivo, IntToStr(CodigoProduto) + '-' + ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.xProd);
  finally
    CloseFile(Arquivo);
  end;
end;

procedure CadastrarTransportador;
Var
   strMunicipio, strEstado: String;
   Flag: Boolean;
   Arquivo : TextFile;
   NomeArquivoGrava: String;
begin
     Open_SQL(DMDados.cdTransportador, 'SELECT * FROM TRANSPORTADOR WHERE TRANSPORTADOR.CODIGO IS NULL');
     DMDados.cdTransportador.Append;
     if Length(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF) = 11 then
        DMDados.cdTransportadorCNPJ.AsString  := MascaraCPF(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF) else
        DMDados.cdTransportadorCNPJ.AsString  := MascaraCnpj(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF);
     DMDados.cdTransportadorNOME.AsString     := AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.xNome);
     DMDados.cdTransportadorIE.AsString       := ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.IE;
     DMDados.cdTransportadorENDERECO.AsString := AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.xEnder);
     if (ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.xMun = '') then
     begin
        DMDados.cdTransportadorCIDADE.AsString := '1';
     end else
     begin
        //Inicio Cidade
        SQL := 'SELECT CIDADE.CODIGO FROM CIDADE INNER JOIN ESTADO ON ESTADO.CODIGO = CIDADE.ESTADO'+
               ' WHERE CIDADE.NOME = ' + QuotedStr(AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.xMun));
        if ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.UF <> '' then
           SQL := SQL + ' AND ESTADO.UF = ' + QuotedStr(AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.UF));
        Open_SQL(DMDados.CDPesquisa, SQL);
        if DMDados.CDPesquisa.IsEmpty then
        begin
           if ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.UF <> '' then begin
              strEstado:= '0';
              SQL := 'SELECT ESTADO.CODIGO FROM ESTADO WHERE ESTADO.UF = ' + QuotedStr(AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.UF));
              Open_SQL(DMDados.CDPesquisa, SQL);
              if DMDados.CDPesquisa.IsEmpty then
              begin
                Aviso('Ajustar Transportador.');
                Abort;
              end
              else
                 strEstado := DMDados.CDPesquisa.FieldByName('CODIGO').AsString;
              DMDados.cdCidade.Open;
              DMDados.cdCidade.Append;
              DMDados.cdCidadeNOME.AsString := AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.xMun);
              DMDados.cdCidadeESTADO.AsString := strEstado;
              DMDados.cdCidadePOPULACAO.AsInteger := 1;
              DMDados.cdCidadeREGIAOVENDA.AsString := 'N';
              DMDados.cdCidadeCOMISSAOENTREGA.AsFloat := 0;
           end else
           begin
              DMDados.cdCidade.Open;
              DMDados.cdCidade.Append;
              DMDados.cdCidadeNOME.AsString := AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.xMun);
              SQL := 'SELECT ESTADO.CODIGO FROM ESTADO WHERE ESTADO.UF = ' + QuotedStr(AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.UF));
              Open_SQL(DMDados.CDPesquisa, SQL);
              if DMDados.CDPesquisa.IsEmpty then
              begin
                 Aviso('300 - Erro ao cadastrar estado do transportador.');
                 Abort;
              end;
              DMDados.cdCidadeESTADO.AsString := DMDados.CDPesquisa.FieldByName('CODIGO').AsString;
           end;
           if not GravarMaster(DMDados.cdCidade, true, '320 - Erro ao cadastrar municipio do transportador.') then
           begin
              DMDados.cdCidade.Close;
              Abort;
           end;
           SQL := 'SELECT CIDADE.CODIGO FROM CIDADE INNER JOIN ESTADO ON ESTADO.CODIGO = CIDADE.ESTADO'+
                  ' WHERE CIDADE.NOME = ' + QuotedStr(AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.xMun))+
                  ' AND ESTADO.UF = ' + QuotedStr(AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.UF));
           Open_SQL(DMDados.CDPesquisa, SQL);
        end;
        if DMDados.CDPesquisa.IsEmpty then
        begin
           Aviso('321 - Município não cadastrado.');
           Abort;
        end;
        DMDados.cdTransportadorCIDADE.AsString := DMDados.CDPesquisa.FieldByName('CODIGO').AsString;
     end;
     GravarMaster(DMDados.cdTransportador, true, '330 - Erro ao cadastrar transportador.', True);

      try
        NomeArquivoGrava := GetLocalTXTCadastrados + 'TransportadoresCadastrados.txt';
        AssignFile(Arquivo, NomeArquivoGrava);
        if not FileExists(NomeArquivoGrava) then
          Rewrite(Arquivo)
        else
          Append(Arquivo);
        Writeln(Arquivo, AnsiUpperCase(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.xNome));
      finally
        CloseFile(Arquivo);
      end;
    end;

procedure InserirNF;
const
  AMsgConfirmacao = 'Deseja cancelar a importação da NF?';
  AMsgAbort = 'Importe o xml novamente.';
var
   Especie, NFNumero, NFOrdem, CFOP, CodigoCFOP, Funcionario: String;
   nItem, nLote, nNumItem, nOrdem: Integer;
begin

  TipoCFOP          := '100';
  CondicaoPagamento := '100';
  FormaPagamento    := '100';


  SQL := ' SELECT CODIGO FROM TIPOCFOP WHERE NOME = '+ QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.natOp);
  Open_SQL(DMDados.CDPesquisa, SQL);
  if not DMDados.CDPesquisa.IsEmpty then
    TipoCFOP := DMDados.CDPesquisa.Fields[0].AsString;
  {else
    TipoCFOP := CadastrarTipoCFOP; - não continuado nao cadastrar para nao dar confusão.}

  SQL := ' SELECT CODIGO FROM FORMAPAGAMENTO WHERE NOME = '+ QuotedStr(GetInfAdicional(ACBrNFe.NotasFiscais.Items[I].NFe.InfAdic.obsCont,'xformaPag'));
  Open_SQL(DMDados.CDPesquisa, SQL);
  if not DMDados.CDPesquisa.IsEmpty then
    FormaPagamento := DMDados.CDPesquisa.Fields[0].AsString;

  SQL := ' SELECT CODIGO FROM CONDICAOPAGAMENTO WHERE NOME = '+
    QuotedStr(Substituir(GetInfAdicional(ACBrNFe.NotasFiscais.Items[I].NFe.InfAdic.obsCont,'xcondPag'),'-','/'));
  Open_SQL(DMDados.CDPesquisa, SQL);
  if not DMDados.CDPesquisa.IsEmpty then
    CondicaoPagamento := DMDados.CDPesquisa.Fields[0].AsString;

  Funcionario := GetInfAdicional(ACBrNFe.NotasFiscais.Items[I].NFe.InfAdic.obsCont,'xCodVen');
  if Pos(Funcionario,'-') > 0 then
    Funcionario := Copy(Funcionario,1, (pos('-',Funcionario)-1));
  if Funcionario <> '' then
  begin
    SQL := ' SELECT CODIGO FROM FUNCIONARIO WHERE CODIGO = '+ Funcionario;
    Open_SQL(DMDados.CDPesquisa, SQL);
    if DMDados.CDPesquisa.IsEmpty then
      raise Exception.Create('Funcionário não cadastrado.')
    else
      Funcionario := DMDados.CDPesquisa.Fields[0].AsString;
  end
  else
    Funcionario := '100';


  Open_SQL(DMDados.cdNF, 'SELECT * FROM NF WHERE NF.NUMERO IS NULL');
  DMDados.cdNF.Append;
  NFNumero                                       := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.nNF);
  DMDados.cdNFNUMERO.AsString  := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.nNF);
  DMDados.cdNFSERIE.AsString   := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.serie);
  DMDados.cdNFCLIFOR.AsInteger := Fornecedor;
  DMDados.cdNFEMISSAO.AsDateTime := ACBrNFe.NotasFiscais.Items[I].NFe.Ide.dEmi;
  if ACBrNFe.NotasFiscais.Items[I].NFe.Ide.dSaiEnt >= DMDados.cdNFEMISSAO.AsDateTime then
    DMDados.cdNFSAIDA.AsDateTime := ACBrNFe.NotasFiscais.Items[I].NFe.Ide.dSaiEnt;
  if Transportador <> 0 then
    DMDados.cdNFTRANSPORTADOR.AsInteger := Transportador;

  DMDados.cdNFTIPOCFOP.AsString := TipoCFOP;
  DMDados.cdNFFORMAPAGAMENTO.AsString := FormaPagamento;
  DMDados.cdNFCONDICAOPAGAMENTO.AsString := CondicaoPagamento;
  DMDados.cdNFFUNCIONARIO.AsString := Funcionario;

  DMDados.cdNFTABELAPRECO.AsString := LabeledEditTabelaPReco.Text;

  nNumItem := 0;
  DMDados.cdNFMODELO.AsString := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.modelo);
  if GravarMaster(DMDados.cdNF, true, '400 - Erro ao incluir a NF-e.') then
  begin
    {SQL := 'SELECT ID FROM NF WHERE NUMERO = %s AND CLIFOR =%s AND SERIE = %s AND FILIAL = %s AND ORIGEM = %s';
    Open_SQL(DMDados.CDPesquisa, SQL);
    if DMDados.cdPesquisa.IsEmpty then
      raise Exception.Create('ID nf não encontrada!');

    DMDados.cdNFID := DMDados.cdPesquisa.FieldByName('ID').AsVariant;}
     //Incluir Produtos
    for nItem := 0 to ACBrNFe.NotasFiscais.Items[I].NFe.Det.Count - 1 do
    begin
      // Incluído tratameno para considerar os relacionamentos da tabela PRODUTOCLIFOR
      {if isFilial then
        SQL := 'SELECT PRODUTO.CODIGO, 1 AS QTDE FROM PRODUTO WHERE PRODUTO.CODIGO = '+QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.cProd)
      else
      begin
        if Trim(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.cEAN) <> '' then
           Condicao := ' OR PRODUTO.CODIGOFORNECEDOR = '+QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.cEAN);
        SQL := 'SELECT CODIGO, QTDE FROM ('+
               'SELECT FIRST 1 1 AS ORDEM, PRODUTO AS CODIGO, QTDE FROM PRODUTOCLIFOR WHERE CODIGORELACIONADO = '+QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.cProd) + ' AND CLIFOR = '+IntToStr(Fornecedor) + ' AND COMPRA = ' + QuotedStr('S') +
               ' UNION ' +
               'SELECT FIRST 1 2 AS ORDEM, PRODUTO.CODIGO, QTDECOMPRA AS QTDE FROM PRODUTO WHERE (PRODUTO.CODIGOFORNECEDOR = '+QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.cProd) + Condicao + ') AND PRODUTO.CLIFOR = '+IntToStr(Fornecedor) +
               ' ORDER BY 2 DESC ' +
               ') ORDER BY ORDEM, QTDE';
      end;
      Open_SQL(DMDados.CDPesquisa,SQL);}

      // outra forma *****************  mudar aonde importa a NF
      SQL := '';
      Open_SQL(DMDados.CDPesquisa,'SELECT CODIGO FROM PRODUTO WHERE CODIGO IS NULL');
      if Trim(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.cEAN) <> '' then
      begin
        SQL := 'SELECT PRODUTO.CODIGO FROM PRODUTO WHERE PRODUTO.BARRAS = '+QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.cEAN);
        Open_SQL(DMDados.CDPesquisa,SQL);
      end;
      if (SQL = '') or (DMDados.CDPesquisa.IsEmpty) then
      begin
        SQL := 'SELECT PRODUTO.CODIGO FROM PRODUTO WHERE PRODUTO.CODIGO = '+(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.cProd);
        Open_SQL(DMDados.CDPesquisa,SQL);
      end;
      // fim outra forma


      if not DMDados.CDPesquisa.IsEmpty then
      begin
        Produto := DMDados.CDPesquisa.FieldByName('CODIGO').AsInteger;
        Inc(nNumItem);
        Open_SQL(DMDados.cdItemNF, 'SELECT * FROM ITEMNF WHERE ITEMNF.NUMERO IS NULL');
        DMDados.cdItemNF.Append;
        DMDados.cdItemNFPRODUTO.AsInteger := Produto;
        DMDados.cdItemNFITEM.AsInteger := nNumItem;

        CFOP := (copy(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.CFOP,1,1)+'.'+
                          copy(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.CFOP,2,5));
        SQL := ' SELECT CODIGO FROM CFOP WHERE CFOP = ' + QuotedStr(CFOP) + ' AND CFOP.TIPOCFOP = ' + TipoCFOP;
        Open_SQL(DMDados.CDGeral,SQL);
        if not DMDados.CDGeral.IsEmpty then
          CodigoCFOP := DMDados.CDGeral.Fields[0].AsString
        else
          CodigoCFOP := CadastrarCFOP(CFOP);

        DMDados.cdItemNFCFOP.AsString := CodigoCFOP;
        DMDados.cdItemNFQTDE.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.qCom),'.',',');
        DMDados.cdItemNFUNITARIO.AsString := Substituir(FloatToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.vUnCom),'.',',');
        if CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.vDesc) <> '' then
          DMDados.cdItemNFTOTAL.AsString := Substituir(FloatToStr(StrToFloat(Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.vProd),'.',',')) - StrToFloat(Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.vDesc),'.',','))),'.',',')
        else
          DMDados.cdItemNFTOTAL.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.vProd),'.',',');
        if Trim(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.vDesc)) <> '' then
        begin
          DMDados.cdItemNFVALORDESCONTO.AsFloat := StrToFloatDef(Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.vDesc),'.',','), 0);
          calcula_PercentualValor(DMDados.cdItemNF,'PERCDESCONTO','VALORDESCONTO',(DMDados.cdItemNF.FieldByName('QTDE').AsFloat * (DMDados.cdItemNF.FieldByName('UNITARIO').AsFloat)),'P');
        end;
        //Tratamento ICMS
        DMDados.cdItemNFCST.AsString       := CSTICMSToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.ICMS.CST);
        DMDados.cdItemNFBASEICMS.AsString  := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.ICMS.vBC),'.',',');
        DMDados.cdItemNFPERCICMS.AsString  := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.ICMS.pICMS),'.',',');
        DMDados.cdItemNFVALORICMS.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.ICMS.vICMS),'.',',');
        DMDados.cdItemNFBASESUBSTITUICAO.AsString  := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.ICMS.vBCST),'.',',');
        DMDados.cdItemNFPERCSUBSTITUICAO.AsString  := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.ICMS.pICMSST),'.',',');
        DMDados.cdItemNFVALORSUBSTITUICAO.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.ICMS.vICMSST),'.',',');
        //Tratamento IPI
        DMDados.cdItemNFCSTIPI.AsString        := CSTIPIToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.IPI.CST);
        DMDados.cdItemNFBASEIPI.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.IPI.vBC),'.',',');
        DMDados.cdItemNFPERCIPI.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.IPI.pIPI),'.',',');
        DMDados.cdItemNFVALORIPI.AsString      := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.IPI.vIPI),'.',',');
        DMDados.cdItemNFVALORPAUTAIPI.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.IPI.vUnid),'.',',');
        // PIS
        DMDados.cdItemNFCSTPIS.AsString        := CSTPISToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PIS.CST);
        DMDados.cdItemNFBASEPIS.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PIS.vBC),'.',',');
        DMDados.cdItemNFVALORPIS.AsString      := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PIS.vPIS),'.',',');
        DMDados.cdItemNFPERCPIS.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PIS.pPIS),'.',',');
        DMDados.cdItemNFVALORPAUTAPIS.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PIS.vAliqProd),'.',',');// ver Alíquota do PIS (em reais)
        if ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PISST.vPIS > 0 then
        begin
            DMDados.cdItemNFCSTPIS.AsString        := CSTPISToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PIS.CST);
            DMDados.cdItemNFBASEPIS.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PISST.vBC),'.',',');
            DMDados.cdItemNFVALORPIS.AsString      := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PISST.vPIS),'.',',');
            DMDados.cdItemNFPERCPIS.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PISST.pPIS),'.',',');
            DMDados.cdItemNFVALORPAUTAPIS.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.PISST.vAliqProd),'.',',');// ver Alíquota do PIS (em reais)
        end;
        // COFINS
        DMDados.cdItemNFCSTCOFINS.AsString        := CSTCOFINSToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINS.CST);
        DMDados.cdItemNFBASECOFINS.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINS.vBC),'.',',');
        DMDados.cdItemNFVALORCOFINS.AsString      := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINS.vCOFINS),'.',',');
        DMDados.cdItemNFPERCCOFINS.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINS.pCOFINS),'.',',');
        DMDados.cdItemNFVALORPAUTACOFINS.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINS.vAliqProd),'.',',');// ver Alíquota do COFINS (em reais)
        if ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINSST.vCOFINS > 0 then
        begin
            DMDados.cdItemNFCSTCOFINS.AsString        := CSTCOFINSToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINS.CST);
            DMDados.cdItemNFBASECOFINS.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINSST.vBC),'.',',');
            DMDados.cdItemNFVALORCOFINS.AsString      := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINSST.vCOFINS),'.',',');
            DMDados.cdItemNFPERCCOFINS.AsString       := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINSST.pCOFINS),'.',',');
            DMDados.cdItemNFVALORPAUTACOFINS.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Imposto.COFINSST.vAliqProd),'.',',');// ver Alíquota do COFINS (em reais)
        end;

        if not GravarMaster(DMDados.cdItemNF, true, '401 - Erro de gravação no item da NF-e.') then Abort;
        for nLote := 0 to ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.med.Count - 1 do
        begin
           Open_SQL(DMDados.cdValidadeItemNFEntrada,GetSqlValidadeItemNFEntrada(DMDados.cdItemNF, ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.med[nLote].nLote, ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.med[nLote].dVal));
           if DMDados.cdValidadeItemNFEntrada.RecordCount = 0 then
           begin
                DMDados.cdValidadeItemNFEntrada.Append;
                DMDados.cdValidadeItemNFEntrada.FieldByName('NUMERO').AsInteger      := DMDados.cdItemNFNUMERO.AsInteger;
                DMDados.cdValidadeItemNFEntrada.FieldByName('SERIE').AsString        := DMDados.cdItemNFSERIE.AsString;
                DMDados.cdValidadeItemNFEntrada.FieldByName('FILIAL').AsInteger      := DMDados.cdItemNFFILIAL.AsInteger;
                DMDados.cdValidadeItemNFEntrada.FieldByName('ORIGEM').AsString       := DMDados.cdItemNFORIGEM.AsString;
                DMDados.cdValidadeItemNFEntrada.FieldByName('CLIFOR').AsInteger      := DMDados.cdItemNFCLIFOR.AsInteger;
                DMDados.cdValidadeItemNFEntrada.FieldByName('PRODUTO').AsInteger     := DMDados.cdItemNFPRODUTO.AsInteger;
                DMDados.cdValidadeItemNFEntrada.FieldByName('ITEM').AsInteger        := DMDados.cdItemNFITEM.AsInteger;
                DMDados.cdValidadeItemNFEntrada.FieldByName('LOTE').AsString         := ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.med[nLote].nLote;
                DMDados.cdValidadeItemNFEntrada.FieldByName('VALIDADE').AsDateTime   := ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.med[nLote].dVal;
                DMDados.cdValidadeItemNFEntrada.FieldByName('FABRICACAO').AsDateTime := ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.med[nLote].dFab;
                {if DMDados.cdItemNFQUANTIDADECOMPRA.AsFloat > 0 then  utilizado na NF entrada, verificar
                  DMDados.cdValidadeItemNFEntrada.FieldByName('QTDE').AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.med[nLote].qLote * DMDados.cdItemNFQUANTIDADECOMPRA.AsFloat),'.',',')
                else}
                  DMDados.cdValidadeItemNFEntrada.FieldByName('QTDE').AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.med[nLote].qLote),'.',',');
           end
           else
           begin
               DMDados.cdValidadeItemNFEntrada.Edit;
               DMDados.cdValidadeItemNFEntrada.FieldByName('QTDE').AsFloat := DMDados.cdValidadeItemNFEntrada.FieldByName('QTDE').AsFloat + ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.med[nLote].qLote;
           end;
           if not GravarMaster(DMDados.cdValidadeItemNFEntrada, true, '410 - Erro de gravação na validade do item da NF-e.') then Abort;
        end;
      end
      else
      begin
        raise exception.Create ('Produto não cadastrado:'+ Trim(ACBrNFe.NotasFiscais.Items[I].NFe.Det[nItem].Prod.xProd));
      end;
    end;
    DMDados.cdNF.Edit;
    DMDados.cdNFBASEICMS.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vBC),'.',',');
    DMDados.cdNFVALORICMS.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vICMS),'.',',');
    DMDados.cdNFBASESUBSTITUICAO.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vBCST),'.',',');
    DMDados.cdNFVALORSUBSTITUICAO.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vST),'.',',');
    DMDados.cdNFTOTALPRODUTO.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vProd),'.',',');
    DMDados.cdNFVALORFRETE.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vFrete),'.',',');
    DMDados.cdNFVALORSEGURO.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vSeg),'.',',');
    DMDados.cdNFVALORDESCONTO.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vDesc),'.',',');
    DMDados.cdNFVALORII.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vII),'.',',');
    DMDados.cdNFVALORIPI.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vIPI),'.',',');
    DMDados.cdNFVALORPIS.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vPIS),'.',',');
    DMDados.cdNFVALORCOFINS.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vCOFINS),'.',',');
    DMDados.cdNFVALORENCARGO.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vOutro),'.',',');
    DMDados.cdNFTOTAL.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Total.ICMSTot.vNF),'.',',');
    //DMDados.cdNFCONTAFRETE.AsString  := modFreteToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.modFrete);
    if ACBrNFe.NotasFiscais.Items[I].NFe.Transp.veicTransp <> nil then
    begin
      DMDados.cdNFPLACA.AsString   := copy (ACBrNFe.NotasFiscais.Items[I].NFe.Transp.veicTransp.placa,1,3) + '-' +
                                                        copy (ACBrNFe.NotasFiscais.Items[I].NFe.Transp.veicTransp.placa,4,4);
      DMDados.cdNFUFPLACA.AsString := ACBrNFe.NotasFiscais.Items[I].NFe.Transp.veicTransp.UF;
    end;
    if ACBrNFe.NotasFiscais.Items[I].NFe.Transp.vol.Count > 0 then
    begin
      DMDados.cdNFVOLUME.AsString      := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.vol.Items[0].qVol);
      DMDados.cdNFESPECIE.AsString     := ACBrNFe.NotasFiscais.Items[I].NFe.Transp.vol.Items[0].esp;
      DMDados.cdNFMARCA.AsString       := ACBrNFe.NotasFiscais.Items[I].NFe.Transp.vol.Items[0].marca;
      DMDados.cdNFPESOBRUTO.AsString   := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.vol.Items[0].pesoB),'.',',');
      DMDados.cdNFPESOLIQUIDO.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.vol.Items[0].pesoL),'.',',');
    end;
    DMDados.cdNFOBS.AsString := ACBrNFe.NotasFiscais.Items[I].NFe.InfAdic.infCpl;
    if GravarMaster(DMDados.cdNF, true, '402 - Erro ao gravar totais da NF-e.') then
    begin
      nOrdem := 0;
      for nItem := 0 to ACBrNFe.NotasFiscais.Items[I].NFe.Cobr.Dup.Count - 1 do
      begin
        DMDados.cdOrdemNF.Open;
        DMDados.cdOrdemNF.Append;
        NFOrdem := NFNumero + '-' + ACBrNFe.NotasFiscais.Items[I].NFe.Cobr.Dup[nItem].nDup;
        Inc(nOrdem);
        if Length(NFOrdem) > 15 then
           NFOrdem := NFNumero + '-' + IntToStr(nOrdem);
        DMDados.cdOrdemNFORDEM.AsString :=  NFOrdem;
        DMDados.cdOrdemNFVCTO.AsDateTime := ACBrNFe.NotasFiscais.Items[I].NFe.Cobr.Dup[nItem].dVenc;
        DMDados.cdOrdemNFVALOR.AsString := Substituir(CurrToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Cobr.Dup[nItem].vDup),'.',',');
        GravarMaster(DMDados.cdOrdemNF, true, '403 - Erro ao gravar duplicatas da NF-e.');
      end;
      DMDados.cdNFE.Open;
      DMDados.cdNFE.Append;
      DMDados.cdNFENUMERO.Value := DMDados.cdNFNUMERO.Value;
      DMDados.cdNFESERIE.Value  := DMDados.cdNFSERIE.Value;
      DMDados.cdNFEFILIAL.Value := DMDados.cdNFFILIAL.Value;
      DMDados.cdNFEORIGEM.Value := DMDados.cdNFORIGEM.Value;
      DMDados.cdNFECLIFOR.Value := DMDados.cdNFCLIFOR.Value;
      DMDados.cdNFECHAVEACESSO.AsString := ChaveAcesso;
      if ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.chNFe <> '' then begin
        DMDados.cdNFECHAVEACESSO.AsString := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.chNFe;
        DMDados.cdNFECHNFE.AsString       := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.chNFe;
        DMDados.cdNFETPAMB.AsString       := TpAmbToStr(ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.tpAmb);
        DMDados.cdNFEVERAPLIC.AsString    := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.verAplic;
        DMDados.cdNFEDHRECBTO.AsDateTime  := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.dhRecbto;
        DMDados.cdNFENPROT.AsString       := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.nProt;
        DMDados.cdNFEDIGVAL.AsString      := ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.digVal;
        DMDados.cdNFEENVIADOEMAIL.AsInteger := 0;
        DMDados.cdNFEENVIARTDOCS.AsString   := 'N';
      end;
      DMDados.cdNFEAUTORIZADA.AsString := 'S';
      DMDados.cdNFEXML.AsString := ObterXML(AArquivo);
      GravarMaster(DMDados.cdNFE, true, '500 - Erro ao gravar dados do protocolo da NF-e.');
      {editadno nesse momento por causa da trigger que esta no update.}
      DMDados.cdNFE.Edit;
      DMDados.cdNFECSTAT.AsString       := IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.cStat);
      GravarMaster(DMDados.cdNFE, true, '500 - Erro ao gravar dados do protocolo da NF-e.');
      DMDados.cdItemNF.Close;
    end;
  end;
end;

begin
  Result := False;
  case RGOrigem.ItemIndex of
    0: begin
        Origem   := 'P';
        IsFilial := False; // Trocar para Dimar.................
    end;
    1: begin
        Origem   := 'T';
        IsFilial := False;
    end;
  end;
  Var_Filial        := StrToInt(LabeledEditFilial.Text);
  case RGServico.ItemIndex of
    0: Servico := 'S';
    1: Servico := 'N';
  end;
  case RGAtualizada.ItemIndex of
    0: Atualizada := 'S';
    1: Atualizada := 'N';
  end;
  case RGImpressa.ItemIndex of
    0: Impressa := 'S';
    1: Impressa := 'N';
  end;
  if FileExists(AArquivo) then
  begin
    ACBrNFe := TACBrNFe.Create(nil);
    uClassNFE.TNFe.Create;
    try
      ACBrNFe.NotasFiscais.LoadFromFile(AArquivo);
      for I := 0 to ACBrNFe.NotasFiscais.Count - 1 do
      begin
        ChaveAcesso := Copy(ACBrNFe.NotasFiscais.Items[I].NFe.infNFe.ID,4,Length(ACBrNFe.NotasFiscais.Items[I].NFe.infNFe.ID));
        if (TpAmbToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.tpAmb) = '1') and (ACBrNFe.NotasFiscais.Items[I].NFe.procNFe.chNFe <> '') then
        begin
          CarregarDadosEmitente;
          //Busca Fornecedor
          SQL := 'SELECT CLIFOR.CODIGO FROM CLIFOR WHERE CLIFOR.CNPJ = '+QuotedStr(Emitente.CNPJ);
          Open_SQL(DmDados.CDPesquisa,SQL);
          if DmDados.CDPesquisa.IsEmpty then
          begin
            //raise Exception.Create('Cliente não cadastrado.');
            CadastrarEmitente;
            //Exit;
          end;
          SQL := 'SELECT CLIFOR.CODIGO, CLIFOR.NOME AS NOME FROM CLIFOR WHERE CLIFOR.CNPJ = '+QuotedStr(Emitente.CNPJ);
          Open_SQL(DMDados.CDPesquisa, SQL);
          if DMDados.CDPesquisa.IsEmpty then
              Aviso('101 - Emitente não cadastrado.')
          else
          begin
            Fornecedor     := DMDados.CDPesquisa.FieldByName('CODIGO').AsInteger;
            NomeFornecedor := DMDados.CDPesquisa.FieldByName('NOME').AsString;
            //if DMDados.CDPesquisa.RecordCount > 1 then
            //begin
            //  if not Confirma('Cnpj cadastrado mais de uma vez no sistema (Cnpj: ' + Emitente.CNPJ+').'+#13+
            //                  'Deseja continuar a importação do xml para o código do fornecedor ' + IntToStr(Fornecedor) + '?') then
            //  Abort;
            //end;
            //Verificar se foi lançado anteriormente
            SQL := 'SELECT NF.NUMERO, NF.SERIE, NF.FILIAL, NF.ORIGEM, NF.CLIFOR FROM NF' +
                   ' WHERE NF.NUMERO = ' + IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.nNF) +
                   ' AND NF.SERIE = ' + QuotedStr(IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.serie)) +
                   ' AND NF.FILIAL = ' + IntToStr(Var_Filial) +
                   ' AND NF.ORIGEM = ' + QuotedStr(Origem) +
                   ' AND NF.CLIFOR = ' + IntToStr(Fornecedor);
            Open_SQL(DMDados.CDPesquisa, SQL);
            if DMDados.CDPesquisa.IsEmpty then
            begin
              //Verificar Produtos
              for Index := 0 to ACBrNFe.NotasFiscais.Items[I].NFe.Det.Count - 1 do
              begin

                // forma usual
                {if isFilial then
                  SQL := 'SELECT PRODUTO.CODIGO FROM PRODUTO WHERE PRODUTO.CODIGO = '+(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cProd)
                else
                begin
                  if Trim(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cEAN) <> '' then
                      Condicao := ' OR PRODUTO.CODIGOFORNECEDOR = '+QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cEAN);
                  SQL := ' SELECT CODIGO FROM ('+
                         ' SELECT FIRST 1 1 AS ORDEM, PRODUTO AS CODIGO FROM PRODUTOCLIFOR WHERE CODIGORELACIONADO = '+QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cProd) + ' AND CLIFOR = '+IntToStr(Fornecedor) +' AND COMPRA = '+QuotedStr('S') +
                         ' UNION ' +
                         ' SELECT FIRST 1 2 AS ORDEM, PRODUTO.CODIGO FROM PRODUTO WHERE (PRODUTO.CODIGOFORNECEDOR = '+QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cProd)+ Condicao +  ') AND PRODUTO.CLIFOR = '+IntToStr(Fornecedor)+
                         ' ) ORDER BY ORDEM';
                end;}
                // fim outra forma usual


                // outra forma *****************  mudar aonde importa a NF
                SQL := '';
                Open_SQL(DMDados.CDPesquisa,'SELECT CODIGO FROM PRODUTO WHERE CODIGO IS NULL');
                if Trim(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cEAN) <> '' then
                begin
                  SQL := 'SELECT PRODUTO.CODIGO FROM PRODUTO WHERE PRODUTO.BARRAS = '+QuotedStr(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cEAN);
                  Open_SQL(DMDados.CDPesquisa,SQL);
                end;
                if (SQL = '') or (DMDados.CDPesquisa.IsEmpty) then
                begin
                  SQL := 'SELECT PRODUTO.CODIGO FROM PRODUTO WHERE PRODUTO.CODIGO = '+(ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.cProd);
                  Open_SQL(DMDados.CDPesquisa,SQL);
                end;
                // fim outra forma

                if DMDados.CDPesquisa.IsEmpty then
                begin
                    //raise Exception.Create('Produto não cadastrado.');
                    //Exit;
                    //if Confirma('201 - Produto não cadastrado.'+#13+#10+
                    //                 'Nome: ' + ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.xProd+#13#10+
                    //                 'Deseja cadastrar o produto?') then
                    //begin
                       // ControlarLote := False;
                        //Verifica se possui lote vinculado
                        //if ACBrNFe.NotasFiscais.Items[I].NFe.Det[Index].Prod.med.Count > 0 then
                        //    ControlarLote := Confirma('O Produto a ser cadastrado possui informações de lote e validade.' + #13 +
                        //                              'Deseja controlar lote de validade do produto a ser cadastrado?');
                        CadastrarProduto;
                    //end; Else Abort;
                end;
              end;
              //Transportador
              if ACBrNFe.NotasFiscais.Items[I].NFe.Transp <> nil then
              begin
                 if ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF <> '' then
                 begin
                    if Length(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF) = 11 then
                      SQL := 'SELECT TRANSPORTADOR.CODIGO FROM TRANSPORTADOR WHERE TRANSPORTADOR.CNPJ = '+QuotedStr(MascaraCPF(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF)) else
                      SQL := 'SELECT TRANSPORTADOR.CODIGO FROM TRANSPORTADOR WHERE TRANSPORTADOR.CNPJ = '+QuotedStr(MascaraCnpj(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF));
                    Open_SQL(DMDados.CDPesquisa,SQL);
                    if DMDados.CDPesquisa.IsEmpty then begin
                       //if Confirma('Deseja cadastrar o transportador da NF-e?'+#13+(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF)+
                       //            ' - '+ ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.xNome) then
                       begin
                          CadastrarTransportador;
                          if Length(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF) = 11 then
                              SQL := 'SELECT TRANSPORTADOR.CODIGO FROM TRANSPORTADOR WHERE TRANSPORTADOR.CNPJ = '+QuotedStr(MascaraCPF(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF)) else
                              SQL := 'SELECT TRANSPORTADOR.CODIGO FROM TRANSPORTADOR WHERE TRANSPORTADOR.CNPJ = '+QuotedStr(MascaraCnpj(ACBrNFe.NotasFiscais.Items[I].NFe.Transp.Transporta.CNPJCPF));
                          Open_SQL(DMDados.CDPesquisa,SQL);
                       end;
                       //raise Exception.Create('Transportador não cadastrado.');
                    end;
                    Transportador := 0;
                    if not DMDados.CDPesquisa.IsEmpty then
                       Transportador := DMDados.CDPesquisa.FieldByName('CODIGO').AsInteger;
                 end;
              end else
              begin
                Transportador := 0;
                Aviso('301 - Transportador não informado no arquivo XML.');
              end;
              //Iniciar Importação
              InserirNF;
              Somar;
              Result := True;
            end
            else
            begin
              Aviso('003 - NF-e lançada anteriormente.'+#13+
                    'NF-e Nº: '+IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.nNF)+#13+
                    'Série: '+IntToStr(ACBrNFe.NotasFiscais.Items[I].NFe.Ide.serie))
            end;
          end;
        end else
        begin // tpAmb = 1
          Aviso('002 - NF-e emitida em ambiente de homologação.');
        end;
      end;
    finally
      ACBrNFe.Free;
    end;
  end;
end;

procedure TFormPrincipal.ListarXML(FileListBox: TFileListBox);
begin
  {seleciona diretorio pedindo o caminho}
  if SelectDirectory('','',Path) then
    if not DirectoryExists (Path) then
      Exit
    else
      FileListBox.FileName := Path;
end;

procedure TFormPrincipal.Panel1Click(Sender: TObject);
var
  NumeroInicial, NumeroFinal: Integer;

procedure BuscarTipo(ATipo: String);
var
I, ANumeroNF, AQtdeANumeroNF: Integer;
DirDestino, teste : String;
ACopiar : Boolean;
begin
  try
    AQtdeANumeroNF := 0;
    Busca(Path+'\', ATipo, ListBoxSeparaArquivos);
    if (ListBoxSeparaArquivos.Count >= 1) then
    begin
      DirDestino := Path + ATipo + '\';
      if not DirectoryExists(DirDestino) then
        ForceDirectories(DirDestino);
      for I := 0 to ListBoxSeparaArquivos.Count - 1 do
      begin

        ACopiar := False;

        if NumeroInicial = 0 then
          ACopiar := True
        else
        begin
          if CheckBoxSepararProc.Checked then
          begin
            ANumeroNF := StrToInt(Copy(ExtractFileName(ListBoxSeparaArquivos.Items[i]),26,9));
            if ((ANumeroNF >= NumeroInicial) and (ANumeroNF <= NumeroFinal)) then
              ACopiar := True;
          end;

          if CheckBoxSepararInu.Checked then
          begin
            //ANumeroNF := StrToInt(Copy(ExtractFileName(ListBoxSeparaArquivos.Items[i]),24,9));
            teste := ExtractFileName(ListBoxSeparaArquivos.Items[i]);
            ANumeroNF := StrToInt(Copy(ExtractFileName(ListBoxSeparaArquivos.Items[i]),27,4));
            if ((ANumeroNF >= NumeroInicial) and (ANumeroNF <= NumeroFinal)) then
              ACopiar := True;
          end;

          if CheckBoxSepararCan.Checked then
          begin
            //ANumeroNF := StrToInt(Copy(ExtractFileName(ListBoxSeparaArquivos.Items[i]),32,9));
            ANumeroNF := StrToInt(Copy(ExtractFileName(ListBoxSeparaArquivos.Items[i]),27,4));
            if ((ANumeroNF >= NumeroInicial) and (ANumeroNF <= NumeroFinal)) then
              ACopiar := True;
          end;
        end;

        if ACopiar then
        begin
          CopyFile(PChar(ListBoxSeparaArquivos.Items[i]), PChar(DirDestino + ExtractFileName(ListBoxSeparaArquivos.Items[i])), True);
          inc (AQtdeANumeroNF);
        end;
      end;
    end;
  finally
    Aviso('Concluído '+ IntToStr(ListBoxSeparaArquivos.Count) + ' Registros:' + ATipo + #13 +
          ' NF Dentro do intervalo: ' + IntToStr(AQtdeANumeroNF));
    ListBoxSeparaArquivos.Clear;
  end;
end;

begin
  try
    ListBoxSeparaArquivos.Clear;
    if SelectDirectory('','',Path) then
    begin
      try
        NumeroInicial := StrToInt(EditNumeracaoInicial.Text);
        NumeroFinal   := StrToInt(EditNumeracaoFinal.Text);
      except
        NumeroInicial := 0;
        NumeroFinal   := 0;
      end;

      if CheckBoxSepararProc.Checked then
        BuscarTipo(EditProc.Text);
      if CheckBoxSepararInu.Checked then
        //BuscarTipo('-inu.xml');
        BuscarTipo(EditInu.Text);
      if CheckBoxSepararCan.Checked then
      //BuscarTipo('-can.xml');   ou -canc?
        BuscarTipo(EditCan.Text);
    end;
  finally
     //Aviso('Concluído.')
  end;
end;

procedure TFormPrincipal.RGTipoClick(Sender: TObject);
begin
  if RGTipo.ItemIndex = 0 then
  begin
    EditProc.Text := '-proc.xml';
    EditInu.Text  := '-procInutNFe.xml';
    EditCan.Text  := '-procEventoNFe.xml';
  end;

  if RGTipo.ItemIndex = 1 then
  begin
    EditProc.Text := '-cte.xml';
    EditInu.Text  := '-procInutCTe.xml';
    EditCan.Text  := '-procEventoCTe.xml';
  end;
end;

procedure TFormPrincipal.Somar;
begin
  if not State_Insert(DMDados.CDNF) then DMDados.CDNF.Edit;
  Open_SQL(DMDados.cdGeral,'SELECT SUM(TOTAL) AS TOTALPRODUTO, SUM(BASEICMS) AS BASEICMS, SUM(VALORICMS) AS VALORICMS, SUM(BASESUBSTITUICAO) AS BASESUBSTITUICAO,'+
                   ' SUM(VALORSUBSTITUICAO) AS VALORSUBSTITUICAO, SUM(BASEIPI) AS BASEIPI, SUM(VALORIPI) AS VALORIPI,  SUM(BASEFUNRURAL) AS BASEFUNRURAL,'+
                   ' SUM(VALORFUNRURAL) AS VALORFUNRURAL, SUM(BASEST) AS BASEST, SUM(VALORST) AS VALORST, SUM(VALORDESCONTO) AS VALORDESCONTO,'+
                   ' SUM(BASEPIS) AS BASEPIS, SUM(BASECOFINS) AS BASECOFINS, SUM(VALORPIS) AS VALORPIS, SUM(VALORCOFINS) AS VALORCOFINS,'+
                   ' SUM(VALORISENTOPIS) AS VALORISENTOPIS, SUM(VALORISENTOCOFINS) AS VALORISENTOCOFINS,'+
                   ' SUM(VALORBRUTO) AS TOTALBRUTO '+
                   ' FROM ITEMNF WHERE NUMERO = '+DMDados.CDNFNUMERO.AsString+
                   ' AND SERIE = '+QuotedStr(DMDados.CDNFSERIE.AsString)+
                   ' AND FILIAL = '+DMDados.CDNFFILIAL.AsString+
                   ' AND ORIGEM = '+QuotedStr(DMDados.CDNFORIGEM.AsString)+
                   ' AND CLIFOR = '+DMDados.CDNFCLIFOR.AsString);
  DMDados.CDNFTOTALPRODUTO.AsFloat      := DMDados.cdGeral.FieldByName('TOTALPRODUTO').AsFloat;
  DMDados.CDNFBASEICMS.AsFloat          := DMDados.cdGeral.FieldByName('BASEICMS').AsFloat;
  DMDados.CDNFVALORICMS.AsFloat         := DMDados.cdGeral.FieldByName('VALORICMS').AsFloat;
  DMDados.CDNFBASESUBSTITUICAO.AsFloat  := DMDados.cdGeral.FieldByName('BASESUBSTITUICAO').AsFloat;
  DMDados.CDNFVALORSUBSTITUICAO.AsFloat := DMDados.cdGeral.FieldByName('VALORSUBSTITUICAO').AsFloat;
  DMDados.CDNFBASEIPI.AsFloat           := DMDados.cdGeral.FieldByName('BASEIPI').AsFloat;
  DMDados.CDNFVALORIPI.AsFloat          := DMDados.cdGeral.FieldByName('VALORIPI').AsFloat;
  DMDados.CDNFBASEFUNRURAL.AsFloat      := DMDados.cdGeral.FieldByName('BASEFUNRURAL').AsFloat;
  DMDados.CDNFVALORFUNRURAL.AsFloat     := DMDados.cdGeral.FieldByName('VALORFUNRURAL').AsFloat;
  DMDados.CDNFBASEST.AsFloat            := DMDados.cdGeral.FieldByName('BASEST').AsFloat;
  DMDados.CDNFVALORST.AsFloat           := DMDados.cdGeral.FieldByName('VALORST').AsFloat;
  if DMDados.CDNFMODELO.AsString = '55' then begin
    DMDados.CDNFVALORDESCONTO.AsFloat  := DMDados.cdGeral.FieldByName('VALORDESCONTO').AsFloat;
    if DMDados.CDNFVALORDESCONTO.AsFloat = 0  then
      DMDados.CDNFPERCDESCONTO.AsFloat := 0
    else
      DMDados.CDNFPERCDESCONTO.AsFloat     := (DMDados.cdGeral.FieldByName('VALORDESCONTO').AsFloat / (DMDados.cdGeral.FieldByName('VALORDESCONTO').AsFloat + DMDados.cdGeral.FieldByName('TOTALPRODUTO').AsFloat))*100;
  end;
  DMDados.CDNFBASEPIS.AsFloat           := DMDados.cdGeral.FieldByName('BASEPIS').AsFloat;
  DMDados.CDNFBASECOFINS.AsFloat        := DMDados.cdGeral.FieldByName('BASECOFINS').AsFloat;
  DMDados.CDNFVALORPIS.AsFloat          := DMDados.cdGeral.FieldByName('VALORPIS').AsFloat;
  DMDados.CDNFVALORCOFINS.AsFloat       := DMDados.cdGeral.FieldByName('VALORCOFINS').AsFloat;
  DMDados.CDNFVALORISENTOPIS.AsFloat    := DMDados.cdGeral.FieldByName('VALORISENTOPIS').AsFloat;
  DMDados.CDNFVALORISENTOCOFINS.AsFloat := DMDados.cdGeral.FieldByName('VALORISENTOCOFINS').AsFloat;
  DMDados.CDNFTOTALBRUTO.AsFloat        := DMDados.cdGeral.FieldByName('TOTALBRUTO').AsFloat;
  Open_SQL(DMDados.cdGeral, 'SELECT SUM(TOTAL) AS TOTALSERVICO FROM SERVICONF'+
                                               ' WHERE NUMERO = '+DMDados.CDNFNUMERO.AsString+
                                               ' AND SERIE = '+QuotedStr(DMDados.CDNFSERIE.AsString)+
                                               ' AND FILIAL = '+DMDados.CDNFFILIAL.AsString+
                                               ' AND ORIGEM = '+QuotedStr(DMDados.CDNFORIGEM.AsString)+
                                               ' AND CLIFOR = '+DMDados.CDNFCLIFOR.AsString);
  DMDados.CDNFBASEISS.AsFloat := DMDados.cdGeral.FieldByName('TOTALSERVICO').AsFloat;
  DMDados.CDNFTOTAL.AsFloat := DMDados.CDNFTOTALPRODUTO.AsFloat + DMDados.CDNFBASEISS.AsFloat +
                                                DMDados.CDNFVALORSUBSTITUICAO.AsFloat + DMDados.CDNFVALORFRETE.AsFloat +
                                                DMDados.CDNFVALORSEGURO.AsFloat + DMDados.CDNFVALORENCARGO.AsFloat +
                                                DMDados.CDNFVALORIPI.AsFloat
                                                - DMDados.CDNFVALORIRRF.AsFloat;
  DMDados.cdGeral.Close;
end;


procedure TFormPrincipal.VerificarCadastrarUnMedida(AUnidadeMedida: String);
const
  SQLUNMedida = 'SELECT * FROM UNIDADEMEDIDA WHERE CODIGO = ''%s''';
begin
  //valida UnMedida
  Open_SQL(DMDados.CDPesquisa, Format(SQLUNMedida, [AnsiUpperCase(AUnidadeMedida)]));
  if DMDados.CDPesquisa.IsEmpty then
  begin
    Open_SQL(DMDados.cdUnMedida, 'SELECT * FROM UNIDADEMEDIDA WHERE CODIGO IS NULL');
    DMDados.cdUnMedida.Append;
    DMDados.cdUnMedida.FieldByName('CODIGO').AsString := AUnidadeMedida;
    DMDados.cdUnMedida.FieldByName('NOME').AsString := AUnidadeMedida+'-';
    if not GravarMaster(DMDados.cdUnMedida, true, 'Erro ao cadastrar Unidade Medida.') then
      Abort;
  end;
end;

end.
