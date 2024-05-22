object FIndicador: TFIndicador
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 193
  ClientWidth = 350
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pContenido: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 193
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 30
      Top = 30
      Width = 286
      Height = 38
      Margins.Left = 30
      Margins.Top = 30
      Margins.Right = 30
      Margins.Bottom = 30
      Align = alClient
      Alignment = taCenter
      Caption = 'Compilando ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 172
      ExplicitHeight = 33
    end
    object Panel1: TPanel
      Left = 0
      Top = 98
      Width = 346
      Height = 91
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object ActivityIndicator1: TActivityIndicator
        Left = 140
        Top = 11
        Animate = True
        IndicatorSize = aisXLarge
        IndicatorType = aitSectorRing
      end
    end
  end
end
