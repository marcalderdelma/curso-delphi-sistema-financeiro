inherited frmContasReceber: TfrmContasReceber
  Caption = 'Cadastro de Contas a Receber'
  ClientHeight = 511
  ClientWidth = 964
  OnShow = FormShow
  ExplicitWidth = 980
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 19
  inherited StatusBar1: TStatusBar
    Top = 492
    Width = 964
    ExplicitTop = 492
    ExplicitWidth = 964
  end
  inherited Panel1: TPanel
    Width = 964
    Height = 416
    ExplicitTop = 24
    ExplicitWidth = 964
    ExplicitHeight = 416
    inherited PageControl1: TPageControl
      Width = 937
      Height = 399
      ActivePage = TSCadastro
      ExplicitWidth = 937
      ExplicitHeight = 399
      inherited TSCadastro: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 30
        ExplicitWidth = 929
        ExplicitHeight = 365
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 450
          Height = 365
          Align = alLeft
          TabOrder = 0
          object Label7: TLabel
            Left = 32
            Top = 32
            Width = 82
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = 'Documento'
            ParentShowHint = False
            ShowHint = True
          end
          object Label4: TLabel
            Left = 43
            Top = 77
            Width = 71
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = 'Descri'#231#227'o'
            ParentShowHint = False
            ShowHint = True
          end
          object Label6: TLabel
            Tag = 119
            Left = 27
            Top = 122
            Width = 87
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = 'Valor Venda'
            ParentShowHint = False
            ShowHint = True
          end
          object Label2: TLabel
            Tag = 119
            Left = 15
            Top = 167
            Width = 99
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = 'Qtde Parcelas'
            ParentShowHint = False
            ShowHint = True
          end
          object Label9: TLabel
            Left = 116
            Top = 32
            Width = 7
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = '*'
            Color = clRed
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label12: TLabel
            Left = 116
            Top = 75
            Width = 7
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = '*'
            Color = clRed
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label13: TLabel
            Left = 116
            Top = 118
            Width = 7
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = '*'
            Color = clRed
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label14: TLabel
            Left = 116
            Top = 167
            Width = 7
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = '*'
            Color = clRed
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label8: TLabel
            Left = 17
            Top = 209
            Width = 97
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = 'Valor Abatido'
            ParentShowHint = False
            ShowHint = True
          end
          object Label19: TLabel
            Left = 115
            Top = 206
            Width = 7
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = '*'
            Color = clRed
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object TxtQtdeparcelas: TEdit
            Tag = 119
            Left = 139
            Top = 164
            Width = 121
            Height = 27
            Hint = 'Campo Obligat'#243'rio'
            MaxLength = 2
            NumbersOnly = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object TxtVlrvenda: TEdit
            Tag = 119
            Left = 139
            Top = 119
            Width = 121
            Height = 27
            Hint = 'Campo Obligat'#243'rio'
            MaxLength = 11
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object TxtDescricao: TEdit
            Left = 139
            Top = 74
            Width = 273
            Height = 27
            Hint = 'Campo Obligat'#243'rio'
            BevelOuter = bvSpace
            MaxLength = 200
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object TxtDocumento: TEdit
            Left = 139
            Top = 29
            Width = 121
            Height = 27
            Hint = 'Campo Obligat'#243'rio'
            MaxLength = 9
            NumbersOnly = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object TxtVlrabatido: TEdit
            Left = 139
            Top = 197
            Width = 121
            Height = 27
            Hint = 'Campo Obligat'#243'rio'
            MaxLength = 11
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
        end
        object Panel4: TPanel
          Left = 450
          Top = 0
          Width = 479
          Height = 365
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Label3: TLabel
            Left = 25
            Top = 98
            Width = 83
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = 'Data Venda'
            ParentShowHint = False
            ShowHint = True
          end
          object Label18: TLabel
            Left = 113
            Top = 98
            Width = 7
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = '*'
            Color = clRed
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label15: TLabel
            Left = 45
            Top = 53
            Width = 48
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = 'Cliente'
            ParentShowHint = False
            ShowHint = True
          end
          object Label17: TLabel
            Left = 113
            Top = 50
            Width = 7
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = '*'
            Color = clRed
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label20: TLabel
            Left = 130
            Top = 22
            Width = 32
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = 'Cod.'
            ParentShowHint = False
            ShowHint = True
          end
          object Label21: TLabel
            Left = 256
            Top = 22
            Width = 42
            Height = 19
            Hint = 'Campo Obligat'#243'rio'
            Caption = 'Nome'
            ParentShowHint = False
            ShowHint = True
          end
          object DPdatavenda: TDatePicker
            Left = 130
            Top = 95
            Date = 43665.000000000000000000
            DateFormat = 'M/d/yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxYear = 2020
            TabOrder = 0
          end
          object TxtCodempresa: TEdit
            Left = 130
            Top = 50
            Width = 65
            Height = 27
            Hint = 'Campo Obligat'#243'rio'
            Color = cl3DLight
            Enabled = False
            MaxLength = 11
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnExit = TxtCodempresaExit
          end
          object Button1: TButton
            Left = 209
            Top = 50
            Width = 30
            Height = 27
            Caption = '...'
            TabOrder = 2
            OnClick = Button1Click
          end
          object TxtNomeempresa: TEdit
            Left = 256
            Top = 50
            Width = 209
            Height = 27
            Hint = 'Campo Obligat'#243'rio'
            Color = cl3DLight
            Enabled = False
            MaxLength = 11
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 3
          end
          object Button2: TButton
            Left = 25
            Top = 149
            Width = 128
            Height = 37
            Caption = 'Gerar Parcelas'
            TabOrder = 4
            OnClick = Button2Click
          end
          object DBGrid1: TDBGrid
            Left = 25
            Top = 206
            Width = 340
            Height = 120
            DataSource = DSParcela
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 5
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -16
            TitleFont.Name = 'Roboto'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'parcela'
                Title.Caption = 'Parcela'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vencimento'
                Title.Caption = 'Vencimento'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor'
                Title.Caption = 'Valor'
                Width = 100
                Visible = True
              end>
          end
        end
      end
      inherited TSPesquisa: TTabSheet
        ExplicitWidth = 929
        ExplicitHeight = 365
        inherited DBGTemplate: TDBGrid
          Top = 126
          Width = 929
          Columns = <
            item
              Expanded = False
              FieldName = 'idcontas_rec'
              Title.Caption = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero_doc'
              Title.Caption = 'DOC'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'DESCRI'#199#195'O'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qtd_parcela'
              Title.Caption = 'QTDE PARACELAS'
              Width = 144
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_parcela'
              Title.Caption = 'VALOR PARCELA'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_venda'
              Title.Caption = 'VALOR VENDA'
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_abatido'
              Title.Caption = 'VALOR ABATIDA'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_venda'
              Title.Caption = 'DATA VENDA'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_vencimento'
              Title.Caption = 'VENCIMENTO'
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_cadastro'
              Title.Caption = 'DATA CADASTRO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'STATUS'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'data_recebimento'
              Title.Caption = 'DATA RECEBIMENTO'
              Width = 160
              Visible = True
            end>
        end
        inherited CBEPesquisa: TComboBoxEx
          ItemsEx = <
            item
              Caption = 'Documento'
            end
            item
              Caption = 'Descri'#231#227'o'
            end
            item
              Caption = 'Data Venda'
            end>
        end
      end
    end
  end
  inherited Panel2: TPanel
    Top = 416
    Width = 964
    ExplicitTop = 416
    ExplicitWidth = 964
  end
  inherited DSTabela: TDataSource
    DataSet = DMConexao.CDSContasReceber
    Left = 336
    Top = 241
  end
  inherited ILTemplate: TImageList
    Left = 398
    Top = 251
  end
  inherited ALTemplate: TActionList
    Left = 398
    Top = 201
  end
  object DSCliente: TDataSource
    DataSet = DMConexao.CDSEmpresa
    Left = 336
    Top = 305
  end
  object CDSParcela: TClientDataSet
    PersistDataPacket.Data = {
      5F0000009619E0BD0100000018000000030000000000030000005F0007706172
      63656C6104000100000000000576616C6F720800040000000100075355425459
      50450200490006004D6F6E6579000A76656E63696D656E746F08000800000000
      000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 368
    object CDSParcelaparcela: TIntegerField
      FieldName = 'parcela'
    end
    object CDSParcelavalor: TCurrencyField
      FieldName = 'valor'
    end
    object CDSParcelavencimento: TDateTimeField
      FieldName = 'vencimento'
    end
  end
  object DSParcela: TDataSource
    DataSet = CDSParcela
    Left = 665
    Top = 361
  end
end
