unit ContaBancaria.Conta.Operacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Mask, Vcl.NumberBox;

type
  TTipoOperacao = (toDeposito, toSaque);

  TfrmOperacao = class(TForm)
    lblValor: TLabel;
    btnOperacao: TButton;
    nbValor: TNumberBox;
  private
    procedure DefinirOperacao(const pOperacao: TTipoOperacao);
  public
    constructor Create(AOwner: TComponent; pOperacao: TTipoOperacao); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmOperacao.Create(AOwner: TComponent; pOperacao: TTipoOperacao);
begin
  inherited Create(AOwner);
  DefinirOperacao(pOperacao);
end;

procedure TfrmOperacao.DefinirOperacao(const pOperacao: TTipoOperacao);
begin
  case pOperacao of
    toDeposito:
      begin
        Caption := 'Conta bancária - Depósito';
        lblValor.Caption := 'Valor do depósito:';
        btnOperacao.Caption := 'Depositar';
      end;
    toSaque:
      begin
        Caption := 'Conta bancária - Saque';
        lblValor.Caption := 'Valor do saque:';
        btnOperacao.Caption := 'Sacar';
      end;
  end;
end;

end.
