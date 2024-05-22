unit uFCrearEditarPlataformaDesarrollo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, SynEditHighlighter,
  SynHighlighterTeX, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, SynEdit, Vcl.ComCtrls, Vcl.ExtDlgs,
  Constantes, Utilidades, uModuloDatos;

type
  TFCrearEditarPlataformaDesarrollo = class(TForm)
    dlgImagen: TOpenPictureDialog;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edDescripcion: TSynEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    imgInst: TImage;
    pCargar: TPanel;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    edNombre: TEdit;
    pTitulo: TPanel;
    Query: TFDQuery;
    SynTeXSyn1: TSynTeXSyn;
    procedure pCargarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbGuardarClick(Sender: TObject);
  private
    FRespuesta: string;
    FAccion: string;
    FIdProyecto: string;
    FRutaTrabajo: string;
    FImagen: string;
    FCreoEdito: boolean;
    FIdRegistro: string;
    FCargoImagen: boolean;
    FDesdePlantilla: boolean;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdProyecto(const Value: string);
    procedure SetIdRegistro(const Value: string);
    procedure SetImagen(const Value: string);
    procedure SetRespuesta(const Value: string);
    procedure SetRutaTrabajo(const Value: string);
    procedure SetDesdePlantilla(const Value: boolean);
    { Private declarations }
  public
    function crear(IdProyecto: string): boolean;
    function editar(IdPlataforma, IdProyecto: string): boolean;
    function crearDesdePlantilla(IdProyecto, Nombre, Descripcion,
      rutaImagen: string): boolean;

    property Accion: string read FAccion write SetAccion;
    property IdPlataforma: string read FIdRegistro write SetIdRegistro;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
    property Imagen: string read FImagen write SetImagen;
    property IdProyecto: string read FIdProyecto write SetIdProyecto;
    property RutaTrabajo: string read FRutaTrabajo write SetRutaTrabajo;
    property DesdePlantilla: boolean read FDesdePlantilla
      write SetDesdePlantilla;
  end;

var
  FCrearEditarPlataformaDesarrollo: TFCrearEditarPlataformaDesarrollo;

implementation

{$R *.dfm}

function TFCrearEditarPlataformaDesarrollo.crear(IdProyecto: string): boolean;
begin
  FAccion := ACCION_CREAR;
  FIdProyecto := IdProyecto;
  FCreoEdito := false;
  FCargoImagen := false;

  ShowModal;
  result := FCreoEdito;
end;

function TFCrearEditarPlataformaDesarrollo.crearDesdePlantilla(IdProyecto,
  Nombre, Descripcion, rutaImagen: string): boolean;
begin
  FAccion := ACCION_CREAR;
  FIdProyecto := IdProyecto;
  FCreoEdito := false;
  FImagen := ExtractFileExt(rutaImagen);
  imgInst.Picture.LoadFromFile(rutaImagen);
  FCargoImagen := true;
  edDescripcion.Text := Descripcion;
  edNombre.Text := Nombre;
  FDesdePlantilla := true;

  ShowModal;
  result := FCreoEdito;
end;

function TFCrearEditarPlataformaDesarrollo.editar(IdPlataforma,
  IdProyecto: string): boolean;
begin
  FAccion := ACCION_EDITAR;
  FIdRegistro := IdPlataforma;
  FIdProyecto := IdProyecto;
  FCreoEdito := false;
  FCargoImagen := false;
  ShowModal;
  result := FCreoEdito;
end;

procedure TFCrearEditarPlataformaDesarrollo.FormShow(Sender: TObject);
begin
  Width := Round(0.7 * Screen.Width);
  Height := Round(0.7 * Screen.Height);

  FRutaTrabajo := ModuloDatos.ConfigApp.RutaArchivos + '\Datos';
  Utilidades.validarDirectorio(FRutaTrabajo);
  FRutaTrabajo := FRutaTrabajo + '\Proyectos-Programacion';
  Utilidades.validarDirectorio(FRutaTrabajo);
  FRutaTrabajo := FRutaTrabajo + '\' + FIdProyecto;
  Utilidades.validarDirectorio(FRutaTrabajo);

  if not DesdePlantilla then
  begin
    edNombre.Clear;
    edDescripcion.Lines.Clear;
    Utilidades.limpiarImagen(imgInst);
  end;

  if FAccion = ACCION_EDITAR then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM PlataformasDesarrollo WHERE IdPlataforma='
      + #39 + FIdRegistro + #39;
    Query.Open;

    edNombre.Text := Query.FieldByName('Nombre').AsString;
    edDescripcion.Text := Query.FieldByName('Descripcion').AsString;

    if FileExists(FRutaTrabajo + '\' + Query.FieldByName('Imagen').AsString)
    then
      imgInst.Picture.LoadFromFile(FRutaTrabajo + '\' +
        Query.FieldByName('Imagen').AsString);
  end;
end;

procedure TFCrearEditarPlataformaDesarrollo.pCargarClick(Sender: TObject);
begin
  if dlgImagen.Execute then
  begin
    FImagen := ExtractFileExt(dlgImagen.FileName);
    imgInst.Picture.LoadFromFile(dlgImagen.FileName);
    FCargoImagen := true;
  end;
end;

procedure TFCrearEditarPlataformaDesarrollo.sbGuardarClick(Sender: TObject);
var
  ruta: string;
begin
  if FAccion = ACCION_CREAR then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO PlataformasDesarrollo (';
    Query.SQL.Add('IdPlataforma, ');
    Query.SQL.Add('Nombre, ');
    Query.SQL.Add('Descripcion, ');
    Query.SQL.Add('Imagen, ');
    Query.SQL.Add('IdProyecto, ');
    Query.SQL.Add('IdUsuario) VALUES (');
    Query.SQL.Add(':IdPlataforma, ');
    Query.SQL.Add(':Nombre, ');
    Query.SQL.Add(':Descripcion, ');
    Query.SQL.Add(':Imagen, ');
    Query.SQL.Add(':IdProyecto, ');
    Query.SQL.Add(':IdUsuario)');

    IdPlataforma := Utilidades.generarID;
    Query.Params.ParamByName('IdPlataforma').Value := IdPlataforma;
    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('Imagen').Value := IdPlataforma + Imagen;
    Query.Params.ParamByName('IdProyecto').Value := IdProyecto;
    Query.Params.ParamByName('IdUsuario').Value := ModuloDatos.IdUsuario;

    Query.ExecSQL;
    FRespuesta := 'La plataforma/IDE se creó correctamente';
    FCreoEdito := true;

    if FCargoImagen then
      imgInst.Picture.SaveToFile(FRutaTrabajo + '\' + FIdRegistro + FImagen);
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE PlataformasDesarrollo SET ';
    Query.SQL.Add('Nombre=:Nombre, ');
    Query.SQL.Add('Descripcion=:Descripcion, ');
    Query.SQL.Add('Imagen=:Imagen ');
    Query.SQL.Add('WHERE IdPlataforma=' + #39 + FIdRegistro + #39);

    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('Imagen').Value := IdPlataforma + Imagen;

    Query.ExecSQL;
    FRespuesta := 'La plataforma/IDE se actualizó correctamente';
    FCreoEdito := true;

    if FCargoImagen then
      imgInst.Picture.SaveToFile(FRutaTrabajo + '\' + FIdRegistro + FImagen);
    Close;
  end;
end;

procedure TFCrearEditarPlataformaDesarrollo.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarPlataformaDesarrollo.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarPlataformaDesarrollo.SetDesdePlantilla
  (const Value: boolean);
begin
  FDesdePlantilla := Value;
end;

procedure TFCrearEditarPlataformaDesarrollo.SetIdProyecto(const Value: string);
begin
  FIdProyecto := Value;
end;

procedure TFCrearEditarPlataformaDesarrollo.SetIdRegistro(const Value: string);
begin
  FIdRegistro := Value;
end;

procedure TFCrearEditarPlataformaDesarrollo.SetImagen(const Value: string);
begin
  FImagen := Value;
end;

procedure TFCrearEditarPlataformaDesarrollo.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

procedure TFCrearEditarPlataformaDesarrollo.SetRutaTrabajo(const Value: string);
begin
  FRutaTrabajo := Value;
end;

end.
