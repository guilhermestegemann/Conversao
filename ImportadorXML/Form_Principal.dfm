object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o de XML'
  ClientHeight = 503
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlSepararXML: TPageControl
    Left = 0
    Top = 0
    Width = 675
    Height = 503
    ActivePage = TabSheetImportaXMLNFe
    Align = alClient
    TabOrder = 0
    object TabSheetPrincipal: TTabSheet
      Caption = 'Configura'#231#245'es Banco de Dados'
      ImageIndex = 3
      object Label4: TLabel
        Left = 3
        Top = 4
        Width = 152
        Height = 13
        Caption = 'Banco de Dados Vers'#227'o 2.0.3.0'
      end
      object Label1: TLabel
        Left = 3
        Top = 76
        Width = 124
        Height = 13
        Caption = 'Diret'#243'rio TXT cadastrados'
      end
      object EditCaminhoOrigem: TEdit
        Left = 3
        Top = 21
        Width = 662
        Height = 21
        TabOrder = 0
        Text = 'E:\Dados\Nezi\Novo\TOPDADOS.FDB'
      end
      object Button4: TButton
        Left = 3
        Top = 48
        Width = 110
        Height = 25
        Caption = 'Conectar Banco'
        TabOrder = 1
        OnClick = Button4Click
      end
      object EditTXTCadastrados: TEdit
        Left = 3
        Top = 93
        Width = 662
        Height = 21
        TabOrder = 2
        Text = 'C:\TXTCadastrados\'
      end
    end
    object TabSheetImportaXMLNFe: TTabSheet
      Caption = 'Importa'#231#227'o de XML - NF-e'
      object Gauge1: TGauge
        Left = 0
        Top = 455
        Width = 667
        Height = 20
        Align = alBottom
        Progress = 0
        ExplicitLeft = 3
        ExplicitTop = 452
        ExplicitWidth = 549
      end
      object rgOrigem: TRadioGroup
        Left = 3
        Top = 5
        Width = 81
        Height = 33
        Caption = ' [ Origem ] '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'P'
          'T')
        TabOrder = 0
        TabStop = True
      end
      object FileListBoxNFe: TFileListBox
        Left = 0
        Top = 72
        Width = 668
        Height = 262
        ItemHeight = 13
        Mask = '*.xml'
        TabOrder = 1
      end
      object Button1: TButton
        Left = 3
        Top = 44
        Width = 110
        Height = 25
        Caption = 'Listar XML'
        TabOrder = 2
        OnClick = Button1Click
      end
      object sbCan: TButton
        Left = 338
        Top = 44
        Width = 110
        Height = 25
        Caption = '-can'
        TabOrder = 3
        OnClick = sbCanClick
      end
      object Button3: TButton
        Left = 115
        Top = 44
        Width = 110
        Height = 25
        Caption = 'Importar XML'
        TabOrder = 4
        OnClick = Button3Click
      end
      object RGServico: TRadioGroup
        Left = 88
        Top = 5
        Width = 81
        Height = 33
        Caption = ' [ Servi'#231'o ] '
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'S'
          'N')
        TabOrder = 5
        TabStop = True
      end
      object RGAtualizada: TRadioGroup
        Left = 173
        Top = 5
        Width = 81
        Height = 33
        Caption = ' [ Atualizada ] '
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'S'
          'N')
        TabOrder = 6
        TabStop = True
      end
      object RGImpressa: TRadioGroup
        Left = 260
        Top = 5
        Width = 81
        Height = 33
        Caption = ' [ Impressa ] '
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'S'
          'N')
        TabOrder = 7
        TabStop = True
      end
      object Memo1: TMemo
        Left = 0
        Top = 288
        Width = 667
        Height = 167
        Align = alBottom
        Color = clInfoBk
        Lines.Strings = (
          'Arrumar ID NF'
          'Desativar TRIGGER_CFOP'
          'Conferir replica'#231#227'o, ativo = '#39'N'#39' nos terminais'
          'NF Propria> TRIGGER_NF_SOMAR comentar a parte de recalcular'
          'Cadastrar cadastros Zerados'
          'Conferir IsFilial'
          
            'Desativar Gerar estoque: trigger atualiza NF, atualiza NF entrad' +
            'a, cancela NF e cancela NF Entrada'
          'OU desativar TRIGGER_MOVIMENTOESTOQUE'
          'Ver bloquear se baixado financeiro'
          'VER TRIGGER_ATUALIZACUPOM')
        TabOrder = 8
      end
      object sbProc: TButton
        Left = 226
        Top = 44
        Width = 110
        Height = 25
        Caption = '-proc'
        TabOrder = 9
        OnClick = sbProcClick
      end
      object sbInu: TButton
        Left = 450
        Top = 44
        Width = 110
        Height = 25
        Caption = '-inu'
        TabOrder = 10
        OnClick = sbInuClick
      end
      object GroupBoxVerificaNF: TGroupBox
        Left = 475
        Top = 1
        Width = 193
        Height = 38
        Caption = 'Verificar NF-NFE -  Data A partir de:'
        Color = clInfoBk
        ParentBackground = False
        ParentColor = False
        TabOrder = 11
        object DateTimePickerData: TDateTimePicker
          Left = 3
          Top = 14
          Width = 92
          Height = 20
          Date = 41824.445770891200000000
          Time = 41824.445770891200000000
          TabOrder = 0
        end
        object ButtonVerificarNFe: TButton
          Left = 97
          Top = 12
          Width = 92
          Height = 25
          Caption = 'Verificar NF-e'
          TabOrder = 1
          OnClick = ButtonVerificarNFeClick
        end
      end
      object LabeledEditFilial: TLabeledEdit
        Left = 343
        Top = 17
        Width = 42
        Height = 21
        EditLabel.Width = 20
        EditLabel.Height = 13
        EditLabel.Caption = 'Filial'
        TabOrder = 12
        Text = '1'
      end
      object LabeledEditTabelaPReco: TLabeledEdit
        Left = 391
        Top = 17
        Width = 80
        Height = 21
        EditLabel.Width = 77
        EditLabel.Height = 13
        EditLabel.Caption = 'Tabela de Pre'#231'o'
        TabOrder = 13
        Text = '1'
      end
    end
    object TabSheetImportaXMLCTe: TTabSheet
      Caption = 'Importa'#231#227'o de XML - CT-e'
      ImageIndex = 2
      object Gauge2: TGauge
        Left = 0
        Top = 455
        Width = 667
        Height = 20
        Align = alBottom
        Progress = 0
        ExplicitLeft = 3
        ExplicitTop = 452
        ExplicitWidth = 549
      end
      object Memo2: TMemo
        Left = 0
        Top = 368
        Width = 667
        Height = 87
        Align = alBottom
        Color = clInfoBk
        Lines.Strings = (
          'Avisos:'
          'NF Propria> TRIGGER_NF_SOMAR comentar a parte de recalcular'
          'Cadastrar cadastros Zerados'
          'Conferir IsFilial'
          
            'Desativar Gerar estoque: trigger atualiza NF, atualiza NF entrad' +
            'a, cancela NF e cancela NF Entrada')
        TabOrder = 0
      end
      object FileListBoxCTe: TFileListBox
        Left = 0
        Top = 73
        Width = 667
        Height = 295
        Align = alBottom
        ItemHeight = 13
        Mask = '*.xml'
        TabOrder = 1
      end
      object ButtonListarCTe: TButton
        Left = 3
        Top = 42
        Width = 110
        Height = 25
        Caption = 'Listar XML'
        TabOrder = 2
        OnClick = ButtonListarCTeClick
      end
      object ButtonImportatCTe: TButton
        Left = 119
        Top = 42
        Width = 110
        Height = 25
        Caption = 'Importar XML'
        TabOrder = 3
        OnClick = ButtonImportatCTeClick
      end
      object ButtonProcCTe: TButton
        Left = 235
        Top = 42
        Width = 110
        Height = 25
        Caption = '-proc'
        TabOrder = 4
        OnClick = ButtonProcCTeClick
      end
      object ButtonCancCTe: TButton
        Left = 351
        Top = 42
        Width = 110
        Height = 25
        Caption = '-can'
        TabOrder = 5
        OnClick = ButtonCancCTeClick
      end
      object ButtonInutCTe: TButton
        Left = 467
        Top = 42
        Width = 110
        Height = 25
        Caption = '-inu'
        TabOrder = 6
        OnClick = ButtonInutCTeClick
      end
      object LabeledEditFilialCTe: TLabeledEdit
        Left = 3
        Top = 15
        Width = 42
        Height = 21
        EditLabel.Width = 20
        EditLabel.Height = 13
        EditLabel.Caption = 'Filial'
        TabOrder = 7
        Text = '1'
      end
      object LabeledEditRemetenteInut: TLabeledEdit
        Left = 363
        Top = 15
        Width = 42
        Height = 21
        EditLabel.Width = 155
        EditLabel.Height = 13
        EditLabel.Caption = 'Remetente Padr'#227'o (Inutilizadas)'
        TabOrder = 8
        Text = '1000'
      end
      object LabeledEditNBSPadraoInut: TLabeledEdit
        Left = 163
        Top = 15
        Width = 66
        Height = 21
        EditLabel.Width = 121
        EditLabel.Height = 13
        EditLabel.Caption = 'NBS Padr'#227'o (Inutilizadas)'
        TabOrder = 9
        Text = '105011320'
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Separar XML'
      ImageIndex = 2
      object ListBoxSeparaArquivos: TListBox
        Left = 0
        Top = 110
        Width = 667
        Height = 324
        Align = alBottom
        ItemHeight = 13
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 0
        Top = 434
        Width = 667
        Height = 41
        Align = alBottom
        Caption = 'Iniciar'
        TabOrder = 1
        OnClick = Panel1Click
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 667
        Height = 110
        Align = alClient
        Caption = 'Preparar Arquivos'
        TabOrder = 2
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 663
          Height = 93
          Align = alClient
          TabOrder = 0
          object Label2: TLabel
            Left = 270
            Top = 27
            Width = 88
            Height = 13
            Caption = 'Numera'#231#227'o Inicial:'
          end
          object Label3: TLabel
            Left = 397
            Top = 27
            Width = 83
            Height = 13
            Caption = 'Numera'#231#227'o Final:'
          end
          object CheckBoxSepararProc: TCheckBox
            Left = 6
            Top = 27
            Width = 131
            Height = 17
            Caption = 'Separar os -proc.xml..:'
            TabOrder = 0
          end
          object CheckBoxSepararInu: TCheckBox
            Left = 6
            Top = 49
            Width = 131
            Height = 17
            Caption = 'Separar os -inu.xml....:'
            TabOrder = 1
          end
          object CheckBoxSepararCan: TCheckBox
            Left = 6
            Top = 72
            Width = 131
            Height = 17
            Caption = 'Separar os -can.xml...:'
            TabOrder = 2
          end
          object StaticText1: TStaticText
            Left = 1
            Top = 1
            Width = 661
            Height = 20
            Align = alTop
            AutoSize = False
            BevelKind = bkTile
            BevelOuter = bvRaised
            BorderStyle = sbsSingle
            Caption = 'Tipos de Arquivos - Extens'#227'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object EditProc: TEdit
            Left = 143
            Top = 22
            Width = 121
            Height = 21
            TabOrder = 4
            Text = '-proc.xml'
          end
          object EditInu: TEdit
            Left = 143
            Top = 46
            Width = 121
            Height = 21
            TabOrder = 5
            Text = '-procInutNFe.xml'
          end
          object EditCan: TEdit
            Left = 141
            Top = 68
            Width = 121
            Height = 21
            TabOrder = 6
            Text = '-procEventoNFe.xml'
          end
          object EditNumeracaoInicial: TEdit
            Left = 270
            Top = 43
            Width = 121
            Height = 21
            Hint = 'Quando informado 0 (zero) n'#227'o compara n'#250'mero do documento'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            Text = '0'
          end
          object EditNumeracaoFinal: TEdit
            Left = 397
            Top = 43
            Width = 121
            Height = 21
            Hint = 'Quando informado 0 (zero) n'#227'o compara n'#250'mero do documento'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            Text = '0'
          end
          object RGTipo: TRadioGroup
            Left = 528
            Top = 23
            Width = 105
            Height = 50
            Caption = 'Tipo'
            ItemIndex = 0
            Items.Strings = (
              'NF-e'
              'CT-e')
            TabOrder = 9
            OnClick = RGTipoClick
          end
        end
      end
    end
  end
  object XMLDocument: TXMLDocument
    Left = 608
    Top = 176
    DOMVendorDesc = 'MSXML'
  end
end
