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
  object ListBox1: TListBox
    Left = 152
    Top = 8
    Width = 1384
    Height = 617
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object btnBairro: TButton
    Left = 8
    Top = 39
    Width = 138
    Height = 25
    Caption = 'Bairro'
    TabOrder = 1
    OnClick = btnBairroClick
  end
  object btnCondicaoPagamento: TButton
    Left = 8
    Top = 132
    Width = 138
    Height = 25
    Caption = 'Condi'#231#227'o Pagamento'
    TabOrder = 2
  end
  object btnRota: TButton
    Left = 8
    Top = 101
    Width = 138
    Height = 25
    Caption = 'Rota'
    TabOrder = 3
    OnClick = btnRotaClick
  end
  object btnCidade: TButton
    Left = 8
    Top = 70
    Width = 138
    Height = 25
    Caption = 'Cidade'
    TabOrder = 4
    OnClick = btnCidadeClick
  end
  object btnFuncionario: TButton
    Left = 8
    Top = 8
    Width = 138
    Height = 25
    Caption = 'Funcionario'
    TabOrder = 5
    OnClick = btnFuncionarioClick
  end
  object btnCliente: TButton
    Left = 8
    Top = 163
    Width = 138
    Height = 25
    Caption = 'Cliente'
    TabOrder = 6
    OnClick = btnClienteClick
  end
  object btnFornecedor: TButton
    Left = 8
    Top = 194
    Width = 138
    Height = 25
    Caption = 'Fornecedor'
    TabOrder = 7
    OnClick = btnFornecedorClick
  end
  object btnUnidadeMedida: TButton
    Left = 8
    Top = 225
    Width = 138
    Height = 25
    Caption = 'Unidade Medida'
    TabOrder = 8
    OnClick = btnUnidadeMedidaClick
  end
  object btnTipoProduto: TButton
    Left = 8
    Top = 256
    Width = 138
    Height = 25
    Caption = 'Tipo Produto'
    TabOrder = 9
    OnClick = btnTipoProdutoClick
  end
  object btnGrupo: TButton
    Left = 8
    Top = 287
    Width = 138
    Height = 25
    Caption = 'Grupo'
    TabOrder = 10
    OnClick = btnGrupoClick
  end
  object btnProduto: TButton
    Left = 8
    Top = 349
    Width = 138
    Height = 25
    Caption = 'Produto'
    TabOrder = 11
    OnClick = btnProdutoClick
  end
  object btnClasse: TButton
    Left = 8
    Top = 318
    Width = 138
    Height = 25
    Caption = 'Classe'
    TabOrder = 12
    OnClick = btnClasseClick
  end
  object btnEstoque: TButton
    Left = 8
    Top = 380
    Width = 138
    Height = 25
    Caption = 'Estoque'
    TabOrder = 13
    OnClick = btnEstoqueClick
  end
  object btnContasAPagar: TButton
    Left = 8
    Top = 411
    Width = 138
    Height = 25
    Caption = 'Contas a Pagar'
    TabOrder = 14
    OnClick = btnContasAPagarClick
  end
  object btnContasAReceber: TButton
    Left = 8
    Top = 442
    Width = 138
    Height = 25
    Caption = 'Contas a Receber'
    TabOrder = 15
    OnClick = btnContasAReceberClick
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 640
    object salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = salvarClick
    end
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    DefaultExt = '*.txt'
    Filter = 'Texto|*.txt'
    Left = 16
    Top = 640
  end
end
