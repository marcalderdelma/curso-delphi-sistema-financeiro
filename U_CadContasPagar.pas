unit U_CadContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Template, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.WinXPickers,
  Vcl.Mask, Datasnap.DBClient, U_ListaFornecedores;

type
  TfrmContasPagar = class(TfrmTemplate)
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    TxtDocumento: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TxtDescricao: TEdit;
    TxtVlrcompra: TEdit;
    TxtQtdeparcelas: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    BalloonHint: TBalloonHint;
    DPdatacompra: TDatePicker;
    Label8: TLabel;
    Label19: TLabel;
    TxtVlrabatido: TEdit;
    Label9: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    TxtCodempresa: TEdit;
    Button1: TButton;
    TxtNomeempresa: TEdit;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DSParcela: TDataSource;
    CDSParcela: TClientDataSet;
    CDSParcelaparcela: TIntegerField;
    CDSParcelavalor: TCurrencyField;
    CDSParcelavencimento: TDateTimeField;
    DSFornecedor: TDataSource;
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActInserirExecute(Sender: TObject);
    procedure ActEditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure CBEPesquisaChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

{$R *.dfm}

uses U_DMConexao, U_Funcoes;

procedure TfrmContasPagar.ActEditarExecute(Sender: TObject);
begin
  inherited;

  TxtDocumento.Text := DMConexao.CDSContasPagarnumero_doc.AsString;
  TxtDescricao.Text := DMConexao.CDSContasPagardescricao.AsString;
  TxtQtdeparcelas.Text := DMConexao.CDSContasPagarqtd_parcela.AsString;
  TxtVlrcompra.Text := DMConexao.CDSContasPagarvlr_compra.AsString;
  TxtVlrabatido.Text := DMConexao.CDSContasPagarvlr_abatido.AsString;
  DPdatacompra.Date := DMConexao.CDSContasPagardata_compra.Value;
  TxtCodempresa.Text := DMConexao.CDSContasPagarid_empresa.AsString;
  //DPdatapagamento.Date := DMConexao.CDSContasPagardata_pagamento.Value;
  //DPvencimento.Date := DMConexao.CDSContasPagardata_vencimento.Value;

  TxtDocumento.SetFocus;
end;

procedure TfrmContasPagar.ActInserirExecute(Sender: TObject);
begin
  inherited;
  TxtDocumento.SetFocus;
end;

procedure TfrmContasPagar.ActPesquisarExecute(Sender: TObject);
begin
  inherited;
  PesqTxt.SetFocus;
  CBEPesquisa.ItemIndex := 0;

  DMConexao.CDSContasPagar.Close;

  DMConexao.CDSContasPagar.CommandText := 'SELECT idcontas_pag,numero_doc,descricao,qtd_parcela,vlr_compra,vlr_abatido,data_compra,data_cadastro,status,data_pagamento,id_empresa FROM contas_pagar';

  DMConexao.CDSContasPagar.Open;
end;

procedure TfrmContasPagar.ActSalvarExecute(Sender: TObject);
begin
  checkEmptyField(TxtDocumento.Text);
  checkEmptyField(TxtDescricao.Text);
  checkEmptyField(TxtVlrcompra.Text);
  checkEmptyField(TxtQtdeparcelas.Text);
  checkEmptyField(TxtVlrabatido.Text);
  //checkEmptyField(TxtDatapagamento);

  DMConexao.CDSContasPagarnumero_doc.AsString := TxtDocumento.Text;
  DMConexao.CDSContasPagardescricao.AsString := TxtDescricao.Text;
  DMConexao.CDSContasPagarqtd_parcela.AsString := TxtQtdeparcelas.Text;
  //DMConexao.CDSContasPagarvlr_parcela.value := StrtoFloat(TxtVlrcompra.Text) / strtofloat(TxtQtdeparcelas.text);;
  DMConexao.CDSContasPagarvlr_compra.AsString := TxtVlrcompra.Text;
  DMConexao.CDSContasPagarvlr_abatido.AsString := TxtVlrabatido.Text;
  DMConexao.CDSContasPagardata_compra.Value := DPdatacompra.Date;
  //DMConexao.CDSContasPagardata_vencimento.Value := DPvencimento.Date;
  //DMConexao.CDSContasPagardata_pagamento.Value := DPdatapagamento.Date;
  DMConexao.CDSContasPagardata_cadastro.Value := now;
  DMConexao.CDSContasPagarstatus.AsString := '0';
  DMConexao.CDSContasPagarid_empresa.Value := StrToInt(TxtCodempresa.Text);

  inherited;
end;

procedure TfrmContasPagar.BtnFiltrarClick(Sender: TObject);
begin
  inherited;

  DSTabela.DataSet.Close;

  case CBEPesquisa.ItemIndex of

    0: DMConexao.CDSContasPagar.CommandText := 'SELECT idcontas_pag,numero_doc,descricao,qtd_parcela,vlr_compra,vlr_abatido,data_compra,data_cadastro,status,data_pagamento,id_empresa FROM contas_pagar WHERE numero_doc LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%')+'ORDER BY numero_doc DESC';
    1: DMConexao.CDSContasPagar.CommandText := 'SELECT idcontas_pag,numero_doc,descricao,qtd_parcela,vlr_compra,vlr_abatido,data_compra,data_cadastro,status,data_pagamento,id_empresa FROM contas_pagar WHERE descricao LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%')+'ORDER BY numero_doc DESC';
    2: DMConexao.CDSContasPagar.CommandText := 'SELECT idcontas_pag,numero_doc,descricao,qtd_parcela,vlr_compra,vlr_abatido,data_compra,data_cadastro,status,data_pagamento,id_empresa FROM contas_pagar WHERE data_compra LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%')+'ORDER BY numero_doc DESC';
  end;

  DSTabela.DataSet.Open;
end;

procedure TfrmContasPagar.Button1Click(Sender: TObject);
begin
  DMConexao.CDSListafornecedores.Active := true;
  DMConexao.CDSListafornecedores.Close;
  DMConexao.CDSListafornecedores.CommandText := '';
  DMConexao.CDSListafornecedores.Open;

  DMConexao.CDSContfornecedores.Active := true;
  DMConexao.CDSContfornecedores.Close;
  DMConexao.CDSContfornecedores.CommandText := '';
  DMConexao.CDSContfornecedores.Open;

  frmListafornecedores := TfrmListafornecedores.Create(nil);
  try
      frmListafornecedores.ShowModal;
  finally
    FreeAndNil(frmListafornecedores);
  end;

end;

procedure TfrmContasPagar.Button2Click(Sender: TObject);
var
  variacao, i : Integer;
begin
  variacao := 20;
  CDSParcela.EmptyDataSet;
  for i := 1 to strtoint(TxtQtdeparcelas.Text) do
  begin
    CDSParcela.Insert;
    CDSParcelaparcela.AsInteger := i;
    CDSParcelavalor.AsFloat := StrToFloat(TxtVlrcompra.Text) / StrToInt(TxtQtdeparcelas.Text);
    CDSParcelavencimento.AsDateTime := DPdatacompra.Date + (variacao * i );
    CDSParcela.Post;

  end;

end;

procedure TfrmContasPagar.CBEPesquisaChange(Sender: TObject);
begin
  inherited;

  if (CBEPesquisa.ItemIndex = 2) or (CBEPesquisa.ItemIndex = 3) or (CBEPesquisa.ItemIndex = 4) then
    PesqTxt.EditMask := '!00/00/0000;0;_'
  else
    PesqTxt.EditMask := ''

end;

procedure TfrmContasPagar.FormShow(Sender: TObject);
begin
  inherited;

  if PageControl1.ActivePage = TSCadastro then
    TxtDocumento.SetFocus
  else
  begin
     PesqTxt.SetFocus;
     CBEPesquisa.ItemIndex := 0;
  end;
end;

end.
