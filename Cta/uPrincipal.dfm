object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'CTA Lixo'
  ClientHeight = 682
  ClientWidth = 1560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 111
    Top = 641
    Width = 1080
    Height = 33
    Progress = 0
  end
  object btnConverter: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Ajustar'
    TabOrder = 0
    OnClick = btnConverterClick
  end
  object btnConverter1: TButton
    Left = 8
    Top = 72
    Width = 97
    Height = 25
    Caption = 'Converter'
    TabOrder = 1
    OnClick = btnConverter1Click
  end
  object btnCidade: TButton
    Left = 8
    Top = 103
    Width = 81
    Height = 41
    Caption = 'Cidade'
    TabOrder = 2
    OnClick = btnCidadeClick
  end
  object ListBox1: TListBox
    Left = 184
    Top = 8
    Width = 1353
    Height = 601
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 3
  end
  object btnBairro: TButton
    Left = 8
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Bairro'
    TabOrder = 4
    OnClick = btnBairroClick
  end
  object btnTipoEstabelecimento: TButton
    Left = 8
    Top = 232
    Width = 113
    Height = 25
    Caption = 'TipoEstabelecimento'
    TabOrder = 5
    OnClick = btnTipoEstabelecimentoClick
  end
  object btnRota: TButton
    Left = 8
    Top = 263
    Width = 75
    Height = 25
    Caption = 'Rota'
    TabOrder = 6
    OnClick = btnRotaClick
  end
  object btnVendedor: TButton
    Left = 8
    Top = 294
    Width = 75
    Height = 25
    Caption = 'Vendedor'
    TabOrder = 7
    OnClick = btnVendedorClick
  end
  object btntabela: TButton
    Left = 8
    Top = 153
    Width = 75
    Height = 25
    Caption = 'Tabela'
    TabOrder = 8
    OnClick = btntabelaClick
  end
  object btnProduto: TButton
    Left = 24
    Top = 488
    Width = 113
    Height = 25
    Caption = 'Produtos - Excel'
    TabOrder = 9
    OnClick = btnProdutoClick
  end
  object btnProdutosTxt: TButton
    Left = 24
    Top = 325
    Width = 113
    Height = 25
    Caption = 'Produtos - TXT'
    TabOrder = 10
  end
  object Button1: TButton
    Left = 62
    Top = 392
    Width = 75
    Height = 25
    Caption = 'AjustarProdutos'
    TabOrder = 11
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 457
    Width = 113
    Height = 25
    Caption = 'Fornecedor'
    TabOrder = 12
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 545
    Width = 113
    Height = 25
    Caption = 'updateProduto'
    TabOrder = 13
    OnClick = Button3Click
  end
  object PopupMenu1: TPopupMenu
    Left = 584
    Top = 328
    object Salvar1: TMenuItem
      Caption = 'Salvar'
      OnClick = Salvar1Click
    end
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Left = 48
    Top = 592
  end
end
