unit U_cadEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_DMConexao, U_Template, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  U_Funcoes;

type
  TfrmEmpresa = class(TfrmTemplate)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TxtNome: TEdit;
    TxtTelefone: TMaskEdit;
    RGTipo: TRadioGroup;
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActEditarExecute(Sender: TObject);
    procedure ActInserirExecute(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure CBEPesquisaChange(Sender: TObject);
    procedure PesqTxtEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure filter;
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

uses
  System.Math;

{$R *.dfm}

procedure TfrmEmpresa.ActEditarExecute(Sender: TObject);
begin
  inherited;

  TxtNome.Text := DMConexao.CDSEmpresanome.AsString;
  TxtTelefone.Text := DMConexao.CDSEmpresatelefone.AsString;

    RGTipo.ItemIndex := ifthen(DMConexao.CDSEmpresatipo.Text = 'C',0,1);

end;

procedure TfrmEmpresa.ActInserirExecute(Sender: TObject);
begin
  inherited;

  TxtNome.SetFocus;
end;

procedure TfrmEmpresa.ActPesquisarExecute(Sender: TObject);
begin
  inherited;

  CBEPesquisa.ItemIndex := 0;
  PesqTxt.SetFocus;

  DMConexao.CDSEmpresa.Close;
  DMConexao.CDSEmpresa.CommandText := 'SELECT idempresa, nome, telefone, tipo FROM empresa';
  DMConexao.CDSEmpresa.Open;
end;

procedure TfrmEmpresa.ActSalvarExecute(Sender: TObject);
begin
  checkEmptyField(TxtNome.Text);
  checkEmptyField(TxtTelefone.Text);

  DMConexao.CDSEmpresanome.AsString := TxtNome.Text;
  DMConexao.CDSEmpresatelefone.AsString := TxtTelefone.Text;

  case RGTipo.ItemIndex of
    0: DMConexao.CDSEmpresatipo.AsString := 'C';
    1: DMConexao.CDSEmpresatipo.AsString := 'F';
  end;

  inherited;
end;

procedure TfrmEmpresa.BtnFiltrarClick(Sender: TObject);
begin
  inherited;

  filter;
  {DMConexao.CDSEmpresa.Close;

  case CBEPesquisa.ItemIndex of
    0: DMConexao.CDSEmpresa.CommandText := 'SELECT idempresa, nome, telefone, tipo FROM empresa WHERE nome LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%');
    1: DMConexao.CDSEmpresa.CommandText := 'SELECT idempresa, nome, telefone, tipo FROM empresa WHERE telefone LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%');
    2: DMConexao.CDSEmpresa.CommandText := 'SELECT idempresa, nome, telefone, tipo FROM empresa WHERE tipo LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%');
  end;

  DMConexao.CDSEmpresa.Open;  }
end;

procedure TfrmEmpresa.CBEPesquisaChange(Sender: TObject);
begin
  if CBEPesquisa.ItemIndex = 1 then
    PesqTxt.EditMask := '!\(99\)\ 9\ 9999-9999;0;_'
  else
    PesqTxt.EditMask := '';

  inherited;
end;

procedure TfrmEmpresa.PesqTxtEnter(Sender: TObject);
begin
  filter;
end;

procedure TfrmEmpresa.filter;
begin
  DMConexao.CDSEmpresa.Close;

  case CBEPesquisa.ItemIndex of
    0: DMConexao.CDSEmpresa.CommandText := 'SELECT idempresa, nome, telefone, tipo FROM empresa WHERE nome LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%');
    1: DMConexao.CDSEmpresa.CommandText := 'SELECT idempresa, nome, telefone, tipo FROM empresa WHERE telefone LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%');
    2: DMConexao.CDSEmpresa.CommandText := 'SELECT idempresa, nome, telefone, tipo FROM empresa WHERE tipo LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%');
  end;

  DMConexao.CDSEmpresa.Open;
end;

end.
