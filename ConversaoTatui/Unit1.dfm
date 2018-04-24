object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Form1'
  ClientHeight = 675
  ClientWidth = 1544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 152
    Top = 631
    Width = 1384
    Height = 36
    Progress = 0
  end
  object Label1: TLabel
    Left = 24
    Top = 224
    Width = 72
    Height = 13
    Caption = 'Qtde Clientes: '
  end
  object LblQtde: TLabel
    Left = 112
    Top = 224
    Width = 3
    Height = 13
  end
  object ListBox1: TListBox
    Left = 152
    Top = 8
    Width = 1384
    Height = 617
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object btnCliente: TButton
    Left = 8
    Top = 163
    Width = 138
    Height = 25
    Caption = 'Cliente'
    TabOrder = 1
    OnClick = btnClienteClick
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 608
    object salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = salvarClick
    end
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    DefaultExt = '*.txt'
    Filter = 'Texto|*.txt'
    Left = 40
    Top = 560
  end
end
