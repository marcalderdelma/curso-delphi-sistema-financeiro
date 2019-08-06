unit U_DMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Datasnap.DBClient;

type
  TDMConexao = class(TDataModule)
    FDConexao: TFDConnection;
    CDSUsuario: TClientDataSet;
    DSPUsuario: TDataSetProvider;
    CDSCaixa: TClientDataSet;
    CDSContasReceber: TClientDataSet;
    CDSContasPagar: TClientDataSet;
    DSPCaixa: TDataSetProvider;
    DSPContasReceber: TDataSetProvider;
    DSPContasPagar: TDataSetProvider;
    CDSUsuarioidusuario: TIntegerField;
    CDSUsuarionome: TStringField;
    CDSUsuariologin: TStringField;
    CDSUsuariosenha: TStringField;
    CDSUsuariodata_cadastro: TDateField;
    CDSUsuariostatus: TStringField;
    CDSCaixaidcaixa: TIntegerField;
    CDSCaixanumero_doc: TStringField;
    CDSCaixadescricao: TStringField;
    CDSCaixatipo: TStringField;
    CDSCaixavalor: TFloatField;
    CDSCaixadata_cadastro: TDateField;
    FDQUsuario: TFDQuery;
    FDQCaixa: TFDQuery;
    FDQContasReceber: TFDQuery;
    FDQContasPagar: TFDQuery;
    FDQCaixaidcaixa: TFDAutoIncField;
    FDQCaixanumero_doc: TStringField;
    FDQCaixadescricao: TStringField;
    FDQCaixatipo: TStringField;
    FDQCaixavalor: TFloatField;
    FDQCaixadata_cadastro: TDateField;
    FDQEmpresa: TFDQuery;
    DSPEmpresa: TDataSetProvider;
    CDSEmpresa: TClientDataSet;
    FDQListaclientes: TFDQuery;
    FDQContcliente: TFDQuery;
    DSPContcliente: TDataSetProvider;
    CDSContcliente: TClientDataSet;
    FDQContclientetotal: TLargeintField;
    DSPListaclientes: TDataSetProvider;
    CDSContclientetotal: TLargeintField;
    CDSListaclientes: TClientDataSet;
    FDQListaclientesidempresa: TFDAutoIncField;
    FDQListaclientesnome: TStringField;
    FDQListaclientestelefone: TStringField;
    FDQListaclientestipo: TStringField;
    CDSListaclientesidempresa: TAutoIncField;
    CDSListaclientesnome: TStringField;
    CDSListaclientestelefone: TStringField;
    CDSListaclientestipo: TStringField;
    FDQContasReceberidcontas_rec: TFDAutoIncField;
    FDQContasRecebernumero_doc: TStringField;
    FDQContasReceberdescricao: TStringField;
    FDQContasReceberqtd_parcela: TIntegerField;
    FDQContasRecebervlr_venda: TFloatField;
    FDQContasRecebervlr_abatido: TFloatField;
    FDQContasReceberdata_venda: TDateField;
    FDQContasReceberdata_cadastro: TDateField;
    FDQContasReceberstatus: TStringField;
    FDQContasReceberdata_recebimento: TDateField;
    FDQContasReceberid_empresa: TIntegerField;
    CDSContasReceberidcontas_rec: TAutoIncField;
    CDSContasRecebernumero_doc: TStringField;
    CDSContasReceberdescricao: TStringField;
    CDSContasReceberqtd_parcela: TIntegerField;
    CDSContasRecebervlr_venda: TFloatField;
    CDSContasRecebervlr_abatido: TFloatField;
    CDSContasReceberdata_venda: TDateField;
    CDSContasReceberdata_cadastro: TDateField;
    CDSContasReceberstatus: TStringField;
    CDSContasReceberdata_recebimento: TDateField;
    CDSContasReceberid_empresa: TIntegerField;
    FDQEmpresaidempresa: TFDAutoIncField;
    FDQEmpresanome: TStringField;
    FDQEmpresatelefone: TStringField;
    FDQEmpresatipo: TStringField;
    CDSEmpresaidempresa: TAutoIncField;
    CDSEmpresanome: TStringField;
    CDSEmpresatelefone: TStringField;
    CDSEmpresatipo: TStringField;
    FDQListafornecedores: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DSPListafornecodores: TDataSetProvider;
    CDSListafornecedores: TClientDataSet;
    FDQContasPagaridcontas_pag: TFDAutoIncField;
    FDQContasPagarnumero_doc: TStringField;
    FDQContasPagardescricao: TStringField;
    FDQContasPagarqtd_parcela: TIntegerField;
    FDQContasPagarvlr_compra: TFloatField;
    FDQContasPagarvlr_abatido: TFloatField;
    FDQContasPagardata_compra: TDateField;
    FDQContasPagardata_cadastro: TDateField;
    FDQContasPagarstatus: TStringField;
    FDQContasPagardata_pagamento: TDateField;
    FDQContasPagarid_empresa: TIntegerField;
    CDSContasPagaridcontas_pag: TAutoIncField;
    CDSContasPagarnumero_doc: TStringField;
    CDSContasPagardescricao: TStringField;
    CDSContasPagarqtd_parcela: TIntegerField;
    CDSContasPagarvlr_compra: TFloatField;
    CDSContasPagarvlr_abatido: TFloatField;
    CDSContasPagardata_compra: TDateField;
    CDSContasPagardata_cadastro: TDateField;
    CDSContasPagarstatus: TStringField;
    CDSContasPagardata_pagamento: TDateField;
    CDSContasPagarid_empresa: TIntegerField;
    FDQContfornecedores: TFDQuery;
    DSPContfornecedores: TDataSetProvider;
    CDSContfornecedores: TClientDataSet;
    FDQContfornecedorestotal: TLargeintField;
    CDSContfornecedorestotal: TLargeintField;
    CDSListafornecedoresidempresa: TAutoIncField;
    CDSListafornecedoresnome: TStringField;
    CDSListafornecedorestelefone: TStringField;
    CDSListafornecedorestipo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
