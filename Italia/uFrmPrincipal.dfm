object FrmPrincipal: TFrmPrincipal
  Left = 480
  Top = 228
  Caption = 'FrmPrincipal'
  ClientHeight = 704
  ClientWidth = 1440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 160
    Top = 663
    Width = 1265
    Height = 28
    Progress = 0
  end
  object DBGrid1: TDBGrid
    Left = 160
    Top = 8
    Width = 1265
    Height = 329
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BtnConectar: TButton
    Left = 1
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = BtnConectarClick
  end
  object BtnDesconectar: TButton
    Left = 79
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Desconectar'
    TabOrder = 2
    OnClick = BtnDesconectarClick
  end
  object ListBox1: TListBox
    Left = 160
    Top = 343
    Width = 1265
    Height = 314
    ItemHeight = 13
    TabOrder = 3
  end
  object BtnSalvar: TButton
    Left = 1
    Top = 663
    Width = 153
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = BtnSalvarClick
  end
  object BtnCliFor: TButton
    Left = 1
    Top = 78
    Width = 153
    Height = 25
    Caption = 'CliFor'
    TabOrder = 5
    OnClick = BtnCliForClick
  end
  object BtnRota: TButton
    Left = 1
    Top = 47
    Width = 153
    Height = 25
    Caption = 'Rota'
    TabOrder = 6
    OnClick = BtnRotaClick
  end
  object BtnFornecedor: TButton
    Left = 1
    Top = 109
    Width = 153
    Height = 25
    Caption = 'Fornecedor'
    TabOrder = 7
    OnClick = BtnFornecedorClick
  end
  object BtnProduto: TButton
    Left = 1
    Top = 140
    Width = 153
    Height = 25
    Caption = 'Produto'
    TabOrder = 8
    OnClick = BtnProdutoClick
  end
  object BtnConsumo: TButton
    Left = 1
    Top = 171
    Width = 153
    Height = 25
    Caption = 'Consumo'
    TabOrder = 9
    OnClick = BtnConsumoClick
  end
  object Button2: TButton
    Left = 1
    Top = 479
    Width = 153
    Height = 25
    Caption = 'Salvar'
    TabOrder = 10
    Visible = False
  end
  object Button3: TButton
    Left = 1
    Top = 431
    Width = 153
    Height = 25
    Caption = 'Salvar'
    TabOrder = 11
    Visible = False
  end
  object Button1: TButton
    Left = 1
    Top = 312
    Width = 153
    Height = 25
    Caption = ' update FDP'
    TabOrder = 12
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Server=Localhost'
      'Password=root'
      'Database=desktopbellait1'
      'User_Name=root')
    LoginPrompt = False
    Left = 64
    Top = 112
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorHome = 'E:\Conversao\Italia\bin'
    VendorLib = 'libmysql.dll'
    Left = 64
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 56
    Top = 296
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 40
    Top = 240
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Left = 88
    Top = 240
  end
end
