object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conta Banc'#225'ria - Tela inicial'
  ClientHeight = 300
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 300
    Align = alLeft
    Caption = 'pnlOpcoes'
    ShowCaption = False
    TabOrder = 0
    object sbtnCriarConta: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 114
      Width = 177
      Height = 41
      Align = alBottom
      Caption = 'Criar conta'
      OnClick = sbtnCriarContaClick
      ExplicitLeft = 48
      ExplicitTop = 48
      ExplicitWidth = 105
    end
    object sbtnDepositar: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 161
      Width = 177
      Height = 41
      Align = alBottom
      Caption = 'Depositar'
      Enabled = False
      OnClick = sbtnDepositarClick
      ExplicitLeft = 1
      ExplicitTop = 57
      ExplicitWidth = 183
    end
    object sbtnSacar: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 208
      Width = 177
      Height = 41
      Align = alBottom
      Caption = 'Sacar'
      Enabled = False
      OnClick = sbtnSacarClick
      ExplicitLeft = 1
      ExplicitTop = 98
      ExplicitWidth = 183
    end
    object sbtnExibirSaldo: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 255
      Width = 177
      Height = 41
      Align = alBottom
      Caption = 'Exibir saldo'
      Enabled = False
      OnClick = sbtnExibirSaldoClick
      ExplicitLeft = 1
      ExplicitTop = 220
      ExplicitWidth = 183
    end
    object grpAcesso: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 177
      Height = 105
      Align = alBottom
      Caption = 'Acessar conta'
      TabOrder = 0
      object btnAcessar: TButton
        Left = 48
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Acessar'
        TabOrder = 0
        OnClick = btnAcessarClick
      end
      object cmbNumeroContaAcesso: TComboBox
        Left = 16
        Top = 24
        Width = 145
        Height = 23
        Style = csDropDownList
        TabOrder = 1
        TextHint = 'Selecione a conta...'
      end
    end
  end
  object pnlInformacoes: TPanel
    Left = 185
    Top = 0
    Width = 691
    Height = 300
    Align = alClient
    Caption = 'pnlInformacoes'
    ShowCaption = False
    TabOrder = 1
    object grpInformacoesConta: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 683
      Height = 292
      Align = alClient
      Caption = 'Informa'#231#245'es da conta'
      TabOrder = 0
      object lblNomeTitular: TLabel
        Left = 16
        Top = 26
        Width = 87
        Height = 15
        Caption = 'Nome do titular:'
      end
      object lblHistorico: TLabel
        Left = 200
        Top = 26
        Width = 155
        Height = 15
        Caption = 'Hist'#243'rico de movimenta'#231#245'es:'
      end
      object lblNumeroConta: TLabel
        Left = 16
        Top = 136
        Width = 96
        Height = 15
        Caption = 'N'#250'mero da conta:'
      end
      object lblSaldo: TLabel
        Left = 16
        Top = 237
        Width = 32
        Height = 15
        Caption = 'Saldo:'
      end
      object edtNomeTitular: TEdit
        Left = 16
        Top = 47
        Width = 121
        Height = 23
        ParentCustomHint = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
      end
      object edtNumeroConta: TEdit
        Left = 16
        Top = 157
        Width = 121
        Height = 23
        ParentCustomHint = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 1
        TextHint = 'Acesse sua conta...'
      end
      object nbSaldo: TNumberBox
        Left = 16
        Top = 258
        Width = 119
        Height = 23
        Mode = nbmCurrency
        ReadOnly = True
        TabOrder = 2
      end
      object memHistorico: TRichEdit
        Left = 200
        Top = 47
        Width = 473
        Height = 234
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
end
