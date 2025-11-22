unit ContaBancaria.TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, System.Generics.Collections, ContaBancaria.Conta,
  ContaBancaria.Conta.Cadastro, Vcl.NumberBox, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlOpcoes: TPanel;
    sbtnCriarConta: TSpeedButton;
    sbtnDepositar: TSpeedButton;
    sbtnSacar: TSpeedButton;
    sbtnExibirSaldo: TSpeedButton;
    pnlInformacoes: TPanel;
    grpInformacoesConta: TGroupBox;
    lblNomeTitular: TLabel;
    lblHistorico: TLabel;
    lblNumeroConta: TLabel;
    lblSaldo: TLabel;
    edtNomeTitular: TEdit;
    edtNumeroConta: TEdit;
    btnAcessar: TButton;
    grpAcesso: TGroupBox;
    nbSaldo: TNumberBox;
    cmbNumeroContaAcesso: TComboBox;
    memHistorico: TRichEdit;
    procedure btnAcessarClick(Sender: TObject);
    procedure sbtnCriarContaClick(Sender: TObject);
    procedure sbtnDepositarClick(Sender: TObject);
    procedure sbtnSacarClick(Sender: TObject);
    procedure sbtnExibirSaldoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FListaContas: TObjectList<TConta>;
    FConta: TConta;

    procedure HabilitarBotoes;
    procedure AcessarConta;
    procedure AtualizarInformacoesDosCampos;
    procedure AdicionarLog(const pMensagem: string; pCor: TColor);

    function ValidarAcessoConta: Boolean;
  public
    property ListaContas: TObjectList<TConta> read FListaContas;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  ContaBancaria.Conta.Operacao;

{ TfrmPrincipal }

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FListaContas := TObjectList<TConta>.Create(True);
end;

procedure TfrmPrincipal.AtualizarInformacoesDosCampos;
begin
  if Assigned(FConta) then
    begin
      edtNomeTitular.Text := FConta.NomeTitular;
      edtNumeroConta.Text := IntToStr(FConta.NumeroConta);
      nbSaldo.Value := FConta.Saldo;
    end;
end;

procedure TfrmPrincipal.btnAcessarClick(Sender: TObject);
begin
  if ValidarAcessoConta() then
    AcessarConta()
  else
    ShowMessage('Por favor, selecione uma conta.');
end;

procedure TfrmPrincipal.HabilitarBotoes;
begin
  sbtnDepositar.Enabled := True;
  sbtnSacar.Enabled := True;
  sbtnExibirSaldo.Enabled := True;
end;

procedure TfrmPrincipal.sbtnCriarContaClick(Sender: TObject);
const
  MENSAGEM_CONTA_EXISTENTE = 'Já existe uma conta com este número.';
var
  lContaCadastro: TfrmContaCadastro;
  lNovaConta: TConta;
  lConta: TConta;
begin
  lContaCadastro := TfrmContaCadastro.Create(nil);
  try
    lContaCadastro.ShowModal;

    if lContaCadastro.modalResult = mrOk then
      begin
        for lConta in FListaContas do
          if (lConta.NumeroConta = StrToInt(lContaCadastro.edtNumeroConta.Text)) then
            begin
              ShowMessage(MENSAGEM_CONTA_EXISTENTE);
              Exit();
            end;

        lNovaConta := TConta.Create();

        lNovaConta.NomeTitular := lContaCadastro.edtNomeTitular.Text;
        lNovaConta.NumeroConta := StrToInt(lContaCadastro.edtNumeroConta.Text);

        FListaContas.Add(lNovaConta);
        cmbNumeroContaAcesso.Items.Add(lContaCadastro.edtNumeroConta.Text);

        ShowMessage('Conta cadastrada com sucesso!' + sLineBreak + 'Por favor, acesse sua conta.');
      end;
  finally
    FreeAndNil(lContaCadastro);
  end;
end;

procedure TfrmPrincipal.sbtnDepositarClick(Sender: TObject);
var
  lDeposito: TfrmOperacao;
begin
  lDeposito := TfrmOperacao.Create(nil, toDeposito);
  try
    if lDeposito.ShowModal = mrOk then
      begin
        FConta.Depositar(lDeposito.nbValor.Value);

        AtualizarInformacoesDosCampos();

        AdicionarLog(Format('Depósito realizado no valor de R$ %s.',
          [FormatFloat('#,##0.00', lDeposito.nbValor.Value)]), clGreen);
      end;
  finally
    FreeAndNil(lDeposito);
  end;
end;

procedure TfrmPrincipal.sbtnExibirSaldoClick(Sender: TObject);
begin
  if Assigned(FConta) then
    ShowMessage(FConta.ExibirSaldo);
end;

procedure TfrmPrincipal.sbtnSacarClick(Sender: TObject);
var
  lSaque: TfrmOperacao;
begin
  lSaque := TfrmOperacao.Create(nil, toSaque);
  try
    if lSaque.ShowModal = mrOk then
      begin
        FConta.Sacar(lSaque.nbValor.Value);

        AtualizarInformacoesDosCampos;

        AdicionarLog(Format('Saque realizado no valor de R$ %s.',
          [FormatFloat('#,##0.00', lSaque.nbValor.Value)]), clRed);
      end;
  finally
    FreeAndNil(lSaque);
  end;
end;

procedure TfrmPrincipal.AcessarConta;
var
  lNumeroContaDigitado: Integer;
  lConta: TConta;
begin
  lNumeroContaDigitado := StrToInt(cmbNumeroContaAcesso.Text);

  for lConta in FListaContas do
    begin
      if (lConta.NumeroConta = lNumeroContaDigitado) then
        begin
          FConta := lConta;

          memHistorico.Clear();
          AdicionarLog('Acessou a conta.', clDefault);

          HabilitarBotoes();

          cmbNumeroContaAcesso.ItemIndex := -1;

          AtualizarInformacoesDosCampos();

          Break;
        end
    end;
end;

function TfrmPrincipal.ValidarAcessoConta: Boolean;
begin
  Result := cmbNumeroContaAcesso.ItemIndex <> -1;
end;

procedure TfrmPrincipal.AdicionarLog(const pMensagem: string; pCor: TColor);
begin
  memHistorico.SelAttributes.Color := clDefault;
  memHistorico.SelText := DateTimeToStr(Now()) + ' - ';

  memHistorico.SelAttributes.Color := pCor;
  memHistorico.SelText := pMensagem + sLineBreak;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FConta := nil;
  FreeAndNil(FListaContas);
end;

end.
