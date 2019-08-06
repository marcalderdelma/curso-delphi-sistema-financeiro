unit U_CadContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Template, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.WinXPickers,
  U_Funcoes, Vcl.Mask, Datasnap.DBClient, U_ListaClientes;

type
  TfrmContasReceber = class(TfrmTemplate)
    Panel3: TPanel;
    Panel4: TPanel;
    Label7: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    TxtQtdeparcelas: TEdit;
    TxtVlrvenda: TEdit;
    TxtDescricao: TEdit;
    TxtDocumento: TEdit;
    Label3: TLabel;
    Label18: TLabel;
    DPdatavenda: TDatePicker;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    TxtVlrabatido: TEdit;
    Label15: TLabel;
    Label17: TLabel;
    TxtCodempresa: TEdit;
    Button1: TButton;
    TxtNomeempresa: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Button2: TButton;
    DSCliente: TDataSource;
    CDSParcela: TClientDataSet;
    CDSParcelaparcela: TIntegerField;
    CDSParcelavalor: TCurrencyField;
    CDSParcelavencimento: TDateTimeField;
    DSParcela: TDataSource;
    DBGrid1: TDBGrid;
    procedure BtnFiltrarClick(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
    procedure ActEditarExecute(Sender: TObject);
    procedure ActSalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CBEPesquisaChange(Sender: TObject);
    procedure TxtCodempresaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasReceber: TfrmContasReceber;

implementation

{$R *.dfm}

uses U_DMConexao;

procedure TfrmContasReceber.ActEditarExecute(Sender: TObject);
begin
  inherited;
  TxtDocumento.Text := DMConexao.CDSContasRecebernumero_doc.AsString;
  TxtDescricao.Text := DMConexao.CDSContasReceberdescricao.AsString;
  TxtQtdeparcelas.Text := DMConexao.CDSContasReceberqtd_parcela.AsString;
  TxtVlrvenda.Text := DMConexao.CDSContasRecebervlr_venda.AsString;
  TxtVlrabatido.Text := DMConexao.CDSContasRecebervlr_abatido.AsString;
  DPdatavenda.Date := DMConexao.CDSContasReceberdata_venda.Value;
  TxtCodempresa.Text := DMConexao.CDSContasReceberid_empresa.AsString;
  TxtDocumento.SetFocus;
end;

procedure TfrmContasReceber.ActPesquisarExecute(Sender: TObject);
begin
  inherited;
  PesqTxt.SetFocus;
  CBEPesquisa.ItemIndex := 0;

  DMConexao.CDSContasReceber.Close;

  DMConexao.CDSContasReceber.CommandText := 'SELECT idcontas_rec,numero_doc,descricao,qtd_parcela,vlr_venda,vlr_abatido,data_venda,data_cadastro,status,data_recebimento, id_empresa FROM contas_receber';

  DMConexao.CDSContasReceber.Open;
end;

procedure TfrmContasReceber.ActSalvarExecute(Sender: TObject);
begin

  checkEmptyField(TxtDocumento.Text);
  checkEmptyField(TxtDescricao.Text);
  checkEmptyField(TxtVlrvenda.Text);
  checkEmptyField(TxtQtdeparcelas.Text);
  checkEmptyField(TxtVlrabatido.Text);
  //checkEmptyField(TxtDatapagamento);

  DMConexao.CDSContasRecebernumero_doc.AsString := TxtDocumento.Text;
  DMConexao.CDSContasReceberdescricao.AsString := TxtDescricao.Text;
  DMConexao.CDSContasReceberqtd_parcela.AsString := TxtQtdeparcelas.Text;
  //DMConexao.CDSContasRecebervlr_parcela.Value := StrtoFloat(TxtVlrvenda.Text) / strtofloat(TxtQtdeparcelas.text);
  DMConexao.CDSContasRecebervlr_venda.AsString := TxtVlrvenda.Text;
  DMConexao.CDSContasRecebervlr_abatido.AsString := TxtVlrabatido.Text;
  DMConexao.CDSContasReceberdata_venda.Value := DPdatavenda.Date;
  //DMConexao.CDSContasReceberdata_vencimento.Value := DPvencimento.Date;
  //DMConexao.CDSContasReceberdata_recebimento.Value := DPdatarecebimento.Date;
  DMConexao.CDSContasReceberdata_cadastro.Value := now;
  DMConexao.CDSContasReceberstatus.AsString := '0';
  DMConexao.CDSContasReceberid_empresa.AsString := TxtCodempresa.Text;

  inherited;

end;

procedure TfrmContasReceber.BtnFiltrarClick(Sender: TObject);
begin
  inherited;
  DMConexao.CDSContasReceber.Close;

  case CBEPesquisa.ItemIndex of

    0: DMConexao.CDSContasReceber.CommandText := 'SELECT idcontas_rec,numero_doc,descricao,qtd_parcela,vlr_venda,vlr_abatido,data_venda,data_cadastro,status,data_recebimento,id_empresa FROM contas_receber WHERE numero_doc LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%')+'ORDER BY numero_doc DESC';
    1: DMConexao.CDSContasReceber.CommandText := 'SELECT idcontas_rec,numero_doc,descricao,qtd_parcela,vlr_venda,vlr_abatido,data_venda,data_cadastro,status,data_recebimento,id_empresa FROM contas_receber WHERE descricao LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%')+'ORDER BY numero_doc DESC';
    2: DMConexao.CDSContasReceber.CommandText := 'SELECT idcontas_rec,numero_doc,descricao,qtd_parcela,vlr_venda,vlr_abatido,data_venda,data_cadastro,status,data_recebimento,id_empresa FROM contas_receber WHERE data_venda LIKE '+QuotedStr('%'+Trim(PesqTxt.Text)+'%')+'ORDER BY numero_doc DESC';
  end;

  DMConexao.CDSContasReceber.Open;
end;

procedure TfrmContasReceber.Button1Click(Sender: TObject);
begin
  DMConexao.CDSListaclientes.Active := true;
  DMConexao.CDSListaclientes.Close;
  DMConexao.CDSListaclientes.CommandText := '';
  DMConexao.CDSListaclientes.Open;

  DMConexao.CDSContcliente.Active := true;
  DMConexao.CDSContcliente.Close;
  DMConexao.CDSContcliente.CommandText := '';
  DMConexao.CDSContcliente.Open;

  frmListaclientes := TfrmListaclientes.Create(nil);
  try
      frmListaclientes.ShowModal;
  finally
    FreeAndNil(frmListaclientes);
  end;

end;

procedure TfrmContasReceber.Button2Click(Sender: TObject);
var
  variacao, i: Integer;
begin
  variacao := 20;
  CDSParcela.EmptyDataSet;
  for i := 1 to strtoint(TxtQtdeparcelas.Text) do
  begin
    CDSParcela.Insert;
    CDSParcelaparcela.AsInteger := i;
    CDSParcelavalor.AsFloat := StrToFloat(TxtVlrvenda.Text) / StrToInt(TxtQtdeparcelas.Text);
    CDSParcelavencimento.AsDateTime := DPdatavenda.Date + (variacao * i );
    CDSParcela.Post;

  end;

end;

procedure TfrmContasReceber.CBEPesquisaChange(Sender: TObject);
begin
  if (CBEPesquisa.ItemIndex = 2) or (CBEPesquisa.ItemIndex = 3) then
    PesqTxt.EditMask := '!99/99/9999;0;_';
  inherited;

end;

procedure TfrmContasReceber.FormShow(Sender: TObject);
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

procedure TfrmContasReceber.TxtCodempresaExit(Sender: TObject);
begin
  {inherited;

  //DMConexao.CDSEmpresa.Close;
  DMConexao.CDSEmpresa.CommandText := 'SELECT nome FROM empresa WHERE idempresa='+TxtCodempresa.Text;
  DMConexao.CDSEmpresa.Open;

  TxtNomeempresa.Text := DMConexao.CDSEmpresanome.AsString;
    }
end;

end.
