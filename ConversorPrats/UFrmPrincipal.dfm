object FrmPrincipal: TFrmPrincipal
  Left = 274
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
  Position = poDesigned
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1543
    Height = 854
    ActivePage = TabSheetConversaoFiliais
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Geral'
      object Gauge1: TGauge
        Left = 180
        Top = 763
        Width = 1355
        Height = 36
        Progress = 0
      end
      object Label1: TLabel
        Left = 8
        Top = 68
        Width = 59
        Height = 13
        Caption = 'Nome Banco'
      end
      object Label2: TLabel
        Left = 8
        Top = 813
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
      object LabelComodato: TLabel
        Left = 839
        Top = 810
        Width = 104
        Height = 13
        Caption = 'Nat. Op. Comodato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelTrocas: TLabel
        Left = 1183
        Top = 810
        Width = 84
        Height = 13
        Caption = 'Nat. Op. Trocas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ListBox1: TListBox
        Left = 180
        Top = 383
        Width = 1355
        Height = 374
        ItemHeight = 13
        TabOrder = 0
      end
      object EditCaminhoScripts: TEdit
        Left = 180
        Top = 805
        Width = 653
        Height = 21
        TabOrder = 1
      end
      object EditDatabase: TEdit
        Left = 80
        Top = 63
        Width = 94
        Height = 21
        TabOrder = 2
      end
      object EditIdEmpresa: TEdit
        Left = 80
        Top = 88
        Width = 94
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
      object EditNaturezaOperacao: TEdit
        Left = 80
        Top = 112
        Width = 94
        Height = 21
        TabOrder = 4
      end
      object EditRotas: TEdit
        Left = 80
        Top = 139
        Width = 94
        Height = 21
        TabOrder = 5
      end
      object BtnBairro: TButton
        Left = 8
        Top = 226
        Width = 166
        Height = 18
        Caption = 'Bairro'
        TabOrder = 6
        OnClick = BtnBairroClick
      end
      object BtnCidade: TButton
        Left = 8
        Top = 247
        Width = 166
        Height = 18
        Caption = 'Cidade'
        TabOrder = 7
        OnClick = BtnCidadeClick
      end
      object BtnClassificacao: TButton
        Left = 8
        Top = 392
        Width = 166
        Height = 18
        Caption = 'Classifica'#231#227'o'
        TabOrder = 8
        OnClick = BtnClassificacaoClick
      end
      object BtnClifor: TButton
        Left = 8
        Top = 286
        Width = 166
        Height = 18
        Caption = 'Clifor'
        TabOrder = 9
        OnClick = BtnCliforClick
      end
      object BtnCliforTabelaPreco: TButton
        Left = 8
        Top = 516
        Width = 166
        Height = 18
        Caption = 'Clifor Tabela Pre'#231'o'
        TabOrder = 10
        OnClick = BtnCliforTabelaPrecoClick
      end
      object BtnCondicaoPagamento: TButton
        Left = 8
        Top = 185
        Width = 166
        Height = 18
        Caption = 'Condi'#231#227'o Pagamento'
        TabOrder = 11
        OnClick = BtnCondicaoPagamentoClick
      end
      object BtnConectar: TButton
        Left = 8
        Top = 164
        Width = 80
        Height = 18
        Caption = 'Conectar'
        TabOrder = 12
        OnClick = BtnConectarClick
      end
      object BtnContasAPagar: TButton
        Left = 8
        Top = 537
        Width = 166
        Height = 18
        Caption = 'Contas a Pagar'
        Enabled = False
        TabOrder = 13
        OnClick = BtnContasAPagarClick
      end
      object BtnContasPagarProcedure: TButton
        Left = 8
        Top = 578
        Width = 166
        Height = 18
        Caption = 'Contas a Pagar Procedure'
        TabOrder = 14
        OnClick = BtnContasPagarProcedureClick
      end
      object BtnAjustaEmailExcel: TButton
        Left = 8
        Top = 558
        Width = 166
        Height = 18
        Caption = 'AjustaEmailExcel'
        TabOrder = 15
        OnClick = BtnAjustaEmailExcelClick
      end
      object BtnDesconectar: TButton
        Left = 94
        Top = 164
        Width = 80
        Height = 18
        Caption = 'Desconectar'
        TabOrder = 16
        OnClick = BtnDesconectarClick
      end
      object BtnEstoque: TButton
        Left = 8
        Top = 454
        Width = 166
        Height = 18
        Caption = 'Estoque'
        TabOrder = 17
        OnClick = BtnEstoqueClick
      end
      object BtnFuncionario: TButton
        Left = 8
        Top = 267
        Width = 166
        Height = 18
        Caption = 'Funcion'#225'rio'
        TabOrder = 18
        OnClick = BtnFuncionarioClick
      end
      object BtnGerarTodos: TButton
        Left = 8
        Top = 765
        Width = 166
        Height = 18
        Caption = 'Gerar Todos'
        TabOrder = 19
        OnClick = BtnGerarTodosClick
      end
      object BtnGrupo: TButton
        Left = 8
        Top = 330
        Width = 166
        Height = 18
        Caption = 'Grupo'
        TabOrder = 20
        OnClick = BtnGrupoClick
      end
      object BtnItemTabelaPreco: TButton
        Left = 8
        Top = 495
        Width = 166
        Height = 18
        Caption = 'Tabela Pre'#231'o - Itens'
        TabOrder = 21
        OnClick = BtnItemTabelaPrecoClick
      end
      object BtnMarca: TButton
        Left = 8
        Top = 371
        Width = 166
        Height = 18
        Caption = 'Marca'
        TabOrder = 22
        OnClick = BtnMarcaClick
      end
      object BtnProduto: TButton
        Left = 8
        Top = 412
        Width = 166
        Height = 18
        Caption = 'Produto'
        TabOrder = 23
        OnClick = BtnProdutoClick
      end
      object BtnProdutoClifor: TButton
        Left = 8
        Top = 433
        Width = 166
        Height = 18
        Caption = 'Produto Clifor'
        TabOrder = 24
        OnClick = BtnProdutoCliforClick
      end
      object BtnRota: TButton
        Left = 8
        Top = 599
        Width = 166
        Height = 18
        Caption = 'Rota'
        TabOrder = 25
        OnClick = BtnRotaClick
      end
      object BtnRotaClifor: TButton
        Left = 8
        Top = 620
        Width = 166
        Height = 18
        Caption = 'Rota Clifor'
        TabOrder = 26
        OnClick = BtnRotaCliforClick
      end
      object BtnSalvar: TButton
        Left = 8
        Top = 786
        Width = 166
        Height = 18
        Caption = 'Salvar'
        TabOrder = 27
        OnClick = BtnSalvarClick
      end
      object BtnTabelaPreco: TButton
        Left = 8
        Top = 475
        Width = 166
        Height = 18
        Caption = 'Tabela Pre'#231'o'
        TabOrder = 28
        OnClick = BtnTabelaPrecoClick
      end
      object BtnTipoEstabelecimento: TButton
        Left = 8
        Top = 205
        Width = 166
        Height = 18
        Caption = 'Tipo Estabelecimento'
        TabOrder = 29
        OnClick = BtnTipoEstabelecimentoClick
      end
      object BtnTipoProduto: TButton
        Left = 8
        Top = 350
        Width = 166
        Height = 18
        Caption = 'Tipo Produto'
        TabOrder = 30
        OnClick = BtnTipoProdutoClick
      end
      object BtnUnidadeMedida: TButton
        Left = 8
        Top = 306
        Width = 166
        Height = 18
        Caption = 'Unidade de Medida'
        TabOrder = 31
        OnClick = BtnUnidadeMedidaClick
      end
      object BtnVendas: TButton
        Left = 8
        Top = 640
        Width = 166
        Height = 18
        Caption = 'Vendas'
        TabOrder = 32
        OnClick = BtnVendasClick
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
        TabOrder = 33
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
        TabOrder = 34
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
        TabOrder = 35
      end
      object DBGrid1: TDBGrid
        Left = 180
        Top = 8
        Width = 1355
        Height = 369
        DataSource = DataSource1
        TabOrder = 36
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object BtnUpdateNossoNumero: TButton
        Left = 8
        Top = 661
        Width = 166
        Height = 18
        Caption = 'Update Nosso Numero'
        TabOrder = 37
        OnClick = BtnUpdateNossoNumeroClick
      end
      object BtnUpdateRapel: TButton
        Left = 8
        Top = 744
        Width = 166
        Height = 18
        Caption = 'Update Rapel'
        TabOrder = 38
        OnClick = BtnUpdateRapelClick
      end
      object EditNatOpTrocas: TEdit
        Left = 1279
        Top = 805
        Width = 74
        Height = 21
        NumbersOnly = True
        TabOrder = 39
        OnKeyPress = EditTipoEstabelecimentoParaKeyPress
      end
      object EditNatOpComodato: TEdit
        Left = 976
        Top = 805
        Width = 89
        Height = 21
        NumbersOnly = True
        TabOrder = 40
        OnKeyPress = EditTipoEstabelecimentoDeKeyPress
      end
      object BtnTrocas: TButton
        Left = 1359
        Top = 805
        Width = 82
        Height = 21
        Caption = 'Trocas'
        TabOrder = 41
        OnClick = BtnTrocasClick
      end
      object BtnComodato: TButton
        Left = 1087
        Top = 805
        Width = 90
        Height = 21
        Caption = 'Comodato'
        TabOrder = 42
        OnClick = BtnComodatoClick
      end
      object ButtonSemRomaneio: TButton
        Left = 8
        Top = 703
        Width = 166
        Height = 18
        Caption = 'Vendas (Excel)'
        TabOrder = 43
        OnClick = ButtonSemRomaneioClick
      end
      object ButtonAjustaFuncionarioClifor: TButton
        Left = 8
        Top = 723
        Width = 166
        Height = 18
        Caption = 'Ajusta FuncionarioClifor Filial'
        TabOrder = 44
        OnClick = ButtonAjustaFuncionarioCliforClick
      end
      object ButtonCliForAtivo: TButton
        Left = 8
        Top = 682
        Width = 166
        Height = 18
        Caption = 'Clifor - Ativo'
        TabOrder = 45
        OnClick = ButtonCliForAtivoClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Configura'#231#227'o'
      ImageIndex = 1
      object sbTipoEstabelecimento: TSpeedButton
        Left = 280
        Top = 24
        Width = 75
        Height = 21
        Caption = '&Incluir'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF00007200007200006B000066000065000065FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0001B70001B7050DAC393EB058
          5AB25657AB2E2F9000006F000069000069FF00FFFF00FFFF00FFFF00FFFF00FF
          0016CE0915C66C74D9CED1F2FFFFFFFFFFFFFFFFFFFFFFFFC1C2DF5A5A9F0101
          6900007DFF00FFFF00FFFF00FF0018DF0A1DD3A8B0EDFFFFFFFFFFFFBDBEE98C
          8CD18D8DD0CACAEAFFFFFFFFFFFF8C8CBD010169000072FF00FFFF00FF0018DF
          919DEFFFFFFFE6E8F94F53CE0002AB00009D0000950000975F5FBEF0F0FAFFFF
          FF6565A6000072FF00FF001EF12743E7FBFBFFF7F8FD3B4BDA0000C0161DBEB0
          B4E7A3A5E00A0CA000008F5252B9FFFFFFD9D9E90B0B7F00007A001EF17287F6
          FFFFFF91A1F4000DDA000BD0161DCBF1F4FEDEE1F60508A900009A000093ACAC
          DDFFFFFF5353AF00007A0023F8A8B8FCFFFFFF4060F61734ECA0AEF2BABEF1F8
          F9FEF3F4FBB6B8E99799DC0D0EA25A5BBFFFFFFF8487D60000790E3EFEC5CFFE
          FFFFFF3259FE2649F9FAFCFFFFFFFFFFFFFFFFFFFFFFFFFFEBECF91519B14A4F
          C1FFFFFF9094D90000A23C63FFC4D0FFFFFFFF5979FF052EFF375CFB586DF4F0
          F3FEE3E6FA4D5ADE3446D20004B7757CD6FFFFFF797DD50000A8103EFFB6C5FF
          FFFFFFC7D2FF032CFF0020FF1739FBF3F6FFE1E5FA071FDC0007CE0C1CCBD9DC
          F5FDFDFE313CC80000A8FF00FF8DA4FFFFFFFFFFFFFF8AA0FF0027FF002CFF46
          6AFF4163F8001DE9061CDFA1ACF1FFFFFFB4BAED0007BBFF00FFFF00FF718DFF
          DAE1FFFFFFFFFFFFFFB1C0FF3B5DFF1538FF1739FE4966F8C0CAFAFFFFFFEDEF
          FC3041D30007BBFF00FFFF00FFFF00FF88A0FFE6EBFFFFFFFFFFFFFFFDFDFFE2
          E9FFE4EBFFFFFFFFFFFFFFDBE0FA3D50E0000BCCFF00FFFF00FFFF00FFFF00FF
          FF00FF8AA1FFBAC7FEE8ECFFFFFFFFFFFFFFFFFFFFE4E9FE889BF61738E6000B
          CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8AA0FF8AA3FF90
          A6FF7993FE4A6BF91A40EFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = sbTipoEstabelecimentoClick
      end
      object Label8: TLabel
        Left = 302
        Top = 516
        Width = 74
        Height = 13
        Caption = 'Config Ativa: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelConfigAtiva: TLabel
        Left = 390
        Top = 516
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 680
        Top = 45
        Width = 58
        Height = 13
        Caption = 'CLIFOR IN '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 5
        Width = 15
        Height = 13
        Caption = 'De'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 135
        Top = 5
        Width = 26
        Height = 13
        Caption = 'Para'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 751
        Top = 317
        Width = 67
        Height = 13
        Caption = 'Fim Planilha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 616
        Top = 317
        Width = 78
        Height = 13
        Caption = 'Inicio Planilha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 584
        Top = 213
        Width = 64
        Height = 13
        Caption = 'For'#231'ar Filial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 960
        Top = 419
        Width = 85
        Height = 13
        Caption = 'Tipo Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 1108
        Top = 419
        Width = 110
        Height = 13
        Caption = 'Situa'#231#227'o Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SGTipoEstabelecimento: TStringGrid
        Left = 3
        Top = 64
        Width = 478
        Height = 441
        ColCount = 3
        RowCount = 2
        TabOrder = 0
        ColWidths = (
          64
          183
          223)
        RowHeights = (
          24
          24)
      end
      object BtnSalvarConfig: TButton
        Left = 3
        Top = 511
        Width = 134
        Height = 25
        Caption = 'Salvar Config'
        TabOrder = 1
        OnClick = BtnSalvarConfigClick
      end
      object BtnCarregarConfig: TButton
        Left = 143
        Top = 511
        Width = 130
        Height = 25
        Caption = 'Carregar Config'
        TabOrder = 2
        OnClick = BtnCarregarConfigClick
      end
      object EditCliforIn: TEdit
        Left = 680
        Top = 64
        Width = 753
        Height = 21
        TabOrder = 3
      end
      object EditTipoEstabelecimentoPara: TEdit
        Left = 135
        Top = 24
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 4
        OnKeyPress = EditTipoEstabelecimentoParaKeyPress
      end
      object EditTipoEstabelecimentoDe: TEdit
        Left = 0
        Top = 24
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 5
        OnKeyPress = EditTipoEstabelecimentoDeKeyPress
      end
      object EditFimPlanilha: TEdit
        Left = 751
        Top = 336
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 6
        OnKeyPress = EditTipoEstabelecimentoParaKeyPress
      end
      object EditInicioPlanilha: TEdit
        Left = 616
        Top = 336
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 7
        OnKeyPress = EditTipoEstabelecimentoDeKeyPress
      end
      object ListBoxNossoNumero: TListBox
        Left = 512
        Top = 376
        Width = 182
        Height = 425
        ItemHeight = 13
        TabOrder = 8
      end
      object ListBoxNossoNumeroDuplicado: TListBox
        Left = 711
        Top = 376
        Width = 186
        Height = 425
        ItemHeight = 13
        TabOrder = 9
      end
      object BtnContasPagarExcel: TButton
        Left = 960
        Top = 336
        Width = 166
        Height = 21
        Caption = 'Contas a Pagar (Excel)'
        Enabled = False
        TabOrder = 10
        Visible = False
        OnClick = BtnContasPagarExcelClick
      end
      object EditForcarNumeroFilial: TEdit
        Left = 584
        Top = 232
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 11
        OnKeyPress = EditTipoEstabelecimentoDeKeyPress
      end
      object ButtonAjustaCondicaoPagamento: TButton
        Left = 960
        Top = 387
        Width = 166
        Height = 18
        Caption = 'AjustaCondicaoPagamento'
        TabOrder = 12
        OnClick = ButtonAjustaCondicaoPagamentoClick
      end
      object ButtonContaPagaRecebida: TButton
        Left = 960
        Top = 535
        Width = 217
        Height = 54
        Caption = 'Contas Recebidas (Excel) (ID)'
        TabOrder = 13
        OnClick = ButtonContaPagaRecebidaClick
      end
      object EditTipoFinanceiro: TEdit
        Left = 960
        Top = 438
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 14
        OnKeyPress = EditTipoEstabelecimentoDeKeyPress
      end
      object EditSituacaoFinanceiro: TEdit
        Left = 1108
        Top = 438
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        NumbersOnly = True
        TabOrder = 15
        Text = '99'
        OnKeyPress = EditTipoEstabelecimentoDeKeyPress
      end
      object ButtonContasPagarExcel: TButton
        Left = 960
        Top = 595
        Width = 217
        Height = 54
        Caption = 'Contas Pagar (Excel)'
        TabOrder = 16
        OnClick = ButtonContasPagarExcelClick
      end
      object ButtonContasPagasExcel: TButton
        Left = 960
        Top = 655
        Width = 217
        Height = 54
        Caption = 'Contas Pagas (Excel) (ID)'
        TabOrder = 17
        OnClick = ButtonContasPagasExcelClick
      end
      object ButtonUpdateGeoLocalizacao: TButton
        Left = 960
        Top = 363
        Width = 166
        Height = 18
        Caption = 'Update Geo Localiza'#231#227'o'
        TabOrder = 18
        OnClick = ButtonUpdateGeoLocalizacaoClick
      end
      object BtnContasAReceberExcel: TButton
        Left = 960
        Top = 475
        Width = 217
        Height = 54
        Caption = 'Contas a Receber (Excel)'
        TabOrder = 19
        OnClick = BtnContasAReceberExcelClick
      end
      object RGTipoConversaoContasReceber: TRadioGroup
        Left = 1199
        Top = 469
        Width = 185
        Height = 60
        Caption = 'Tipo Convers'#227'o Contas Receber'
        Items.Strings = (
          'Sem agrupar'
          'Agrupando pelo nosso numero')
        TabOrder = 20
      end
    end
    object TabSheetConversaoFiliais: TTabSheet
      Caption = 'Convers'#227'o Filiais'
      ImageIndex = 2
      object ButtonConversaoFiliaisCliFor: TButton
        Left = 3
        Top = 65
        Width = 75
        Height = 25
        Caption = 'Clifor'
        TabOrder = 0
        OnClick = ButtonConversaoFiliaisCliForClick
      end
      object ButtonConversaoFiliaisFuncionario: TButton
        Left = 3
        Top = 34
        Width = 75
        Height = 25
        Caption = 'Funcion'#225'rio'
        TabOrder = 1
        OnClick = ButtonConversaoFiliaisFuncionarioClick
      end
      object ButtonRotaFiliais: TButton
        Left = 3
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Rota'
        TabOrder = 2
        OnClick = ButtonRotaFiliaisClick
      end
      object ButtonRotaCliforFiliais: TButton
        Left = 3
        Top = 127
        Width = 75
        Height = 25
        Caption = 'Rota Clifor'
        TabOrder = 3
        OnClick = ButtonRotaCliforFiliaisClick
      end
      object ButtonTabelaPrecoFiliais: TButton
        Left = 3
        Top = 219
        Width = 75
        Height = 25
        Caption = 'Tabela Pre'#231'o'
        TabOrder = 4
        OnClick = ButtonTabelaPrecoFiliaisClick
      end
      object ButtonItemTabelaPrecoFiliais: TButton
        Left = 3
        Top = 250
        Width = 94
        Height = 25
        Caption = 'ItemTabelaPre'#231'o'
        TabOrder = 5
        OnClick = ButtonItemTabelaPrecoFiliaisClick
      end
      object ButtonEstoqueFiliais: TButton
        Left = 3
        Top = 281
        Width = 75
        Height = 25
        Caption = 'Estoque'
        TabOrder = 6
        OnClick = ButtonEstoqueFiliaisClick
      end
      object ButtonCliforTabelaPrecoFiliais: TButton
        Left = 3
        Top = 309
        Width = 102
        Height = 25
        Caption = 'CliforTabelaPreco'
        TabOrder = 7
        OnClick = ButtonCliforTabelaPrecoFiliaisClick
      end
      object ButtonAjustaCondicaoPagamentoFiliais: TButton
        Left = 3
        Top = 414
        Width = 222
        Height = 25
        Caption = 'Ajusta Condi'#231#227'o Pagamento Filiais'
        TabOrder = 8
        OnClick = ButtonAjustaCondicaoPagamentoFiliaisClick
      end
      object ButtonAjustaCliforAtivoFiliais: TButton
        Left = 3
        Top = 462
        Width = 222
        Height = 25
        Caption = 'Ajusta Clifor Ativo Filiais'
        TabOrder = 9
        OnClick = ButtonAjustaCliforAtivoFiliaisClick
      end
      object ButtonCidadeFiliais: TButton
        Left = 3
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Cidade'
        TabOrder = 10
        OnClick = ButtonCidadeFiliaisClick
      end
      object ButtonProdutoFiliais: TButton
        Left = 3
        Top = 158
        Width = 75
        Height = 25
        Caption = 'Produto'
        TabOrder = 11
        OnClick = ButtonProdutoFiliaisClick
      end
      object ButtonGerarTodosFiliais: TButton
        Left = 3
        Top = 582
        Width = 126
        Height = 25
        Caption = 'Gerar Todos'
        TabOrder = 12
        OnClick = ButtonGerarTodosFiliaisClick
      end
    end
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 72
    Top = 232
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'D:\Conversao\ConversorPrats'
    VendorLib = 'libpq.dll'
    Left = 16
    Top = 168
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=postgres'
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
  object OpenDialog1: TOpenDialog
    DefaultExt = '.xls'
    Left = 84
    Top = 528
  end
end
