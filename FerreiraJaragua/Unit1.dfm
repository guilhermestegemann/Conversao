object Form1: TForm1
  Left = 0
  Top = 0
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
  object ListBox1: TListBox
    Left = 152
    Top = 8
    Width = 1384
    Height = 617
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Contato'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Vendedor'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 176
    Width = 89
    Height = 25
    Caption = 'Data Cadastro'
    TabOrder = 3
    OnClick = Button3Click
  end
  object PopupMenu1: TPopupMenu
    Left = 32
    Top = 408
    object salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = salvarClick
    end
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Left = 40
    Top = 320
  end
end
