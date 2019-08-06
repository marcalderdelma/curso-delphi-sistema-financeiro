unit U_Funcoes;

interface

uses U_DMConexao, FireDAC.Comp.Client, Data.DB, Vcl.DBGrids, Vcl.Grids,
  Winapi.Windows, Vcl.StdCtrls;

function loginCadastrado(login : string) : Boolean;
//function getId(Campo, Tabela : string) : Integer;
procedure checkEmptyField(sender : string);
procedure CustomizarDBGrid(DataSource : TDataSource; sender : TDBGrid; State : TGridDrawState; Rect : TRect; Column : TColumn);

implementation

uses
  System.SysUtils, Vcl.Forms;

function loginCadastrado(login : string) : Boolean;
begin
  Result := false;
  with Tfdquery.Create(nil) do
    try
      Connection :=  DMConexao.FDConexao;
      SQL.Add('SELECT idusuario FROM usuario WHERE login=:login');
      Params[0].Value := login;
      Open;

      if not IsEmpty then
        Result := true

    finally
      Close;
      Free;
    end;

end;

procedure CustomizarDBGrid(DataSource : TDataSource; sender : TDBGrid; State : TGridDrawState; Rect : TRect; Column : TColumn);
begin
   if not Odd(DataSource.DataSet.RecNo) then
   begin
     if gdSelected in state then
      begin
        sender.Canvas.Brush.Color := $00ffefdf;
        sender.Canvas.FillRect(Rect);
        sender.DefaultDrawDataCell(Rect,Column.Field,State);
      end;
   end;

end;

{function getId(Campo, Tabela : string) : Integer;
begin
  with TFDQuery.Create(nil) do
  try
    Connection := DMConexao.FDConexao;
    SQL.Add('SELECT '+Campo+' FROM '+ Tabela+' ORDER BY '+Campo+' DESC LIMIT 1');
  finally

  end;

end; }

procedure checkEmptyField(sender : string);
begin
  if sender = '' then
  begin
    Application.MessageBox('Preencha os campos obligatórios','Advertência',0+48);
    Abort;

  end;
end;

end.
