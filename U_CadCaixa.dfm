inherited frmCaixa: TfrmCaixa
  Caption = 'Lan'#231'amentos no Caixa'
  ClientHeight = 511
  ClientWidth = 923
  OnShow = FormShow
  ExplicitWidth = 939
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 19
  inherited StatusBar1: TStatusBar
    Top = 492
    Width = 923
    ExplicitTop = 492
    ExplicitWidth = 923
  end
  inherited Panel1: TPanel
    Width = 923
    Height = 428
    ExplicitWidth = 923
    ExplicitHeight = 428
    inherited PageControl1: TPageControl
      Width = 896
      Height = 411
      ExplicitWidth = 896
      ExplicitHeight = 411
      inherited TSCadastro: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 30
        ExplicitWidth = 888
        ExplicitHeight = 377
        object Label2: TLabel
          Left = 13
          Top = 32
          Width = 75
          Height = 19
          Caption = 'Descri'#231#227'o:'
        end
        object Label4: TLabel
          Left = 13
          Top = 120
          Width = 42
          Height = 19
          Caption = 'Valor:'
        end
        object Label3: TLabel
          Left = 13
          Top = 77
          Width = 54
          Height = 19
          Caption = 'N'#186' Doc:'
        end
        object TxtDescricao: TEdit
          Left = 95
          Top = 24
          Width = 382
          Height = 27
          MaxLength = 200
          TabOrder = 0
        end
        object RGtipo_caixa: TRadioGroup
          Left = 3
          Top = 153
          Width = 196
          Height = 96
          Caption = 'Tipo:'
          ItemIndex = 0
          Items.Strings = (
            'Cr'#233'dito'
            'D'#233'bito')
          TabOrder = 3
          StyleElements = [seFont, seClient]
        end
        object TxtValor: TEdit
          Left = 95
          Top = 117
          Width = 170
          Height = 27
          TabOrder = 2
        end
        object txtDocumento: TEdit
          Left = 95
          Top = 69
          Width = 170
          Height = 27
          TabOrder = 1
        end
      end
      inherited TSPesquisa: TTabSheet
        ExplicitWidth = 888
        ExplicitHeight = 377
        inherited DBGTemplate: TDBGrid
          Top = 138
          Width = 888
          Columns = <
            item
              Expanded = False
              FieldName = 'idcaixa'
              Title.Caption = 'ID'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero_doc'
              Title.Caption = 'NUMERO DOC'
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'DESCRI'#199#195'O'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo'
              Title.Caption = 'TIPO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Title.Caption = 'VALOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_cadastro'
              Title.Caption = 'DATA DE CADASTRO'
              Visible = True
            end>
        end
        inherited CBEPesquisa: TComboBoxEx
          ItemsEx = <
            item
              Caption = 'Descri'#231#227'o'
            end
            item
              Caption = 'Numero de Documento'
            end
            item
              Caption = 'Tipo'
            end
            item
              Caption = 'Valor'
            end>
        end
      end
    end
  end
  inherited Panel2: TPanel
    Top = 428
    Width = 923
    Height = 64
    BevelInner = bvSpace
    BevelOuter = bvSpace
    ExplicitTop = 428
    ExplicitWidth = 923
    ExplicitHeight = 64
    inherited SpeedButton4: TSpeedButton
      Top = 21
      ExplicitTop = 21
    end
  end
  inherited DSTabela: TDataSource
    DataSet = DMConexao.CDSCaixa
    Left = 696
  end
end
