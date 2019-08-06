unit U_CadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Template, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  U_Funcoes;

type
  TfrmUsuario = class(TfrmTemplate)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TxtNome: TEdit;
    TxtLogin: TEdit;
    TxtSenha: TEdit;
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActEditarExecute(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure ActInserirExecute(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.dfm}

uses U_DMConexao;

procedure TfrmUsuario.ActEditarExecute(Sender: TObject);
begin
  inherited;

  TxtNome.Text := DMConexao.CDSUsuarionome.AsString;
  TxtLogin.Text := DMConexao.CDSUsuariologin.AsString;
  TxtSenha.Text := DMConexao.CDSUsuariosenha.AsString;
end;

procedure TfrmUsuario.ActInserirExecute(Sender: TObject);
begin
  inherited;
  TxtNome.SetFocus;
end;

procedure TfrmUsuario.ActPesquisarExecute(Sender: TObject);
begin
  inherited;
  PesqTxt.SetFocus;
  CBEPesquisa.ItemIndex := 0;

  DMConexao.CDSUsuario.Close;

  DMConexao.CDSUsuario.CommandText := 'SELECT * FROM usuario';

  DMConexao.CDSUsuario.Open;
end;

procedure TfrmUsuario.ActSalvarExecute(Sender: TObject);
begin

  if Trim(TxtNome.Text) = '' then
  begin
     Application.MessageBox('O campo "Nome" é obligatório','Advertência',0+48);
     TxtNome.SetFocus;
     Abort;
  end;

  if Trim(TxtLogin.Text) = '' then
  begin
     Application.MessageBox('O campo "Login" é obligatório','Advertência',0+48);
     TxtLogin.SetFocus;
     Abort;
  end;

  if Trim(TxtSenha.Text) = '' then
  begin
     Application.MessageBox('O campo "Senha" é obligatório','Advertência',0+48);
     TxtSenha.SetFocus;
     Abort;
  end;

  if (DSTabela.State in [dsInsert]) and loginCadastrado(Trim(TxtLogin.Text)) then
  begin
    Application.MessageBox('Login já cadastrado!','Advertência',0+48);
    TxtLogin.SetFocus;
  end

  else if DSTabela.State in [dsInsert] then
  begin
    DMConexao.CDSUsuarionome.AsString := Trim(TxtNome.Text);
    DMConexao.CDSUsuariologin.AsString := Trim(TxtLogin.Text);
    DMConexao.CDSUsuariosenha.AsString := Trim(TxtSenha.Text);
    DMConexao.CDSUsuariodata_cadastro.Value := now;
    DMConexao.CDSUsuariostatus.Value := '1';
  end

  else if DSTabela.State in [dsEdit] then
  begin
    DMConexao.CDSUsuarionome.AsString := Trim(TxtNome.Text);
    DMConexao.CDSUsuariologin.AsString := Trim(TxtLogin.Text);
    DMConexao.CDSUsuariosenha.AsString := Trim(TxtSenha.Text);
  end;
    inherited;

end;

procedure TfrmUsuario.BtnFiltrarClick(Sender: TObject);
begin
  inherited;

  DMConexao.CDSUsuario.Close;

  case CBEPesquisa.ItemIndex of
    0: DMConexao.CDSUsuario.CommandText := 'SELECT * FROM USUARIO WHERE NOME LIKE '+QuotedStr('%'+PesqTxt.Text+'%');
    1: DMConexao.CDSUsuario.CommandText := 'SELECT * FROM USUARIO WHERE LOGIN LIKE '+QuotedStr('%'+PesqTxt.Text+'%');
  end;

  DMConexao.CDSUsuario.Open;
end;

procedure TfrmUsuario.FormShow(Sender: TObject);
begin
  inherited;

  if PageControl1.ActivePage = TSCadastro then
    TxtNome.SetFocus
  else
    PesqTxt.SetFocus;
end;

end.
