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
  Vcl.Samples.Gauges, Vcl.ExtDlgs, Vcl.ComCtrls, Vcl.Buttons, ComObj;

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
    BtnUnidadeMedida: TButton;
    BtnGrupo: TButton;
    BtnTipoProduto: TButton;
    BtnMarca: TButton;
    BtnClassificacao: TButton;
    BtnProduto: TButton;
    BtnEstoque: TButton;
    BtnTabelaPreco: TButton;
    BtnItemTabelaPreco: TButton;
    BtnCliforTabelaPreco: TButton;
    BtnProdutoClifor: TButton;
    BtnContasAPagar: TButton;
    BtnContasReceber: TButton;
    CheckBoxInserirDeleteAntes: TCheckBox;
    CheckBoxSalvarAutomaticamente: TCheckBox;
    BtnGerarTodos: TButton;
    EditCaminhoScripts: TEdit;
    Label2: TLabel;
    BtnContasPagarProcedure: TButton;
    Label3: TLabel;
    EditIdEmpresa: TEdit;
    BtnRota: TButton;
    BtnRotaClifor: TButton;
    Label4: TLabel;
    EditNaturezaOperacao: TEdit;
    BtnVendas: TButton;
    EditRotas: TEdit;
    Label5: TLabel;
    CheckBobxContasReceberSomenteDocumentosComNumero: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SGTipoEstabelecimento: TStringGrid;
    sbTipoEstabelecimento: TSpeedButton;
    Label8: TLabel;
    BtnSalvarConfig: TButton;
    BtnCarregarConfig: TButton;
    LabelConfigAtiva: TLabel;
    BtnUpdateNossoNumero: TButton;
    BtnContasAReceberExcel: TButton;
    OpenDialog1: TOpenDialog;
    EditCliforIn: TEdit;
    Label9: TLabel;
    EditTipoEstabelecimentoPara: TEdit;
    EditTipoEstabelecimentoDe: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EditFimPlanilha: TEdit;
    EditInicioPlanilha: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    BtnUpdateRapel: TButton;
    LabelComodato: TLabel;
    EditNatOpComodato: TEdit;
    EditNatOpTrocas: TEdit;
    LabelTrocas: TLabel;
    BtnComodato: TButton;
    BtnTrocas: TButton;
    ListBoxNossoNumero: TListBox;
    ListBoxNossoNumeroDuplicado: TListBox;
    BtnContasPagarExcel: TButton;
    Label12: TLabel;
    EditForcarNumeroFilial: TEdit;
    ButtonSemRomaneio: TButton;
    ButtonAjustaFuncionarioClifor: TButton;
    ButtonAjustaCondicaoPagamento: TButton;
    ButtonContaPagaRecebida: TButton;
    Label13: TLabel;
    Label14: TLabel;
    EditTipoFinanceiro: TEdit;
    EditSituacaoFinanceiro: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    ButtonContasPagarExcel: TButton;
    ButtonContasPagasExcel: TButton;
    ButtonUpdateGeoLocalizacao: TButton;
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
    procedure BtnCliforClick2(Sender: TObject);
    procedure BtnUnidadeMedidaClick(Sender: TObject);
    procedure BtnGrupoClick(Sender: TObject);
    procedure BtnTipoProdutoClick(Sender: TObject);
    procedure BtnMarcaClick(Sender: TObject);
    procedure BtnClassificacaoClick(Sender: TObject);
    procedure BtnProdutoClick(Sender: TObject);
    procedure BtnEstoqueClick(Sender: TObject);
    procedure BtnTabelaPrecoClick(Sender: TObject);
    procedure BtnItemTabelaPrecoClick(Sender: TObject);
    procedure BtnCliforTabelaPrecoClick(Sender: TObject);
    procedure BtnProdutoCliforClick(Sender: TObject);
    procedure BtnContasReceberClick(Sender: TObject);
    procedure BtnGerarTodosClick(Sender: TObject);
    procedure GerarContasAPagar(UsaProcedure : Boolean);
    procedure BtnContasPagarProcedureClick(Sender: TObject);
    procedure BtnContasAPagarClick(Sender: TObject);
    procedure BtnRotaClick(Sender: TObject);
    procedure BtnRotaCliforClick(Sender: TObject);
    procedure BtnVendasClick(Sender: TObject);
    procedure sbTipoEstabelecimentoClick(Sender: TObject);
    procedure BtnSalvarConfigClick(Sender: TObject);
    procedure BtnCarregarConfigClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditTipoEstabelecimentoDeKeyPress(Sender: TObject; var Key: Char);
    procedure EditTipoEstabelecimentoParaKeyPress(Sender: TObject;
      var Key: Char);
    procedure BtnUpdateNossoNumeroClick(Sender: TObject);
    procedure BtnContasAReceberExcelClick(Sender: TObject);
    procedure BtnUpdateRapelClick(Sender: TObject);
    procedure BtnComodatoClick(Sender: TObject);
    procedure BtnTrocasClick(Sender: TObject);
    procedure BtnContasPagarExcelClick(Sender: TObject);
    procedure ButtonSemRomaneioClick(Sender: TObject);
    procedure ButtonAjustaFuncionarioCliforClick(Sender: TObject);
    procedure ButtonAjustaCondicaoPagamentoClick(Sender: TObject);
    procedure ButtonContaPagaRecebidaClick(Sender: TObject);
    procedure ButtonContasPagarExcelClick(Sender: TObject);
    procedure ButtonContasPagasExcelClick(Sender: TObject);
    procedure ButtonUpdateGeoLocalizacaoClick(Sender: TObject);

  private
    procedure CarregarExcel;
    procedure ConectarDB;
    procedure DesconectarDB;
    procedure CarregarIni;
    procedure SalvarIni;
    procedure AjustaBotoesConexao;
    procedure VerificaConexao;
    procedure AjustaGauge;
    procedure SetHorizontalScrollBar(lb : TListBox);
    procedure SalvarArquivo;
    procedure SalvarArquivoAutomatico(Caminho : String);
    procedure AbreQuery;
    procedure AjustaStringGrid;
    procedure SalvarConfigTipoEstabelecimento;
    procedure CarregarConfigTipoEstabelecimento;
    procedure ValidaConfigTipoEstabelecimento;
    function BooleanToStr (p : Boolean) : String;
    function AdjustRight(st: string;tam:integer;ch:char):string;
    function AjustaData(Data : String) : String;
    function Numericos(st: string):string;
    function StrSplit(st: String; dl: char): TStrings;
    function ConverteTipoEstabelecimento(Tipo : String) : String;
    function GetNomeSituacaoFinanceiro(Codigo : String) : String;
  published

  public
  end;

const
  cNull : String = 'NULL';
  cNao   : String = '''N''';
  cSim  : String = '''S''';
var
  FrmPrincipal: TFrmPrincipal;
  Excel, Planilha : OleVariant;

implementation

{$R *.dfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.AbreQuery;
begin
  FDQuery1.Open();
  FDQuery1.Last;
  FDQuery1.First;
  //ShowMEssage(IntToStr(FDQuery1.RecordCount));
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

procedure TFrmPrincipal.AjustaStringGrid;
begin
  SGTipoEstabelecimento.Cells[1,0] := 'De';
  SGTipoEstabelecimento.Cells[2,0] := 'Para';
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
  FDQuery1.SQL.Clear;
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
  if (CheckBoxInserirDeleteAntes.Checked) then
  begin
    ListBox1.Items.Add('DELETE FROM BAIRRO WHERE NOME <> ''CENTRO''; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Nome := FDQuery1.FieldByName('nome_bairro').AsString;
    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome)]));
    Inc(Codigo);
    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '03-bairro.txt');
end;

procedure TFrmPrincipal.BtnCarregarConfigClick(Sender: TObject);
begin
  CarregarConfigTipoEstabelecimento;
end;

procedure TFrmPrincipal.BtnCidadeClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Estado, Populacao : Integer;
  Nome, CodigoFiscal : String;
begin
  FDQuery1.SQL.Clear;
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
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CIDADE WHERE CODIGO NOT IN (SELECT CIDADE FROM TRANSPORTADOR) AND CODIGO NOT IN (SELECT CIDADE FROM FILIAL); COMMIT;');
  end;
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
    Application.ProcessMessages;
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '04-cidade.txt');
end;

procedure TFrmPrincipal.BtnClassificacaoClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo : Integer;
  Nome : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from sabores');
  SQLInsert := 'INSERT INTO CLASSIFICACAO (CODIGO, NOME, ORDEM) VALUES (%d, %s, %d);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CLASSIFICACAO; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('id').AsInteger;
    Nome := FDQuery1.FieldByName('desc_sabor').AsString;

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), 0]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '11-classificacao.txt');
end;

procedure TFrmPrincipal.BtnCliforClick(Sender: TObject);
var
  SQLInsertClifor, SQLInsertCliforContato, SQLInsertFuncionarioClifor : String;
  Codigo, Cidade, IndicadorIE, Vendedor, Tipo, Filial : Integer;
  Fantasia, Nome, CNPJ, IE, DataCadastro, DataNascimento, NomePai, NomeMae, Contato, Endereco, Numero, NomeBairro, Complemento, Cep, Telefone, Celular,
  Email, EmailNFe, EmailBoleto, Simples, DataMovimento, DataInativado, Obs, LimiteCredito, TipoEstabelecimento, CondicaoPagamento,
  EnviarNFe, EnviarBoleto, Latitude, Longitude : String;
  IsFornecedor, IsCliente, IsFuncionario, IsTransportador, IsVendedor, IsEmpresa, IsMotorista, Ativo : Boolean;
begin
  ValidaConfigTipoEstabelecimento;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select distinct');
  FDQuery1.SQL.Add('terceiros.tipo_fornecedor as isfornecedor, ');
  FDQuery1.SQL.Add('terceiros.tipo_motorista as ismotorista, ');
  FDQuery1.SQL.Add('terceiros.tipo_empresa as isempresa, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_empresa as filial, ');
  FDQuery1.SQL.Add('terceiros.tipo_cliente as iscliente, ');
  FDQuery1.SQL.Add('terceiros.tipo_funcionario as isfuncionario, ');
  FDQuery1.SQL.Add('terceiros.tipo_transportadora as istransportador, ');
  FDQuery1.SQL.Add('terceiros.tipo_vendedor as isvendedor, ');
  FDQuery1.SQL.Add('terceiros.id as codigo, ');
  FDQuery1.SQL.Add('terceiros.nome as fantasia, ');
  FDQuery1.SQL.Add('terceiros.razao_social as nome, ');
  FDQuery1.SQL.Add('terceiros.cpf_cnpj as cpfcnpj, ');
  FDQuery1.SQL.Add('terceiros.rg_ie as rgie, ');
  FDQuery1.SQL.Add('terceiros.data_cadastro as data, ');
  FDQuery1.SQL.Add('terceiros.data_nascimento as datanasc, ');
  FDQuery1.SQL.Add('terceiros.nome_pai as nomepai, ');
  FDQuery1.SQL.Add('terceiros.nome_mae as nomemae, ');
  FDQuery1.SQL.Add('terceiros.id_tipologia as tipoestabelecimento, ');
  FDQuery1.SQL.Add('terceiros.proprietario as contato, ');
  FDQuery1.SQL.Add('logradouros.nome_completo as endereco, ');
  FDQuery1.SQL.Add('terceiros.numero as numero, ');
  FDQuery1.SQL.Add('terceiros.id_cidade as cidade, ');
  FDQuery1.SQL.Add('bairros.nome_bairro as nomebairro, ');
  FDQuery1.SQL.Add('terceiros.complemento as complemento, ');
  FDQuery1.SQL.Add('terceiros.cep, ');
  FDQuery1.SQL.Add('terceiros.fone as telefone, ');
  FDQuery1.SQL.Add('terceiros.endereco_latitude as latitude, ');
  FDQuery1.SQL.Add('terceiros.endereco_longitude as longitude, ');
  FDQuery1.SQL.Add('terceiros.celular as celular, ');
  FDQuery1.SQL.Add('terceiros.email as email, ');
  FDQuery1.SQL.Add('terceiros.email_nfe as emailnfe, ');
  FDQuery1.SQL.Add('terceiros.email_boleto as emailboleto, ');
  FDQuery1.SQL.Add('case when (terceiros.id_regime_icms = 1) then ''N'' else ''S'' end as simples, ');
  FDQuery1.SQL.Add('terceiros.indicador_insc_estadual as indicadorie, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.limite_credito as limitecredito, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_form_parc_pref as condicaopagamento, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.ativo as ativo, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.data_ultima_venda as datamovimento, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.data_inativacao as datainativado, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.observacao_entrega as obs, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_vendedor as codigovendedor ');
  FDQuery1.SQL.Add('from terceiros ');
  FDQuery1.SQL.Add('left join logradouros on logradouros.id = terceiros.id_logradouro ');
  FDQuery1.SQL.Add('left join bairros on bairros.id = terceiros.id_bairro ');
  FDQuery1.SQL.Add('inner join terceiros_dados_emp on terceiros_dados_emp.id_terceiro = terceiros.id ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and terceiros_dados_emp.id_empresa = %s',[EditIdEmpresa.Text]));
  if EditRotas.Text <> EmptyStr then
  begin
    FDQuery1.SQL.Add('left join terceiros_setores on terceiros_setores.id_terceiro = terceiros.id ');
    FDQuery1.SQL.Add('left join rotas_setores on rotas_setores.id = terceiros_setores.id_setor ');
    FDQuery1.SQL.Add(Format('where ((terceiros.tipo_fornecedor is true) or (terceiros.tipo_funcionario is true) or (rotas_setores.id_rota in (%s))) ',[EditRotas.Text]));
  end;
  if EditCliforIn.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and terceiros.id %s',[EditCliforIn.Text]));

//  FDQuery1.SQL.Add('where ((terceiros.tipo_cliente = true) or (terceiros.tipo_fornecedor = true) or terceiros.id in (select distinct(produtos_fornecedores.id_terceiro) from produtos_fornecedores)) ');
  SQLInsertClifor := 'INSERT INTO CLIFOR (CODIGO, FANTASIA, NOME, CNPJ, IE, DATA, DATANASC, NOMEPAI, NOMEMAE, TIPOESTABELECIMENTO, ENDERECO, NUMERO, CIDADE, BAIRRO, COMPLEMENTO, CEP, '+
                     'SIMPLES, INDICADORIE, LIMITECREDITO, CONDICAOPAGAMENTO, ATIVO, DATAMOVIMENTO, DATAINATIVADO, OBS, COMISSAO, SPC, COMISSAOFIXA, VENDARESTRITA, CONSUMIDOR, '+
                     'DESTACARSTITEM, TIPO, CATEGORIA, FILIAL, LATITUDE, LONGITUDE) VALUES (%d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %d, (SELECT FIRST(1) CODIGO FROM BAIRRO WHERE NOME = %s), '+
                     '%s, %s, %s, %d, %s, %s, %s, %s, %s, %s, %d, %s, %s, %s, %s, %s, %d, %d, %d, %s, %s);';
  SQLInsertCliforContato := 'INSERT INTO CLIFORCONTATO (CLIFOR, NUMERO, NOME, EMAIL, ENVIARNFE, ENVIARDANFE, ENVIARBOLETO, ENVIARPEDIDO) ' +
                            'VALUES (%d, %s, %s, %s, %s, %s, %s, %s);';
  SQLInsertFuncionarioClifor := 'INSERT INTO FUNCIONARIOCLIFOR (FUNCIONARIO, CLIFOR) VALUES (%d, %d);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;

  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CLIFORCONTATO; COMMIT;');
    ListBox1.Items.Add('DELETE FROM FUNCIONARIOCLIFOR; COMMIT;');
    ListBox1.Items.Add('DELETE FROM CLIFOR; COMMIT;');
    ListBox1.Items.Add('DELETE FROM TIPO; COMMIT;');
  end;
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[1, QuotedStr('CLIENTE')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[2, QuotedStr('FORNECEDOR')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[3, QuotedStr('CLIENTE/FORNECEDOR')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[4, QuotedStr('FUNCIONARIO')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[5, QuotedStr('TRANSPORTADOR')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[6, QuotedStr('VENDEDOR')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[7, QuotedStr('EMPRESA')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[8, QuotedStr('MOTORISTA')]));
  ListBox1.Items.Add('ALTER TRIGGER TRIGGER_CLIFORCONTATO_VALIDAR INACTIVE; COMMIT;');
  while not FDQuery1.Eof do
  begin
    IsVendedor := FDQuery1.FieldByName('isVendedor').AsBoolean;
    IsMotorista := FDQuery1.FieldByName('ismotorista').AsBoolean;
    IsEmpresa := FDQuery1.FieldByName('isEmpresa').AsBoolean;
    IsFornecedor := FDQuery1.FieldByName('isfornecedor').AsBoolean;
    IsCliente := FDQuery1.FieldByName('iscliente').AsBoolean;
    IsFuncionario := FDQuery1.FieldByName('isfuncionario').AsBoolean;
    IsTransportador := FDQuery1.FieldByName('istransportador').AsBoolean;
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    Fantasia := Copy(FDQuery1.FieldByName('fantasia').AsString, 0, 60);
    Nome := Copy(FDQuery1.FieldByName('nome').AsString, 0, 60);
    CNPJ := Numericos(FDQuery1.FieldByName('cpfcnpj').AsString);
    IE := Numericos(FDQuery1.FieldByName('rgie').AsString);
    DataCadastro := AjustaData(FDQuery1.FieldByName('data').AsString);
    DataNascimento := AjustaData(FDQuery1.FieldByName('datanasc').AsString);
    NomePai := FDQuery1.FieldByName('nomepai').AsString;
    NomeMae := FDQuery1.FieldByName('nomemae').AsString;
    TipoEstabelecimento := FDQuery1.FieldByName('tipoestabelecimento').AsString;
    Contato := Copy(FDQuery1.FieldByName('contato').AsString, 0, 40);
    Endereco := Copy(FDQuery1.FieldByName('endereco').AsString, 0, 60);
    Numero := FDQuery1.FieldByName('numero').AsString;
    Cidade := FDQuery1.FieldByName('cidade').AsInteger;
    NomeBairro := FDQuery1.FieldByName('nomebairro').AsString;
    Complemento := FDQuery1.FieldByName('complemento').AsString;
    Cep := Numericos(FDQuery1.FieldByName('cep').AsString);
    Telefone := Copy(Numericos(FDQuery1.FieldByName('telefone').AsString),0,12);
    Celular := Copy(Numericos(FDQuery1.FieldByName('celular').AsString),0,12);
    Email := Trim(FDQuery1.FieldByName('email').AsString);
    EmailNFe := Trim(FDQuery1.FieldByName('emailnfe').AsString);
    EmailBoleto := Trim(FDQuery1.FieldByName('emailboleto').AsString);
    Simples := FDQuery1.FieldByName('simples').AsString;
    Latitude := Copy(FDQuery1.FieldByName('latitude').AsString,0,14);
    Longitude := Copy(FDQuery1.FieldByName('longitude').AsString,0,14);
    IndicadorIE := FDQuery1.FieldByName('indicadorie').AsInteger;
    LimiteCredito := StringReplace(FDQuery1.FieldByName('limitecredito').AsString,',', '.', [rfReplaceAll]);
    if Length(LimiteCredito) > 8 then
      LimiteCredito := '0';
    CondicaoPagamento := FDQuery1.FieldByName('condicaopagamento').AsString;;
    Ativo := FDQuery1.FieldByName('ativo').AsBoolean;
    DataMovimento := AjustaData(FDQuery1.FieldByName('datamovimento').AsString);
    DataInativado := AjustaData(FDQuery1.FieldByName('datainativado').AsString);
    Obs := FDQuery1.FieldByName('obs').AsString;
    Vendedor := FDQuery1.FieldByName('codigovendedor').AsInteger;
    //separados por virgula
    if Pos(',', Email) > 0 then
      Email := Copy(Email, 0, Pos(',', Email)-1);
    if Pos(',', EmailNFe) > 0 then
      EmailNFe := Copy(EmailNFe, 0, Pos(',', EmailNFe)-1);
    if Pos(',', EmailBoleto) > 0 then
      EmailBoleto := Copy(EmailBoleto, 0, Pos(',', EmailBoleto)-1);
    //separados por ;
    if Pos(';', Email) > 0 then
      Email := Copy(Email, 0, Pos(';', Email)-1);
    if Pos(';', EmailNFe) > 0 then
      EmailNFe := Copy(EmailNFe, 0, Pos(';', EmailNFe)-1);
    if Pos(';', EmailBoleto) > 0 then
      EmailBoleto := Copy(EmailBoleto, 0, Pos(';', EmailBoleto)-1);
    //separados por espaço vazio
    if Pos(' ', Email) > 0 then
    begin
      Email := Copy(Email, 0, Pos(' ', Email)-1);

    end;
    if Pos(' ', EmailNFe) > 0 then
    begin
      EmailNFe := Copy(EmailNFe, 0, Pos(' ', EmailNFe)-1);

    end;
    if Pos(' ', EmailBoleto) > 0 then
    begin
      EmailBoleto := Copy(EmailBoleto, 0, Pos(' ', EmailBoleto)-1);

    end;


    if ((IsFornecedor) and (IsCliente)) then
      Tipo := 3
    else if (IsCliente) then
      Tipo := 1
    else if (IsFornecedor) then
      Tipo := 2
    else if (IsFuncionario) then
      Tipo := 4
    else if (IsTransportador) then
      Tipo := 5
    else if (IsVendedor) then
      Tipo := 6
    else if (IsEmpresa) then
      Tipo := 7
    else if (IsMotorista) then
      Tipo := 8;


    if Tipo = 0 then
      raise Exception.Create('TipoClifor Inválido no cliente código: '+ IntToStr(Codigo));

    if Latitude = EmptyStr then Latitude := 'NULL' else Latitude := QuotedStr(Latitude);
    if Longitude = EmptyStr then Longitude := 'NULL' else Longitude := QuotedStr(Longitude);

    if TipoEstabelecimento = EmptyStr then
      TipoEstabelecimento := 'NULL'
    else
      TipoEstabelecimento := ConverteTipoEstabelecimento(TipoEstabelecimento);
    if CondicaoPagamento = EmptyStr then CondicaoPagamento := 'NULL';
    if Cidade = 0 then Cidade := 1;
    if NomeBairro = EmptyStr then NomeBairro := 'CENTRO';
    //insert clifor
    ListBox1.Items.Add(Format(SQLInsertClifor,[Codigo, QuotedStr(Fantasia), QuotedStr(Nome), QuotedStr(Cnpj), QuotedStr(IE), DataCadastro, DataNascimento, QuotedStr(NomePai),
                     QuotedStr(NomeMae), TipoEstabelecimento, QuotedStr(Endereco), QuotedStr(Numero), Cidade, QuotedStr(NomeBairro), QuotedStr(Complemento), QuotedStr(Cep), QuotedStr(Simples),
                     IndicadorIE, LimiteCredito, CondicaoPagamento, BooleanToStr(Ativo), DataMovimento, DataInativado, QuotedStr(Obs), 0, cNao, cNao, cNao, cNao, cNao, Tipo, 1, Filial,
                     Latitude, Longitude]));
    //insert cliforcontato
    EnviarNFe := QuotedStr('N');
    EnviarBoleto := QuotedStr('N');
    if ((Email = EmailNFe) and (EmailNfe = EmailBoleto)) then // se os 3 emails forem iguais
    begin
      EmailNFe := EmptyStr;
      EmailBoleto := EmptyStr;
      EnviarNFe := QuotedStr('S');
      EnviarBoleto := QuotedStr('S');
    end
    else
    if (Email = EmailNFe)  then
    begin
      EmailNFe := EmptyStr;
      EnviarNFe := QuotedStr('S');
    end
    else
    if ((Email = EmailBoleto) and (EmailNFe = EmptyStr)) then
    begin
      EmailBoleto := EmptyStr;
      EnviarBoleto := QuotedStr('S');
    end
    else
    if (EmailNFe = EmailBoleto) then
    begin
      EmailBoleto := EmptyStr;
      EnviarBoleto := QuotedStr('S');
    end;

    if EmailNFe <> EmptyStr then
      EnviarNFe := QuotedStr('S');

    if (Telefone = Celular)  then
      Celular := EmptyStr;

    if ((Telefone <> EmptyStr) or (Celular <> EmptyStr)) then
    begin
      //Telefone
      if Telefone <> EmptyStr then
      begin
        if ((Email = EmptyStr) and (EmailNFe = EmptyStr) and (EmailBoleto = EmptyStr)) then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Telefone), QuotedStr(Contato), cNull, cNao, cNao, cNao, cNao]));
        if Email <> EmptyStr then
        begin
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Telefone), QuotedStr(Contato), QuotedStr(Email), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
          Email := EmptyStr;
        end;
        if EmailNFe <> EmptyStr then
        begin
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Telefone), QuotedStr(Contato), QuotedStr(EmailNFe), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
          EmailNFe := EmptyStr;
          EnviarNFe := QuotedStr('N');
        end;
        if EmailBoleto <> EmptyStr then
        begin
          EnviarBoleto := QuotedStr('S');
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Telefone), QuotedStr(Contato), QuotedStr(EmailBoleto), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
          EmailBoleto := EmptyStr;
          EnviarBoleto := QuotedStr('N');
        end;
      end;
      //Celular
      if Celular <> EmptyStr then
      begin
        if EmailBoleto <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Celular), QuotedStr(Contato), QuotedStr(EmailBoleto), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if EmailNFe <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Celular), QuotedStr(Contato), QuotedStr(EmailNFe), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if Email <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Celular), QuotedStr(Contato), QuotedStr(Email), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if ((Email = EmptyStr) and (EmailNFe = EmptyStr) and (EmailBoleto = EmptyStr)) then
        begin
          EnviarNFe := QuotedStr('N');
          EnviarBoleto := QuotedStr('N');
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Celular), QuotedStr(Contato), QuotedStr(Email), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        end;
      end;
    end
    else
      if ((Email <> EmptyStr) or (EmailNFe <> EmptyStr) or (EmailBoleto <> EmptyStr)) then
      begin
        if Email <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr('11111111'), QuotedStr(Contato), QuotedStr(Email), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if EmailNFe <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr('11111111'), QuotedStr(Contato), QuotedStr(EmailNFe), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if EmailBoleto <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr('111111111'), QuotedStr(Contato), QuotedStr(EmailBoleto), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
      end;

    //funcionarioclifor
    if Vendedor > 0 then
      ListBox1.Items.Add(Format(SQLInsertFuncionarioClifor, [Vendedor, Codigo]));
    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  ListBox1.Items.Add('ALTER TRIGGER TRIGGER_CLIFORCONTATO_VALIDAR ACTIVE;');
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '06-clifor.txt');
end;

procedure TFrmPrincipal.BtnCliforClick2(Sender: TObject);
var
  SQLInsertCliforContato : String;
  Codigo, Cidade, IndicadorIE, Vendedor, Tipo, Filial : Integer;
  Fantasia, Nome, CNPJ, IE, DataCadastro, DataNascimento, NomePai, NomeMae, Contato, Endereco, Numero, NomeBairro, Complemento, Cep, Telefone, Celular,
  Email, EmailNFe, EmailBoleto, Simples, DataMovimento, DataInativado, Obs, LimiteCredito, TipoEstabelecimento, CondicaoPagamento,
  EnviarNFe, EnviarBoleto : String;
  IsFornecedor, IsCliente, IsFuncionario, IsTransportador, IsVendedor, IsEmpresa, IsMotorista, Ativo : Boolean;
begin
  ValidaConfigTipoEstabelecimento;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select distinct');
  FDQuery1.SQL.Add('terceiros.tipo_fornecedor as isfornecedor, ');
  FDQuery1.SQL.Add('terceiros.tipo_motorista as ismotorista, ');
  FDQuery1.SQL.Add('terceiros.tipo_empresa as isempresa, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_empresa as filial, ');
  FDQuery1.SQL.Add('terceiros.tipo_cliente as iscliente, ');
  FDQuery1.SQL.Add('terceiros.tipo_funcionario as isfuncionario, ');
  FDQuery1.SQL.Add('terceiros.tipo_transportadora as istransportador, ');
  FDQuery1.SQL.Add('terceiros.tipo_vendedor as isvendedor, ');
  FDQuery1.SQL.Add('terceiros.id as codigo, ');
  FDQuery1.SQL.Add('terceiros.nome as fantasia, ');
  FDQuery1.SQL.Add('terceiros.razao_social as nome, ');
  FDQuery1.SQL.Add('terceiros.cpf_cnpj as cpfcnpj, ');
  FDQuery1.SQL.Add('terceiros.rg_ie as rgie, ');
  FDQuery1.SQL.Add('terceiros.data_cadastro as data, ');
  FDQuery1.SQL.Add('terceiros.data_nascimento as datanasc, ');
  FDQuery1.SQL.Add('terceiros.nome_pai as nomepai, ');
  FDQuery1.SQL.Add('terceiros.nome_mae as nomemae, ');
  FDQuery1.SQL.Add('terceiros.id_tipologia as tipoestabelecimento, ');
  FDQuery1.SQL.Add('terceiros.proprietario as contato, ');
  FDQuery1.SQL.Add('logradouros.nome_completo as endereco, ');
  FDQuery1.SQL.Add('terceiros.numero as numero, ');
  FDQuery1.SQL.Add('terceiros.id_cidade as cidade, ');
  FDQuery1.SQL.Add('bairros.nome_bairro as nomebairro, ');
  FDQuery1.SQL.Add('terceiros.complemento as complemento, ');
  FDQuery1.SQL.Add('terceiros.cep, ');
  FDQuery1.SQL.Add('terceiros.fone as telefone, ');
  FDQuery1.SQL.Add('terceiros.celular as celular, ');
  FDQuery1.SQL.Add('terceiros.email as email, ');
  FDQuery1.SQL.Add('terceiros.email_nfe as emailnfe, ');
  FDQuery1.SQL.Add('terceiros.email_boleto as emailboleto, ');
  FDQuery1.SQL.Add('case when (terceiros.id_regime_icms = 1) then ''N'' else ''S'' end as simples, ');
  FDQuery1.SQL.Add('terceiros.indicador_insc_estadual as indicadorie, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.limite_credito as limitecredito, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_form_parc_pref as condicaopagamento, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.ativo as ativo, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.data_ultima_venda as datamovimento, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.data_inativacao as datainativado, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.observacao_entrega as obs, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_vendedor as codigovendedor ');
  FDQuery1.SQL.Add('from terceiros ');
  FDQuery1.SQL.Add('left join logradouros on logradouros.id = terceiros.id_logradouro ');
  FDQuery1.SQL.Add('left join bairros on bairros.id = terceiros.id_bairro ');
  FDQuery1.SQL.Add('inner join terceiros_dados_emp on terceiros_dados_emp.id_terceiro = terceiros.id ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and terceiros_dados_emp.id_empresa = %s',[EditIdEmpresa.Text]));
  if EditRotas.Text <> EmptyStr then
  begin
    FDQuery1.SQL.Add('left join terceiros_setores on terceiros_setores.id_terceiro = terceiros.id ');
    FDQuery1.SQL.Add('left join rotas_setores on rotas_setores.id = terceiros_setores.id_setor ');
    FDQuery1.SQL.Add(Format('where ((terceiros.tipo_fornecedor is true) or (terceiros.tipo_funcionario is true) or (rotas_setores.id_rota in (%s))) ',[EditRotas.Text]));
  end;
  if EditCliforIn.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and terceiros.id in (%s)',[EditCliforIn.Text]));

//  FDQuery1.SQL.Add('where ((terceiros.tipo_cliente = true) or (terceiros.tipo_fornecedor = true) or terceiros.id in (select distinct(produtos_fornecedores.id_terceiro) from produtos_fornecedores)) ');
  {SQLInsertClifor := 'INSERT INTO CLIFOR (CODIGO, FANTASIA, NOME, CNPJ, IE, DATA, DATANASC, NOMEPAI, NOMEMAE, TIPOESTABELECIMENTO, ENDERECO, NUMERO, CIDADE, BAIRRO, COMPLEMENTO, CEP, '+
                     'SIMPLES, INDICADORIE, LIMITECREDITO, CONDICAOPAGAMENTO, ATIVO, DATAMOVIMENTO, DATAINATIVADO, OBS, COMISSAO, SPC, COMISSAOFIXA, VENDARESTRITA, CONSUMIDOR, '+
                     'DESTACARSTITEM, TIPO, CATEGORIA, FILIAL) VALUES (%d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %d, (SELECT FIRST(1) CODIGO FROM BAIRRO WHERE NOME = %s), '+
                     '%s, %s, %s, %d, %s, %s, %s, %s, %s, %s, %d, %s, %s, %s, %s, %s, %d, %d, %d);'; }
  SQLInsertCliforContato := 'INSERT INTO CLIFORCONTATO (CLIFOR, NUMERO, NOME, EMAIL, ENVIARNFE, ENVIARDANFE, ENVIARBOLETO, ENVIARPEDIDO) ' +
                            'VALUES (%d, %s, %s, %s, %s, %s, %s, %s);';
  //SQLInsertFuncionarioClifor := 'INSERT INTO FUNCIONARIOCLIFOR (FUNCIONARIO, CLIFOR) VALUES (%d, %d);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;

 { if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CLIFORCONTATO; COMMIT;');
    ListBox1.Items.Add('DELETE FROM FUNCIONARIOCLIFOR; COMMIT;');
    ListBox1.Items.Add('DELETE FROM CLIFOR; COMMIT;');
    ListBox1.Items.Add('DELETE FROM TIPO; COMMIT;');
  end;
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[1, QuotedStr('CLIENTE')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[2, QuotedStr('FORNECEDOR')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[3, QuotedStr('CLIENTE/FORNECEDOR')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[4, QuotedStr('FUNCIONARIO')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[5, QuotedStr('TRANSPORTADOR')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[6, QuotedStr('VENDEDOR')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[7, QuotedStr('EMPRESA')]));
  ListBox1.Items.Add(Format('UPDATE OR INSERT INTO TIPO (CODIGO, NOME) VALUES (%d, %s) MATCHING (CODIGO); COMMIT;',[8, QuotedStr('MOTORISTA')]));
  ListBox1.Items.Add('ALTER TRIGGER TRIGGER_CLIFORCONTATO_VALIDAR INACTIVE; COMMIT;');  }
  while not FDQuery1.Eof do
  begin
    IsVendedor := FDQuery1.FieldByName('isVendedor').AsBoolean;
    IsMotorista := FDQuery1.FieldByName('ismotorista').AsBoolean;
    IsEmpresa := FDQuery1.FieldByName('isEmpresa').AsBoolean;
    IsFornecedor := FDQuery1.FieldByName('isfornecedor').AsBoolean;
    IsCliente := FDQuery1.FieldByName('iscliente').AsBoolean;
    IsFuncionario := FDQuery1.FieldByName('isfuncionario').AsBoolean;
    IsTransportador := FDQuery1.FieldByName('istransportador').AsBoolean;
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    Fantasia := Copy(FDQuery1.FieldByName('fantasia').AsString, 0, 60);
    Nome := Copy(FDQuery1.FieldByName('nome').AsString, 0, 60);
    CNPJ := Numericos(FDQuery1.FieldByName('cpfcnpj').AsString);
    IE := Numericos(FDQuery1.FieldByName('rgie').AsString);
    DataCadastro := AjustaData(FDQuery1.FieldByName('data').AsString);
    DataNascimento := AjustaData(FDQuery1.FieldByName('datanasc').AsString);
    NomePai := FDQuery1.FieldByName('nomepai').AsString;
    NomeMae := FDQuery1.FieldByName('nomemae').AsString;
    TipoEstabelecimento := FDQuery1.FieldByName('tipoestabelecimento').AsString;
    Contato := FDQuery1.FieldByName('contato').AsString;
    Endereco := Copy(FDQuery1.FieldByName('endereco').AsString, 0, 60);
    Numero := FDQuery1.FieldByName('numero').AsString;
    Cidade := FDQuery1.FieldByName('cidade').AsInteger;
    NomeBairro := FDQuery1.FieldByName('nomebairro').AsString;
    Complemento := FDQuery1.FieldByName('complemento').AsString;
    Cep := Numericos(FDQuery1.FieldByName('cep').AsString);
    Telefone := Copy(Numericos(FDQuery1.FieldByName('telefone').AsString),0,12);
    Celular := Copy(Numericos(FDQuery1.FieldByName('celular').AsString),0,12);
    Email := FDQuery1.FieldByName('email').AsString;
    EmailNFe := FDQuery1.FieldByName('emailnfe').AsString;
    EmailBoleto := FDQuery1.FieldByName('emailboleto').AsString;
    Simples := FDQuery1.FieldByName('simples').AsString;
    IndicadorIE := FDQuery1.FieldByName('indicadorie').AsInteger;
    LimiteCredito := StringReplace(FDQuery1.FieldByName('limitecredito').AsString,',', '.', [rfReplaceAll]);
    CondicaoPagamento := FDQuery1.FieldByName('condicaopagamento').AsString;;
    Ativo := FDQuery1.FieldByName('ativo').AsBoolean;
    DataMovimento := AjustaData(FDQuery1.FieldByName('datamovimento').AsString);
    DataInativado := AjustaData(FDQuery1.FieldByName('datainativado').AsString);
    Obs := FDQuery1.FieldByName('obs').AsString;
    Vendedor := FDQuery1.FieldByName('codigovendedor').AsInteger;
    //separados por virgula
    if Pos(',', Email) > 0 then
      Email := Copy(Email, 0, Pos(',', Email)-1);
    if Pos(',', EmailNFe) > 0 then
      EmailNFe := Copy(EmailNFe, 0, Pos(',', EmailNFe)-1);
    if Pos(',', EmailBoleto) > 0 then
      EmailBoleto := Copy(EmailBoleto, 0, Pos(',', EmailBoleto)-1);
    //separados por ;
    if Pos(';', Email) > 0 then
      Email := Copy(Email, 0, Pos(';', Email)-1);
    if Pos(';', EmailNFe) > 0 then
      EmailNFe := Copy(EmailNFe, 0, Pos(';', EmailNFe)-1);
    if Pos(';', EmailBoleto) > 0 then
      EmailBoleto := Copy(EmailBoleto, 0, Pos(';', EmailBoleto)-1);
    //separados por espaço vazio
    if Pos(' ', Email) > 0 then
      Email := Copy(Email, 0, Pos(' ', Email)-1);
    if Pos(' ', EmailNFe) > 0 then
      EmailNFe := Copy(EmailNFe, 0, Pos(' ', EmailNFe)-1);
    if Pos(' ', EmailBoleto) > 0 then
      EmailBoleto := Copy(EmailBoleto, 0, Pos(' ', EmailBoleto)-1);

    Tipo := 0;
    if ((IsFornecedor) and (IsCliente)) then
      Tipo := 3
    else if (IsCliente) then
      Tipo := 1
    else if (IsFornecedor) then
      Tipo := 2
    else if (IsFuncionario) then
      Tipo := 4
    else if (IsTransportador) then
      Tipo := 5
    else if (IsVendedor) then
      Tipo := 6
    else if (IsEmpresa) then
      Tipo := 7
    else if (IsMotorista) then
      Tipo := 8;


    if Tipo = 0 then
      raise Exception.Create('TipoClifor Inválido no cliente código: '+ IntToStr(Codigo));

    if TipoEstabelecimento = EmptyStr then
      TipoEstabelecimento := 'NULL'
    else
      TipoEstabelecimento := ConverteTipoEstabelecimento(TipoEstabelecimento);
    if CondicaoPagamento = EmptyStr then CondicaoPagamento := 'NULL';
    if Cidade = 0 then Cidade := 1;
    if NomeBairro = EmptyStr then NomeBairro := 'CENTRO';
    //insert clifor
//    ListBox1.Items.Add(Format(SQLInsertClifor,[Codigo, QuotedStr(Fantasia), QuotedStr(Nome), QuotedStr(Cnpj), QuotedStr(IE), DataCadastro, DataNascimento, QuotedStr(NomePai),
//                     QuotedStr(NomeMae), TipoEstabelecimento, QuotedStr(Endereco), QuotedStr(Numero), Cidade, QuotedStr(NomeBairro), QuotedStr(Complemento), QuotedStr(Cep), QuotedStr(Simples),
//                     IndicadorIE, LimiteCredito, CondicaoPagamento, BooleanToStr(Ativo), DataMovimento, DataInativado, QuotedStr(Obs), 0, cNao, cNao, cNao, cNao, cNao, Tipo, 1, Filial]));
    //insert cliforcontato
    EnviarNFe := QuotedStr('N');
    EnviarBoleto := QuotedStr('N');
    if ((Email = EmailNFe) and (EmailNfe = EmailBoleto)) then // se os 3 emails forem iguais
    begin
      EmailNFe := EmptyStr;
      EmailBoleto := EmptyStr;
      EnviarNFe := QuotedStr('S');
      EnviarBoleto := QuotedStr('S');
    end
    else
    if (Email = EmailNFe)  then
    begin
      EmailNFe := EmptyStr;
      EnviarNFe := QuotedStr('S');
    end
    else
    if ((Email = EmailBoleto) and (EmailNFe = EmptyStr)) then
    begin
      EmailBoleto := EmptyStr;
      EnviarBoleto := QuotedStr('S');
    end
    else
    if (EmailNFe = EmailBoleto) then
    begin
      EmailBoleto := EmptyStr;
      EnviarBoleto := QuotedStr('S');
    end;

    if EmailNFe <> EmptyStr then
      EnviarNFe := QuotedStr('S');

    if (Telefone = Celular)  then
      Celular := EmptyStr;

    if ((Telefone <> EmptyStr) or (Celular <> EmptyStr)) then
    begin
      //Telefone
      if Telefone <> EmptyStr then
      begin
        {if Email <> EmptyStr then
        begin
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Telefone), QuotedStr(Contato), QuotedStr(Email), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
          Email := EmptyStr;
        end;
        if EmailNFe <> EmptyStr then
        begin
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Telefone), QuotedStr(Contato), QuotedStr(EmailNFe), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
          EmailNFe := EmptyStr;
          EnviarNFe := QuotedStr('N');
        end;
        if EmailBoleto <> EmptyStr then
        begin
          EnviarBoleto := QuotedStr('S');
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Telefone), QuotedStr(Contato), QuotedStr(EmailBoleto), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
          EmailBoleto := EmptyStr;
          EnviarBoleto := QuotedStr('N');
        end;}
        if ((Email = EmptyStr) and (EmailNFe = EmptyStr) and (EmailBoleto = EmptyStr)) then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Telefone), QuotedStr(Contato), cNull, cNao, cNao, cNao, cNao]));

      end;
      //Celular
      //if Celular <> EmptyStr then
      //begin
        {if EmailBoleto <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Celular), QuotedStr(Contato), QuotedStr(EmailBoleto), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if EmailNFe <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Celular), QuotedStr(Contato), QuotedStr(EmailNFe), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if Email <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Celular), QuotedStr(Contato), QuotedStr(Email), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if ((Email = EmptyStr) and (EmailNFe = EmptyStr) and (EmailBoleto = EmptyStr)) then
        begin
          EnviarNFe := QuotedStr('N');
          EnviarBoleto := QuotedStr('N');
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr(Celular), QuotedStr(Contato), QuotedStr(Email), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        end;}
      //end;
    end;
    //else
      {if ((Email <> EmptyStr) or (EmailNFe <> EmptyStr) or (EmailBoleto <> EmptyStr)) then
      begin
        if Email <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr('11111111'), QuotedStr(Contato), QuotedStr(Email), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if EmailNFe <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr('11111111'), QuotedStr(Contato), QuotedStr(EmailNFe), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
        if EmailBoleto <> EmptyStr then
          ListBox1.Items.Add(Format(SQLInsertCliforContato, [Codigo, QuotedStr('111111111'), QuotedStr(Contato), QuotedStr(EmailBoleto), EnviarNFe, EnviarNFe, EnviarBoleto, cNao]));
      end;}

    //funcionarioclifor
    {if Vendedor > 0 then
      ListBox1.Items.Add(Format(SQLInsertFuncionarioClifor, [Vendedor, Codigo]));}
    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  //ListBox1.Items.Add('ALTER TRIGGER TRIGGER_CLIFORCONTATO_VALIDAR ACTIVE;');
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '06-clifor.txt');
end;

procedure TFrmPrincipal.BtnCliforTabelaPrecoClick(Sender: TObject);
var
  SQLInsert : String;
  TabelaPreco, Clifor : Integer;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select distinct ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_terceiro as clifor, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_tabela_precos as tabelapreco ');
  FDQuery1.SQL.Add('from terceiros_dados_emp');
  if EditRotas.Text <> EmptyStr then
  begin
    FDQuery1.SQL.Add('inner join terceiros_setores on terceiros_setores.id_terceiro = terceiros_dados_emp.id_terceiro ');
    FDQuery1.SQL.Add(Format('inner join rotas_setores on rotas_setores.id = terceiros_setores.id_setor and rotas_setores.id_rota in (%s) ',[EditRotas.Text]));
  end;
  FDQuery1.SQL.Add('where terceiros_dados_emp.id_tabela_precos > 0');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and terceiros_dados_emp.id_empresa = %s',[EditIdEmpresa.Text]));

  SQLInsert := 'INSERT INTO CLIFORTABELAPRECO (CLIFOR, TABELAPRECO, PADRAO) VALUES (%d, %d, %s);';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CLIFORTABELAPRECO; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    TabelaPreco := FDQuery1.FieldByName('tabelapreco').AsInteger;
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;

    ListBox1.Items.Add(Format(SQLInsert,[Clifor, TabelaPreco, cNao]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '17-clifortabelapreco.txt');
end;

procedure TFrmPrincipal.BtnComodatoClick(Sender: TObject);
var
  SQLInsert : String;
  Filial, Clifor, Produto, Funcionario : Integer;
  Obs, Qtde, DataEmissao : String;
begin
  if EditNatOpComodato.Text = EmptyStr then
    raise Exception.Create('Informar Nat. Op. Comodato');
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('vendas.id_empresa as filial, ');
  FDQuery1.SQL.Add('vendas.id_terceiro as clifor, ');
  FDQuery1.SQL.Add('vendas_itens.id_produto as produto, ');
  FDQuery1.SQL.Add('vendas_itens.quantidade as qtde, ');
  FDQuery1.SQL.Add('vendas.id_vendedor as funcionario, ');
  FDQuery1.SQL.Add('cast(vendas.data_emissao as date) as dataemissao, ');
  FDQuery1.SQL.Add('vendas.numero_nf as obs ');
  FDQuery1.SQL.Add('from vendas_itens ');
  FDQuery1.SQL.Add('inner join vendas on vendas.id = vendas_itens.id_venda ');
  FDQuery1.SQL.Add('where vendas.data_cancelamento_nf is  null ');

  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and vendas.id_empresa = %s',[EditIdEmpresa.Text]));
  if EditNatOpComodato.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and vendas.id_nat_operacao in (%s)',[EditNatOpComodato.Text]));
  if EditRotas.Text <> EmptyStr then
  begin
    FDQuery1.SQL.Add('and vendas.id_terceiro in (select id from terceiros where id in ');
    FDQuery1.SQL.Add('(select id_terceiro from terceiros_setores where id_setor in ');
    FDQuery1.SQL.Add(Format('(select id from rotas_setores where id_rota in (%s))) or (terceiros.tipo_fornecedor is true) or (terceiros.tipo_funcionario is true)) ',[EditRotas.Text]));
  end;
  SQLInsert := 'INSERT INTO COMODATO (CODIGO, DATAEMISSAO, CLIFOR, FUNCIONARIO, PRODUTO, OBS, FILIAL) '+
               'VALUES ((SELECT COALESCE((MAX(CODIGO) +1),1) FROM COMODATO), %s, %d, %d, (SELECT CODIGO FROM PRODUTO WHERE PRAZOVALIDADE = %d), %s, %d);';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  {if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CONSUMO; COMMIT;');
  end; }
  while not FDQuery1.Eof do
  begin
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;
    Produto := FDQuery1.FieldByName('produto').AsInteger;
    Qtde := StringReplace(FDQuery1.FieldByName('qtde').AsString, ',', '.', [rfReplaceAll]);
    Funcionario := FDQuery1.FieldByName('funcionario').AsInteger;
    DataEmissao := AjustaData(FDQuery1.FieldByName('dataemissao').AsString);
    Obs := FDQuery1.FieldByName('obs').AsString;
    if Obs <> EmptyStr then
      Obs := QuotedStr('NOTA FISCAL NUMERO: ' + Obs)
    else
      Obs := 'NULL';


    ListBox1.Items.Add(Format(SQLInsert,[DataEmissao, Clifor, Funcionario, Produto, Obs, Filial]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
    Application.ProcessMessages;
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '60-comodato.txt');
end;

procedure TFrmPrincipal.BtnCondicaoPagamentoClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Vezes, Intervalo, PrimeiroVcto : Integer;
  Ativo : Boolean;
  Nome, Indicador : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from formas_parcelamento');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('where id_empresa = %s',[EditIdEmpresa.Text]));
  SQLInsert := 'INSERT INTO CONDICAOPAGAMENTO (CODIGO, NOME, PRIMEIROVCTO, VEZES, INTERVALO, EXPORTAR, ATIVO, COMISSAO, LIBERARVENDAPENDENCIA, INDICADOR, '+
               'DIVIDIRVALORST, LIBERARVENDALIMITE, CONCEDERDESCONTO, INDICADORNFE, SOLICITARPRIMEIROVENCIMENTO, INDICE, VALORMINIMO, BLOQUEARCLIFORAUTOMATICAMENTE, ISOLARST) '+
               'VALUES (%d, %s, %d, %d, %d, %s, %s, %d, %s, %s, %s, %s, %s, %s, %s, %d, %d, %s, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CONDICAOPAGAMENTO; COMMIT;');
  end;
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
                       cNao, 1, 0, cNao, cNao]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '01-condicaopagamento.txt');
end;

procedure TFrmPrincipal.BtnConectarClick(Sender: TObject);
begin
  ConectarDB;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.BtnContasAPagarClick(Sender: TObject);
begin
  GerarContasAPagar(False);
end;

procedure TFrmPrincipal.BtnContasAReceberExcelClick(Sender: TObject);
var
  I : Integer;
  SQLInsert : String;
  Clifor, Ordem, Documento, Emissao, Vencimento, Valor, NossoNumero, Historico, Filial : String;
begin
  try
    ShowMessage('Lembrar de preencher Inicio Planilha e Fim Planilha');
    ShowMessage('Analisar NossoNumero');
    CarregarExcel;
    PageControl1.ActivePageIndex := 0;
    Application.ProcessMessages;
    SQLInsert := 'INSERT INTO FINANCEIRO (FILIAL, TIPO, CLIFOR, ORDEM, DOCUMENTO, DATAEMISSAO, DATAVCTO, VALOR, NOSSONUMERO, HISTORICO, SITUACAO) '+
                 'VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
    ListBox1.Clear;
    ListBoxNossoNumero.Clear;
    ListBoxNossoNumeroDuplicado.Clear;
    ListBox1.Items.Add('UPDATE OR INSERT INTO SITUACAO (CODIGO, NOME, GERARDESC0NTO, OCORRENCIA) VALUES ('+EditSituacaoFinanceiro.Text+', '+ GetNomeSituacaoFinanceiro(EditSituacaoFinanceiro.Text) +', ''N'', NULL) MATCHING (CODIGO); COMMIT WORK;');
    Gauge1.Progress := StrToInt(EditInicioPlanilha.Text);
    Gauge1.MaxValue := StrToInt(EditFimPlanilha.Text);

    Filial := '1';
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := EditForcarNumeroFilial.Text;
    for I := StrToInt(EditInicioPlanilha.Text) to StrToInt(EditFimPlanilha.Text) do
    begin
      Clifor := Trim(Planilha.cells[i,2]);
      Ordem := Trim(Planilha.cells[i,6]);
      Documento := Trim(Planilha.cells[i,6]);
      Emissao := StringReplace(Trim(Planilha.cells[i,7]),'/','.',[rfReplaceAll]);
      Vencimento := StringReplace(Trim(Planilha.cells[i,9]),'/','.',[rfReplaceAll]);
      Valor := StringReplace(Trim(Planilha.cells[i,13]),',','.',[rfReplaceAll]);
      NossoNumero := Trim(Planilha.cells[i,14]);
      Historico := Trim(Planilha.cells[i,21]);


      //Documento := Copy(Documento,4,(Pos('/',Documento)-4));
      Documento := Numericos(Documento);
      if Documento = EmptyStr then
        Documento := 'NULL';
      if Historico = EmptyStr then
        Historico := 'NULL';
      if Pos('-',NossoNumero) > 0 then
        NossoNumero := Copy(NossoNumero,0,(Pos('-',NossoNumero)-1))
      else
        NossoNumero := Numericos(NossoNumero);
      if NossoNumero = EmptyStr then NossoNumero := 'NULL';

      if NossoNumero <> EmptyStr then
      begin

        if ListBoxNossoNumero.Items.IndexOf(NossoNumero) = -1 then
          ListBoxNossoNumero.Items.Add(NossoNumero)
        else
          if ListBoxNossoNumeroDuplicado.Items.IndexOf(NossoNumero) = -1 then
            ListBoxNossoNumeroDuplicado.Items.Add(NossoNumero)
        else

      end;
      Ordem := Copy(Ordem,0,17);
      ListBox1.Items.Add(Format(SQLInsert,[Filial, QuotedStr(EditTipoFinanceiro.Text), Clifor, QuotedStr(Ordem), Documento, QuotedStr(Emissao), QuotedStr(Vencimento),
      Valor, NossoNumero, Historico, EditSituacaoFinanceiro.Text]));

      Gauge1.AddProgress(1);
    end;
  finally
    Excel.Quit;
  end;
end;

procedure TFrmPrincipal.BtnContasPagarExcelClick(Sender: TObject);
var
  I : Integer;
  SQLInsert : String;
  Clifor, Ordem, Documento, Emissao, Vencimento, Valor, NossoNumero, Historico : String;
begin
  try
    ShowMessage('Lembrar de preencher Inicio Planilha e Fim Planilha');
    ShowMessage('Analisar NossoNumero');
    CarregarExcel;
    SQLInsert := 'INSERT INTO FINANCEIRO (FILIAL, TIPO, CLIFOR, ORDEM, DOCUMENTO, DATAEMISSAO, DATAVCTO, VALOR, NOSSONUMERO, HISTORICO, SITUACAO) '+
                 'VALUES (1, %s, %s, %s, %s, %s, %s, %s, %s, %s, 99);';
    ListBox1.Clear;
    ListBoxNossoNumero.Clear;
    ListBoxNossoNumeroDuplicado.Clear;
    ListBox1.Items.Add('UPDATE OR INSERT INTO SITUACAO (CODIGO, NOME, GERARDESC0NTO, OCORRENCIA) VALUES (99, ''CONVERSAO'', ''N'', NULL) MATCHING (CODIGO); COMMIT WORK;');
    Gauge1.Progress := StrToInt(EditInicioPlanilha.Text);
    Gauge1.MaxValue := StrToInt(EditFimPlanilha.Text);
    for I := StrToInt(EditInicioPlanilha.Text) to StrToInt(EditFimPlanilha.Text) do
    begin
      Clifor := Trim(Planilha.cells[i,2]);
      Ordem := Trim(Planilha.cells[i,7]);
      Documento := Trim(Planilha.cells[i,7]);
      Emissao := StringReplace(Trim(Planilha.cells[i,9]),'/','.',[rfReplaceAll]);
      Vencimento := StringReplace(Trim(Planilha.cells[i,10]),'/','.',[rfReplaceAll]);
      Valor := StringReplace(Trim(Planilha.cells[i,13]),',','.',[rfReplaceAll]);
      NossoNumero := 'NULL';
      Historico := Trim(Planilha.cells[i,21]);

      //Documento := Copy(Documento,4,(Pos('/',Documento)-4));
      Documento := Numericos(Documento);
      if Documento = EmptyStr then
        Documento := 'NULL';
      if Historico = EmptyStr then
        Historico := 'NULL';

      ListBox1.Items.Add(Format(SQLInsert,[QuotedStr('D'), Clifor, QuotedStr(Ordem), Documento, QuotedStr(Emissao), QuotedStr(Vencimento), Valor, NossoNumero, Historico]));

      Gauge1.AddProgress(1);
    end;
  finally
    Excel.Quit;
  end;
end;

procedure TFrmPrincipal.BtnContasPagarProcedureClick(Sender: TObject);
begin
  GerarContasAPagar(True);
end;

procedure TFrmPrincipal.BtnContasReceberClick(Sender: TObject);
var
  SQLInsert : String;
  Clifor, Filial : Integer;
  Documento, Ordem, DataEmissao, DataVcto, DataBaixa, ValorTitulo, Obs, Juros, Desconto, ValorDevedor, DataAgendamento, Multa, ValorBaixa, Parcela, TipoDoc: String;
  Cancelado : Boolean;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('contas_receber.id_terceiro as clifor, ');
  FDQuery1.SQL.Add('contas_receber.id_empresa as filial, ');
  FDQuery1.SQL.Add('contas_receber.documento as documento, ');
  FDQuery1.SQL.Add('contas_receber.tipo_doc, ');
  FDQuery1.SQL.Add('contas_receber.tipo_doc || contas_receber.documento as ordem, ');
  FDQuery1.SQL.Add('contas_receber.referencia as parcela, ');
  FDQuery1.SQL.Add('contas_receber.data_emissao as dataemissao, ');
  FDQuery1.SQL.Add('contas_receber.data_vencimento as datavcto, ');
  FDQuery1.SQL.Add('contas_receber.data_quitacao as databaixa, ');
  FDQuery1.SQL.Add('contas_receber.valor as valortitulo, ');
  FDQuery1.SQL.Add('contas_receber.valor_total_amortizado as valorbaixa, ');
  FDQuery1.SQL.Add('contas_receber.observacao as obs, ');
  FDQuery1.SQL.Add('contas_receber.valor_total_juros as juro, ');
  FDQuery1.SQL.Add('contas_receber.valor_total_desconto as desconto, ');
  FDQuery1.SQL.Add('contas_receber.valor_devedor as valordevedor, ');
  FDQuery1.SQL.Add('contas_receber.data_agend_pagto as agendamento, ');
  FDQuery1.SQL.Add('contas_receber.valor_total_multa as multa, ');
  //FDQuery1.SQL.Add('case when vendas.data_cancelamento_nf is null then false else true end as cancelado ');
  FDQuery1.SQL.Add('case when ((vendas.data_cancelamento_nf is not null) or (vendas.data_contabil is  null)) then true else false end as cancelado ');
  FDQuery1.SQL.Add('from contas_receber ');
  FDQuery1.SQL.Add('left join vendas on vendas.id_terceiro = contas_receber.id_terceiro ');
  FDQuery1.SQL.Add('and vendas.id_empresa = contas_receber.id_empresa ');
  FDQuery1.SQL.Add('and vendas.numero_nf = cast(contas_receber.documento as integer) ');
  FDQuery1.SQL.Add('and cast(vendas.data_emissao as date) = contas_receber.data_emissao ');
  FDQuery1.SQL.Add('where 1=1 ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and contas_receber.id_empresa = %s',[EditIdEmpresa.Text]));
  if CheckBobxContasReceberSomenteDocumentosComNumero.Checked then
    FDQuery1.SQL.Add('and contas_receber.documento ~ ''^[-0-9]+$'' = true and contas_receber.documento not like ''%-%'' ');
  if EditRotas.Text <> EmptyStr then
  begin
    FDQuery1.SQL.Add('and contas_receber.id_terceiro in (select id from terceiros where id in ');
    FDQuery1.SQL.Add('(select id_terceiro from terceiros_setores where id_setor in ');
    FDQuery1.SQL.Add(Format('(select id from rotas_setores where id_rota in (%s))) or (terceiros.tipo_fornecedor is true) or (terceiros.tipo_funcionario is true)) ',[EditRotas.Text]));
  end;

    SQLInsert := 'INSERT INTO FINANCEIRO (TIPO, FILIAL, CLIFOR, DOCUMENTO, ORDEM, DATAEMISSAO, DATAVCTO, DATABAIXA, VALOR, OBS, JURO, DESCONTO, VALORBAIXA, DATAAGENDAMENTO, MULTA,  '+
                 'IMPRIMIR, IMPRESSO, CANCELADO, SITUACAO) VALUES (%s, %d, %d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 99);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  ListBox1.Items.Add('UPDATE OR INSERT INTO SITUACAO (CODIGO, NOME, GERARDESC0NTO, OCORRENCIA) VALUES (99, ''CONVERSAO'', ''N'', NULL) MATCHING (CODIGO); COMMIT WORK;');
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM FINANCEIRO FIN WHERE SITUACAO = 99 AND TIPO = ''C'' AND FIN.ORDEM NOT IN (SELECT OC.ORDEM FROM OCORRENCIAFINANCEIRO OC WHERE OC.ORDEM = FIN.ORDEM AND OC.CLIFOR = FIN.CLIFOR '+
                       'AND OC.FILIAL = FIN.FILIAL AND OC.DATAEMISSAO = FIN.DATAEMISSAO); COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;
    Documento := Copy(Numericos(FDQuery1.FieldByName('documento').AsString),0,9);
    Ordem := Copy(FDQuery1.FieldByName('ordem').AsString,0,18);
    Parcela := FDQuery1.FieldByName('parcela').AsString;
    TipoDoc := FDQuery1.FieldByName('tipo_doc').AsString;
    DataEmissao := AjustaData(FDQuery1.FieldByName('dataemissao').AsString);
    DataVcto := AjustaData(FDQuery1.FieldByName('datavcto').AsString);
    DataBaixa := AjustaData(FDQuery1.FieldByName('databaixa').AsString);
    ValorTitulo := StringReplace(FDQuery1.FieldByName('valortitulo').AsString,',','.',[rfReplaceAll]);
    Valorbaixa := StringReplace(FDQuery1.FieldByName('valorbaixa').AsString,',','.',[rfReplaceAll]);
    Obs := FDQuery1.FieldByName('obs').AsString;
    Juros := StringReplace(FDQuery1.FieldByName('juro').AsString,',','.',[rfReplaceAll]);
    Desconto := StringReplace(FDQuery1.FieldByName('desconto').AsString,',','.',[rfReplaceAll]);
    ValorDevedor := StringReplace(FDQuery1.FieldByName('valordevedor').AsString,',','.',[rfReplaceAll]);
    DataAgendamento := AjustaData(FDQuery1.FieldByName('agendamento').AsString);
    Multa := StringReplace(FDQuery1.FieldByName('multa').AsString,',','.',[rfReplaceAll]);
    Cancelado := FDQuery1.FieldByName('cancelado').AsBoolean;

    if ((FDQuery1.FieldByName('datavcto').AsDateTime < FDQuery1.FieldByName('dataemissao').AsDateTime) and (DataVcto <> 'NULL')) then
      DataVcto := DataEmissao;
    if ((FDQuery1.FieldByName('agendamento').AsDateTime < FDQuery1.FieldByName('dataemissao').AsDateTime) and (DataAgendamento <> 'NULL')) then
      DataAgendamento := DataEmissao;
    if ((FDQuery1.FieldByName('databaixa').AsDateTime < FDQuery1.FieldByName('dataemissao').AsDateTime) and (DataBaixa <> 'NULL')) then
      DataBaixa := DataEmissao;

    Ordem := Ordem + '-' + Parcela;

    if ValorBaixa = '0.00' then
    begin
      ValorBaixa := 'NULL';
      ValorTitulo := ValorDevedor;
    end;
    if DataBaixa = 'NULL' then
      ValorTitulo := ValorDevedor;
    if Juros = '0.00' then Juros := 'NULL';
    if Desconto = '0.00' then Desconto := 'NULL';
    if Multa = '0.00' then Multa := 'NULL';
    if Documento = EmptyStr then Documento := 'NULL';

    //pedidos nunca estao cancelados
    if TipoDoc = 'PED' then Cancelado := False;
    

    ListBox1.Items.Add(Format(SQLInsert,[QuotedStr('C'), Filial, Clifor, Documento, QuotedStr(Ordem), DataEmissao, DataVcto, DataBaixa, ValorTitulo, QuotedStr(Obs), Juros, Desconto,
                       ValorBaixa, DataAgendamento, Multa, cNao, cNao, BooleanToStr(Cancelado)]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '19-contasreceber.txt');
end;

procedure TFrmPrincipal.BtnDesconectarClick(Sender: TObject);
begin
  DesconectarDB;
  AjustaBotoesConexao;
end;

procedure TFrmPrincipal.BtnEstoqueClick(Sender: TObject);
var
  SQLUpdate : String;
  Codigo, TipoItem, Filial : Integer;
  CustoMedio, CustoTabela: String;
  Venda, Exportar : Boolean;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('produtos_dados_emp.id_empresa as filial, ');
  FDQuery1.SQL.Add('produtos.id as produto, ');
  FDQuery1.SQL.Add('produtos.tipo as tipoitem, ');
  FDQuery1.SQL.Add('produtos_dados_emp.custo_mpm as customedio, ');
  FDQuery1.SQL.Add('produtos_dados_emp.custo_reposicao as custotabela, ');
  FDQuery1.SQL.Add('produtos_dados_emp.vende as venda, ');
  FDQuery1.SQL.Add('produtos_dados_emp.exporta_pda as exportar ');
  FDQuery1.SQL.Add('from produtos ');
  FDQuery1.SQL.Add('left join produtos_dados_emp on produtos_dados_emp.id_produto = produtos.id ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and produtos_dados_emp.id_empresa = %s',[EditIdEmpresa.Text]));
  SQLUpdate := 'UPDATE ESTOQUE SET TIPOITEM = %d, VALORMEDIO = %s, VALORCUSTOTABELA = %s, VALORCUSTO = %s, VENDA = %s, EXPORTAR = %s WHERE FILIAL = %d AND PRODUTO = (SELECT CODIGO FROM PRODUTO WHERE PRAZOVALIDADE = %d);';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  ListBox1.Items.Add('UPDATE ESTOQUE SET TRIBUTACAOPIS = 1, TRIBUTACAOCOFINS = 1; COMMIT;');
  while not FDQuery1.Eof do
  begin
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Codigo := FDQuery1.FieldByName('produto').AsInteger;
    TipoItem := FDQuery1.FieldByName('tipoitem').AsInteger;
    CustoMedio := StringReplace(FDQuery1.FieldByName('customedio').AsString, ',', '.', [rfReplaceAll]);
    CustoTabela := StringReplace(FDQuery1.FieldByName('custotabela').AsString, ',', '.', [rfReplaceAll]);
    Venda := FDQuery1.FieldByName('venda').AsBoolean;
    Exportar := FDQuery1.FieldByName('exportar').AsBoolean;

    ListBox1.Items.Add(Format(SQLUpdate,[TipoItem, CustoMedio, CustoTabela, CustoTabela, BooleanToStr(Venda), BooleanToStr(Exportar), Filial, Codigo]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '14-estoque.txt');
end;

procedure TFrmPrincipal.BtnFuncionarioClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Cidade : Integer;
  Fantasia, Nome, Cpf, Rg, Data, DataNasc, Endereco, NomeBairro, Complemento, Cep, Telefone, Email : String;
  Vendedor : Boolean;
begin
  FDQuery1.SQL.Clear;
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
  if EditCliforIn.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('where terceiros.id in (%s) ',[EditCliforIn.Text]))
  else
  begin
    FDQuery1.SQL.Add('where ((terceiros.tipo_vendedor = true) or (terceiros.tipo_funcionario = true) ');
    FDQuery1.SQL.Add('or (terceiros.id in (select id_vendedor from terceiros_dados_emp)) ');
    FDQuery1.SQL.Add('or (terceiros.id in (select id_vendedor from vendas))) ');
  end;


   //FDQuery1.SQL.Add(') ');

  SQLInsert := 'INSERT INTO FUNCIONARIO (CODIGO, FANTASIA, NOME, CPF, RG, DATA, DATANASC, ENDERECO, CIDADE, BAIRRO, COMPLEMENTO, CEP, TELEFONE, EMAIL, GERARPEDIDOBLOQUEADO, '+
               'COMISSAOFIXA, UTILIZAGEOLOCALIZACAO, AFVLIBERARFORAROTA, ENVIARAUTOMATICO, AFVPRONTAENTREGA, COMISSAO, EXPORTAR, ATIVO, RECEBEMENSAGEM, GERARCOMISSAO, FLEX, GERARFLEX, '+
               'UTILIZAROTA, AFVTEMPOSINCRONIZAR, LIMITEFLEX) VALUES (%d, %s, %s, %s, %s, %s, %s, %s, %d, (SELECT FIRST(1) CODIGO FROM BAIRRO WHERE NOME = %s), '+
               '%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %d, %s, %s, %s, %s, %d, %s, %s, %d, %d);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CARGOFUNCIONARIO; COMMIT;');
    ListBox1.Items.Add('DELETE FROM FUNCIONARIO; COMMIT;');
  end;
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
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '05-funcionario.txt');
end;

procedure TFrmPrincipal.BtnGerarTodosClick(Sender: TObject);
begin
  //ShowMessage('Verificar Configs');
  ValidaConfigTipoEstabelecimento;
  CheckBoxSalvarAutomaticamente.Checked := True;
  Application.ProcessMessages;
  BtnCondicaoPagamentoClick(Self);
  Application.ProcessMessages;
  //BtnTipoEstabelecimentoClick(Self);
  //Application.ProcessMessages;
  BtnBairroClick(Self);
  Application.ProcessMessages;
  BtnCidadeClick(Self);
  Application.ProcessMessages;
  BtnFuncionarioClick(Self);
  Application.ProcessMessages;
  BtnCliforClick(Self);
  Application.ProcessMessages;
  BtnUnidadeMedidaClick(Self);
  Application.ProcessMessages;
  BtnGrupoClick(Self);
  Application.ProcessMessages;
  BtnTipoProdutoClick(Self);
  Application.ProcessMessages;
  BtnMarcaClick(Self);
  Application.ProcessMessages;
  BtnClassificacaoClick(Self);
  Application.ProcessMessages;
  BtnProdutoClick(Self);
  Application.ProcessMessages;
  BtnProdutoCliforClick(Self);
  Application.ProcessMessages;
  BtnEstoqueClick(Self);
  Application.ProcessMessages;
  BtnTabelaPrecoClick(Self);
  Application.ProcessMessages;
  BtnItemTabelaPrecoClick(Self);
  Application.ProcessMessages;
  BtnCliforTabelaPrecoClick(Self);
  Application.ProcessMessages;
  //BtnContasAPagarClick(Self);
  //Application.ProcessMessages;
  //BtnContasReceberClick(Self);
  //Application.ProcessMessages;
  BtnRotaClick(Self);
  Application.ProcessMessages;
  BtnRotaCliforClick(Self);
  Application.ProcessMessages;
  //BtnVendasClick(Self);
  //Application.ProcessMessages;
end;

procedure TFrmPrincipal.BtnGrupoClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Ordem : Integer;
  Nome : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from grupos_gerenciais_prod');
  SQLInsert := 'INSERT INTO GRUPO (CODIGO, NOME, ORDEM, COMISSAO, FLEX, ORDEMTABELA, EXPORTAR, QTDEMULTIPLA, COMISSAOFIXA, COMISSAOENTREGA, LIMITESUPERIORFLEX, '+
               'LIMITEINFERIORFLEX, FLEXFIXO, ATIVO) VALUES (%d, %s, %d, %d, %d, %d, %s, %d, %s, %d, %d, %d, %s, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM GRUPO; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('id').AsInteger;
    Nome := FDQuery1.FieldByName('desc_grupo_gerencial').AsString;
    Ordem := FDQuery1.FieldByName('ordem_relatorio').AsInteger;

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), Ordem, 0, 0, Ordem, cSim, 1, cNao, 0, 0, 0, cNao, cSim]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '08-grupo.txt');
end;

procedure TFrmPrincipal.BtnItemTabelaPrecoClick(Sender: TObject);
var
  SQLUpdate : String;
  TabelaPreco, Produto : Integer;
  ValorMinimo, ValorVenda : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from produtos_precos');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('where produtos_precos.id_tabela in (select id from tabelas_precos where tabelas_precos.id_empresa = %s)',[EditIdEmpresa.Text]));
  SQLUpdate := 'UPDATE ITEMTABELAPRECO SET VALORVENDA = %s, VALORMINIMO = %s WHERE TABELAPRECO = %d AND PRODUTO = (SELECT CODIGO FROM PRODUTO WHERE PRAZOVALIDADE = %d);';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  while not FDQuery1.Eof do
  begin
    TabelaPreco := FDQuery1.FieldByName('id_tabela').AsInteger;
    Produto := FDQuery1.FieldByName('id_produto').AsInteger;
    ValorMinimo := StringReplace(FDQuery1.FieldByName('valor_minimo').AsString,',','.',[rfReplaceAll]);
    ValorVenda := StringReplace(FDQuery1.FieldByName('valor').AsString,',','.',[rfReplaceAll]);

    ListBox1.Items.Add(Format(SQLUpdate,[ValorVenda, ValorMinimo, TabelaPreco, Produto]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '16-itemtabelapreco.txt');
end;

procedure TFrmPrincipal.BtnMarcaClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo : Integer;
  Nome : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from marcas');
  SQLInsert := 'INSERT INTO MARCA (CODIGO, NOME, COMISSAO, EXPORTAR, ORDEM, ATIVO, COMISSAOFIXA, FLEX, LIMITESUPERIORFLEX, LIMITEINFERIORFLEX, FLEXFIXO) '+
               'VALUES (%d, %s, %d, %s, %d, %s, %s, %d, %d, %d, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM MARCA; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('id').AsInteger;
    Nome := FDQuery1.FieldByName('desc_marca').AsString;

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), 0, cSim, 0, cSim, cNao, 0, 0, 0, cNao]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '10-marca.txt');
end;

procedure TFrmPrincipal.BtnProdutoClick(Sender: TObject);
var
  SQLInsert, SQLInsertGrupo : String;
  Codigo,  Grupo, Ordem : Integer;
  Nome, Barras, PesoLiquido, PesoBruto, Data, UnCompra, CodigoNcm,  Cest, TipoProduto, Marca, Classificacao: String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('produtos.id as codigo, ');
  FDQuery1.SQL.Add('produtos.desc_produto as nome, ');
  FDQuery1.SQL.Add('produtos.codigo_barras as barras, ');
  FDQuery1.SQL.Add('produtos.id_subgrupo as tipoproduto, ');
  FDQuery1.SQL.Add('produtos.id_marca as marca, ');
  FDQuery1.SQL.Add('produtos.id_sabor as classificacao, ');
  FDQuery1.SQL.Add('produtos.peso as pesoliquido, ');
  FDQuery1.SQL.Add('produtos.peso_embalado as pesobruto, ');
  FDQuery1.SQL.Add('produtos.data_criacao as data, ');
  FDQuery1.SQL.Add('unidades.sigla as uncompra, ');
  FDQuery1.SQL.Add('classif_fiscal.codigo_ncm as codigoncm, ');
  FDQuery1.SQL.Add('produtos.ordem_relatorio as ordem, ');
  FDQuery1.SQL.Add('produtos.id_grupo_gerencial as grupo, ');
  FDQuery1.SQL.Add('produtos.codigo_cest as cest ');
  FDQuery1.SQL.Add('from produtos ');
  FDQuery1.SQL.Add('inner join unidades on unidades.id = produtos.id_unidade ');
  FDQuery1.SQL.Add('left join classif_fiscal on classif_fiscal.id = produtos.id_classif_fiscal ');
  //if EditIdEmpresa.Text <> EmptyStr then
  //  FDQuery1.SQL.Add(Format('where produtos.id_empresa = %s',[EditIdEmpresa.Text]));

  SQLInsert := 'INSERT INTO PRODUTO (CODIGO, NOME, BARRAS, TIPOPRODUTO, MARCA, CLASSIFICACAO, PESOLIQUIDO, PESOBRUTO, DATA, UNCOMPRA, CODIGONCM, ORDEM, GRUPO, CEST, '+
               'PESOEMBALAGEM, QTDEREFERENCIA, UNREFERENCIA, QTDEMULTIPLAEMBALAGEM, VOLUME, PROFUNDIDADE, LARGURA, ALTURA, VENDACONTROLADA, QTDETROCA, UNTROCA, QTDEMULTIPLA, '+
               'QTDEPADRAO, TRIBUTACAO, QTDECARREGAMENTO, UNCARREGAMENTO, QTDEVENDA, UNVENDA, QTDECOMPRA, INDICADORESCALA, PRAZOVALIDADE, BLOQUEARENTRADAVALIDADE) VALUES (%d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %d, %d, %s, %d, %d, %s, %d, %d, '+
               '%d, %d, %d, %s, %d, %s, %d, %d, %d, %d, %s, %d, %s, %d, %s, %d, %d);';
  SQLInsertGrupo := 'INSERT INTO GRUPO (CODIGO, NOME, ORDEM, COMISSAO, FLEX, ORDEMTABELA, EXPORTAR, QTDEMULTIPLA, COMISSAOFIXA, COMISSAOENTREGA, LIMITESUPERIORFLEX, '+
                    'LIMITEINFERIORFLEX, FLEXFIXO, ATIVO) VALUES (%d, %s, %d, %d, %d, %d, %s, %d, %s, %d, %d, %d, %s, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM PRODUTO; COMMIT;');
  end;
  ListBox1.Items.Add('DELETE FROM GRUPO WHERE CODIGO = 9999; COMMIT;');
  ListBox1.Items.Add(Format(SQLInsertGrupo,[9999, QuotedStr('VERIFICAR'), 0, 0, 0, 0, cSim, 1, cNao, 0, 0, 0, cNao, cSim]));
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    Nome := Copy(FDQuery1.FieldByName('nome').AsString,0,60);
    Barras := FDQuery1.FieldByName('barras').AsString;
    TipoProduto := FDQuery1.FieldByName('tipoproduto').AsString;
    Marca := FDQuery1.FieldByName('marca').AsString;
    Classificacao := FDQuery1.FieldByName('classificacao').AsString;
    PesoLiquido := StringReplace(FDQuery1.FieldByName('pesoliquido').AsString, ',', '.', [rfReplaceAll]);
    PesoBruto := StringReplace(FDQuery1.FieldByName('pesobruto').AsString, ',', '.', [rfReplaceAll]);
    Data := AjustaData(FDQuery1.FieldByName('data').AsString);
    UnCompra := Copy(FDQuery1.FieldByName('uncompra').AsString,0,3);
    CodigoNcm := Numericos(FDQuery1.FieldByName('codigoncm').AsString);
    Ordem := FDQuery1.FieldByName('ordem').AsInteger;
    Grupo := FDQuery1.FieldByName('grupo').AsInteger;
    Cest := Numericos(FDQuery1.FieldByName('cest').AsString);

    if TipoProduto = EmptyStr then TipoProduto := 'NULL';
    if Marca = EmptyStr then Marca := 'NULL';
    if Classificacao = EmptyStr then Classificacao := 'NULL';
    if Grupo = 0 then Grupo := 9999;
    if ((Length(Barras) = 1) or (Length(Barras) = 2) or (Length(Barras) = 3) or (Length(Barras) = 4)) then Barras := IntToStr(Codigo);

    if Barras = 'SEM GTIN' then Barras := IntToStr(Codigo);

    

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), QuotedStr(Barras), TipoProduto, Marca, Classificacao, PesoLiquido, PesoBruto, Data, QuotedStr(UnCompra),
                       QuotedStr(CodigoNcm), Ordem, Grupo, QuotedStr(Cest), 0, 1, QuotedStr(UnCompra), 1, 0, 0, 0, 0, cNao, 1, QuotedStr(UnCompra), 1, 1, 1, 1, QuotedStr(UnCompra),
                       1, QuotedStr(UnCompra), 1, cSim, Codigo, 0]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '12-produto.txt');
end;

procedure TFrmPrincipal.BtnProdutoCliforClick(Sender: TObject);
var
  SQLUpdate : String;
  Produto, Clifor : Integer;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('produtos_fornecedores.id_produto as produto, ');
  FDQuery1.SQL.Add('produtos_fornecedores.id_terceiro as clifor ');
  FDQuery1.SQL.Add('from produtos_fornecedores');
  //if EditIdEmpresa.Text <> EmptyStr then
  //  FDQuery1.SQL.Add(Format('where produtos_fornecedores.id_empresa = %s',[EditIdEmpresa.Text]));
  SQLUpdate := 'UPDATE PRODUTO SET CLIFOR = %d WHERE CODIGO = (SELECT CODIGO FROM PRODUTO WHERE PRAZOVALIDADE = %d);';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  while not FDQuery1.Eof do
  begin
    Produto := FDQuery1.FieldByName('produto').AsInteger;
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;

    ListBox1.Items.Add(Format(SQLUpdate,[Clifor, Produto]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '13-produtoclifor.txt');
end;

procedure TFrmPrincipal.BtnRotaClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Funcionario, Filial : Integer;
  NomeRota, ClassificacaoRota, Periodicidade : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('rotas_setores.id as codigo, ');
  FDQuery1.SQL.Add('rotas.desc_rota || '' - '' ||rotas_setores.desc_setor as nome, ');
  FDQuery1.SQL.Add('rotas_setores.id_vendedor as funcionario, ');
  FDQuery1.SQL.Add('rotas_setores.ordem as classificacaorota, ');
  FDQuery1.SQL.Add('rotas_setores.periodicidade, ');
  FDQuery1.SQL.Add('rotas.id_empresa as filial ');
  FDQuery1.SQL.Add('from rotas_setores ');
  FDQuery1.SQL.Add('inner join rotas on rotas.id = rotas_setores.id_rota ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and rotas.id_empresa = %s ',[EditIdEmpresa.Text]));
  if EditRotas.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('where rotas.id in (%s) ',[EditRotas.Text]));

  SQLInsert := 'INSERT INTO ROTA (CODIGO, NOME, TIPOROTA, FUNCIONARIO, REORDENAR, CLASSIFICACAOROTA, FILIAL) VALUES (%d, %s, %s, %d, %s, %s, %d);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM ROTACLIFOR; COMMIT;');
    ListBox1.Items.Add('DELETE FROM ROTA; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    NomeRota := Copy(FDQuery1.FieldByName('nome').AsString,0,30);
    Funcionario := FDQuery1.FieldByName('funcionario').AsInteger;
    ClassificacaoRota := FDQuery1.FieldByName('classificacaorota').AsString;
    Periodicidade := FDQuery1.FieldByName('periodicidade').AsString;
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);

    //if Periodicidade = '2' then ClassificacaoRota := Periodicidade + ClassificacaoRota; //quinzenal
    ClassificacaoRota := 'NULL';
    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(NomeRota), QuotedStr('V'), Funcionario, cNao, ClassificacaoRota, Filial]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '20-rota.txt');
end;

procedure TFrmPrincipal.BtnRotaCliforClick(Sender: TObject);
var
  SQLInsert : String;
  Rota, Clifor, Ordem : Integer;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('terceiros_setores.id_terceiro as clifor, ');
  FDQuery1.SQL.Add('terceiros_setores.id_setor as rota, ');
  FDQuery1.SQL.Add('terceiros_setores.ordem_setor as ordem ');
  FDQuery1.SQL.Add('from terceiros_setores ');
  FDQuery1.SQL.Add('inner join rotas_setores on rotas_setores.id = terceiros_setores.id_setor ');
  FDQuery1.SQL.Add('inner join rotas on rotas.id = rotas_setores.id_rota ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and rotas.id_empresa = %s ',[EditIdEmpresa.Text]));
  if EditRotas.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('where rotas.id in (%s) ',[EditRotas.Text]));


  SQLInsert := 'INSERT INTO ROTACLIFOR (ROTA, CLIFOR, ORDEM) VALUES (%d, %d, %d);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM ROTACLIFOR; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Rota := FDQuery1.FieldByName('rota').AsInteger;
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;
    Ordem := FDQuery1.FieldByName('ordem').AsInteger;

    ListBox1.Items.Add(Format(SQLInsert,[Rota, Clifor, Ordem]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '21-rotaclifor.txt');
end;


procedure TFrmPrincipal.BtnSalvarClick(Sender: TObject);
begin
  SalvarArquivo;
end;

procedure TFrmPrincipal.BtnSalvarConfigClick(Sender: TObject);
begin
  SalvarConfigTipoEstabelecimento;
end;

procedure TFrmPrincipal.BtnTabelaPrecoClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo, Filial : Integer;
  Nome, DataInicial : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from tabelas_precos');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('where tabelas_precos.id_empresa = %s',[EditIdEmpresa.Text]));
  SQLInsert := 'INSERT INTO TABELAPRECO (CODIGO, FILIAL, NOME, INDICE, BASE, PROMOCAO, DATAINICIAL, DATAFINAL, EXPORTAR, VALORMINIMO, COMISSAO, ATUALIZARVALORVENDA, ' +
               'ATUALIZARVALORMINIMO, ATUALIZARDESCONTOMAXIMO, BLOQUEAR, VINCULARCLIFORAUTOMATICAMENTE, COMISSAOFIXA, INCLUIRPRODUTOAUTOMATICO, VALORMAXIMO, VALORMINIMOINICIAL) '+
               'VALUES (%d, %d, %s, %d, %s, %s, %s, %s, %s, %d, %d, %s, %s, %s, %s, %s, %s, %s, %d, %d);';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM ITEMTABELAPRECO; COMMIT;');
    ListBox1.Items.Add('DELETE FROM TABELAPRECO; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('id').AsInteger;
    Filial := FDQuery1.FieldByName('id_empresa').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Nome := Copy(FDQuery1.FieldByName('desc_tabela').AsString,0,40);
    DataInicial := AjustaData(FDQuery1.FieldByName('data_criacao').AsString);

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, Filial, QuotedStr(Nome), 1, QuotedStr('V'), cNao, DataInicial, QuotedStr('31.12.2020'), cSim, 0, 0, cSim, cSim, cSim, cNao, cNao, cNao, cSim, 0, 0]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '15-tabelapreco.txt');
end;

procedure TFrmPrincipal.BtnTipoEstabelecimentoClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo : Integer;
  Nome : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from tipologias');
  SQLInsert := 'INSERT INTO TIPOESTABELECIMENTO (CODIGO, NOME, SEGMENTO, ATIVO, EXPORTAR, REVENDA) '+
               'VALUES (%d, %s, %d, %s, %s, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM TIPOESTABELECIMENTO; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('id').AsInteger;
    Nome := Copy(FDQuery1.FieldByName('desc_tipologia').AsString,0,40);

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), 1, cSim, cSim, cSim]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '02-tipoestabelecimento.txt');
end;

procedure TFrmPrincipal.BtnTipoProdutoClick(Sender: TObject);
var
  SQLInsert : String;
  Codigo : Integer;
  Nome : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from subgrupos_prod');
  SQLInsert := 'INSERT INTO TIPOPRODUTO (CODIGO, NOME, TIPO) VALUES (%d, %s, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM TIPOPRODUTO; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('id').AsInteger;
    Nome := FDQuery1.FieldByName('nome_subgrupo').AsString;

    ListBox1.Items.Add(Format(SQLInsert,[Codigo, QuotedStr(Nome), QuotedStr('O')]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '09-tipoproduto.txt');
end;

procedure TFrmPrincipal.BtnTrocasClick(Sender: TObject);
var
  SQLInsert : String;
  Filial, Clifor, Produto, Vendedor, Documento : Integer;
  Unitario, Custo, Qtde, Data, Tipo : String;
begin
  if EditNatOpTrocas.Text = EmptyStr then
    raise Exception.Create('Informar Nat. Op. Trocas');
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('vendas.id_empresa as filial, ');
  FDQuery1.SQL.Add('vendas.id_terceiro as clifor, ');
  FDQuery1.SQL.Add('vendas_itens.id_produto as produto, ');
  FDQuery1.SQL.Add('vendas_itens.valor_unit_praticado as unitario, ');
  FDQuery1.SQL.Add('vendas_itens.valor_desconto as valordesconto, ');
  FDQuery1.SQL.Add('vendas_itens.valor_custo as custo, ');
  FDQuery1.SQL.Add('vendas_itens.valor_unitario as valorvenda, ');
  FDQuery1.SQL.Add('vendas_itens.quantidade as qtde, ');
  FDQuery1.SQL.Add('vendas.id_vendedor as vendedor, ');
  FDQuery1.SQL.Add('cast(vendas.data_emissao as date) as data, ');
  FDQuery1.SQL.Add('vendas.numero_nf as documento, ');
  FDQuery1.SQL.Add('case when (tem_nf = true) then ''NF'' else ''PE'' end as tipo ');
  FDQuery1.SQL.Add('from vendas_itens ');
  FDQuery1.SQL.Add('inner join vendas on vendas.id = vendas_itens.id_venda ');
  FDQuery1.SQL.Add('where vendas.data_cancelamento_nf is  null ');

  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and vendas.id_empresa = %s',[EditIdEmpresa.Text]));
  if EditNatOpTrocas.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and vendas.id_nat_operacao in (%s)',[EditNatOpTrocas.Text]));
  if EditRotas.Text <> EmptyStr then
  begin
    FDQuery1.SQL.Add('and vendas.id_terceiro in (select id from terceiros where id in ');
    FDQuery1.SQL.Add('(select id_terceiro from terceiros_setores where id_setor in ');
    FDQuery1.SQL.Add(Format('(select id from rotas_setores where id_rota in (%s))) or (terceiros.tipo_fornecedor is true) or (terceiros.tipo_funcionario is true)) ',[EditRotas.Text]));
  end;
  SQLInsert := 'INSERT INTO TROCA (FILIAL, TIPO, DOCUMENTO, PRODUTO, DATA, QTDE, UNITARIO, CLIFOR, VENDEDOR, CUSTO) '+
               'VALUES (%d, %s, %d, (SELECT CODIGO FROM PRODUTO WHERE PRAZOVALIDADE = %d), %s, %s, %s, %d, %d, %s);';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  {if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CONSUMO; COMMIT;');
  end; }
  while not FDQuery1.Eof do
  begin
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;
    Produto := FDQuery1.FieldByName('produto').AsInteger;
    Unitario := StringReplace(FDQuery1.FieldByName('unitario').AsString, ',', '.', [rfReplaceAll]);
    Custo := StringReplace(FDQuery1.FieldByName('custo').AsString, ',', '.', [rfReplaceAll]);
    Qtde := StringReplace(FDQuery1.FieldByName('qtde').AsString, ',', '.', [rfReplaceAll]);
    Vendedor := FDQuery1.FieldByName('vendedor').AsInteger;
    Data := AjustaData(FDQuery1.FieldByName('data').AsString);
    Documento := FDQuery1.FieldByName('documento').AsInteger;
    Tipo := FDQuery1.FieldByName('tipo').AsString;


    ListBox1.Items.Add(Format(SQLInsert,[Filial, QuotedStr(Tipo), Documento, Produto, Data, Qtde, Unitario, Clifor, Vendedor, Custo]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
    Application.ProcessMessages;
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '70-trocas.txt');
end;

procedure TFrmPrincipal.BtnUnidadeMedidaClick(Sender: TObject);
var
  SQLInsert : String;
  Sigla, Descricao : String;

begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select unidades_venda.abreviacao as sigla, unidades_venda.desc_unid_venda as descricao ');
  FDQuery1.SQL.Add('from unidades_venda ');
  FDQuery1.SQL.Add('union ');
  FDQuery1.SQL.Add('select unidades.sigla as sigla, unidades.desc_unidade as descricao ');
  FDQuery1.SQL.Add('from unidades ');
  SQLInsert := 'INSERT INTO UNIDADEMEDIDA (CODIGO, NOME) '+
               'VALUES (%s, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM UNIDADEMEDIDA; COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Sigla := Copy(FDQuery1.FieldByName('sigla').AsString,0,3);
    Descricao := FDQuery1.FieldByName('descricao').AsString;

    ListBox1.Items.Add(Format(SQLInsert,[Quotedstr(Sigla), QuotedStr(Descricao)]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '07-unidademedida.txt');
end;

procedure TFrmPrincipal.BtnUpdateNossoNumeroClick(Sender: TObject);
var
  SQLUpdate : String;
  Filial, Clifor : Integer;
  Ordem, NossoNumero, Parcela, DataEmissao : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('contas_receber.id, ');
  FDQuery1.SQL.Add('contas_receber.id_terceiro as clifor, ');
  FDQuery1.SQL.Add('contas_receber.id_empresa as filial, ');
  FDQuery1.SQL.Add('contas_receber.tipo_doc || contas_receber.documento as ordem, ');
  FDQuery1.SQL.Add('contas_receber.referencia as parcela, ');
  FDQuery1.SQL.Add('contas_receber.data_emissao as dataemissao, ');
  FDQuery1.SQL.Add('boletos.numero_boleto as nossonumero ');
  FDQuery1.SQL.Add('from contas_receber ');
  FDQuery1.SQL.Add('inner join boletos_contas_receber on boletos_contas_receber.id_conta_receber = contas_receber.id ');
  FDQuery1.SQL.Add('inner join boletos on boletos.id = boletos_contas_receber.id_boleto ');
  FDQuery1.SQL.Add('where 1=1 ');

  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and contas_receber.id_empresa = %s',[EditIdEmpresa.Text]));

  SQLUpdate := 'UPDATE FINANCEIRO SET NOSSONUMERO = %s WHERE FINANCEIRO.FILIAL = %d AND FINANCEIRO.CLIFOR = %d AND FINANCEIRO.ORDEM = %s AND FINANCEIRO.DATAEMISSAO = %s AND SITUACAO = 99 AND TIPO = ''C'';';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  while not FDQuery1.Eof do
  begin
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;
    DataEmissao := AjustaData(FDQuery1.FieldByName('dataemissao').AsString);
    Ordem := Copy(FDQuery1.FieldByName('ordem').AsString,0,18);
    Parcela := FDQuery1.FieldByName('parcela').AsString;
    NossoNumero := FDQuery1.FieldByName('nossonumero').AsString;

    Ordem := Ordem + '-' + Parcela;

    ListBox1.Items.Add(Format(SQLUpdate,[NossoNumero, Filial, Clifor, QuotedStr(Ordem), DataEmissao]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
    Application.ProcessMessages;
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '23-updatenossonumero.txt');
end;

procedure TFrmPrincipal.BtnUpdateRapelClick(Sender: TObject);
var
  SQLUpdate : String;
  Clifor : Integer;
  Rapel : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select terceiros.id as clifor, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_perfil_boleto, ');
  FDQuery1.SQL.Add('perfil_boletos.perc_desconto as rapel ');
  FDQuery1.SQL.Add('from terceiros ');
  FDQuery1.SQL.Add('inner join terceiros_dados_emp on terceiros_dados_emp.id_terceiro = terceiros.id ');
  FDQuery1.SQL.Add('inner join perfil_boletos on perfil_boletos.id = terceiros_dados_emp.id_perfil_boleto ');
  FDQuery1.SQL.Add('where terceiros_dados_emp.id_perfil_boleto > 0 ');
  FDQuery1.SQL.Add('and perfil_boletos.perc_desconto > 0 ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and perfil_boletos.id_empresa = %s',[EditIdEmpresa.Text]));
  FDQuery1.SQL.Add('order by terceiros.id ');
  SQLUpdate := 'UPDATE CLIFOR SET RAPEL = %s WHERE CLIFOR.CODIGO = %d;';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  while not FDQuery1.Eof do
  begin
    Rapel := StringReplace(FDQuery1.FieldByName('rapel').AsString,',','.',[rfReplaceAll]);
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;

    ListBox1.Items.Add(Format(SQLUpdate,[Rapel, Clifor]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
    Application.ProcessMessages;
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '30-updaterapel.txt');
end;

procedure TFrmPrincipal.BtnVendasClick(Sender: TObject);
var
  SQLInsert : String;
  Filial, Clifor, Produto, FormaPagamento, CondicaoPagamento, Vendedor, Documento : Integer;
  Unitario, ValorDesconto, ValorIpi, Custo, ValorPis, ValorCofins, ValorIcms, ValorVenda, Qtde, Data, Tipo : String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('vendas.id_empresa as filial, ');
  FDQuery1.SQL.Add('vendas.id_terceiro as clifor, ');
  FDQuery1.SQL.Add('vendas_itens.id_produto as produto, ');
  FDQuery1.SQL.Add('vendas_itens.valor_unit_praticado as unitario, ');
  FDQuery1.SQL.Add('vendas_itens.valor_desconto as valordesconto, ');
  FDQuery1.SQL.Add('vendas_itens.valor_ipi as valoripi, ');
  FDQuery1.SQL.Add('vendas_itens.valor_custo as custo, ');
  FDQuery1.SQL.Add('vendas_itens.valor_pis as valorpis, ');
  FDQuery1.SQL.Add('vendas_itens.valor_cofins as valorcofins, ');
  FDQuery1.SQL.Add('vendas_itens.valor_icms as valoricms, ');
  FDQuery1.SQL.Add('vendas_itens.valor_unitario as valorvenda, ');
  FDQuery1.SQL.Add('vendas_itens.quantidade as qtde, ');
  FDQuery1.SQL.Add('vendas.tipo_pagto as formapagamento, ');
  FDQuery1.SQL.Add('vendas.id_forma_parc as condicaopagamento, ');
  FDQuery1.SQL.Add('vendas.id_vendedor as vendedor, ');
  FDQuery1.SQL.Add('cast(vendas.data_emissao as date) as data, ');
  FDQuery1.SQL.Add('vendas.numero_nf as documento, ');
  FDQuery1.SQL.Add('case when (tem_nf = true) then ''NF'' else ''PE'' end as tipo ');
  FDQuery1.SQL.Add('from vendas_itens ');
  FDQuery1.SQL.Add('inner join vendas on vendas.id = vendas_itens.id_venda ');
  FDQuery1.SQL.Add('where vendas.data_cancelamento_nf is  null ');

  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and vendas.id_empresa = %s',[EditIdEmpresa.Text]));
  if EditNaturezaOperacao.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and vendas.id_nat_operacao in (%s)',[EditNaturezaOperacao.Text]));
  if EditRotas.Text <> EmptyStr then
  begin
    FDQuery1.SQL.Add('and vendas.id_terceiro in (select id from terceiros where id in ');
    FDQuery1.SQL.Add('(select id_terceiro from terceiros_setores where id_setor in ');
    FDQuery1.SQL.Add(Format('(select id from rotas_setores where id_rota in (%s))) or (terceiros.tipo_fornecedor is true) or (terceiros.tipo_funcionario is true)) ',[EditRotas.Text]));
  end;
  SQLInsert := 'INSERT INTO CONSUMO (FILIAL, CLIFOR, PRODUTO, UNITARIO, VALORDESCONTO, VALORIPI, CUSTO, VALORPIS, VALORCOFINS, VALORICMS, VALORVENDA, QTDE, FORMAPAGAMENTO, '+
               'CONDICAOPAGAMENTO, VENDEDOR, DATA, DOCUMENTO, TIPO, COMISSAO, TRANSPORTADOR, QTDEDEVOLVIDO, FLEX, GERARFLEX, TABELAPRECO, COMISSAOENTREGA, DESPESA, COMISSAOLIBERADA, '+
               'COMISSAOPAGA, ENCARGO) VALUES (%d, %d, (SELECT CODIGO FROM PRODUTO WHERE PRAZOVALIDADE = %d), %s, %s, %s, %s, %s, %s, %s, %s, %s, %d, %d, %d, %s, %d, %s, '+
               '%d, (SELECT MIN(CODIGO) FROM TRANSPORTADOR), %d, %d, %s, (SELECT MIN(CODIGO) FROM TABELAPRECO), %d, %d, %s, %s, %d);';

  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  {if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM CONSUMO; COMMIT;');
  end; }
  while not FDQuery1.Eof do
  begin
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;
    Produto := FDQuery1.FieldByName('produto').AsInteger;
    Unitario := StringReplace(FDQuery1.FieldByName('unitario').AsString, ',', '.', [rfReplaceAll]);
    ValorDesconto := StringReplace(FDQuery1.FieldByName('valordesconto').AsString, ',', '.', [rfReplaceAll]);
    ValorIpi := StringReplace(FDQuery1.FieldByName('valoripi').AsString, ',', '.', [rfReplaceAll]);
    Custo := StringReplace(FDQuery1.FieldByName('custo').AsString, ',', '.', [rfReplaceAll]);
    ValorPis := StringReplace(FDQuery1.FieldByName('valorpis').AsString, ',', '.', [rfReplaceAll]);
    ValorCofins := StringReplace(FDQuery1.FieldByName('valorcofins').AsString, ',', '.', [rfReplaceAll]);
    ValorIcms := StringReplace(FDQuery1.FieldByName('valoricms').AsString, ',', '.', [rfReplaceAll]);
    ValorVenda := StringReplace(FDQuery1.FieldByName('valorvenda').AsString, ',', '.', [rfReplaceAll]);
    Qtde := StringReplace(FDQuery1.FieldByName('qtde').AsString, ',', '.', [rfReplaceAll]);
    FormaPagamento := FDQuery1.FieldByName('formapagamento').AsInteger;
    CondicaoPagamento := FDQuery1.FieldByName('condicaopagamento').AsInteger;
    Vendedor := FDQuery1.FieldByName('vendedor').AsInteger;
    Data := AjustaData(FDQuery1.FieldByName('data').AsString);
    Documento := FDQuery1.FieldByName('documento').AsInteger;
    Tipo := FDQuery1.FieldByName('tipo').AsString;


    ListBox1.Items.Add(Format(SQLInsert,[Filial, Clifor, Produto, Unitario, ValorDesconto, ValorIpi, Custo, ValorPis, ValorCofins, ValorIcms, ValorVenda, Qtde, FormaPagamento,
                       CondicaoPagamento, Vendedor, Data, Documento, QuotedStr(Tipo), 0, 0, 0, cNao, 0, 0, cNao, cNao, 0]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
    Application.ProcessMessages;
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '22-consumo.txt');
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  ShowMessage(ConverteTipoEstabelecimento(EditTipoEstabelecimentoDe.Text));
end;

procedure TFrmPrincipal.ButtonAjustaCondicaoPagamentoClick(Sender: TObject);
var
  SQLUpdate : String;
  Codigo, CondicaoPagamento : Integer;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select distinct');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_terceiro as codigo, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_form_parc_pref as condicaopagamento ');
  FDQuery1.SQL.Add('from terceiros_dados_emp ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('where terceiros_dados_emp.id_empresa = %s and terceiros_dados_emp.id_form_parc_pref > 0',[EditIdEmpresa.Text]));

  SQLUpdate := 'UPDATE CLIFOR SET CONDICAOPAGAMENTO = %d WHERE CODIGO = %d AND CONDICAOPAGAMENTO IS NULL;';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;

  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    CondicaoPagamento := FDQuery1.FieldByName('condicaopagamento').AsInteger;

    ListBox1.Items.Add(Format(SQLUpdate, [CondicaoPagamento, Codigo]));
    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '30-ajustafuncionarioclifor.txt');
end;

procedure TFrmPrincipal.ButtonAjustaFuncionarioCliforClick(Sender: TObject);
var
  SQLInsertFuncionarioClifor : String;
  Codigo, Vendedor : Integer;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select distinct');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_terceiro as codigo, ');
  FDQuery1.SQL.Add('terceiros_dados_emp.id_vendedor as codigovendedor ');
  FDQuery1.SQL.Add('from terceiros_dados_emp ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and terceiros_dados_emp.id_empresa = %s',[EditIdEmpresa.Text]));

  SQLInsertFuncionarioClifor := 'INSERT INTO FUNCIONARIOCLIFOR (FUNCIONARIO, CLIFOR) VALUES (%d, %d);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;

  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    Vendedor := FDQuery1.FieldByName('codigovendedor').AsInteger;

    //funcionarioclifor
    if Vendedor > 0 then
      ListBox1.Items.Add(Format(SQLInsertFuncionarioClifor, [Vendedor, Codigo]));
    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '30-ajustafuncionarioclifor.txt');
end;

procedure TFrmPrincipal.ButtonContaPagaRecebidaClick(Sender: TObject);
var
  I : Integer;
  SQLInsert : String;
  ID, Clifor, Ordem, Documento, Emissao, Vencimento, Valor, Filial, DataPgto, DataBaixa, Multa, Juros, Desconto, ValorPago, Historico : String;
begin
  try
    ShowMessage('Confirmar Edit Tipo Financeiro');
    ShowMessage('Lembrar de preencher Inicio Planilha e Fim Planilha');
    CarregarExcel;
    PageControl1.ActivePageIndex := 0;
    Application.ProcessMessages;
    //SQLInsert := 'INSERT INTO FINANCEIRO (FILIAL, TIPO, CLIFOR, ORDEM, DOCUMENTO, DATAEMISSAO, DATAVCTO, VALOR, DATAPGTO, DATABAIXA, MULTA, JURO, DESCONTO, VALORBAIXA, SITUACAO) '+
    //             'VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 99);';
    SQLInsert := 'EXECUTE PROCEDURE CUS_SETFINANCEIROPRATS(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
    ListBox1.Clear;
    ListBox1.Items.Add('UPDATE OR INSERT INTO SITUACAO (CODIGO, NOME, GERARDESC0NTO, OCORRENCIA) VALUES ('+EditSituacaoFinanceiro.Text+', '+ GetNomeSituacaoFinanceiro(EditSituacaoFinanceiro.Text) +', ''N'', NULL) MATCHING (CODIGO); COMMIT WORK;');
    Gauge1.Progress := StrToInt(EditInicioPlanilha.Text);
    Gauge1.MaxValue := StrToInt(EditFimPlanilha.Text);

    Filial := '1';
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := EditForcarNumeroFilial.Text;
    for I := StrToInt(EditInicioPlanilha.Text) to StrToInt(EditFimPlanilha.Text) do
    begin
      ID := Trim(Planilha.cells[i,1]);
      Clifor := Trim(Planilha.cells[i,2]);
      Ordem := Trim(Planilha.cells[i,4]);
      Documento := Trim(Planilha.cells[i,4]);
      Emissao := StringReplace(Trim(Planilha.cells[i,6]),'/','.',[rfReplaceAll]);
      Vencimento := StringReplace(Trim(Planilha.cells[i,7]),'/','.',[rfReplaceAll]);
      Valor := StringReplace(Trim(Planilha.cells[i,27]),',','.',[rfReplaceAll]);
      DataPgto := StringReplace(Trim(Planilha.cells[i,8]),'/','.',[rfReplaceAll]);
      DataBaixa := StringReplace(Trim(Planilha.cells[i,10]),'/','.',[rfReplaceAll]);
      Multa := StringReplace(Trim(Planilha.cells[i,17]),',','.',[rfReplaceAll]);
      Juros := StringReplace(Trim(Planilha.cells[i,19]),',','.',[rfReplaceAll]);
      Desconto := StringReplace(Trim(Planilha.cells[i,21]),',','.',[rfReplaceAll]);
      ValorPago := StringReplace(Trim(Planilha.cells[i,24]),',','.',[rfReplaceAll]);
      Historico := 'NULL';
      if ID = EmptyStr then
        raise Exception.Create('ID não informado');
      //Documento := Copy(Documento,4,(Pos('/',Documento)-4));
      Documento := Numericos(Documento);
      if Documento = EmptyStr then
        Documento := 'NULL';

      Ordem := Copy(Ordem,0,19);
      ListBox1.Items.Add(Format(SQLInsert,[ID, Filial, QuotedStr(EditTipoFinanceiro.Text), Clifor, QuotedStr(Ordem), Documento, QuotedStr(Emissao), QuotedStr(Vencimento),
                         Valor, QuotedStr(DataPgto), QuotedStr(DataBaixa), Multa, Juros, Desconto, ValorPago, Historico, EditSituacaoFinanceiro.Text]));

      Gauge1.AddProgress(1);
    end;
  finally
    Excel.Quit;
  end;
end;

procedure TFrmPrincipal.ButtonContasPagarExcelClick(Sender: TObject);
var
  I : Integer;
  SQLInsert : String;
  Clifor, Ordem, Documento, Emissao, Vencimento, Valor, Historico, Filial : String;
begin
  try
    ShowMessage('Lembrar de preencher Inicio Planilha e Fim Planilha');
    ShowMessage('Analisar NossoNumero');
    ShowMessage('Edit Tipo Financeiro');
    CarregarExcel;
    PageControl1.ActivePageIndex := 0;
    SQLInsert := 'INSERT INTO FINANCEIRO (FILIAL, TIPO, CLIFOR, ORDEM, DOCUMENTO, DATAEMISSAO, DATAVCTO, VALOR, HISTORICO, SITUACAO) '+
                 'VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
    ListBox1.Clear;
    ListBoxNossoNumero.Clear;
    ListBoxNossoNumeroDuplicado.Clear;
    ListBox1.Items.Add('UPDATE OR INSERT INTO SITUACAO (CODIGO, NOME, GERARDESC0NTO, OCORRENCIA) VALUES ('+EditSituacaoFinanceiro.Text+', '+ GetNomeSituacaoFinanceiro(EditSituacaoFinanceiro.Text) +', ''N'', NULL) MATCHING (CODIGO); COMMIT WORK;');
    Gauge1.Progress := StrToInt(EditInicioPlanilha.Text);
    Gauge1.MaxValue := StrToInt(EditFimPlanilha.Text);

    Filial := '1';
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := EditForcarNumeroFilial.Text;
    for I := StrToInt(EditInicioPlanilha.Text) to StrToInt(EditFimPlanilha.Text) do
    begin
      Clifor := Trim(Planilha.cells[i,2]);
      Ordem := Trim(Planilha.cells[i,7]);
      Documento := Trim(Planilha.cells[i,7]);
      Emissao := StringReplace(Trim(Planilha.cells[i,9]),'/','.',[rfReplaceAll]);
      Vencimento := StringReplace(Trim(Planilha.cells[i,10]),'/','.',[rfReplaceAll]);
      Valor := StringReplace(Trim(Planilha.cells[i,13]),',','.',[rfReplaceAll]);
      Historico := Trim(Planilha.cells[i,20]);


      //Documento := Copy(Documento,4,(Pos('/',Documento)-4));
      Documento := Numericos(Documento);
      Documento := Copy(Documento,0,8);
      if Documento = EmptyStr then
        Documento := 'NULL';
      if Historico = EmptyStr then
        Historico := 'NULL';



      Ordem := Copy(Ordem,0,17);
      ListBox1.Items.Add(Format(SQLInsert,[Filial, QuotedStr(EditTipoFinanceiro.Text), Clifor, QuotedStr(Ordem), Documento, QuotedStr(Emissao), QuotedStr(Vencimento),
      Valor, Historico, EditSituacaoFinanceiro.Text]));

      Gauge1.AddProgress(1);
    end;
  finally
    Excel.Quit;
  end;
end;

procedure TFrmPrincipal.ButtonContasPagasExcelClick(Sender: TObject);
var
  I : Integer;
  SQLInsert : String;
  ID, Clifor, Ordem, Documento, Emissao, Vencimento, Valor, Filial, DataPgto, DataBaixa, Multa, Juros, Desconto, ValorPago, Historico : String;
begin
  try
    ShowMessage('Confirmar Edit Tipo Financeiro');
    ShowMessage('Lembrar de preencher Inicio Planilha e Fim Planilha');
    CarregarExcel;
    PageControl1.ActivePageIndex := 0;
    Application.ProcessMessages;
    //SQLInsert := 'INSERT INTO FINANCEIRO (FILIAL, TIPO, CLIFOR, ORDEM, DOCUMENTO, DATAEMISSAO, DATAVCTO, VALOR, DATAPGTO, DATABAIXA, MULTA, JURO, DESCONTO, VALORBAIXA, SITUACAO) '+
    //             'VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 99);';
    SQLInsert := 'EXECUTE PROCEDURE CUS_SETFINANCEIROPRATS(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, '+EditSituacaoFinanceiro.Text+');';
    ListBox1.Clear;
    ListBox1.Items.Add('UPDATE OR INSERT INTO SITUACAO (CODIGO, NOME, GERARDESC0NTO, OCORRENCIA) VALUES ('+EditSituacaoFinanceiro.Text+', '+ GetNomeSituacaoFinanceiro(EditSituacaoFinanceiro.Text) +', ''N'', NULL) MATCHING (CODIGO); COMMIT WORK;');
    Gauge1.Progress := StrToInt(EditInicioPlanilha.Text);
    Gauge1.MaxValue := StrToInt(EditFimPlanilha.Text);

    Filial := '1';
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := EditForcarNumeroFilial.Text;
    for I := StrToInt(EditInicioPlanilha.Text) to StrToInt(EditFimPlanilha.Text) do
    begin
      ID := Trim(Planilha.cells[i,1]);
      Clifor := Trim(Planilha.cells[i,2]);
      Ordem := Trim(Planilha.cells[i,6]);
      Documento := Trim(Planilha.cells[i,6]);
      Emissao := StringReplace(Trim(Planilha.cells[i,7]),'/','.',[rfReplaceAll]);
      Vencimento := StringReplace(Trim(Planilha.cells[i,8]),'/','.',[rfReplaceAll]);
      Valor := StringReplace(Trim(Planilha.cells[i,29]),',','.',[rfReplaceAll]);
      DataPgto := StringReplace(Trim(Planilha.cells[i,10]),'/','.',[rfReplaceAll]);
      DataBaixa := StringReplace(Trim(Planilha.cells[i,10]),'/','.',[rfReplaceAll]);
      Multa := StringReplace(Trim(Planilha.cells[i,18]),',','.',[rfReplaceAll]);
      Juros := StringReplace(Trim(Planilha.cells[i,20]),',','.',[rfReplaceAll]);
      Desconto := StringReplace(Trim(Planilha.cells[i,23]),',','.',[rfReplaceAll]);
      ValorPago := StringReplace(Trim(Planilha.cells[i,26]),',','.',[rfReplaceAll]);
      Historico := Trim(Planilha.cells[i,15]);

      if Historico = EmptyStr then
        Historico := 'NULL';

      if ID = EmptyStr then
        raise Exception.Create('ID não informado');
      //Documento := Copy(Documento,4,(Pos('/',Documento)-4));
      Documento := Copy(Numericos(Documento),0,6);
      if Documento = EmptyStr then
        Documento := 'NULL';

      Ordem := Copy(Ordem,0,19);
      ListBox1.Items.Add(Format(SQLInsert,[ID, Filial, QuotedStr(EditTipoFinanceiro.Text), Clifor, QuotedStr(Ordem), Documento, QuotedStr(Emissao), QuotedStr(Vencimento),
                         Valor, QuotedStr(DataPgto), QuotedStr(DataBaixa), Multa, Juros, Desconto, ValorPago, Historico]));

      Gauge1.AddProgress(1);
    end;
  finally
    Excel.Quit;
  end;
end;

procedure TFrmPrincipal.ButtonSemRomaneioClick(Sender: TObject);
var
  I :Integer;
  SQLInsert : String;
  Nome, Fantasia, Documento, Emissao, Produto, Qtde, Unitario, Tipo : String;
begin
  try
    ShowMessage('Lembrar de preencher Inicio Planilha e Fim Planilha');
    CarregarExcel;
    SQLInsert := 'EXECUTE PROCEDURE CUS_INS_CONSUMO_PRATS(%s, %s, %s, %s, %s, %s, %s, %s, %s);';
    ListBox1.Clear;
    Gauge1.Progress := StrToInt(EditInicioPlanilha.Text);
    Gauge1.MaxValue := StrToInt(EditFimPlanilha.Text);

    for I := StrToInt(EditInicioPlanilha.Text) to StrToInt(EditFimPlanilha.Text) do
    begin
      Nome := Trim(Planilha.cells[i,7]);
      Fantasia := Trim(Planilha.cells[i,10]);
      Documento := Trim(Planilha.cells[i,5]);
      Emissao := Copy(StringReplace(Trim(Planilha.cells[i,1]),'/','.',[rfReplaceAll]),0,10);
      Produto := Trim(Planilha.cells[i,15]);
      Qtde := StringReplace(Trim(Planilha.cells[i,19]),',','.',[rfReplaceAll]);
      Unitario := StringReplace(Trim(Planilha.cells[i,21]),',','.',[rfReplaceAll]);
      Tipo := 'CP';
      if Copy(Documento, 0, 2) = 'NF' then Tipo := 'CN';

      Documento := Numericos(Documento);
      if Documento = EmptyStr then
        raise Exception.Create('Documento Vazio! I: ' + IntToStr(I) + ' - ' + Nome +' - '+ Fantasia);

      ListBox1.Items.Add(Format(SQLInsert,[QuotedStr(Nome), QuotedStr(Fantasia), Documento, QuotedStr(Emissao), QuotedStr(Produto), Qtde, Unitario, QuotedStr(Tipo), EditForcarNumeroFilial.Text]));

      Gauge1.AddProgress(1);
    end;
  finally
    Excel.Quit;
  end;
end;

procedure TFrmPrincipal.ButtonUpdateGeoLocalizacaoClick(Sender: TObject);
var
  SQLUpdateLatitude, SQLUpdateLongitude, Latitude, Longitude : String;
  Codigo : Integer;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select distinct');
  FDQuery1.SQL.Add('terceiros.id as codigo, ');
  FDQuery1.SQL.Add('terceiros.endereco_latitude as latitude, ');
  FDQuery1.SQL.Add('terceiros.endereco_longitude as longitude ');
  FDQuery1.SQL.Add('from terceiros ');

  SQLUpdateLatitude := 'UPDATE CLIFOR SET LATITUDE = %s WHERE CODIGO = %d AND LATITUDE IS NULL;';
  SQLUpdateLongitude := 'UPDATE CLIFOR SET LONGITUDE = %s WHERE CODIGO = %d AND LONGITUDE IS NULL;';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  PageControl1.ActivePageIndex := 0;
  Application.ProcessMessages;
  while not FDQuery1.Eof do
  begin
    Codigo := FDQuery1.FieldByName('codigo').AsInteger;
    Latitude := Copy(StringReplace(FDQuery1.FieldByName('latitude').AsString,',','.',[rfReplaceAll]),0,15);
    Longitude := Copy(StringReplace(FDQuery1.FieldByName('longitude').AsString,',','.',[rfReplaceAll]),0,15);

    if Latitude <> EmptyStr then
      ListBox1.Items.Add(Format(SQLUpdateLatitude, [QuotedStr(Latitude), Codigo]));
    if Longitude <> EmptyStr then
      ListBox1.Items.Add(Format(SQLUpdateLongitude, [QuotedStr(Longitude), Codigo]));
    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '40-ajustageolocalizacao.txt');
end;

procedure TFrmPrincipal.CarregarConfigTipoEstabelecimento;
var
  INI : TIniFile;
  I, QtdeContador : Integer;
  TiposEstabelecimentosDePara : TStrings;
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conversor.ini');
  QtdeContador := INI.ReadInteger('Contadores',EditDatabase.Text, 0);
  if QtdeContador = 0 then
    raise Exception.Create('Contador Invádido TipoEstabelecimento!');

  if SGTipoEstabelecimento.RowCount > 1 then
  begin
    if INI.ReadString(EditDatabase.Text,'1' ,EmptyStr) <> '' then begin
     for I := 1 to QtdeContador  do
     begin
       TiposEstabelecimentosDePara := StrSplit(INI.ReadString(EditDatabase.Text, IntToStr(I) ,EmptyStr),';');
       if SGTipoEstabelecimento.Cells[1, SGTipoEstabelecimento.RowCount-1] <> EmptyStr then //begin
         SGTipoEstabelecimento.RowCount:= SGTipoEstabelecimento.RowCount + 1;
       SGTipoEstabelecimento.Cells[0,i] := IntToStr(I);
       SGTipoEstabelecimento.Cells[1,i] := TiposEstabelecimentosDePara.Strings[1];
       SGTipoEstabelecimento.Cells[2,i] := TiposEstabelecimentosDePara.Strings[2];
     end;
    end;
  end;
  LabelConfigAtiva.Caption := EditDatabase.Text;
end;

procedure TFrmPrincipal.CarregarExcel;
begin
  if OpenDialog1.Execute then
  begin
    Excel := CreateOleObject('Excel.Application');
    Excel.WorkBooks.open(OpenDialog1.FileName);
    Planilha := Excel.WorkSheets[1];
  end;

end;

procedure TFrmPrincipal.CarregarIni;
var
  INI : TIniFile;
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conversor.ini');
  EditDataBase.Text := INI.ReadString('Geral', 'database', EmptyStr);
  EditCaminhoScripts.Text := INI.ReadString('Geral', 'caminhoscripts', EmptyStr);
  EditInicioPlanilha.Text := INI.ReadString('Geral', 'inicioplanilha', EmptyStr);
  EditFimPlanilha.Text := INI.ReadString('Geral', 'fimplanilha', EmptyStr);
  EditIdEmpresa.Text := INI.ReadString('Geral', 'idempresa', EmptyStr);
  EditNaturezaOperacao.Text := INI.ReadString('Geral', 'naturezaoperacao', EmptyStr);
  EditRotas.Text := INI.ReadString('Geral', 'rotas', EmptyStr);
  CheckBoxInserirDeleteAntes.Checked := INI.ReadBool('Geral', 'inserirdelete', True);
  CheckBoxSalvarAutomaticamente.Checked := INI.ReadBool('Geral', 'salvarautomaticamente', True);
  CheckBobxContasReceberSomenteDocumentosComNumero.Checked := INI.ReadBool('Geral', 'contasrecebersomentedocumentocomnumero', True);
  EditForcarNumeroFilial.Text := INI.ReadString('Geral', 'forcarfilial', EmptyStr);

end;

procedure TFrmPrincipal.ConectarDB;
begin
  DesconectarDB;
  FDPhysPgDriverLink1.VendorHome := ExtractFilePath(Application.ExeName);
  FDPhysPgDriverLink1.VendorLib := 'libpq.dll';
  FDConnection1.Params.Values['database'] := EditDatabase.Text;
  FDConnection1.Connected := True;
  AjustaBotoesConexao;
end;

function TFrmPrincipal.ConverteTipoEstabelecimento(Tipo: String): String;
  var
  i: integer;
  //aux : string;
begin
  Result := EmptyStr;

  for I := 1 to SGTipoEstabelecimento.RowCount do begin
    if Tipo  = SGTipoEstabelecimento.Cells[1, i] then begin
      Result := SGTipoEstabelecimento.Cells[2,i];
    end;
  end;
  if Result = EmptyStr then
    raise Exception.CreateFmt('Tipo Estabelecimento: %s não configurado. Verifique!',[Tipo]);
  
end;

procedure TFrmPrincipal.DesconectarDB;
begin
  FDConnection1.Connected := False;
end;

procedure TFrmPrincipal.EditTipoEstabelecimentoDeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((Key = #13) and (EditTipoEstabelecimentoDe.Text <> EmptyStr)) then
    EditTipoEstabelecimentoPara.SetFocus;

end;

procedure TFrmPrincipal.EditTipoEstabelecimentoParaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Key = #13) and (EditTipoEstabelecimentoPara.Text <> EmptyStr)) then
      sbTipoEstabelecimentoClick(Self);
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
  AjustaStringGrid;
  PageControl1.ActivePage := TabSheet1
end;

procedure TFrmPrincipal.GerarContasAPagar(UsaProcedure: Boolean);
var
  SQLInsert : String;
  Clifor, Filial : Integer;
  Documento, Ordem, DataEmissao, DataVcto, DataBaixa, ValorTitulo, Obs, Juros, Desconto, ValorDevedor, DataAgendamento, Multa, ValorBaixa, Parcela, Id: String;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select ');
  FDQuery1.SQL.Add('contas_pagar.id as id, ');
  FDQuery1.SQL.Add('contas_pagar.id_empresa as filial, ');
  FDQuery1.SQL.Add('contas_pagar.id_terceiro as clifor, ');
  FDQuery1.SQL.Add('contas_pagar.documento as documento, ');
  FDQuery1.SQL.Add('contas_pagar.tipo_doc || contas_pagar.documento as ordem, ');
  FDQuery1.SQL.Add('contas_pagar.referencia as parcela, ');
  FDQuery1.SQL.Add('contas_pagar.data_emissao as dataemissao, ');
  FDQuery1.SQL.Add('contas_pagar.data_vencimento as datavcto, ');
  FDQuery1.SQL.Add('contas_pagar.data_quitacao as databaixa, ');
  FDQuery1.SQL.Add('contas_pagar.valor as valortitulo, ');
  FDQuery1.SQL.Add('contas_pagar.valor_total_amortizado as valorbaixa, ');
  FDQuery1.SQL.Add('contas_pagar.observacao as obs, ');
  FDQuery1.SQL.Add('contas_pagar.valor_total_juros as juro, ');
  FDQuery1.SQL.Add('contas_pagar.valor_total_desconto as desconto, ');
  FDQuery1.SQL.Add('contas_pagar.valor_devedor as valordevedor, ');
  FDQuery1.SQL.Add('contas_pagar.data_agend_pagto as agendamento, ');
  FDQuery1.SQL.Add('contas_pagar.valor_total_multa as multa ');
  FDQuery1.SQL.Add('from contas_pagar where 1=1 ');
  if EditIdEmpresa.Text <> EmptyStr then
    FDQuery1.SQL.Add(Format('and contas_pagar.id_empresa = %s ',[EditIdEmpresa.Text]));

  if EditRotas.Text <> EmptyStr then
  begin
    FDQuery1.SQL.Add('and contas_pagar.id_terceiro in (select id from terceiros where id in ');
    FDQuery1.SQL.Add('(select id_terceiro from terceiros_setores where id_setor in ');
    FDQuery1.SQL.Add(Format('(select id from rotas_setores where id_rota in (%s))) or (terceiros.tipo_fornecedor is true) or (terceiros.tipo_funcionario is true)) ',[EditRotas.Text]));
  end;
  FDQuery1.SQL.Add('order by contas_pagar.id ');
  SQLInsert := 'INSERT INTO FINANCEIRO (TIPO, FILIAL, CLIFOR, DOCUMENTO, ORDEM, DATAEMISSAO, DATAVCTO, DATABAIXA, VALOR, OBS, JURO, DESCONTO, VALORBAIXA, DATAAGENDAMENTO, MULTA,  '+
               'IMPRIMIR, IMPRESSO, SITUACAO) VALUES (%s, %d, %d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 99);';
  if UsaProcedure then
    SQLInsert := 'EXECUTE PROCEDURE CUSTOM_SET_FINANCEIRO(%s, %d, %d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);';
  VerificaConexao;
  AbreQuery;
  AjustaGauge;
  ListBox1.Clear;
  ListBox1.Items.Add('UPDATE OR INSERT INTO SITUACAO (CODIGO, NOME, GERARDESC0NTO, OCORRENCIA) VALUES (99, ''CONVERSAO'', ''N'', NULL) MATCHING (CODIGO); COMMIT WORK;');
  if CheckBoxInserirDeleteAntes.Checked then
  begin
    ListBox1.Items.Add('DELETE FROM FINANCEIRO FIN WHERE SITUACAO = 99 AND TIPO = ''D'' AND FIN.ORDEM NOT IN (SELECT OC.ORDEM FROM OCORRENCIAFINANCEIRO OC WHERE OC.ORDEM = FIN.ORDEM AND OC.CLIFOR = FIN.CLIFOR '+
                       'AND OC.FILIAL = FIN.FILIAL AND OC.DATAEMISSAO = FIN.DATAEMISSAO); COMMIT;');
  end;
  while not FDQuery1.Eof do
  begin
    Id := FDQuery1.FieldByName('id').AsString;
    Filial := FDQuery1.FieldByName('filial').AsInteger;
    if EditForcarNumeroFilial.Text <> EmptyStr then
      Filial := StrToInt(EditForcarNumeroFilial.Text);
    Clifor := FDQuery1.FieldByName('clifor').AsInteger;
    Documento := Copy(Numericos(FDQuery1.FieldByName('documento').AsString),0,9);
    Ordem := Copy(FDQuery1.FieldByName('ordem').AsString,0,18);
    Parcela := FDQuery1.FieldByName('parcela').AsString;
    DataEmissao := AjustaData(FDQuery1.FieldByName('dataemissao').AsString);
    DataVcto := AjustaData(FDQuery1.FieldByName('datavcto').AsString);
    DataBaixa := AjustaData(FDQuery1.FieldByName('databaixa').AsString);
    ValorTitulo := StringReplace(FDQuery1.FieldByName('valortitulo').AsString,',','.',[rfReplaceAll]);
    Valorbaixa := StringReplace(FDQuery1.FieldByName('valorbaixa').AsString,',','.',[rfReplaceAll]);
    Obs := FDQuery1.FieldByName('obs').AsString;
    Juros := StringReplace(FDQuery1.FieldByName('juro').AsString,',','.',[rfReplaceAll]);
    Desconto := StringReplace(FDQuery1.FieldByName('desconto').AsString,',','.',[rfReplaceAll]);
    ValorDevedor := StringReplace(FDQuery1.FieldByName('valordevedor').AsString,',','.',[rfReplaceAll]);
    DataAgendamento := AjustaData(FDQuery1.FieldByName('agendamento').AsString);
    Multa := StringReplace(FDQuery1.FieldByName('multa').AsString,',','.',[rfReplaceAll]);


    if ((FDQuery1.FieldByName('datavcto').AsDateTime < FDQuery1.FieldByName('dataemissao').AsDateTime) and (DataVcto <> 'NULL')) then
      DataVcto := DataEmissao;
    if ((FDQuery1.FieldByName('agendamento').AsDateTime < FDQuery1.FieldByName('dataemissao').AsDateTime) and (DataAgendamento <> 'NULL')) then
      DataAgendamento := DataEmissao;
    if ((FDQuery1.FieldByName('databaixa').AsDateTime < FDQuery1.FieldByName('dataemissao').AsDateTime) and (DataBaixa <> 'NULL')) then
      DataBaixa := DataEmissao;
    Ordem := Ordem + '-' + Parcela;

    if ValorBaixa = '0.00' then
    begin
      ValorBaixa := 'NULL';
      ValorTitulo := ValorDevedor;
    end;
    if DataBaixa = 'NULL' then
      ValorTitulo := ValorDevedor;
    if Juros = '0.00' then Juros := 'NULL';
    if Desconto = '0.00' then Desconto := 'NULL';
    if Multa = '0.00' then Multa := 'NULL';
    if Documento = EmptyStr then Documento := 'NULL';

    if UsaProcedure then
      ListBox1.Items.Add(Format(SQLInsert,[QuotedStr('D'), Filial, Clifor, Documento, QuotedStr(Ordem), DataEmissao, DataVcto, DataBaixa, ValorTitulo, QuotedStr(Obs), Juros, Desconto,
                         ValorBaixa, DataAgendamento, Multa, cNao, cNao, QuotedStr(Id)]))
    else
      ListBox1.Items.Add(Format(SQLInsert,[QuotedStr('D'), Filial, Clifor, Documento, QuotedStr(Ordem), DataEmissao, DataVcto, DataBaixa, ValorTitulo, QuotedStr(Obs), Juros, Desconto,
                         ValorBaixa, DataAgendamento, Multa, cNao, cNao]));

    FDQuery1.Next;
    Gauge1.AddProgress(1);
  end;
  SetHorizontalScrollBar(ListBox1);
  if CheckBoxSalvarAutomaticamente.Checked then
    SalvarArquivoAutomatico(EditCaminhoScripts.Text + '18-contaspagar.txt');
end;

function TFrmPrincipal.GetNomeSituacaoFinanceiro(Codigo: String): String;
begin
  if Codigo = '99' then Result := 'CONTAS RECEBER';
  if Codigo = '98' then Result := 'CONTAS RECEBIDAS';
  if Codigo = '97' then Result := 'CONTAS A PAGAR';
  if Codigo = '96' then Result := 'CONTAS PAGAS';
  if Result = EmptyStr then
    raise Exception.Create('Codigo invalido situação');

  Result := QuotedStr(Result);
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

procedure TFrmPrincipal.SalvarArquivoAutomatico(Caminho: String);
begin
  ListBox1.Items.SaveToFile(Caminho);
end;

procedure TFrmPrincipal.SalvarConfigTipoEstabelecimento;
var
  I : Integer;
  INI : TIniFile;
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conversor.ini');
  for I := 1 to SGTipoEstabelecimento.RowCount -1 do
  begin
    INI.WriteString(EditDatabase.Text,IntToStr(I),';'+SGTipoEstabelecimento.Cells[1,I]+';'+SGTipoEstabelecimento.Cells[2,I]+';' );
  end;
  INI.WriteString('Contadores', EditDatabase.Text,IntToStr(SGTipoEstabelecimento.RowCount-1));
  LabelConfigAtiva.Caption := EditDatabase.Text;
end;

procedure TFrmPrincipal.SalvarIni;
var
  INI : TIniFile;
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conversor.ini');
  INI.WriteString('Geral', 'database', EditDatabase.Text);
  INI.WriteString('Geral', 'caminhoscripts', EditCaminhoScripts.Text);
  INI.WriteString('Geral', 'inicioplanilha', EditInicioPlanilha.Text);
  INI.WriteString('Geral', 'fimplanilha', EditFimPlanilha.Text);
  INI.WriteString('Geral', 'idempresa', EditIdEmpresa.Text);
  INI.WriteString('Geral', 'naturezaoperacao', EditNaturezaOperacao.Text);
  INI.WriteString('Geral', 'rotas', EditRotas.Text);
  INI.WriteBool('Geral', 'inserirdelete', CheckBoxInserirDeleteAntes.Checked);
  INI.WriteBool('Geral', 'salvarautomaticamente', CheckBoxSalvarAutomaticamente.Checked);
  INI.WriteBool('Geral', 'contasrecebersomentedocumentocomnumero', CheckBobxContasReceberSomenteDocumentosComNumero.Checked);
  INI.WriteString('Geral', 'forcarfilial', EditForcarNumeroFilial.Text);
end;

procedure TFrmPrincipal.sbTipoEstabelecimentoClick(Sender: TObject);
begin
  if ((EditTipoEstabelecimentoDe.Text = EmptyStr) or (EditTipoEstabelecimentoPara.Text = EmptyStr)) then
    raise Exception.Create('Informar valores nos campos De e Para!');
  if SGTipoEstabelecimento.Cells[1,SGTipoEstabelecimento.RowCount-1] <> EmptyStr then
    SGTipoEstabelecimento.RowCount := SGTipoEstabelecimento.RowCount + 1;

  SGTipoEstabelecimento.Cells[0,SGTipoEstabelecimento.RowCount-1]:= IntToStr(SGTipoEstabelecimento.RowCount-1);
  SGTipoEstabelecimento.Cells[1,SGTipoEstabelecimento.RowCount-1]:= EditTipoEstabelecimentoDe.Text;
  SGTipoEstabelecimento.Cells[2,SGTipoEstabelecimento.RowCount-1]:= EditTipoEstabelecimentoPara.Text;

  EditTipoEstabelecimentoDe.Clear;
  EditTipoEstabelecimentoPara.Clear;
  EditTipoEstabelecimentoDe.SetFocus;
end;

procedure TFrmPrincipal.ValidaConfigTipoEstabelecimento;
begin
  if (LowerCase(EditDatabase.Text) <> LowerCase(LabelConfigAtiva.Caption)) then
    raise Exception.Create('Config Tipo Estabelecimento Inválida!');
end;

procedure TFrmPrincipal.VerificaConexao;
begin
  if not FDConnection1.Connected then
    //raise Exception.Create('Não conectado ao banco de dados!');
    ConectarDB;
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


function TFrmPrincipal.StrSplit(st: String; dl: char): TStrings;
Var
   ret : TStringList;
   r: String;
   i: integer;
begin
     ret := TStringList.Create;
     r:= '';
     If length(st) > 0 then
        For i := 0 to length(st) do
            if st[i] = dl then begin
               ret.Add(r);
               r := '';
            end else
               r := r + st[i];
     result := ret;
end;

end.

