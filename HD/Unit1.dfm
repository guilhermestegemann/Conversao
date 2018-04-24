object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 737
  ClientWidth = 1542
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
    Left = 120
    Top = 688
    Width = 1414
    Height = 28
    Progress = 0
  end
  object ListBox1: TListBox
    Left = 120
    Top = 8
    Width = 1414
    Height = 674
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Bairro'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Cidade'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 240
    Width = 106
    Height = 25
    Caption = 'TipoEstabelecimento'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Cliente'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 32
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 5
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Left = 32
    Top = 536
  end
  object PopupMenu1: TPopupMenu
    Left = 32
    Top = 448
    object Salvar1: TMenuItem
      Caption = 'Salvar'
      OnClick = Salvar1Click
    end
  end
end
