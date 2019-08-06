unit U_CadCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Math, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Template, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, U_Funcoes, Vcl.Mask;

type
  TfrmCaixa = class(TfrmTemplate)
    Label2: TLabel;
    Label4: TLabel;
    TxtDescricao: TEdit;
    RGtipo_caixa: TRadioGroup;
    TxtValor: TEdit;
    Label3: TLabel;
    txtDocumento: TEdit;
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActEditarExecute(Sender: TObject);
    procedure ActInserirExecute(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaixa: TfrmCaixa;

implementation

{$R *.dfm}

uses U_DMConexao;

procedure TfrmCaixa.ActEditarExecute(Sender: TObject);
begin
  inherited;

  TxtDescricao.Text := DMConexao.CDSCaixadescricao.AsString;
  txtDocumento.Text := DMConexao.CDSCaixanumero_doc.AsString;
  TxtValor.Text := DMConexao.CDSCaixavalor.AsString;
  RGtipo_caixa.ItemIndex := ifthen(DMConexao.CDSCaixatipo.AsString ='C',0,1);


end;

procedure TfrmCaixa.ActInserirExecute(Sender: TObject);
begin
  inherited;
  TxtDescricao.SetFocus;
end;

procedure TfrmCaixa.ActPesquisarExecute(Sender: TObject);
begin
  inherited;
  PesqTxt.SetFocus;
  CBEPesquisa.ItemIndex := 0;

  DMConexao.CDSCaixa.Close;

  DMConexao.CDSCaixa.CommandText := 'SELECT * FROM caixa';

  DMConexao.CDSCaixa.Open;
end;

procedure TfrmCaixa.ActSalvarExecute(Sender: TObject);

  //idCaixa : Integer;
begin

  checkEmptyField(TxtDescricao.Text);
  checkEmptyField(txtDocumento.Text);
  checkEmptyField(TxtValor.Text);

  {if Trim(TxtDescricao.Text) = '' then
  begin
     Application.MessageBox('O campo "Descrição" é obligatório','Advertência',0+48);
     TxtDescricao.SetFocus;
     Abort;
  end;

  if Trim(txtDocumento.Text) = '' then
  begin
     Application.MessageBox('O campo "Nº Doc" é obligatório','Advertência',0+48);
     txtDocumento.SetFocus;
     Abort;
  end;

  if StrToFloat(TxtValor.Text) <= 0 then
  begin
     Application.MessageBox('O campo "Valor" tem que ser maior que zero!','Advertência',0+48);
     TxtValor.SetFocus;
     Abort;
  end;}

  DMConexao.CDSCaixadescricao.AsString := Trim(TxtDescricao.Text);
  DMConexao.CDSCaixanumero_doc.AsString := Trim(txtDocumento.Text);
  DMConexao.CDSCaixavalor.AsString := Trim(TxtValor.Text);
  DMConexao.CDSCaixadata_cadastro.Value := now;
  if RGtipo_caixa.ItemIndex = 0 then
    DMConexao.CDSCaixatipo.AsString := 'C'
  else
    DMConexao.CDSCaixatipo.AsString := 'D';

  inherited;

end;

procedure TfrmCaixa.BtnFiltrarClick(Sender: TObject);
begin
  inherited;

  DMConexao.CDSCaixa.Close;

  case CBEPesquisa.ItemIndex of
    0: DMConexao.CDSCaixa.CommandText := 'SELECT idcaixa,numero_doc,descricao,tipo,valor,data_cadastro FROM caixa WHERE descricao LIKE'+QuotedStr('%'+PesqTxt.Text+'%')+' ORDER BY idcaixa DESC';
    1: DMConexao.CDSCaixa.CommandText := 'SELECT idcaixa,numero_doc,descricao,tipo,valor,data_cadastro FROM caixa WHERE numero_doc LIKE'+QuotedStr('%'+PesqTxt.Text+'%')+' ORDER BY idcaixa DESC';
    2: DMConexao.CDSCaixa.CommandText := 'SELECT idcaixa,numero_doc,descricao,tipo,valor,data_cadastro FROM caixa WHERE tipo LIKE'+QuotedStr('%'+PesqTxt.Text+'%')+' ORDER BY idcaixa DESC';
    3: DMConexao.CDSCaixa.CommandText := 'SELECT idcaixa,numero_doc,descricao,tipo,valor,data_cadastro FROM caixa WHERE valor LIKE'+QuotedStr('%'+PesqTxt.Text+'%')+' ORDER BY idcaixa DESC';
  end;

  DMConexao.CDSCaixa.Open;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
  inherited;

  //TxtDescricao.SetFocus;
  //CBEPesquisa.ItemIndex := 0;
end;

end.
