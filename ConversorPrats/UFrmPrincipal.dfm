object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Conversor Prats'
  ClientHeight = 703
  ClientWidth = 1522
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
  object FDQuery1: TFDQuery
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
end
