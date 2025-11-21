unit ContaBancaria.Conta;

interface

uses
  System.SysUtils;

type
  ESaldoInsuficiente = class(Exception)
  protected
    constructor Create(pSaldo: Double);
  end;

type
  EValorInvalido = class(Exception)
  protected
    constructor Create;
  end;

type
  TConta = class
  private
    FNumeroConta: Integer;
    FNomeTitular: string;
    FSaldo: Double;
  public
    procedure Depositar(pValorDeposito: Double);
    procedure Sacar(pValorSaque: Double);

    function ExibirSaldo: string;
    function PossuiSaldo(pValorSaque: Double): Boolean;
    function ValorValido(pValor: Double): Boolean;

    property NumeroConta: Integer read FNumeroConta write FNumeroConta;
    property NomeTitular: string read FNomeTitular write FNomeTitular;
    property Saldo: Double read FSaldo;
  end;

implementation

{ TConta }

procedure TConta.Depositar(pValorDeposito: Double);
begin
  if ValorValido(pValorDeposito) then
    FSaldo := FSaldo + pValorDeposito
end;

procedure TConta.Sacar(pValorSaque: Double);
begin
  if not PossuiSaldo(pValorSaque) then
    raise ESaldoInsuficiente.Create(FSaldo);

  if ValorValido(pValorSaque) then
    FSaldo := FSaldo - pValorSaque
end;

function TConta.ValorValido(pValor: Double): Boolean;
begin
  if pValor > 0 then
    Exit(True);

  raise EValorInvalido.Create();
end;

function TConta.ExibirSaldo: string;
begin
  Result := Format('Seu saldo atual é de: R$ %s', [FormatFloat('#,##0.00', FSaldo)]);
end;

function TConta.PossuiSaldo(pValorSaque: Double): Boolean;
begin
  Result := pValorSaque <= FSaldo;
end;

{ ESaldoInsuficiente }

constructor ESaldoInsuficiente.Create(pSaldo: Double);
begin
  inherited CreateFmt('Saldo insuficiente.%sSaldo na conta: R$ %s',
    [sLineBreak, FormatFloat('#,##0.00', pSaldo)]);
end;

{ EValorInvalido }

constructor EValorInvalido.Create;
begin
  inherited Create('Informe um valor maior que zero.');
end;

end.
