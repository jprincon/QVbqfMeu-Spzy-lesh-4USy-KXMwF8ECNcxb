object Consola: TConsola
  Left = 0
  Top = 0
  ClientHeight = 561
  ClientWidth = 1008
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 19
  object pTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 65
    Align = alTop
    Caption = 'Consola'
    Color = 12615680
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 561
  end
  object lvConsola: TListView
    Left = 0
    Top = 65
    Width = 680
    Height = 496
    Align = alClient
    Columns = <
      item
      end
      item
        Caption = 'No'
        Width = 75
      end
      item
        Caption = 'Mensaje'
        Width = 500
      end
      item
        Caption = 'Procedimiento'
        Width = 300
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    SmallImages = iconos24
    TabOrder = 1
    ViewStyle = vsReport
  end
  object paginaVistaPrevia: TPageControl
    Left = 680
    Top = 65
    Width = 328
    Height = 496
    ActivePage = TabVistaPrevia
    Align = alRight
    MultiLine = True
    TabOrder = 2
    TabPosition = tpRight
    object TabVistaPrevia: TTabSheet
      Caption = 'Vista Previa'
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 288
        Height = 482
        Align = alClient
        Caption = 
          'Este es un texto de vista previa de la consola de mensajes de la' +
          's aplicaciones de JarinconApps'
        WordWrap = True
        ExplicitWidth = 286
        ExplicitHeight = 57
      end
    end
  end
  object iconos24: TImageList
    Height = 24
    Width = 24
    Left = 796
    Top = 245
    Bitmap = {
      494C010101000800140018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDEB
      E100F2E0D5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEF0E800F8BC9800F49A
      6500BD652E00D3987300F5E7DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEF4EE00F8C1A000F49B6600F3996400F399
      6400BC642D00BC642D00BD662F00D7A07D00F8EDE60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFF7F300F9C6A800F49C6900F3996400F3996400F3996400F399
      6400BC642D00BC642D00BC642D00BC642D00BE683200DAA88900FAF2ED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFA
      F700F9CCB100F49E6C00F3996400F3996400F3996400F3996400F3996400F399
      6400BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BF6B3700DEB0
      9300FCF6F3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFCFA00FAD1B900F4A1
      7000F3996400F3996400F3996400F3996400F3996400F3996400F3996400F399
      6400BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC64
      2D00C16F3C00E1B89F00FDFAF800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F3996400F3996400F3996400F3996400F3996400F3996400F399
      6400BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F3996400F3996400F3996400F3996400F3996400F3996400F399
      6400BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F3996400F3996400F3996400F3996400F3996400F3996400F399
      6400BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F3996400F3996400F3996400F3996400F3996400F3996400F399
      6400BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F3996400F3996400F3996400F3996400F3996400F3996400F399
      6400BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F3996400F3996400F3996400F3996400F3996400F3996400F399
      6400BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F3996400F3996400F3996400F3996400F3996400F3996400F49F
      6C00C8743F00BC642D00BC642D00BC642D00BC642D00BC642D00BC642D00BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F3996400F3996400F3996400F3996400F49E6A00F6AD7E00F7B7
      8B00F7B78A00E39B6B00C5713B00BC642D00BC642D00BC642D00BC642D00BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F3996400F3996400F39C6900F5AB7C00F7B78A00F7B78B00F7B7
      8B00F7B78B00F7B78B00F6B68A00E0976600C36E3800BC642D00BC642D00BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F399
      6400F3996400F39C6700F5AA7A00F7B68A00F7B78B00F7B78B00F7B78B00F7B7
      8B00F7B78B00F7B78B00F7B78B00F7B78B00F5B48800DD926100C16B3500BC64
      2D00BC642D00BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDAC700F3996400F39B
      6600F5A87800F7B58900F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B7
      8B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F4B38600DA8E
      5D00BF693200BC642D00E7C7B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBDBC800F5A77600F7B5
      8800F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B7
      8B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B7
      8B00F3B18400D78A5700E9C9B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFDFB00FCDFCB00F8BD
      9400F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B7
      8B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B7
      8B00F8BD9400FCDECA00FFFDFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFC
      F900FBDBC500F8BB9100F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B7
      8B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F7B78B00F8BB9100FBDB
      C400FFFBF9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFAF600FBD7BE00F8B98F00F7B78B00F7B78B00F7B78B00F7B7
      8B00F7B78B00F7B78B00F7B78B00F7B78B00F8B98E00FBD7BE00FFF9F5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF7F200FBD3B800F8B88D00F7B78B00F7B7
      8B00F7B78B00F7B78B00F8B88D00FBD3B800FFF7F20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEF4EE00FAD0B200F8B8
      8C00F8B88C00FACFB200FEF4EE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEF1
      E900FEF1E9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FFE7FF000000000000000000FF81FF00
      0000000000000000FE007F000000000000000000F8001F000000000000000000
      E000070000000000000000008000010000000000000000008000010000000000
      0000000080000100000000000000000080000100000000000000000080000100
      0000000000000000800001000000000000000000800001000000000000000000
      8000010000000000000000008000010000000000000000008000010000000000
      0000000080000100000000000000000080000100000000000000000080000100
      0000000000000000800001000000000000000000E00007000000000000000000
      F8001F000000000000000000FE007F000000000000000000FF81FF0000000000
      00000000FFE7FF00000000000000000000000000000000000000000000000000
      000000000000}
  end
end
