object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Conversor Prats'
  ClientHeight = 854
  ClientWidth = 1543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 68
    Width = 59
    Height = 13
    Caption = 'Nome Banco'
  end
  object Gauge1: TGauge
    Left = 180
    Top = 790
    Width = 1355
    Height = 36
    Progress = 0
  end
  object Label2: TLabel
    Left = 8
    Top = 833
    Width = 102
    Height = 13
    Caption = 'Salvar Scripts em:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 91
    Width = 54
    Height = 13
    Caption = 'Id Empresa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 115
    Width = 42
    Height = 13
    Caption = 'Nat. Op.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 142
    Width = 28
    Height = 13
    Caption = 'Rotas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EditDatabase: TEdit
    Left = 80
    Top = 63
    Width = 94
    Height = 21
    TabOrder = 0
  end
  object BtnConectar: TButton
    Left = 8
    Top = 171
    Width = 80
    Height = 21
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = BtnConectarClick
  end
  object BtnDesconectar: TButton
    Left = 94
    Top = 171
    Width = 80
    Height = 21
    Caption = 'Desconectar'
    TabOrder = 2
    OnClick = BtnDesconectarClick
  end
  object DBGrid1: TDBGrid
    Left = 180
    Top = 8
    Width = 1355
    Height = 385
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BtnCondicaoPagamento: TButton
    Left = 8
    Top = 195
    Width = 166
    Height = 21
    Caption = 'Condi'#231#227'o Pagamento'
    TabOrder = 4
    OnClick = BtnCondicaoPagamentoClick
  end
  object ListBox1: TListBox
    Left = 180
    Top = 399
    Width = 1355
    Height = 385
    ItemHeight = 13
    TabOrder = 5
  end
  object BtnSalvar: TButton
    Left = 8
    Top = 790
    Width = 166
    Height = 21
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = BtnSalvarClick
  end
  object BtnTipoEstabelecimento: TButton
    Left = 8
    Top = 218
    Width = 166
    Height = 21
    Caption = 'Tipo Estabelecimento'
    TabOrder = 7
    OnClick = BtnTipoEstabelecimentoClick
  end
  object BtnBairro: TButton
    Left = 8
    Top = 241
    Width = 166
    Height = 21
    Caption = 'Bairro'
    TabOrder = 8
    OnClick = BtnBairroClick
  end
  object BtnCidade: TButton
    Left = 8
    Top = 265
    Width = 166
    Height = 21
    Caption = 'Cidade'
    TabOrder = 9
    OnClick = BtnCidadeClick
  end
  object BtnFuncionario: TButton
    Left = 8
    Top = 289
    Width = 166
    Height = 21
    Caption = 'Funcion'#225'rio'
    TabOrder = 10
    OnClick = BtnFuncionarioClick
  end
  object BtnClifor: TButton
    Left = 8
    Top = 309
    Width = 166
    Height = 21
    Caption = 'Clifor'
    TabOrder = 11
    OnClick = BtnCliforClick
  end
  object BtnUnidadeMedida: TButton
    Left = 8
    Top = 336
    Width = 166
    Height = 21
    Caption = 'Unidade de Medida'
    TabOrder = 12
    OnClick = BtnUnidadeMedidaClick
  end
  object BtnGrupo: TButton
    Left = 8
    Top = 359
    Width = 166
    Height = 21
    Caption = 'Grupo'
    TabOrder = 13
    OnClick = BtnGrupoClick
  end
  object BtnTipoProduto: TButton
    Left = 8
    Top = 383
    Width = 166
    Height = 21
    Caption = 'Tipo Produto'
    TabOrder = 14
    OnClick = BtnTipoProdutoClick
  end
  object BtnMarca: TButton
    Left = 8
    Top = 407
    Width = 166
    Height = 21
    Caption = 'Marca'
    TabOrder = 15
    OnClick = BtnMarcaClick
  end
  object BtnClassificacao: TButton
    Left = 8
    Top = 430
    Width = 166
    Height = 21
    Caption = 'Classifica'#231#227'o'
    TabOrder = 16
    OnClick = BtnClassificacaoClick
  end
  object BtnProduto: TButton
    Left = 8
    Top = 452
    Width = 166
    Height = 21
    Caption = 'Produto'
    TabOrder = 17
    OnClick = BtnProdutoClick
  end
  object BtnEstoque: TButton
    Left = 8
    Top = 501
    Width = 166
    Height = 21
    Caption = 'Estoque'
    TabOrder = 18
    OnClick = BtnEstoqueClick
  end
  object BtnTabelaPreco: TButton
    Left = 8
    Top = 524
    Width = 166
    Height = 21
    Caption = 'Tabela Pre'#231'o'
    TabOrder = 19
    OnClick = BtnTabelaPrecoClick
  end
  object BtnItemTabelaPreco: TButton
    Left = 8
    Top = 548
    Width = 166
    Height = 21
    Caption = 'Tabela Pre'#231'o - Itens'
    TabOrder = 20
    OnClick = BtnItemTabelaPrecoClick
  end
  object BtnCliforTabelaPreco: TButton
    Left = 8
    Top = 571
    Width = 166
    Height = 21
    Caption = 'Clifor Tabela Pre'#231'o'
    TabOrder = 21
    OnClick = BtnCliforTabelaPrecoClick
  end
  object BtnProdutoClifor: TButton
    Left = 8
    Top = 477
    Width = 166
    Height = 21
    Caption = 'Produto Clifor'
    TabOrder = 22
    OnClick = BtnProdutoCliforClick
  end
  object BtnContasAPagar: TButton
    Left = 8
    Top = 594
    Width = 166
    Height = 21
    Caption = 'Contas a Pagar'
    TabOrder = 23
    OnClick = BtnContasAPagarClick
  end
  object BtnContasReceber: TButton
    Left = 8
    Top = 617
    Width = 166
    Height = 21
    Caption = 'Contas a Receber'
    TabOrder = 24
    OnClick = BtnContasReceberClick
  end
  object CheckBoxInserirDeleteAntes: TCheckBox
    Left = 8
    Top = 4
    Width = 137
    Height = 17
    Caption = 'Inserir Delete Antes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 25
  end
  object CheckBoxSalvarAutomaticamente: TCheckBox
    Left = 8
    Top = 21
    Width = 166
    Height = 17
    Caption = 'Salvar Automaticamente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 26
  end
  object BtnGerarTodos: TButton
    Left = 8
    Top = 763
    Width = 166
    Height = 21
    Caption = 'Gerar Todos'
    TabOrder = 27
    OnClick = BtnGerarTodosClick
  end
  object EditCaminhoScripts: TEdit
    Left = 180
    Top = 832
    Width = 653
    Height = 21
    TabOrder = 28
  end
  object BtnContasPagarProcedure: TButton
    Left = 8
    Top = 644
    Width = 166
    Height = 21
    Caption = 'Contas a Pagar Procedure'
    TabOrder = 29
    OnClick = BtnContasPagarProcedureClick
  end
  object EditIdEmpresa: TEdit
    Left = 80
    Top = 88
    Width = 94
    Height = 21
    NumbersOnly = True
    TabOrder = 30
  end
  object BtnRota: TButton
    Left = 8
    Top = 671
    Width = 166
    Height = 21
    Caption = 'Rota'
    TabOrder = 31
    OnClick = BtnRotaClick
  end
  object BtnRotaClifor: TButton
    Left = 8
    Top = 698
    Width = 166
    Height = 21
    Caption = 'Rota Clifor'
    TabOrder = 32
    OnClick = BtnRotaCliforClick
  end
  object EditNaturezaOperacao: TEdit
    Left = 80
    Top = 112
    Width = 94
    Height = 21
    TabOrder = 33
  end
  object BtnVendas: TButton
    Left = 8
    Top = 725
    Width = 166
    Height = 21
    Caption = 'Vendas'
    TabOrder = 34
    OnClick = BtnVendasClick
  end
  object EditRotas: TEdit
    Left = 80
    Top = 139
    Width = 94
    Height = 21
    TabOrder = 35
  end
  object CheckBobxContasReceberSomenteDocumentosComNumero: TCheckBox
    Left = 8
    Top = 40
    Width = 166
    Height = 17
    Hint = 
      'Serve para filtrar no contas a receber apenas documentos que sej' +
      'am s'#243' n'#250'meros. Isso evita pegar docs como "VALE, RECIBO"'
    Caption = 'C.R Somente Doc. Numero'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 36
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 72
    Top = 232
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'E:\Conversao\ConversorPrats'
    VendorLib = 'libpq.dll'
    Left = 16
    Top = 168
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=admin'
      'Server=localhost'
      'DriverID=PG')
    Left = 24
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 80
    Top = 136
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    DefaultExt = '.txt'
    Filter = 'Texto|*.txt'
    Left = 80
    Top = 600
  end
end
