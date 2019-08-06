unit U_ListaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_DMConexao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;
  //, U_CadContasReceber;

type
  TfrmListaclientes = class(TForm)
    DSListaclientes: TDataSource;
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
  frmListaclientes: TfrmListaclientes;

implementation

{$R *.dfm}

uses U_CadContasReceber;

procedure TfrmListaclientes.DBGrid1CellClick(Column: TColumn);
begin
  frmContasReceber.TxtCodempresa.Text := inttostr(DMConexao.CDSListaclientesidempresa.AsInteger);
  frmContasReceber.TxtNomeempresa.Text := DMConexao.CDSListaclientesnome.AsString;
  close;
end;

procedure TfrmListaclientes.FormShow(Sender: TObject);
begin
  statusbar1.panels.items[0].text := 'Total de Empresas - Clientes: ' + inttostr(dmconexao.cdscontclientetotal.asinteger);
end;

end.
