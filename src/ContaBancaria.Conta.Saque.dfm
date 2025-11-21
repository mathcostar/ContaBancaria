object frmSaque: TfrmSaque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conta banc'#225'ria - Saque'
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
  object lblSaque: TLabel
    Left = 16
    Top = 27
    Width = 80
    Height = 15
    Caption = 'Valor do saque:'
  end
  object btnSacar: TButton
    Left = 276
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Sacar'
    TabOrder = 0
    OnClick = btnSacarClick
  end
  object nbValorSaque: TNumberBox
    Left = 117
    Top = 24
    Width = 121
    Height = 23
    Mode = nbmCurrency
    TabOrder = 1
  end
end
