unit U_Template;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  U_Funcoes;

type
  TfrmTemplate = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DSTabela: TDataSource;
    PageControl1: TPageControl;
    TSCadastro: TTabSheet;
    ILTemplate: TImageList;
    Panel2: TPanel;
    ALTemplate: TActionList;
    ActInserir: TAction;
    ActEditar: TAction;
    ActExcluir: TAction;
    ActSalvar: TAction;
    ActCancelar: TAction;
    ActImprimir: TAction;
    ActPesquisar: TAction;
    ActFechar: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    TSPesquisa: TTabSheet;
    Label1: TLabel;
    BtnFiltrar: TButton;
    DBGTemplate: TDBGrid;
    Label5: TLabel;
    CBEPesquisa: TComboBoxEx;
    PesqTxt: TMaskEdit;
    procedure ActInserirExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
    procedure ActCancelarExecute(Sender: TObject);
    procedure ActEditarExecute(Sender: TObject);
    procedure ActSalvarExecute(Sender: TObject);
    procedure ActPesquisarExecute(Sender: TObject);
    procedure ActFecharExecute(Sender: TObject);
    procedure ActImprimirExecute(Sender: TObject);
    procedure ActCancelarUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TSPesquisarShow(Sender: TObject);
    procedure ActInserirUpdate(Sender: TObject);
    procedure ActSalvarUpdate(Sender: TObject);
    procedure ActExcluirUpdate(Sender: TObject);
    procedure ActEditarUpdate(Sender: TObject);
    procedure DBGTemplateDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure CBEPesquisaChange(Sender: TObject);
  private
    { Private declarations }
    IMode : Integer;
    procedure limparCampos;
  public
    { Public declarations }
  end;

var
  frmTemplate: TfrmTemplate;

implementation

uses
  Datasnap.DBClient, U_DMConexao;

{$R *.dfm}

procedure TfrmTemplate.ActCancelarExecute(Sender: TObject);
begin
  limparCampos;
  //Cancelar uma Operação
  TClientDataSet(DSTabela.DataSet).Cancel;
end;

procedure TfrmTemplate.ActCancelarUpdate(Sender: TObject);
begin
  //Habilitar o botão cancelar se tiver dados a serem salvos
  ActCancelar.Enabled := ActSalvar.Enabled = true;

end;

procedure TfrmTemplate.ActEditarExecute(Sender: TObject);
begin
  IMode := 0;

  if PageControl1.ActivePage = TSPesquisa then
    TSCadastro.TabVisible := true;
    TSPesquisa.TabVisible := false;
    PageControl1.ActivePage := TSCadastro;

  TClientDataSet(DSTabela.DataSet).Edit;
end;

procedure TfrmTemplate.ActEditarUpdate(Sender: TObject);
begin
  if (DSTabela.State in [dsBrowse]) and (not TClientDataSet(DSTabela.DataSet).IsEmpty) then
    ActEditar.Enabled := DSTabela.State in [dsBrowse];
end;

procedure TfrmTemplate.ActExcluirExecute(Sender: TObject);
begin
   if Application.MessageBox('Deseja realmente excluir o registro?','Info',4+32) = 6 then
    begin

      try
        TClientDataSet(DSTabela.DataSet).Delete;
        TClientDataSet(DSTabela.DataSet).ApplyUpdates(-1);

        Application.MessageBox('Registro excluido com sucesso','Info',0+64);
        //TClientDataSet(DSTabela).Open;

        except on E : Exception do
          raise Exception.Create('Erro ao excluir o registro: '+E.Message);

      end;
    end;
end;

procedure TfrmTemplate.ActExcluirUpdate(Sender: TObject);
begin
  if (DSTabela.State in [dsBrowse]) and (not TClientDataSet(DSTabela.DataSet).IsEmpty) then
    ActExcluir.Enabled := DSTabela.State in [dsBrowse];

end;

procedure TfrmTemplate.ActFecharExecute(Sender: TObject);
begin
  //Handler para fechar
  Close;
end;

procedure TfrmTemplate.ActImprimirExecute(Sender: TObject);
begin
   //Imprimir
end;

procedure TfrmTemplate.ActInserirExecute(Sender: TObject);
begin
  // Inserir
  IMode := 1;

  if PageControl1.ActivePage = TSPesquisa then
    TSCadastro.TabVisible := true;
    TSPesquisa.TabVisible := false;
    PageControl1.ActivePage := TSCadastro;

  if not TClientDataSet(DSTabela.DataSet).Active then
  begin
    TClientDataSet(DSTabela.DataSet).Open;
  end;

    TClientDataSet(DSTabela.DataSet).Insert;
end;

procedure TfrmTemplate.ActInserirUpdate(Sender: TObject);
begin
  ActInserir.Enabled := DSTabela.State in [dsBrowse,dsInactive];
end;

procedure TfrmTemplate.ActPesquisarExecute(Sender: TObject);
begin
  //Fechar a conexão atual e abrir uma nova para pesquisar
  TSCadastro.TabVisible := false;
  TSPesquisa.TabVisible := true;

  PageControl1.ActivePage := TSPesquisa;

  TClientDataSet(DSTabela.DataSet).Close;
  TClientDataSet(DSTabela.DataSet).Open;

end;

procedure TfrmTemplate.ActSalvarExecute(Sender: TObject);
begin

  try
    TClientDataSet(DSTabela.DataSet).Post;
    TClientDataSet(DSTabela.DataSet).ApplyUpdates(0);

    case IMode of
      0:
        Application.MessageBox('Registro atualizado com sucesso!', 'Info',MB_OK+MB_ICONINFORMATION);
      1:
        Application.MessageBox('Registro inserido com sucesso!', 'Info',MB_OK+MB_ICONINFORMATION);
    end;

    if PageControl1.ActivePage = TSCadastro then
      TSCadastro.TabVisible := false;
      TSPesquisa.TabVisible := true;
      PageControl1.ActivePage := TSPesquisa;

      CBEPesquisa.ItemIndex := 0;
      PesqTxt.Text := '';

    //Limpar o formulário
    limparCampos;
    //TClientDataSet(DSTabela).Open;

    except on E : Exception do
      raise Exception.Create('Erro ao salvar o registro: '+E.Message);

  end;

end;

procedure TfrmTemplate.ActSalvarUpdate(Sender: TObject);
begin
  ActSalvar.Enabled := DSTabela.State in [dsInsert,dsEdit];
end;

procedure TfrmTemplate.BtnFiltrarClick(Sender: TObject);
begin
  if (PesqTxt.Text = '') or (CBEPesquisa.ItemIndex < 0) then
  begin
    Application.MessageBox('Informe o campo e/ou valor a ser filtrado!','Advertência',0+48);
    PesqTxt.SetFocus;

    Abort;
  end
end;

procedure TfrmTemplate.CBEPesquisaChange(Sender: TObject);
begin

  PesqTxt.Text := '';
  PesqTxt.SetFocus;
end;

procedure TfrmTemplate.DBGTemplateDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  CustomizarDBGrid(DSTabela,DBGTemplate,State,Rect,Column);
end;

procedure TfrmTemplate.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  TClientDataSet(DSTabela.DataSet).Cancel;
  TClientDataSet(DSTabela.DataSet).Close;
end;

procedure TfrmTemplate.limparCampos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[i] is TCustomEdit then
      TCustomEdit(Components[i]).Clear;

    if PageControl1.ActivePage = TSCadastro then
      TSCadastro.TabVisible := false;
      TSPesquisa.TabVisible := true;
      PageControl1.ActivePage := TSPesquisa;

      PesqTxt.SetFocus;
end;

procedure TfrmTemplate.TSPesquisarShow(Sender: TObject);
begin
  {
  TSCadastro.TabVisible := false;
  PageControl1.ActivePage := TSPesquisa;
  }
end;

end.
