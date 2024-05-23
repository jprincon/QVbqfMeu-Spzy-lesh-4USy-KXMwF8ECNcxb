{Este formulario tiene el objetivo de crear o editar la información de un
autor de proyecto. Se piden nombres, correo, biografía y fotografía del autor}
unit uFCrearEditarAutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, SynEdit, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Constantes, Utilidades, uModuloDatos, Vcl.Imaging.pngimage;

type
  TFCrearEditarAutor = class(TForm)
    pTitulo: TPanel;
    pBoton: TPanel;
    sbGuardar: TSpeedButton;
    Query: TFDQuery;
    pContenido: TPanel;
    pDatos: TPanel;
    gbNombre: TGroupBox;
    edNombre: TEdit;
    gbCorreo: TGroupBox;
    edCorreo: TEdit;
    gbBiografia: TGroupBox;
    edBiografia: TSynEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    imgAutor: TImage;
    Panel3: TPanel;
    Label1: TLabel;
    dlgImagen: TOpenDialog;
    GroupBox1: TGroupBox;
    edOrden: TEdit;
    procedure sbGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure leerFotografia(Sender: TObject);
  private
    FRespuesta: string;
    FAccion: string;
    FCreoEdito: boolean;
    FIdAutor: string;
    FIdProyecto: string;
    FCargoImagen: boolean;
    FExtensionImagen: string;
    FRutaFotografia: string;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdAutor(const Value: string);
    procedure SetRespuesta(const Value: string);
    procedure SetIdProyecto(const Value: string);
    procedure SetExtensionImagen(const Value: string);
    procedure SetRutaFotografia(const Value: string);
    { Private declarations }
  public
    procedure guardarFotografiaAutor(ruta: string);

    function crearEditar(accion, IdAutor, IdProyecto: string): boolean;

    property accion: string read FAccion write SetAccion;
    property IdAutor: string read FIdAutor write SetIdAutor;
    property IdProyecto: string read FIdProyecto write SetIdProyecto;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
    property CargoImagen: boolean read FCargoImagen;
    property ExtensionImagen: string read FExtensionImagen
      write SetExtensionImagen;
    property RutaFotografia: string read FRutaFotografia
      write SetRutaFotografia;
  end;

var
  FCrearEditarAutor: TFCrearEditarAutor;

implementation

{$R *.dfm}

function TFCrearEditarAutor.crearEditar(accion, IdAutor,
  IdProyecto: string): boolean;
begin
  FIdProyecto := IdProyecto;
  FIdAutor := IdAutor;
  FAccion := accion;
  FCreoEdito := false;
  FCargoImagen := false;

  edOrden.Clear;

  ShowModal;

  result := FCreoEdito;
end;

procedure TFCrearEditarAutor.FormShow(Sender: TObject);
var
  ruta: string;
begin
  edNombre.Clear;
  edCorreo.Clear;
  edBiografia.Lines.Clear;

  Utilidades.limpiarImagen(imgAutor);

  if FAccion = ACCION_EDITAR then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM AutoresProyecto WHERE IdAutor=' + #39 +
      FIdAutor + #39;
    Query.Open;

    edCorreo.Text := Query.FieldByName('Correo').AsString;
    edNombre.Text := Query.FieldByName('Nombre').AsString;
    edOrden.Text := Query.FieldByName('Orden').AsString;
    edBiografia.Text := Query.FieldByName('Biografia').AsString;

    if FileExists(FRutaFotografia) then
      imgAutor.Picture.LoadFromFile(RutaFotografia);
  end;
end;

procedure TFCrearEditarAutor.guardarFotografiaAutor(ruta: string);
begin
  imgAutor.Picture.SaveToFile(ruta);
end;

procedure TFCrearEditarAutor.leerFotografia(Sender: TObject);
begin
  if dlgImagen.Execute then
  begin
    imgAutor.Picture.LoadFromFile(dlgImagen.FileName);
    FExtensionImagen := ExtractFileExt(dlgImagen.FileName);
    FCargoImagen := true;
  end;
end;

procedure TFCrearEditarAutor.sbGuardarClick(Sender: TObject);
begin
  if FAccion = ACCION_CREAR then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO AutoresProyecto (';
    Query.SQL.Add('IdAutor, ');
    Query.SQL.Add('Nombre, ');
    Query.SQL.Add('Correo, ');
    Query.SQL.Add('Orden, ');
    Query.SQL.Add('Fotografia, ');
    Query.SQL.Add('Biografia, ');
    Query.SQL.Add('IdProyecto) VALUES (');
    Query.SQL.Add(':IdAutor, ');
    Query.SQL.Add(':Nombre, ');
    Query.SQL.Add(':Correo, ');
    Query.SQL.Add(':Orden, ');
    Query.SQL.Add(':Fotografia, ');
    Query.SQL.Add(':Biografia, ');
    Query.SQL.Add(':IdProyecto)');

    FIdAutor := Utilidades.generarID;
    Query.Params.ParamByName('IdAutor').Value := FIdAutor;
    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Correo').Value := edCorreo.Text;
    Query.Params.ParamByName('Orden').Value := StrToInt(edOrden.Text);
    Query.Params.ParamByName('Fotografia').Value := FIdAutor + FExtensionImagen;
    Query.Params.ParamByName('Biografia').AsWideMemo :=
      Utilidades.StringsToText(edBiografia.Lines);
    Query.Params.ParamByName('IdProyecto').Value := FIdProyecto;

    Query.ExecSQL;
    FRespuesta := 'El autor se creó correctamente';
    FCreoEdito := true;
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE AutoresProyecto SET ';
    Query.SQL.Add('Nombre=:Nombre, ');
    Query.SQL.Add('Correo=:Correo, ');
    Query.SQL.Add('Orden=:Orden, ');
    Query.SQL.Add('Fotografia=:Fotografia, ');
    Query.SQL.Add('Biografia=:Biografia ');
    Query.SQL.Add('WHERE IdAutor=' + #39 + IdAutor + #39);

    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Correo').Value := edCorreo.Text;
    Query.Params.ParamByName('Orden').Value := StrToInt(edOrden.Text);
    Query.Params.ParamByName('Fotografia').Value := FIdAutor + FExtensionImagen;
    Query.Params.ParamByName('Biografia').AsWideMemo :=
      Utilidades.StringsToText(edBiografia.Lines);

    Query.ExecSQL;
    FRespuesta := 'Los datos del autor se actualizaron correctamente';
    FCreoEdito := true;
    Close;
  end;
end;

procedure TFCrearEditarAutor.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarAutor.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarAutor.SetExtensionImagen(const Value: string);
begin
  FExtensionImagen := Value;
end;

procedure TFCrearEditarAutor.SetIdAutor(const Value: string);
begin
  FIdAutor := Value;
end;

procedure TFCrearEditarAutor.SetIdProyecto(const Value: string);
begin
  FIdProyecto := Value;
end;

procedure TFCrearEditarAutor.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

procedure TFCrearEditarAutor.SetRutaFotografia(const Value: string);
begin
  FRutaFotografia := Value;
end;

end.
