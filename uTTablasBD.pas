{Esta unidad contiene la definición de la clase TTablasBD que permite
crear tablas en la una base de datos y actualizar los atributos}
unit uTTablasBD;

interface

uses classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, Vcl.Graphics,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, dialogs, System.SysUtils, Winapi.Windows;

type
  TTablasBD = class(tobject)
  private
    Tablas: TStringList;
    FConexion: TFDConnection;
    Query: TFDQuery;
    FNombreTabla: string;
    procedure setConexion(const Value: TFDConnection);
  public
    constructor create;
    destructor destroy; override;

    procedure obtenerTablas;
    procedure crearActualizarTabla;
    procedure iniciarTabla(nombre: string);
    procedure agregarAtributo(ss: string);
    procedure agregarColumna(columna: string; tabla, tipo: string);

    function existeColumnaString(columna, tabla: string): boolean;
    function existeColumnaNumber(columna, tabla: string): boolean;
  published

    function generarColor: tcolor;
    property Conexion: TFDConnection read FConexion write setConexion;
  end;

  { Ejemplo de Creación de una tabla

    1. crear la variable

    gestorTablas: TTablasBD;

    2. implementarla en el OnCreate

    gestorTablas := TTablasBD.create;

    3. llamarla en el proceso de crearActualizarBaseDatos

    gestorTablas.Conexion := Conexion;
    gestorTablas.obtenerTablas;

    4. Crear una tabla particular

    gestorTablas.iniciarTabla('Usuarios');

    gestorTablas.agregarAtributo('IdUsuario String(255) primary key not null, ');
    gestorTablas.agregarAtributo('Nombre String(255), ');
    gestorTablas.agregarAtributo('Correo String(255), ');
    gestorTablas.agregarAtributo('Contra String(255)');

    gestorTablas.crearActualizarTabla;
  }

implementation

{ TTablasBD }

procedure TTablasBD.agregarAtributo(ss: string);
begin
  Query.SQL.Add(ss);
end;

procedure TTablasBD.agregarColumna(columna, tabla, tipo: string);
begin
  try
    Query.Close;
    Query.SQL.Text := 'ALTER TABLE ' + tabla + ' ADD ' + columna + ' ' +
      tipo + ';';
    Query.ExecSQL;
  except

  end;
end;

procedure TTablasBD.crearActualizarTabla;
begin
  try
    { Tabla de Proyectos }
    if Tablas.IndexOf(FNombreTabla) = -1 then
    begin
      Query.SQL.Add(');');

      Query.ExecSQL;
      Query.Close;

      // ShowMessage('Se creo la tabla: ' + FNombreTabla);
    end;
  except
    on E: Exception do
      MessageDlg(E.Message + ': crearActualizarTabla(' + FNombreTabla + ')',
        mtError, [mbyes], 0);
  end;
end;

constructor TTablasBD.create;
begin
  Tablas := TStringList.create;
  Query := TFDQuery.create(nil);
end;

destructor TTablasBD.destroy;
begin
  Tablas.Free;
  inherited destroy;
end;

function TTablasBD.existeColumnaNumber(columna, tabla: string): boolean;
begin
  try
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM ' + tabla + ' WHERE ' + columna + '=-1';
    Query.Open;
    result := true;
  except
    result := false;
  end;
end;

function TTablasBD.existeColumnaString(columna, tabla: string): boolean;
begin
  try
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM ' + tabla + ' WHERE ' + columna + #39 +
      '0' + #39;
    Query.Open;
    result := true;
  except
    result := false;
  end;
end;

function TTablasBD.generarColor: tcolor;
var
  r, g, b: byte;
begin
  r := Random(256);
  g := Random(256);
  b := Random(256);

  result := RGB(r, g, b);
end;

procedure TTablasBD.iniciarTabla(nombre: string);
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('CREATE TABLE ' + nombre + ' (');
  FNombreTabla := nombre;
end;

procedure TTablasBD.obtenerTablas;
begin
  FConexion.GetTableNames('', '', '', Tablas, [osMy], [tkTable], true);
end;

procedure TTablasBD.setConexion(const Value: TFDConnection);
begin
  FConexion := Value;
  Query.Connection := FConexion;
end;

end.
