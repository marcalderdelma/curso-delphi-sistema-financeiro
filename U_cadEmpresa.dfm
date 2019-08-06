inherited frmEmpresa: TfrmEmpresa
  Caption = 'Cadastro de Empresa'
  PixelsPerInch = 96
  TextHeight = 19
  inherited Panel1: TPanel
    inherited PageControl1: TPageControl
      inherited TSCadastro: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 30
        ExplicitWidth = 933
        ExplicitHeight = 359
        object Label2: TLabel
          Left = 13
          Top = 40
          Width = 46
          Height = 19
          Caption = 'Nome:'
        end
        object Label3: TLabel
          Left = 13
          Top = 96
          Width = 65
          Height = 19
          Caption = 'Telefone:'
        end
        object Label4: TLabel
          Left = 13
          Top = 154
          Width = 36
          Height = 19
          Caption = 'Tipo:'
        end
        object TxtNome: TEdit
          Left = 100
          Top = 32
          Width = 225
          Height = 27
          MaxLength = 50
          TabOrder = 0
        end
        object TxtTelefone: TMaskEdit
          Left = 100
          Top = 88
          Width = 131
          Height = 27
          EditMask = '!\(99\)\ 9\ 0000-0000;0;_'
          MaxLength = 16
          TabOrder = 1
          Text = ''
        end
        object RGTipo: TRadioGroup
          Left = 100
          Top = 134
          Width = 263
          Height = 39
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Cliente'
            'Fornecedor')
          TabOrder = 2
        end
      end
      inherited TSPesquisa: TTabSheet
        inherited DBGTemplate: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'idempresa'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'NOME/RAZ'#195'O SOCIAL'
              Width = 450
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'telefone'
              Title.Caption = 'TELEFONE'
              Width = 175
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo'
              Title.Caption = 'TIPO'
              Width = 90
              Visible = True
            end>
        end
        inherited CBEPesquisa: TComboBoxEx
          ItemsEx = <
            item
              Caption = 'Nome'
            end
            item
              Caption = 'Telefone'
            end
            item
              Caption = 'Tipo'
            end>
        end
        inherited PesqTxt: TMaskEdit
          OnEnter = PesqTxtEnter
        end
      end
    end
  end
  inherited DSTabela: TDataSource
    DataSet = DMConexao.CDSEmpresa
    Left = 656
    Top = 281
  end
end
