object FCrearEditarPlataformaDesarrollo: TFCrearEditarPlataformaDesarrollo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 777
  ClientWidth = 1185
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 137
    Width = 1185
    Height = 591
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 641
      Height = 591
      ActivePage = TabSheet1
      Align = alLeft
      MultiLine = True
      TabOrder = 0
      TabPosition = tpLeft
      object TabSheet1: TTabSheet
        Caption = 'Descripci'#243'n'
        object edDescripcion: TSynEdit
          Left = 0
          Top = 0
          Width = 607
          Height = 583
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 0
          CodeFolding.GutterShapeSize = 11
          CodeFolding.CollapsedLineColor = clGrayText
          CodeFolding.FolderBarLinesColor = clGrayText
          CodeFolding.IndentGuidesColor = clGray
          CodeFolding.IndentGuides = True
          CodeFolding.ShowCollapsedLine = False
          CodeFolding.ShowHintMark = True
          UseCodeFolding = False
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = 8388672
          Gutter.Font.Height = -21
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = [fsBold]
          Gutter.ShowLineNumbers = True
          Highlighter = SynTeXSyn1
          Lines.Strings = (
            'edDescripcion')
          WantTabs = True
          WordWrap = True
          FontSmoothing = fsmNone
        end
      end
    end
    object PageControl2: TPageControl
      Left = 641
      Top = 0
      Width = 544
      Height = 591
      ActivePage = TabSheet2
      Align = alClient
      MultiLine = True
      TabOrder = 1
      TabPosition = tpLeft
      object TabSheet2: TTabSheet
        Caption = 'Imagen'
        object imgInst: TImage
          Left = 0
          Top = 33
          Width = 510
          Height = 550
          Align = alClient
          Center = True
          Proportional = True
          ExplicitTop = -3
          ExplicitWidth = 483
          ExplicitHeight = 439
        end
        object pCargar: TPanel
          Left = 0
          Top = 0
          Width = 510
          Height = 33
          Align = alTop
          Caption = 'Haga clic aqu'#237' para cargar una imagen ...'
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          OnClick = pCargarClick
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 728
    Width = 1185
    Height = 49
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object sbGuardar: TSpeedButton
      AlignWithMargins = True
      Left = 1061
      Top = 4
      Width = 120
      Height = 41
      Align = alRight
      Caption = 'Guardar'
      Flat = True
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000232E0000232E00000000000000000000FAF9F8B09E94
        866A5B816454816454AE968AF2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1
        D9F2E1D9F2E1D9F2E1D9E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6
        CDC3E6CDC3E6CDC3A38A7C765C4E765C4E7A6052A7968DF9F8F7AC998E795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1
        D9F2E1D9F2E1D9F2E1D9E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D5142A391887F6151795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1
        D9F2E1D9F2E1D9F2E1D9E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D5142725748795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9F0DFD7E3D1C8E2D1C8E2D1
        C8E2D1C8E2D1C8E2D1C8D7BFB5D7BFB5D7BFB5D7BFB5D7BFB5D7BFB5E4CBC1E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9CFBDB3B39F94B39F94B39F
        94B39F94B39F94B39F94A8948AA8948AA8948AA8948AA8948AA8948AC3ADA3E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9E5D3CBCBB8AECBB8AECBB8
        AECBB8AECBB8AECBB8AEBFA99FBFA99FBFA99FBFA99FBFA99FC0AAA0D8C1B7E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1
        D9F2E1D9F2E1D9F2E1D9E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9E9D8CFD3C0B7D3C0B7D3C0
        B7D3C0B7D3C0B7D3C0B7C7B1A7C7B1A7C7B1A7C7B1A7C7B1A7C7B1A7DDC5BBE6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9CEBBB1B39F94B39F94B39F
        94B39F94B39F94B39F94A8948AA8948AA8948AA8948AA8948AA8948AC2ACA2E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9EDDCD3DBC9C0DAC8BFDAC8
        BFDAC8BFDAC8BFDAC8BFCFB8AECFB8AECFB8AECFB8AECFB8AECFB8AEE1C8BEE6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1
        D9F2E1D9F2E1D9F2E1D9E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1
        D9F2E1D9F2E1D9F2E1D9E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49A68D7FF2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1D9F2E1
        D9F2E1D9F2E1D9F2E1D9E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6CDC3E6
        CDC3E6CDC3E6CDC39A80726D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49AA9255FDEF6AFDEF6AFDEF6AFDEF6AFDEF6AFDEF6AFDEF
        6AFDEF6AFDEF6AFDEF6AE6D85FE6D85FE6D85FE6D85FE6D85FE6D85FE6D85FE6
        D85FE6D85FE6D85F9A844D6D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49AB934FFFF15AFFF15AFFF15AFFF15AFFF15AFFF15AFFF1
        5AFFF15AFFF15AFFF15AE6DA51E6DA51E6DA51E6DA51E6DA51E6DA51E6DA51E6
        DA51E6DA51E6DA519A84486D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49AB934FFFF15AFFF15AFFF15AFFF15AFFF15AFFF15AFFF1
        5AFFF15AFFF15AFFF15AE6DA51E6DA51E6DA51E6DA51E6DA51E6DA51E6DA51E6
        DA51E6DA51E6DA519A84486D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A4993784CF2E258F7E859F7E859F7E859F7E859F7E859F7E8
        59F7E859F7E859F7E859DED150DED150DED150DED150DED150DED150DED150DE
        D150DED150DBCE50866D456D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49795A49795A49795A49795A49795A49795A49795A49795A
        49795A49795A49795A496D51426D51426D51426D51426D51426D51426D51426D
        51426D51426D51426D51426D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49795A49795A49795A49795A49795A49795A49795A49795A
        49795A49795A49795A496D51426D51426D51426D51426D51426D51426D51426D
        51426D51426D51426D51426D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49795A49795A49795A49795A49795A49795A49795A49795A
        49795A49795A49795A496D51426D51426D51426D51426D51426D51426D51426D
        51426D51426D51426D51426D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49795A49795A497B5C4B957A6B977C6E977C6E977C6E977C
        6E977C6E977C6E977C6E8B72658B72658B72658B72658B72658B72658B72658A
        71646F53456D51426D51426D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49795A49795A49AE9588F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DBF2E2DBE6D6CFE6D6CFE6D6CFE6D6CFE6D6CFE6D6CFE6D6CFE6
        D6CFA38C816D51426D51426D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DBC8B2A8B9A49AB9A49AB9A49AB9A49AC4B1A7E6D6CFE6D6CFE6
        D6CFAA94896D51426D51426D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DB8163526D51426D51426D51426D51428B7265E6D6CFE6D6CFE6
        D6CFAA94896D51426D51426D51426D51426D51426D51426D5142795A49795A49
        795A49795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DB8163526D51426D51426D51426D51428B7265E6D6CFE6D6CFE6
        D6CFAA94896D51426D51426D51426D51426D51426D5142735849795A49795A49
        795A49795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DB8163526D51426D51426D51426D51428B7265E6D6CFE6D6CFE6
        D6CFAA94896D51426D51426D51426D51426D51426D5142978378795A49795A49
        795A49795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DB8163526D51426D51426D51426D51428B7265E6D6CFE6D6CFE6
        D6CFAA94896D51426D51426D51426D51426D51426F5445E0D9D6795A49795A49
        795A49795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DB8163526D51426D51426D51426D51428B7265E6D6CFE6D6CFE6
        D6CFAA94896D51426D51426D51426D51426F5344CCC2BCFFFFFF795A49795A49
        795A49795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DB8163526D51426D51426D51426D51428B7265E6D6CFE6D6CFE6
        D6CFAA94896D51426D51426D51426F5344CCC2BCFFFFFFFFFFFF7D5F4F795A49
        795A49795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DB8163526D51426D51426D51426D51428B7265E6D6CFE6D6CFE6
        D6CFAA94896D51426D51426F5344CCC2BCFFFFFFFFFFFFFFFFFFA79388795A49
        795A49795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DB8163526D51426D51426D51426D51428B7265E6D6CFE6D6CFE6
        D6CFAA94896D51426F5445CCC1BCFFFFFFFFFFFFFFFFFFFFFFFFF8F6F5A89489
        7E604F795A49795A49795A49795A49B69E92F2E2DBF2E2DBF2E2DBF2E2DBF2E2
        DBF2E2DBF2E2DB8163526D51426D51426D51426D51428B7265E6D6CFE6D6CFE6
        D6CFB09B90968277E0D9D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = sbGuardarClick
      ExplicitTop = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 1185
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 30
      Top = 10
      Width = 611
      Height = 52
      Margins.Left = 30
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'Nombre del IDE o Software'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitTop = 11
      object edNombre: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 601
        Height = 26
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8388672
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'edNombre'
        ExplicitHeight = 27
      end
    end
  end
  object pTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1185
    Height = 65
    Align = alTop
    Caption = 'Creando/Editando Plataforma de Desarrollo ...'
    Color = 12615680
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
  end
  object dlgImagen: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.ti' +
      'ff)|*.png;*.jpg;*.jpeg;*.bmp|Portable Network Graphics (*.png)|*' +
      '.png|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jp' +
      'eg|Bitmaps (*.bmp)|*.bmp'
    Title = 'Cargar imagen para instalaci'#243'n ...'
    Left = 463
    Top = 325
  end
  object Query: TFDQuery
    Connection = ModuloDatos.Conexion
    Left = 318
    Top = 325
  end
  object SynTeXSyn1: TSynTeXSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 871
    Top = 213
  end
end