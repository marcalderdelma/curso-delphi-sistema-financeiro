unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TfrmInicio = class(TForm)
    Label1: TLabel;
    img_usuario: TImage;
    img_receber: TImage;
    img_pagar: TImage;
    img_caixa: TImage;
    img_conreceber: TImage;
    img_conpagar: TImage;
    Label3: TLabel;
    img_config: TImage;
    img_navegar: TImage;
    Label2: TLabel;
    img_relreceber: TImage;
    img_relpagar: TImage;
    img_relcaixa: TImage;
    BalloonHint1: TBalloonHint;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Relatrios1: TMenuItem;
    Sisitema1: TMenuItem;
    Usurio1: TMenuItem;
    Empresa1: TMenuItem;
    Caixa1: TMenuItem;
    Contasapagar1: TMenuItem;
    Contasareceber1: TMenuItem;
    Contasareceber2: TMenuItem;
    Contasapagar2: TMenuItem;
    Caixa2: TMenuItem;
    Configurao1: TMenuItem;
    Navegador1: TMenuItem;
    ImageList1: TImageList;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img_usuarioClick(Sender: TObject);
    procedure img_receberClick(Sender: TObject);
    procedure img_pagarClick(Sender: TObject);
    procedure img_caixaClick(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure img_conreceberClick(Sender: TObject);
    procedure img_conpagarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure Contasapagar1Click(Sender: TObject);
    procedure Contasareceber1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicio: TfrmInicio;

implementation

{$R *.dfm}

uses U_CadContasReceber, U_CadContasPagar, U_CadCaixa,
  U_CadUsuario, U_Template, U_cadEmpresa, U_ListaFornecedores;

procedure TfrmInicio.Button1Click(Sender: TObject);
begin
frmListafornecedores := TfrmListafornecedores.Create(nil);
  try
      frmListafornecedores.ShowModal;
  finally
    FreeAndNil(frmListafornecedores);
  end;
end;

procedure TfrmInicio.Caixa1Click(Sender: TObject);
begin
  frmCaixa := TfrmCaixa.Create(nil);

  try
    frmCaixa.PageControl1.ActivePage := frmCaixa.TSCadastro;
    frmCaixa.TSPesquisa.TabVisible := false;

    frmCaixa.ShowModal;
  finally
    FreeAndNil(frmCaixa);
  end;
end;

procedure TfrmInicio.Contasapagar1Click(Sender: TObject);
begin
  frmContasPagar := TfrmContasPagar.Create(nil);
  try
    frmContasPagar.PageControl1.ActivePage := frmContasPagar.TSPesquisa;
    frmContasPagar.TSCadastro.TabVisible := false;

    frmContasPagar.ShowModal;
  finally
    FreeAndNil(frmContasPagar);
  end;
end;

procedure TfrmInicio.Contasareceber1Click(Sender: TObject);
begin
  frmContasReceber := TfrmContasReceber.Create(nil);
  try
    frmContasReceber.PageControl1.ActivePage := frmContasReceber.TSPesquisa;
    frmContasReceber.TSCadastro.TabVisible := false;

    frmContasReceber.ShowModal;
  finally
    FreeAndNil(frmContasReceber);
  end;
end;

procedure TfrmInicio.Empresa1Click(Sender: TObject);
begin
  frmempresa := Tfrmempresa.Create(nil);
  try
    frmempresa.PageControl1.ActivePage := frmempresa.TSCadastro;
    frmempresa.TSPesquisa.TabVisible := false;

    frmempresa.ShowModal;
  finally
    FreeAndNil(frmempresa);
  end;
end;

procedure TfrmInicio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja realmente sair?',
    'Info', MB_YESNO+MB_ICONQUESTION) = mrYes then
    Application.Terminate
  else
    Abort;
end;

procedure TfrmInicio.Image1Click(Sender: TObject);
begin
  frmempresa := Tfrmempresa.Create(nil);
  try
    frmEmpresa.PageControl1.ActivePage := frmempresa.TSCadastro;
    frmEmpresa.TSPesquisa.TabVisible := false;

    frmempresa.ShowModal;
  finally
    FreeAndNil(frmEmpresa);
  end;
end;

procedure TfrmInicio.img_caixaClick(Sender: TObject);
begin
  frmCaixa := TfrmCaixa.Create(nil);

  try
    frmCaixa.PageControl1.ActivePage := frmCaixa.TSCadastro;
    frmCaixa.TSPesquisa.TabVisible := false;

    frmCaixa.ShowModal;
  finally
    FreeAndNil(frmCaixa);
  end;

end;

procedure TfrmInicio.img_conpagarClick(Sender: TObject);
begin
  frmContasPagar := TfrmContasPagar.Create(nil);
  try
    frmContasPagar.PageControl1.ActivePage := frmContasPagar.TSPesquisa;
    frmContasPagar.TSCadastro.TabVisible := false;

    frmContasPagar.ShowModal;
  finally
    FreeAndNil(frmContasPagar);
  end;
end;

procedure TfrmInicio.img_conreceberClick(Sender: TObject);
begin
  frmContasReceber := TfrmContasReceber.Create(nil);
  try
    frmContasReceber.PageControl1.ActivePage := frmContasReceber.TSPesquisa;
    frmContasReceber.TSCadastro.TabVisible := false;

    frmContasReceber.ShowModal;
  finally
    FreeAndNil(frmContasReceber);
  end;
end;

procedure TfrmInicio.img_pagarClick(Sender: TObject);
begin
  frmContasPagar := TfrmContasPagar.Create(nil);
  try
    frmContasPagar.PageControl1.ActivePage := frmContasPagar.TSCadastro;
    frmContasPagar.TSPesquisa.TabVisible := false;

    frmContasPagar.ShowModal;
  finally
    FreeAndNil(frmContasPagar);
  end;

end;

procedure TfrmInicio.img_receberClick(Sender: TObject);
begin
  frmContasReceber := TfrmContasReceber.Create(nil);
  try
    frmContasReceber.PageControl1.ActivePage := frmContasReceber.TSCadastro;
    frmContasReceber.TSPesquisa.TabVisible := false;

    frmContasReceber.ShowModal;
  finally
    FreeAndNil(frmContasReceber);
  end;

end;

procedure TfrmInicio.img_usuarioClick(Sender: TObject);
begin
  frmUsuario := TfrmUsuario.Create(nil);
  try
    frmUsuario.PageControl1.ActivePage := frmUsuario.TSCadastro;
    frmUsuario.TSPesquisa.TabVisible := false;

    frmUsuario.ShowModal;
  finally
    FreeAndNil(frmUsuario);
  end;

end;

procedure TfrmInicio.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now)
end;

procedure TfrmInicio.Usurio1Click(Sender: TObject);
begin
  frmUsuario := TfrmUsuario.Create(nil);
  try
    frmUsuario.PageControl1.ActivePage := frmUsuario.TSCadastro;
    frmUsuario.TSPesquisa.TabVisible := false;

    frmUsuario.ShowModal;
  finally
    FreeAndNil(frmUsuario);
  end;
end;

end.
