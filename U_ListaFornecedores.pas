unit U_ListaFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_DMConexao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;
  //, U_CadContasPagar;

type
  TfrmListafornecedores = class(TForm)
    DSListafornecedores: TDataSource;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListafornecedores: TfrmListafornecedores;

implementation

{$R *.dfm}

uses U_CadContasPagar;

procedure TfrmListafornecedores.DBGrid1CellClick(Column: TColumn);
begin
  frmcontaspagar.txtcodempresa.text := inttostr(dmconexao.cdslistafornecedoresidempresa.asinteger);
  frmcontaspagar.txtnomeempresa.text := dmconexao.cdslistafornecedoresnome.asstring;

  close;
end;

procedure TfrmListafornecedores.FormShow(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := 'Total de Empresas - Fornecedores: ' + inttostr(DMConexao.CDSContfornecedorestotal.AsInteger);
end;

end.
