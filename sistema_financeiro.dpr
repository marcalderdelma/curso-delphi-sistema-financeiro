program sistema_financeiro;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  U_Template in 'U_Template.pas' {frmTemplate},
  U_CadCaixa in 'U_CadCaixa.pas' {frmCaixa},
  U_Funcoes in 'classes\U_Funcoes.pas',
  U_DMConexao in 'datamodule\U_DMConexao.pas' {DMConexao: TDataModule},
  U_CadContasPagar in 'U_CadContasPagar.pas' {frmContasPagar},
  U_CadContasReceber in 'U_CadContasReceber.pas' {frmContasReceber},
  U_cadEmpresa in 'U_cadEmpresa.pas' {frmEmpresa},
  U_CadUsuario in 'U_CadUsuario.pas' {frmUsuario},
  U_ListaClientes in 'U_ListaClientes.pas' {frmListaclientes},
  U_Principal in 'U_Principal.pas' {frmInicio},
  U_ListaFornecedores in 'U_ListaFornecedores.pas' {frmListafornecedores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmInicio, frmInicio);
  Application.CreateForm(TDMConexao, DMConexao);
  TStyleManager.TrySetStyle('Cyan Night');
  Application.Run;
end.
