program ContaBancaria;

uses
  Vcl.Forms,
  ContaBancaria.TelaPrincipal in 'src\ContaBancaria.TelaPrincipal.pas' {frmPrincipal},
  ContaBancaria.Conta in 'src\ContaBancaria.Conta.pas',
  ContaBancaria.Conta.Cadastro in 'src\ContaBancaria.Conta.Cadastro.pas' {frmContaCadastro},
  ContaBancaria.Conta.Deposito in 'src\ContaBancaria.Conta.Deposito.pas' {frmDeposito},
  ContaBancaria.Conta.Saque in 'src\ContaBancaria.Conta.Saque.pas' {frmSaque};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
