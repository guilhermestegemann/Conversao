object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Conversor Prats'
  ClientHeight = 838
  ClientWidth = 1543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
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
  object EditDatabase: TEdit
    Left = 80
    Top = 8
    Width = 94
    Height = 21
    TabOrder = 0
  end
  object BtnConectar: TButton
    Left = 8
    Top = 35
    Width = 80
    Height = 21
    Caption = 'Conectar'
    TabOrder = 1
    OnClick = BtnConectarClick
  end
  object BtnDesconectar: TButton
    Left = 94
    Top = 35
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
    Top = 62
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
    Top = 805
    Width = 166
    Height = 21
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = BtnSalvarClick
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
