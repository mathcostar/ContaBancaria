unit ContaBancaria.Conta.Deposito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Mask, Vcl.NumberBox;

type
  TfrmDeposito = class(TForm)
    lblDeposito: TLabel;
    btnDepositar: TButton;
    nbValorDeposito: TNumberBox;
    procedure btnDepositarClick(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TfrmDeposito.btnDepositarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
