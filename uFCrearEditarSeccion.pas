{Este formulario permite crear o editar una sección del manual de usuario. Se
debe ingresar el nombre de la sección, el número (orden) la descripción
de la secció y una imagen}
unit uFCrearEditarSeccion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, SynEdit,
  Vcl.Buttons, Constantes, uModuloDatos, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, SynEditHighlighter,
  SynHighlighterTeX, Vcl.ComCtrls, Utilidades, uTEditorLatex,
  SynHighlighterHtml;

type
  TFCrearEditarSeccion = class(TForm)
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    pTitulo: TPanel;
    dlgImagen: TOpenDialog;
    Query: TFDQuery;
    pContenido: TPanel;
    PaginaImagen: TPageControl;
    TabSheet1: TTabSheet;
    imagenSeccion: TImage;
    GroupBox1: TGroupBox;
    sbBuscarImagen: TSpeedButton;
    edImagen: TSynEdit;
    sTEX: TSynTeXSyn;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    edNombre: TEdit;
    GroupBox4: TGroupBox;
    edOrden: TEdit;
    paginaEditor: TPageControl;
    TabEditor: TTabSheet;
    seEditor: TSynEdit;
    SynHTMLSyn1: TSynHTMLSyn;
    procedure sbBuscarImagenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbGuardarClick(Sender: TObject);
  private
    FCargoImagen: boolean;
    FAccion: string;
    FIdImagen: string;
    FRespuesta: string;
    FCreoEdito: boolean;
    FIdRegistro: string;
    FIdProyecto: string;
    FRutaTrabajo: string;
    FImagen: string;

    procedure SetCargoImagen(const Value: boolean);
    procedure SetAccion(const Value: string);
    procedure SetIdImagen(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdRegistro(const Value: string);
    procedure SetRespuesta(const Value: string);
    procedure SetIdProyecto(const Value: string);
    procedure SetImagen(const Value: string);
    procedure SetRutaTrabajo(const Value: string);
    { Private declarations }
  public
    function cargar: boolean;

    function crear(IdProyecto: string; Orden: Integer): boolean;
    function editar(IdRegistro, IdProyecto: string): boolean;

    property IdImagen: string read FIdImagen write SetIdImagen;
    property Accion: string read FAccion write SetAccion;
    property CargoImagen: boolean read FCargoImagen write SetCargoImagen;
    property IdRegistro: string read FIdRegistro write SetIdRegistro;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
    property IdProyecto: string read FIdProyecto write SetIdProyecto;
    property RutaTrabajo: string read FRutaTrabajo write SetRutaTrabajo;
    property Imagen: string read FImagen write SetImagen;
  end;

var
  FCrearEditarSeccion: TFCrearEditarSeccion;

implementation

{$R *.dfm}

function TFCrearEditarSeccion.cargar: boolean;
begin
  FCargoImagen := false;
  ShowModal;

  result := FCargoImagen;
end;

function TFCrearEditarSeccion.crear(IdProyecto: string; Orden: Integer)
  : boolean;
begin
  FAccion := ACCION_CREAR;
  FCreoEdito := false;
  FIdProyecto := IdProyecto;
  edOrden.Text := IntToStr(Orden);
  FCargoImagen := false;
  seEditor.Lines.Clear;
  edNombre.Clear;
  ShowModal;
  result := FCreoEdito;
end;

function TFCrearEditarSeccion.editar(IdRegistro, IdProyecto: string): boolean;
begin
  FAccion := ACCION_EDITAR;
  FIdRegistro := IdRegistro;
  FIdProyecto := IdProyecto;
  FCreoEdito := false;
  FCargoImagen := false;
  ShowModal;
  result := FCreoEdito;
end;

procedure TFCrearEditarSeccion.FormShow(Sender: TObject);
begin
  width := round(0.8 * Screen.width);
  Height := round(0.8 * Screen.Height);
  PaginaImagen.width := round(0.4 * width);

  edNombre.Clear;
  edImagen.Lines.Clear;
  Utilidades.limpiarImagen(imagenSeccion);

  FRutaTrabajo := ModuloDatos.ConfigApp.RutaArchivos + '\Datos';
  Utilidades.validarDirectorio(FRutaTrabajo);
  FRutaTrabajo := FRutaTrabajo + '\Proyectos-Programacion';
  Utilidades.validarDirectorio(FRutaTrabajo);
  FRutaTrabajo := FRutaTrabajo + '\' + FIdProyecto;
  Utilidades.validarDirectorio(FRutaTrabajo);

  if Accion = ACCION_EDITAR then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM ManualUsuario WHERE IdRegistro=' + #39 +
      FIdRegistro + #39;
    Query.Open;

    edNombre.Text := Query.FieldByName('Nombre').AsString;
    edOrden.Text := Query.FieldByName('Orden').AsString;
    seEditor.Text := Query.FieldByName('Descripcion').AsString;
    edImagen.Text := FRutaTrabajo + '\' + Query.FieldByName('Imagen').AsString;

    FImagen := ExtractFileExt(edImagen.Text);

    if FileExists(edImagen.Text) then
      imagenSeccion.Picture.LoadFromFile(edImagen.Text);
  end;
end;

procedure TFCrearEditarSeccion.sbBuscarImagenClick(Sender: TObject);
begin
  if dlgImagen.Execute then
  begin
    FImagen := ExtractFileExt(dlgImagen.FileName);
    imagenSeccion.Picture.LoadFromFile(dlgImagen.FileName);
    edImagen.Text := dlgImagen.FileName;
    FCargoImagen := true;
  end;
end;

procedure TFCrearEditarSeccion.sbGuardarClick(Sender: TObject);
begin
  if FAccion = ACCION_CREAR then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO ManualUsuario (';
    Query.SQL.Add('IdRegistro, ');
    Query.SQL.Add('Nombre, ');
    Query.SQL.Add('Orden, ');
    Query.SQL.Add('Descripcion, ');
    Query.SQL.Add('Imagen, ');
    Query.SQL.Add('Tipo, ');
    Query.SQL.Add('IdProyecto');
    Query.SQL.Add(') VALUES (');
    Query.SQL.Add(':IdRegistro, ');
    Query.SQL.Add(':Nombre, ');
    Query.SQL.Add(':Orden, ');
    Query.SQL.Add(':Descripcion, ');
    Query.SQL.Add(':Imagen, ');
    Query.SQL.Add(':Tipo, ');
    Query.SQL.Add(':IdProyecto)');

    FIdRegistro := Utilidades.generarID;
    Query.Params.ParamByName('IdRegistro').Value := FIdRegistro;
    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Orden').Value := StrToInt(edOrden.Text);
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(seEditor.Lines);
    Query.Params.ParamByName('Imagen').Value := FIdRegistro + Imagen;
    Query.Params.ParamByName('Tipo').Value := 'Título';
    Query.Params.ParamByName('IdProyecto').Value := FIdProyecto;

    Query.ExecSQL;
    FRespuesta := 'La sección se creó correctamente';
    FCreoEdito := true;

    if FCargoImagen then
      imagenSeccion.Picture.SaveToFile(FRutaTrabajo + '\' + FIdRegistro
        + FImagen);

    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE ManualUsuario SET ';
    Query.SQL.Add('Nombre=:Nombre, ');
    Query.SQL.Add('Orden=:Orden, ');
    Query.SQL.Add('Descripcion=:Descripcion, ');
    Query.SQL.Add('Imagen=:Imagen, ');
    Query.SQL.Add('Tipo=:Tipo ');
    Query.SQL.Add('WHERE IdRegistro=' + #39 + IdRegistro + #39);

    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Orden').Value := StrToInt(edOrden.Text);
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(seEditor.Lines);
    Query.Params.ParamByName('Imagen').Value := FIdRegistro + Imagen;
    Query.Params.ParamByName('Tipo').Value := 'Título';

    Query.ExecSQL;
    FRespuesta := 'La sección se actualizó correctamente';
    FCreoEdito := true;

    if FCargoImagen then
      imagenSeccion.Picture.SaveToFile(FRutaTrabajo + '\' + FIdRegistro
        + FImagen);
    Close;
  end;
end;

procedure TFCrearEditarSeccion.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarSeccion.SetCargoImagen(const Value: boolean);
begin
  FCargoImagen := Value;
end;

procedure TFCrearEditarSeccion.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarSeccion.SetIdImagen(const Value: string);
begin
  FIdImagen := Value;
end;

procedure TFCrearEditarSeccion.SetIdProyecto(const Value: string);
begin
  FIdProyecto := Value;
end;

procedure TFCrearEditarSeccion.SetIdRegistro(const Value: string);
begin
  FIdRegistro := Value;
end;

procedure TFCrearEditarSeccion.SetImagen(const Value: string);
begin
  FImagen := Value;
end;

procedure TFCrearEditarSeccion.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

procedure TFCrearEditarSeccion.SetRutaTrabajo(const Value: string);
begin
  FRutaTrabajo := Value;
end;

end.
