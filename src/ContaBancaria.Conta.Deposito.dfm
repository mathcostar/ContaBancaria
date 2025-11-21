object frmDeposito: TfrmDeposito
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conta banc'#225'ria - Depositar'
  ClientHeight = 83
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  object lblDeposito: TLabel
    Left = 16
    Top = 27
    Width = 95
    Height = 15
    Caption = 'Valor do dep'#243'sito:'
  end
  object btnDepositar: TButton
    Left = 276
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Depositar'
    TabOrder = 0
    OnClick = btnDepositarClick
  end
  object nbValorDeposito: TNumberBox
    Left = 117
    Top = 24
    Width = 121
    Height = 23
    Mode = nbmCurrency
    TabOrder = 1
  end
end
