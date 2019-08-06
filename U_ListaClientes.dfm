object frmListaclientes: TfrmListaclientes
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Lista de Clientes'
  ClientHeight = 302
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 283
    Width = 536
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 283
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 56
      Width = 534
      Height = 226
      Align = alBottom
      DataSource = DSListaclientes
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'idempresa'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefone'
          Title.Caption = 'Telefone'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo'
          Title.Caption = 'Tipo'
          Width = 60
          Visible = True
        end>
    end
  end
  object DSListaclientes: TDataSource
    DataSet = DMConexao.CDSListaclientes
    Left = 320
    Top = 192
  end
end
