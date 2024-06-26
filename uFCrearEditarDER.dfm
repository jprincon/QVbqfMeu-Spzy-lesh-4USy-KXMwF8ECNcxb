object FCrearEditarDER: TFCrearEditarDER
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 739
  ClientWidth = 1360
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
  object pTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1360
    Height = 65
    Align = alTop
    Caption = 'Creando/Editando Tabla de la Base de Datos ...'
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
  object paginaTabla: TPageControl
    Left = 0
    Top = 65
    Width = 528
    Height = 503
    ActivePage = TabTabla
    Align = alClient
    MultiLine = True
    TabOrder = 1
    TabPosition = tpLeft
    object TabTabla: TTabSheet
      Caption = 'Tabla'
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 72
        Width = 474
        Height = 52
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Nombre de la Tabla'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object edNombre: TEdit
          AlignWithMargins = True
          Left = 5
          Top = 21
          Width = 464
          Height = 26
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8388672
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'edTabla'
          OnKeyUp = edNombreKeyUp
          ExplicitHeight = 27
        end
      end
      object lvAtributos: TListView
        AlignWithMargins = True
        Left = 10
        Top = 127
        Width = 474
        Height = 365
        Margins.Left = 10
        Margins.Right = 10
        Align = alClient
        Columns = <
          item
            Width = 3
          end
          item
            Caption = 'Tipo'
          end
          item
            Caption = 'Nombre'
            Width = 200
          end
          item
            Caption = 'Definici'#243'n'
            Width = 200
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 474
        Height = 52
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Tipo de Base de Datos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object edTipoBD: TComboBox
          Left = 2
          Top = 18
          Width = 470
          Height = 31
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edTipoBDChange
          Items.Strings = (
            'Microsoft Access'
            'PostgreSQL')
        end
      end
    end
  end
  object paginaVistaCodigo: TPageControl
    Left = 528
    Top = 65
    Width = 832
    Height = 503
    ActivePage = TabCodigo
    Align = alRight
    TabOrder = 2
    object TabCodigo: TTabSheet
      Caption = 'C'#243'digo SQL'
      object seCodigo: TSynEdit
        Left = 0
        Top = 0
        Width = 824
        Height = 469
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
        Gutter.Font.Color = 16711808
        Gutter.Font.Height = -21
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = [fsBold]
        Gutter.ShowLineNumbers = True
        Highlighter = SynSQLSyn1
        Lines.Strings = (
          'create table if not exists usuarios('
          '    idusuario varchar(255) primary key not null,'
          '    nombre varchar(255),'
          '    correo varchar(255),'
          '    idrol varchar(255) references roles(idrol)'
          ');'
          '')
        FontSmoothing = fsmNone
      end
    end
  end
  object pContent: TPanel
    Left = 0
    Top = 568
    Width = 1360
    Height = 171
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object pDatos: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 43
      Width = 1352
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object sbCrear: TSpeedButton
        Left = 1202
        Top = 0
        Width = 150
        Height = 36
        Align = alRight
        Caption = 'Crear Atributo'
        Flat = True
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000232E0000232E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FEF5C7F5C29DEE
          967FE9756CE56162E4564CB50256BA116DC3318FD261BDE4A3F3FBEEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FBE59CEE9465E45960E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB40050B6078DD15FE2
          F4D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF9FEF9A7F0A062E45760E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004D
          B50399D670F8FDF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE8FBE77BE87160E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB40067C129E4F5D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE0FADE6CE66160E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB40058BA14DBF1CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE8FBE76CE66160E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB40058BA14E4F5D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9FEF97BE87160E35460E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB4004BB40067C129F8FDF5FFFFFFFFFFFFFFFFFFFFFFFF
          A7F0A060E35460E35460E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB4004BB4004BB40099D56FFFFFFFFFFFFFFFFFFFE7FBE5
          62E45760E35460E35460E35460E35460E35460E35460E35460E35460E35461E3
          5578E56D71E56660E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB4004BB4004BB4004DB503E3F4D7FFFFFFFFFFFF9BEE94
          60E35460E35460E35460E35460E35460E35460E35460E35460E35476E56AD8EE
          CFEFF0E7EFF0E7C2ECB953B60A4BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB4004BB4004BB4004BB4008DD05EFFFFFFF5FEF565E459
          60E35460E35460E35460E35460E35460E35460E35460E35476E56BE1EFD8EFF0
          E7EFF0E7EFF0E7EFF0E7C1D69753B60A4BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB4004BB4004BB4004BB40050B607F4FBEFC7F5C260E354
          60E35460E35460E35460E35460E35460E35460E35476E56BE1EFD8EFF0E7EFF0
          E7EFF0E7EFF0E7EFF0E7E6E1C5C1D69753B60A4BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB4004BB4004BB4004BB4004BB400BDE4A29DEE9660E354
          60E35460E35460E35460E35460E35460E35476E56BE1EFD8EFF0E7EFF0E7EFF0
          E7EFF0E7EFF0E7EFF0E7E6E1C5E6E1C5C1D69753B60A4BB4004BB4004BB4004B
          B4004BB4004BB4004BB4004BB4004BB4004BB4004BB4008FD1617FE97560E354
          60E35460E35460E35460E35460E35476E56BE1EFD8EFF0E7EFF0E7EFF0E7EFF0
          E7EFF0E7EFF0E7EFF0E7E6E1C5E6E1C5E6E1C5C1D69753B60A4BB4004BB4004B
          B4004BB4004BB4004BB4004BB4004BB4004BB4004BB4006CC3306BE56060E354
          60E35460E35460E35460E35464E359DCEED4EFF0E7EFF0E7EFF0E7EFF0E7EFF0
          E7EFF0E7EFF0E7EFF0E7E6E1C5E6E1C5E6E1C5E6E1C5C1D69753B60A4BB4004B
          B4004BB4004BB4004BB4004BB4004BB4004BB4004BB40056BA1162E45660E354
          60E35460E35460E35460E35487E77DEFF0E7EFF0E7EFF0E7EFF0E7EFF0E7EFF0
          E7EEF0E6EFF0E7EFF0E7E6E1C5E6E1C5E6E1C5E6E1C5E6E1C5C1D69753B60A4B
          B4004BB4004BB4004BB4004BB4004BB4004BB4004BB4004CB50262E45660E354
          60E35460E35460E35460E35488E77DEFF0E7EFF0E7EFF0E7EFF0E7EFF0E7ECF0
          E38BE781ACEAA3EFF0E7E6E1C5E6E1C5E6E1C5E6E1C5E6E1C5E6E1C5C1D69753
          B60A4BB4004BB4004BB4004BB4004BB4004BB4004BB4004CB5026BE56060E354
          60E35460E35460E35460E35464E359DCEED4EFF0E7EFF0E7EFF0E7ECF0E38BE7
          8060E35460E354ACEAA3E6E1C5E6E1C5E6E1C5E6E1C5E6E1C5E6E1C5E6E1C5C1
          D69753B60A4BB4004BB4004BB4004BB4004BB4004BB40056BA117FE97560E354
          60E35460E35460E35460E35460E35474E568C6ECBCE5EFDCD1EDC885E67A60E3
          5460E35460E35460E354A0CD6CE6E1C5E6E1C5E6E1C5E6E1C5E6E1C5E6E1C5E6
          E1C5BDD5914CB4014BB4004BB4004BB4004BB4004BB4006CC3309DEE9660E354
          60E35460E35460E35460E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB400A0CD6CE6E1C5E6E1C5E6E1C5E6E1C5E6E1C5E6
          E1C5E6E1C56FBE2D4BB4004BB4004BB4004BB4004BB4008ED160C6F5C260E354
          60E35460E35460E35460E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB400A0CD6CE6E1C5E6E1C5E6E1C5E6E1C5E6
          E1C5E6E1C57DC23F4BB4004BB4004BB4004BB4004BB400BDE4A2F5FEF565E459
          60E35460E35460E35460E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB400A0CD6CE6E1C5E6E1C5E6E1C5E6
          E1C5E0DFBE59B8124BB4004BB4004BB4004BB40050B607F3FBEEFFFFFF9BEE94
          60E35460E35460E35460E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB40099CB64E3E0C2E6E1C5DD
          DEB97DC3404BB4004BB4004BB4004BB4004BB4008DD05EFFFFFFFFFFFFE7FBE5
          62E45760E35460E35460E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB40057B8106ABD2752
          B6084BB4004BB4004BB4004BB4004BB4004DB503E3F4D7FFFFFFFFFFFFFFFFFF
          A7F0A060E35460E35460E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB4004BB4004BB40099D56FFFFFFFFFFFFFFFFFFFFFFFFF
          F9FEF97AE87060E35460E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB4004BB40067C129F8FDF5FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE8FBE76CE66160E35460E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB4004BB40058BA13E4F4D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE0FADE6CE66160E35460E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB4004BB40058BA13DBF1CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE8FBE77AE87060E35460E35460E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004B
          B4004BB40067C129E4F4D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF9FEF9A7F0A062E45760E35460E35460E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB4004BB4004BB4004D
          B50399D66FF8FDF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FBE59CEE9465E45960E35460E3
          5460E35460E35460E3544BB4004BB4004BB4004BB4004BB40050B6078DD15EE2
          F4D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FEF5C7F5C29DEE
          967FE9756BE56062E4564CB50256BA116CC3308FD261BDE4A3F3FBEEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = sbCrearClick
        ExplicitLeft = 1203
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 96
        Height = 36
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Atributo'
        Color = 10526880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object edAtributo: TEdit
        Left = 96
        Top = 0
        Width = 304
        Height = 36
        Align = alLeft
        Alignment = taCenter
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'edAtributo'
        OnKeyUp = edAtributoKeyUp
      end
      object Panel3: TPanel
        Left = 400
        Top = 0
        Width = 96
        Height = 36
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Definici'#243'n'
        Color = 10526880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object edDefinicion: TComboBox
        AlignWithMargins = True
        Left = 499
        Top = 3
        Width = 700
        Height = 31
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = edDefinicionChange
      end
    end
    object pOpciones: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 82
      Width = 1352
      Height = 32
      Margins.Top = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object edPK: TCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 177
        Height = 26
        Align = alLeft
        Caption = 'Primary Key Not Null'
        TabOrder = 0
        OnClick = edPKClick
      end
      object edFK: TCheckBox
        AlignWithMargins = True
        Left = 186
        Top = 3
        Width = 107
        Height = 26
        Align = alLeft
        Caption = 'Foreign Key'
        TabOrder = 1
        OnClick = edFKClick
      end
      object edTablaFK: TEdit
        Left = 392
        Top = 0
        Width = 185
        Height = 32
        Align = alLeft
        Alignment = taCenter
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'edTablaFK'
        OnKeyUp = edTablaFKKeyUp
      end
      object Panel4: TPanel
        Left = 296
        Top = 0
        Width = 96
        Height = 32
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Tabla'
        Color = 10526880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
      object edAtributoFK: TEdit
        Left = 673
        Top = 0
        Width = 679
        Height = 32
        Align = alClient
        Alignment = taCenter
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = 'edAtributoFK'
        OnKeyUp = edAtributoFKKeyUp
      end
      object Panel5: TPanel
        Left = 577
        Top = 0
        Width = 96
        Height = 32
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Atributo'
        Color = 10526880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 117
      Width = 1358
      Height = 53
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 2
      object sbGuardar: TSpeedButton
        AlignWithMargins = True
        Left = 1234
        Top = 4
        Width = 120
        Height = 45
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
        ExplicitLeft = 709
        ExplicitTop = 2
        ExplicitHeight = 41
      end
    end
    object pVista: TPanel
      Left = 1
      Top = 1
      Width = 1358
      Height = 39
      Align = alTop
      TabOrder = 3
    end
  end
  object SynSQLSyn1: TSynSQLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 813
    Top = 255
  end
  object Query: TFDQuery
    Connection = ModuloDatos.Conexion
    Left = 972
    Top = 319
  end
end
