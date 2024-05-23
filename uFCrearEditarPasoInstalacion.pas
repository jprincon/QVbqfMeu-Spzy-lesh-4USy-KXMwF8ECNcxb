{Este formulario permite crear o editar un paso de instalación. Es decir
permite crear un item explicando uno de los pasos de instalación. En este
formulario se deben agregar, título, descripción, orden e imagen.}
unit uFCrearEditarPasoInstalacion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.ExtCtrls, SynEdit,
  Vcl.ComCtrls, Vcl.Buttons, Constantes, Utilidades, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uModuloDatos,
  Vcl.StdCtrls, SynEditHighlighter, SynHighlighterTeX;

type
  TFCrearEditarPasoInstalacion = class(TForm)
    pTitulo: TPanel;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edDescripcion: TSynEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    imgInst: TImage;
    pCargar: TPanel;
    dlgImagen: TOpenPictureDialog;
    Query: TFDQuery;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    edTitulo: TEdit;
    GroupBox2: TGroupBox;
    edOrden: TEdit;
    SynTeXSyn1: TSynTeXSyn;
    procedure sbGuardarClick(Sender: TObject);
    procedure pCargarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FRespuesta: string;
    FAccion: string;
    FCreoEdito: boolean;
    FIdRegistro: string;
    FImagen: string;
    FIdProyecto: string;
    FRutaTrabajo: string;
    FCargoImagen: boolean;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdRegistro(const Value: string);
    procedure SetRespuesta(const Value: string);
    procedure SetImagen(const Value: string);
    procedure SetIdProyecto(const Value: string);
    procedure SetRutaTrabajo(const Value: string);
    procedure SetCargoImagen(const Value: boolean);
    { Private declarations }
  public

    function crear(IdProyecto: string; Orden: integer): boolean;
    function editar(IdRegistro, IdProyecto: string): boolean;
    function crearDesdePlantilla(IdProyecto: string; descripcion: TStringList;
      nombre, ruta: string; Orden: integer): boolean;

    property Accion: string read FAccion write SetAccion;
    property IdRegistro: string read FIdRegistro write SetIdRegistro;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
    property Imagen: string read FImagen write SetImagen;
    property IdProyecto: string read FIdProyecto write SetIdProyecto;
    property RutaTrabajo: string read FRutaTrabajo write SetRutaTrabajo;
    property CargoImagen: boolean read FCargoImagen write SetCargoImagen;
  end;

var
  FCrearEditarPasoInstalacion: TFCrearEditarPasoInstalacion;

implementation

{$R *.dfm}

function TFCrearEditarPasoInstalacion.crear(IdProyecto: string;
  Orden: integer): boolean;
begin
  FAccion := ACCION_CREAR;
  FRespuesta := '';
  FIdProyecto := IdProyecto;
  FCreoEdito := false;
  FCargoImagen := false;

  edOrden.Text := IntToStr(Orden);
  ShowModal;
  result := FCreoEdito;
end;

function TFCrearEditarPasoInstalacion.crearDesdePlantilla(IdProyecto: string;
  descripcion: TStringList; nombre, ruta: string; Orden: integer): boolean;
begin
  FRespuesta := 'Editando';
  edTitulo.Text := nombre;
  edDescripcion.Lines.Clear;
  edDescripcion.Lines.AddStrings(descripcion);
  edOrden.Text := IntToStr(Orden);
  FAccion := ACCION_CREAR;
  FIdProyecto := IdProyecto;

  if FileExists(ruta) then
  begin
    imgInst.Picture.LoadFromFile(ruta);
    FImagen := ExtractFileExt(ruta);
    FCargoImagen := true;
  end;

  ShowModal;

  result := FCreoEdito;
end;

function TFCrearEditarPasoInstalacion.editar(IdRegistro,
  IdProyecto: string): boolean;
begin
  FAccion := ACCION_EDITAR;
  FIdRegistro := IdRegistro;
  FIdProyecto := IdProyecto;
  FCreoEdito := false;
  FCargoImagen := false;
  ShowModal;
  result := FCreoEdito;
end;

procedure TFCrearEditarPasoInstalacion.FormShow(Sender: TObject);
begin
  Width := Round(0.7 * Screen.Width);
  Height := Round(0.7 * Screen.Height);

  FRutaTrabajo := ModuloDatos.ConfigApp.RutaArchivos + '\Datos';
  Utilidades.validarDirectorio(FRutaTrabajo);
  FRutaTrabajo := FRutaTrabajo + '\Proyectos-Programacion';
  Utilidades.validarDirectorio(FRutaTrabajo);
  FRutaTrabajo := FRutaTrabajo + '\' + FIdProyecto;
  Utilidades.validarDirectorio(FRutaTrabajo);

  if FRespuesta = '' then
  begin
    edTitulo.Clear;
    edDescripcion.Lines.Clear;
    Utilidades.limpiarImagen(imgInst);
  end;

  if FAccion = ACCION_EDITAR then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM PasosInstalacion WHERE IdRegistro=' + #39 +
      FIdRegistro + #39;
    Query.Open;

    edOrden.Text := Query.FieldByName('Orden').AsString;
    edTitulo.Text := Query.FieldByName('Titulo').AsString;
    edDescripcion.Text := Query.FieldByName('Descripcion').AsString;

    if FileExists(FRutaTrabajo + '\' + Query.FieldByName('Imagen').AsString)
    then
      imgInst.Picture.LoadFromFile(FRutaTrabajo + '\' +
        Query.FieldByName('Imagen').AsString);
  end;
end;

procedure TFCrearEditarPasoInstalacion.pCargarClick(Sender: TObject);
begin
  if dlgImagen.Execute then
  begin
    FImagen := ExtractFileExt(dlgImagen.FileName);
    imgInst.Picture.LoadFromFile(dlgImagen.FileName);
    FCargoImagen := true;
  end;
end;

procedure TFCrearEditarPasoInstalacion.sbGuardarClick(Sender: TObject);
var
  ruta: string;
begin
  if FAccion = ACCION_CREAR then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO PasosInstalacion (';
    Query.SQL.Add('IdRegistro, ');
    Query.SQL.Add('Titulo, ');
    Query.SQL.Add('Orden, ');
    Query.SQL.Add('Descripcion, ');
    Query.SQL.Add('Imagen, ');
    Query.SQL.Add('IdProyecto) VALUES (');
    Query.SQL.Add(':IdRegistro, ');
    Query.SQL.Add(':Titulo, ');
    Query.SQL.Add(':Orden, ');
    Query.SQL.Add(':Descripcion, ');
    Query.SQL.Add(':Imagen, ');
    Query.SQL.Add(':IdProyecto)');

    IdRegistro := Utilidades.generarID;
    Query.Params.ParamByName('IdRegistro').Value := IdRegistro;
    Query.Params.ParamByName('Titulo').Value := edTitulo.Text;
    Query.Params.ParamByName('Orden').Value := StrToInt(edOrden.Text);
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('Imagen').Value := IdRegistro + Imagen;
    Query.Params.ParamByName('IdProyecto').Value := IdProyecto;

    Query.ExecSQL;
    FRespuesta := 'El paso se creó correctamente';
    FCreoEdito := true;

    if FCargoImagen then
      imgInst.Picture.SaveToFile(FRutaTrabajo + '\' + FIdRegistro + FImagen);
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE PasosInstalacion SET ';
    Query.SQL.Add('Titulo=:Titulo, ');
    Query.SQL.Add('Orden=:Orden, ');
    Query.SQL.Add('Descripcion=:Descripcion, ');
    Query.SQL.Add('Imagen=:Imagen ');
    Query.SQL.Add('WHERE IdRegistro=' + #39 + FIdRegistro + #39);

    Query.Params.ParamByName('Titulo').Value := edTitulo.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('Orden').Value := StrToInt(edOrden.Text);
    Query.Params.ParamByName('Imagen').Value := IdRegistro + Imagen;

    Query.ExecSQL;
    FRespuesta := 'El paso se actualizó correctamente';
    FCreoEdito := true;

    if FCargoImagen then
      imgInst.Picture.SaveToFile(FRutaTrabajo + '\' + FIdRegistro + FImagen);
    Close;
  end;
end;

procedure TFCrearEditarPasoInstalacion.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarPasoInstalacion.SetCargoImagen(const Value: boolean);
begin
  FCargoImagen := Value;
end;

procedure TFCrearEditarPasoInstalacion.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarPasoInstalacion.SetIdProyecto(const Value: string);
begin
  FIdProyecto := Value;
end;

procedure TFCrearEditarPasoInstalacion.SetIdRegistro(const Value: string);
begin
  FIdRegistro := Value;
end;

procedure TFCrearEditarPasoInstalacion.SetImagen(const Value: string);
begin
  FImagen := Value;
end;

procedure TFCrearEditarPasoInstalacion.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

procedure TFCrearEditarPasoInstalacion.SetRutaTrabajo(const Value: string);
begin
  FRutaTrabajo := Value;
end;

end.
