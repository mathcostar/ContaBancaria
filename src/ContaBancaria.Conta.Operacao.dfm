object frmOperacao: TfrmOperacao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conta banc'#225'ria - Opera'#231#227'o'
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
  object lblValor: TLabel
    Left = 16
    Top = 27
    Width = 29
    Height = 15
    Caption = 'Valor:'
  end
  object btnOperacao: TButton
    Left = 276
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Opera'#231#227'o'
    ModalResult = 1
    TabOrder = 0
  end
  object nbValor: TNumberBox
    Left = 117
    Top = 24
    Width = 121
    Height = 23
    Mode = nbmCurrency
    TabOrder = 1
  end
end
