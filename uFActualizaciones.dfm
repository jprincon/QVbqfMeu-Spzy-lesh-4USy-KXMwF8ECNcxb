object FActualizaciones: TFActualizaciones
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Actualizaciones'
  ClientHeight = 739
  ClientWidth = 1018
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object pTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 65
    Align = alTop
    Caption = 'Actualizaciones de la Aplicaci'#243'n'
    Color = 12615680
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object Navegador: TWebBrowser
    Left = 0
    Top = 65
    Width = 1018
    Height = 674
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 472
    ExplicitTop = 344
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C00000037690000A94500000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620A000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
