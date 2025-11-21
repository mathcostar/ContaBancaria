unit ContaBancaria.Conta.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Contabancaria.Conta;

type
  TfrmContaCadastro = class(TForm)
    lblNomeTitular: TLabel;
    edtNomeTitular: TEdit;
    lblNumeroConta: TLabel;
    edtNumeroConta: TEdit;
    btnCadastrar: TButton;
    grpContaCadastro: TGroupBox;
    procedure btnCadastrarClick(Sender: TObject);
  private
    procedure CadastrarConta;

    function PossuiImpeditivos: Boolean;
  end;

implementation

{$R *.dfm}

uses
  ContaBancaria.TelaPrincipal;

{ TfrmContaCadastro }

procedure TfrmContaCadastro.btnCadastrarClick(Sender: TObject);
begin
  CadastrarConta();
end;

procedure TfrmContaCadastro.CadastrarConta;
const
  MENSAGEM_CAMPOS_INVALIDOS = 'Por favor, preencha todos os campos.';
begin
  if PossuiImpeditivos() then
    begin
      ShowMessage(MENSAGEM_CAMPOS_INVALIDOS);
      Abort();
    end;

  modalResult := mrOk;
end;

function TfrmContaCadastro.PossuiImpeditivos: Boolean;
begin
  Result := (edtNomeTitular.Text = '') or (edtNumeroConta.Text = '');
end;

end.
