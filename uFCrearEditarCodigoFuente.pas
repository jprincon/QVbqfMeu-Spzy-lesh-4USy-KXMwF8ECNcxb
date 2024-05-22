unit uFCrearEditarCodigoFuente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Clipbrd,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModuloDatos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, SynEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Utilidades, Constantes,
  SynHighlighterPython, SynHighlighterSQL, SynHighlighterCS,
  SynHighlighterJScript, SynHighlighterHtml, SynEditCodeFolding,
  SynHighlighterPas, SynEditHighlighter, SynHighlighterTeX, SynHighlighterJSON,
  uTTipos, Vcl.Menus;

type
  TFCrearEditarCodigoFuente = class(TForm)
    pTitulo: TPanel;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    Query: TFDQuery;
    dlgArchivo: TOpenDialog;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    sbCodigoFuente: TSpeedButton;
    edNombre: TSynEdit;
    GroupBox2: TGroupBox;
    edLenguaje: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edDescripcion: TSynEdit;
    PageControl2: TPageControl;
    TabCodigo: TTabSheet;
    edCodigo: TSynEdit;
    sTex: TSynTeXSyn;
    sPas: TSynPasSyn;
    sHtml: TSynHTMLSyn;
    sJs: TSynJScriptSyn;
    sCSS: TSynCSSyn;
    sSQL: TSynSQLSyn;
    sPython: TSynPythonSyn;
    sJSON: TSynJSONSyn;
    opcionesCodigo: TPopupMenu;
    Guardar1: TMenuItem;
    Extraerdescripcindecdigo1: TMenuItem;
    procedure sbCodigoFuenteClick(Sender: TObject);
    procedure sbGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edLenguajeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Extraerdescripcindecdigo1Click(Sender: TObject);
  private
    FRespuesta: string;
    FAccion: string;
    FIdModulo: string;
    FCreoEdito: boolean;
    FIdCodigo: string;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdCodigo(const Value: string);
    procedure SetIdModulo(const Value: string);
    procedure SetRespuesta(const Value: string);
    { Private declarations }
  public
    procedure actualizarLenguaje;

    function crear(IdModulo: string): boolean;
    function editar(IdCodigo: string): boolean;

    property Accion: string read FAccion write SetAccion;
    property IdCodigo: string read FIdCodigo write SetIdCodigo;
    property IdModulo: string read FIdModulo write SetIdModulo;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
  end;

var
  FCrearEditarCodigoFuente: TFCrearEditarCodigoFuente;

implementation

{$R *.dfm}

procedure TFCrearEditarCodigoFuente.actualizarLenguaje;
var
  lang: string;
begin
  lang := edLenguaje.Items[edLenguaje.ItemIndex];

  if lang = LANG_HTML then
    edCodigo.Highlighter := sHtml;

  if lang = LANG_CSS then
    edCodigo.Highlighter := sCSS;

  if lang = LANG_JAVASCRIPT then
    edCodigo.Highlighter := sJs;

  if lang = LANG_TYPESCRIPT then
    edCodigo.Highlighter := sJs;

  if lang = LANG_PASCAL then
    edCodigo.Highlighter := sPas;

  if lang = LANG_PYTHON then
    edCodigo.Highlighter := sPython;

  if lang = LANG_SQL then
    edCodigo.Highlighter := sSQL;

  if lang = LANG_JSON then
    edCodigo.Highlighter := sJSON;
end;

function TFCrearEditarCodigoFuente.crear(IdModulo: string): boolean;
begin
  FAccion := ACCION_CREAR;
  FCreoEdito := false;
  FIdModulo := IdModulo;
  ShowModal;
  result := FCreoEdito;
end;

function TFCrearEditarCodigoFuente.editar(IdCodigo: string): boolean;
begin
  FAccion := ACCION_EDITAR;
  FIdCodigo := IdCodigo;
  FCreoEdito := false;
  ShowModal;
  result := FCreoEdito;
end;

procedure TFCrearEditarCodigoFuente.edLenguajeChange(Sender: TObject);
begin
  actualizarLenguaje;
end;

procedure TFCrearEditarCodigoFuente.Extraerdescripcindecdigo1Click
  (Sender: TObject);
begin
  edDescripcion.Text := edCodigo.Lines[0];
end;

procedure TFCrearEditarCodigoFuente.FormCreate(Sender: TObject);
begin
  edLenguaje.Items.Clear;
  edLenguaje.Items.Add(LANG_HTML);
  edLenguaje.Items.Add(LANG_CSS);
  edLenguaje.Items.Add(LANG_JAVASCRIPT);
    edLenguaje.Items.Add(LANG_JSON);
  edLenguaje.Items.Add(LANG_TYPESCRIPT);
  edLenguaje.Items.Add(LANG_PASCAL);
  edLenguaje.Items.Add(LANG_PYTHON);
  edLenguaje.Items.Add(LANG_SQL);
  edLenguaje.Items.Add(LANG_SQL);
end;

procedure TFCrearEditarCodigoFuente.FormShow(Sender: TObject);
var
  Encoding: TEncoding;
begin
  Width := Round(0.8 * Screen.Width);
  Height := Round(0.8 * Screen.Height);

  edNombre.Clear;
  edDescripcion.Clear;

  if FAccion = ACCION_EDITAR then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM CodigoFuente WHERE IdCodigo=' + #39 +
      FIdCodigo + #39;
    Query.Open;

    edNombre.Text := Query.FieldByName('Nombre').AsString;

    TabCodigo.Caption := ExtractFileName(edNombre.Text);
    Encoding := TUTF8Encoding.Create;

    if FileExists(edNombre.Text) then
      edCodigo.Lines.LoadFromFile(edNombre.Text);

    edDescripcion.Text := Query.FieldByName('Descripcion').AsString;
    edLenguaje.ItemIndex := edLenguaje.Items.IndexOf
      (Query.FieldByName('Lenguaje').AsString);
    actualizarLenguaje;
  end;
end;

procedure TFCrearEditarCodigoFuente.sbCodigoFuenteClick(Sender: TObject);
var
  ext: string;
begin
  if dlgArchivo.Execute then
  begin
    edNombre.Text := dlgArchivo.FileName;
    ext := ExtractFileExt(dlgArchivo.FileName);

    edCodigo.Lines.LoadFromFile(dlgArchivo.FileName);

    if ext = '.html' then
      edLenguaje.Text := LANG_HTML;

    if ext = '.css' then
      edLenguaje.Text := LANG_CSS;

    if ext = '.js' then
      edLenguaje.Text := LANG_JAVASCRIPT;

    if ext = '.ts' then
      edLenguaje.Text := LANG_TYPESCRIPT;

    if (ext = '.pas') or (ext = '.dpr') then
      edLenguaje.Text := LANG_PASCAL;

    if ext = '.py' then
      edLenguaje.Text := LANG_PYTHON;

    if ext = '.sql' then
      edLenguaje.Text := LANG_SQL;

    if ext = '.json' then
      edLenguaje.Text := LANG_JSON;

    actualizarLenguaje;
  end;
end;

procedure TFCrearEditarCodigoFuente.sbGuardarClick(Sender: TObject);
var
  Descripcion: string;
begin
  if FAccion = ACCION_CREAR then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO CodigoFuente (';
    Query.SQL.Add('IdCodigo, ');
    Query.SQL.Add('Nombre, ');
    Query.SQL.Add('Lenguaje, ');
    Query.SQL.Add('Descripcion, ');
    Query.SQL.Add('IdModulo, ');
    Query.SQL.Add('IdUsuario');
    Query.SQL.Add(') VALUES (');
    Query.SQL.Add(':IdCodigo, ');
    Query.SQL.Add(':Nombre, ');
    Query.SQL.Add(':Lenguaje, ');
    Query.SQL.Add(':Descripcion, ');
    Query.SQL.Add(':IdModulo, ');
    Query.SQL.Add(':IdUsuario)');

    Query.Params.ParamByName('IdCodigo').Value := Utilidades.generarID;
    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Lenguaje').Value := edLenguaje.Items
      [edLenguaje.ItemIndex];

    Descripcion := Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('Descripcion').AsWideMemo := Descripcion;
    Query.Params.ParamByName('IdModulo').Value := FIdModulo;
    Query.Params.ParamByName('IdUsuario').Value := ModuloDatos.IdUsuario;

    Query.ExecSQL;
    FRespuesta := 'El archivo de código se creó correctamente';
    FCreoEdito := true;
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE CodigoFuente SET ';
    Query.SQL.Add('Nombre=:Nombre, ');
    Query.SQL.Add('Lenguaje=:Lenguaje, ');
    Query.SQL.Add('Descripcion=:Descripcion ');
    Query.SQL.Add('WHERE IdCodigo=' + #39 + IdCodigo + #39);

    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Lenguaje').Value := edLenguaje.Items
      [edLenguaje.ItemIndex];

    Descripcion := Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('Descripcion').AsWideMemo := Descripcion;

    Clipboard.AsText := Descripcion;

    Query.ExecSQL;
    FRespuesta := 'El archivo de código se actualizó correctamente';
    FCreoEdito := true;
    Close;
  end;
end;

procedure TFCrearEditarCodigoFuente.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarCodigoFuente.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarCodigoFuente.SetIdCodigo(const Value: string);
begin
  FIdCodigo := Value;
end;

procedure TFCrearEditarCodigoFuente.SetIdModulo(const Value: string);
begin
  FIdModulo := Value;
end;

procedure TFCrearEditarCodigoFuente.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

end.
