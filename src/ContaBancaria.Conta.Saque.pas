unit ContaBancaria.Conta.Saque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox;

type
  TfrmSaque = class(TForm)
    btnSacar: TButton;
    nbValorSaque: TNumberBox;
    lblSaque: TLabel;
    procedure btnSacarClick(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TfrmSaque.btnSacarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
