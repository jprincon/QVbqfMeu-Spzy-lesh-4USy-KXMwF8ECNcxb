{Este formulario muestra las actualizaciones que se han desarrollado en el software}
unit uFActualizaciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  contnrs, Utilidades;

type
  TActualizacion = class(Tobject)
  private
    FLista: TStringList;
    FFecha: TDate;
    procedure SetFecha(const Value: TDate);
  public
    constructor create(Fecha: TDate);
    destructor destroy; override;

    procedure agregarDescripcion(desc: string);
    procedure addDesc(desc: string);
    procedure add(desc: string);

    function cantidadDescripciones: integer;
    function obtenerDescripcion(ID: integer): string;
  published
    property Fecha: TDate read FFecha write SetFecha;
  end;

  TFActualizaciones = class(TForm)
    pTitulo: TPanel;
    Navegador: TWebBrowser;
    procedure FormCreate(Sender: Tobject);
  private
    listaActualizaciones: TObjectList;
  public
    procedure limpiar;
    procedure MostrarActualizaciones(software: string); overload;
    procedure MostrarActualizaciones(software, version: string); overload;
    function Actualizacion(Fecha: TDate): TActualizacion;
    function obtenerActualizacion(ID: integer): TActualizacion;
  end;

var
  FActualizaciones: TFActualizaciones;

implementation

{$R *.dfm}
{ TActualizacion }

procedure TActualizacion.add(desc: string);
begin
  FLista.add(desc);
end;

procedure TActualizacion.addDesc(desc: string);
begin
  FLista.add(desc);
end;

procedure TActualizacion.agregarDescripcion(desc: string);
begin
  FLista.add(desc);
end;

function TActualizacion.cantidadDescripciones: integer;
begin
  result := FLista.Count;
end;

constructor TActualizacion.create(Fecha: TDate);
begin
  FFecha := Fecha;
  FLista := TStringList.create;
end;

destructor TActualizacion.destroy;
begin
  FLista.Free;
  inherited destroy;
end;

function TActualizacion.obtenerDescripcion(ID: integer): string;
begin
  result := FLista[ID];
end;

procedure TActualizacion.SetFecha(const Value: TDate);
begin
  FFecha := Value;
end;

{ TFActualizaciones }

function TFActualizaciones.Actualizacion(Fecha: TDate): TActualizacion;
var
  Act: TActualizacion;
begin
  Act := TActualizacion.create(Fecha);
  listaActualizaciones.add(Act);

  result := Act;
end;

procedure TFActualizaciones.FormCreate(Sender: Tobject);
begin
  listaActualizaciones := TObjectList.create;
end;

procedure TFActualizaciones.limpiar;
begin
  listaActualizaciones.Clear;
end;

procedure TFActualizaciones.MostrarActualizaciones(software, version: string);
begin
  MostrarActualizaciones(software + ' ' + version);
end;

procedure TFActualizaciones.MostrarActualizaciones(software: string);
var
  Pagina, Actual: TStringList;
  Encoding: TEncoding;
  i, j, Cantidad: integer;
  ruta: string;
  Act: TActualizacion;
begin
  Position := poScreenCenter;
  Pagina := TStringList.create;
  Actual := TStringList.create;

  Cantidad := 0;
  for i := 1 to listaActualizaciones.Count do
  begin
    Act := obtenerActualizacion(i - 1);

    Actual.add('    <h3>Actualización del ' + Utilidades.FechaToDescripcion
      (Act.Fecha) + '</h3>');
    Actual.add('    ');
    Actual.add('    <ol>');
    for j := 1 to Act.cantidadDescripciones do
    begin
      Actual.add('         <li>' + Act.obtenerDescripcion(j - 1) + '</li>');
      Inc(Cantidad);
    end;
    Actual.add('    </ol>');
  end;

  With Pagina do
  begin
    add('<!doctype html>');
    add('<html lang="en">');
    add('  <head>');
    add('    <meta charset="utf-8">');
    add('    <meta name="viewport" content="width=device-width, initial-scale=1">');
    add('');
    add('<style>');
    add('        body {');
    add('            font-family: ' + #39 + 'Segoe UI' + #39 +
      ', Tahoma, Geneva, Verdana, sans-serif !important;');
    add('            margin: 100px !important;');
    add('            text-align: justify;');
    add('            font-size: 24px;');
    add('        }');
    add('');
    add('        pre {');
    add('            color: blue;');
    add('        }');
    add('    </style>');
    add('');
    add('    <title>Actualizaciones del Sistema</title>');
    add('  </head>');
    add('  <body>');
    add('    <h1>Actualizaciones del Sistema (' + IntToStr(Cantidad) +
      ' Actualizaciones)</h1>');
    add('    <h2>' + software + '</h2>');
    add('    <hr>');
    add('    ');

    AddStrings(Actual);

    add('  </body>');
    add('</html>');
  end;

  Encoding := TUTF8Encoding.create;
  ruta := ExtractFilePath(ParamStr(0)) + 'Datos';
  ruta := Utilidades.validarDirectorio(ruta);
  ruta := ruta + '\Actualizaciones.html';
  Pagina.SaveToFile(ruta, Encoding);
  Navegador.Navigate(ruta);

  ShowModal;
end;

function TFActualizaciones.obtenerActualizacion(ID: integer): TActualizacion;
begin
  result := (listaActualizaciones.Items[ID] as TActualizacion);
end;

end.
