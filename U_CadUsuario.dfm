inherited frmUsuario: TfrmUsuario
  Caption = 'Cadastro de Usuario'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  inherited Panel1: TPanel
    inherited PageControl1: TPageControl
      ActivePage = TSCadastro
      inherited TSCadastro: TTabSheet
        object Label2: TLabel
          Left = 13
          Top = 104
          Width = 40
          Height = 19
          Caption = 'Login'
        end
        object Label3: TLabel
          Left = 13
          Top = 48
          Width = 46
          Height = 19
          Caption = 'Nome:'
        end
        object Label4: TLabel
          Left = 13
          Top = 159
          Width = 45
          Height = 19
          Caption = 'Senha'
        end
        object TxtNome: TEdit
          Left = 90
          Top = 45
          Width = 306
          Height = 27
          MaxLength = 50
          TabOrder = 0
        end
        object TxtLogin: TEdit
          Left = 90
          Top = 96
          Width = 183
          Height = 27
          MaxLength = 20
          TabOrder = 1
        end
        object TxtSenha: TEdit
          Left = 90
          Top = 151
          Width = 183
          Height = 27
          ParentCustomHint = False
          MaxLength = 20
          PasswordChar = '*'
          TabOrder = 2
        end
      end
      inherited TSPesquisa: TTabSheet
        inherited DBGTemplate: TDBGrid
          ReadOnly = True
          Columns = <
            item
              Expanded = False
              FieldName = 'idusuario'
              Title.Caption = 'ID'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'NOME'
              Width = 239
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'login'
              Title.Caption = 'LOGIN'
              Width = 207
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'senha'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'data_cadastro'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'STATUS'
              Width = 107
              Visible = True
            end>
        end
        inherited CBEPesquisa: TComboBoxEx
          ItemsEx = <
            item
              Caption = 'Nome'
            end
            item
              Caption = 'Login'
            end>
        end
      end
    end
  end
  inherited DSTabela: TDataSource
    DataSet = DMConexao.CDSUsuario
    Left = 672
    Top = 113
  end
  inherited ILTemplate: TImageList
    Left = 694
    Top = 59
  end
  inherited ALTemplate: TActionList
    Left = 646
    Top = 57
  end
end
