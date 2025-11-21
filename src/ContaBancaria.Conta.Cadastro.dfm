object frmContaCadastro: TfrmContaCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conta banc'#225'ria - Cadastrar'
  ClientHeight = 131
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  object grpContaCadastro: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 369
    Height = 125
    Align = alClient
    Caption = 'Informa'#231#245'es da conta'
    TabOrder = 0
    object lblNomeTitular: TLabel
      Left = 16
      Top = 24
      Width = 87
      Height = 15
      Caption = 'Nome do titular:'
    end
    object lblNumeroConta: TLabel
      Left = 232
      Top = 24
      Width = 96
      Height = 15
      Caption = 'N'#250'mero da conta:'
    end
    object btnCadastrar: TButton
      Left = 142
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 0
      OnClick = btnCadastrarClick
    end
    object edtNomeTitular: TEdit
      Left = 16
      Top = 45
      Width = 201
      Height = 23
      TabOrder = 1
      TextHint = 'Informe o nome do titular...'
    end
    object edtNumeroConta: TEdit
      Left = 232
      Top = 45
      Width = 121
      Height = 23
      NumbersOnly = True
      TabOrder = 2
      TextHint = 'Inisra o n'#186' da conta...'
    end
  end
end
