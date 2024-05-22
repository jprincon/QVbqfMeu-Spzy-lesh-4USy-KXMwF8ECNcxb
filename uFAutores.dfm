object FAutores: TFAutores
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 701
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 65
    Align = alTop
    Caption = 'Acerca de los autores ...'
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
  object pAutores: TScrollBox
    Left = 0
    Top = 65
    Width = 1018
    Height = 636
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 1
    ExplicitTop = 71
    ExplicitHeight = 603
  end
end
