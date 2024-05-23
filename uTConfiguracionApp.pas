{Esta corresponde a una unidad donde se define la clase TConfiguracionApp}
unit uTConfiguracionApp;

interface

uses
  Classes, Inifiles, WinApi.Windows, WinApi.Winsock, shlobj,
  System.SysUtils, FireDAC.Comp.Client, Constantes, dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, Vcl.ComCtrls,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, Data.DB, Utilidades;

type

  TConfiguracionApp = class(TObject)
  private
    Config: TIniFile;
    FRutaTrabajo: string;
    FRutaBD: string;
    FNombreApp: string;
    FConexion: TFDConnection;
    FVersion: string;
    FSubaplicacion: string;
    FRutaArchivos: string;
    Query: TFDQuery;
    FIdUsuario: string;
    procedure SetRutaBD(const Value: string);
    procedure SetRutaTrabajo(const Value: string);
    procedure validarRutaDirectorio(ruta: string);

    function getDocumentsFolder: String;
    function getAppdataFolder: String;

    function getWindowsFolder(Folder: Integer): String;
    procedure guardarRecursoDirectorio(recurso, directorio: string);
    procedure SetConexion(const Value: TFDConnection);
    procedure SetRutaArchivos(const Value: string);
    procedure SetIdUsuario(const Value: string);
    procedure SetSubaplicacion(const Value: string);
  public
    constructor create;
    destructor destroy; override;

    function version: string;
    function getAppData: string;

    procedure ConfigurarAplicacion(nombre: string); overload;
    procedure ConfigurarAplicacion(nombre, subaplicacion,
      version: string); overload;

    procedure actualizarRutaBD(ruta: string);

    procedure registrarReciente(nombre, IdTabla: string);
    procedure leerRecientes(lista: TListView);

    procedure NoMostrarMensajeBienvenida;
    function MostrarMensajeBienvenida: boolean;
  published
    property RutaTrabajo: string read FRutaTrabajo write SetRutaTrabajo;
    property RutaBD: string read FRutaBD write SetRutaBD;
    property RutaArchivos: string read FRutaArchivos write SetRutaArchivos;

    property Conexion: TFDConnection read FConexion write SetConexion;
    property IdUsuario: string read FIdUsuario write SetIdUsuario;

    property subaplicacion: string read FSubaplicacion write SetSubaplicacion;
  end;

implementation

{ TConfiguracionApp }

procedure TConfiguracionApp.actualizarRutaBD(ruta: string);
begin

  FRutaBD := ruta;
  FRutaArchivos := ExtractFileDir(ruta);

  Config.WriteString(S_CONFIGURACION, V_RUTA_BD, FRutaBD);
  Config.WriteString(S_CONFIGURACION, V_RUTA_ARCHIVOS, FRutaArchivos);

  FConexion.Connected := false;
  FConexion.Params.Database := FRutaBD;
  FConexion.Params.Password := 'donmatematicas';
  FConexion.Connected := true;
end;

procedure TConfiguracionApp.ConfigurarAplicacion(nombre, subaplicacion,
  version: string);
begin
  FVersion := version;
  FSubaplicacion := subaplicacion;
  ConfigurarAplicacion(nombre);
end;

constructor TConfiguracionApp.create;
begin
  Query := TFDQuery.create(nil);
end;

procedure TConfiguracionApp.ConfigurarAplicacion(nombre: string);
begin
  FNombreApp := nombre;

  FRutaTrabajo := ExtractFilePath(ParamStr(0));
  validarRutaDirectorio(FRutaTrabajo);

  FRutaBD := FRutaTrabajo + 'DataBase.mdb';
  FRutaArchivos := FRutaTrabajo;

  if FRutaBD = '' then
  begin
    FRutaBD := FRutaTrabajo + '\DataBase.mdb';
    if not FileExists(FRutaBD) then
      guardarRecursoDirectorio('BD_JARINCON_APPS', FRutaBD);
  end;

  try
    FConexion.Params.Database := FRutaBD;
    FConexion.Params.Password := 'donmatematicas';
    FConexion.Connected := true;
  except
    on E: Exception do
      ShowMessage('Debe configurar la ruta de archivos y la base de datos');
  end;
end;

destructor TConfiguracionApp.destroy;
begin

  Config.Free;
  inherited destroy;
end;

function TConfiguracionApp.getAppData: string;
begin
  Result := getWindowsFolder(CSIDL_APPDATA);
end;

function TConfiguracionApp.getAppdataFolder: String;
begin
  Result := getWindowsFolder(CSIDL_APPDATA);
end;

function TConfiguracionApp.getDocumentsFolder: String;
begin
  Result := getWindowsFolder(CSIDL_PERSONAL);
end;

function TConfiguracionApp.getWindowsFolder(Folder: Integer): String;
var
  sFolder: PItemIDList;
  SpecialPath: array [0 .. MAX_PATH] of char;
begin
  SHGetSpecialFolderLocation(0, Folder, sFolder);
  SHGetPathFromIDList(sFolder, SpecialPath);
  Result := StrPas(SpecialPath);

  { CSIDL_APPDATA: carpeta de "datos de programas".
    CSIDL_COMMON_FAVORITES: carpeta de "Favoritos" común a todos los usuarios.
    CSIDL_COMMON_STARTMENU: carpeta del "Menú Inicio" común a todos los usuarios.
    CSIDL_COMMON_PROGRAMS: carpeta "Programas" del menú Inicio común a todos los usuarios.
    CSIDL_COMMON_STARTUP: carpeta "Inicio" dentro de "Inicio|Programas" común a todos los usuarios.
    CSIDL_COMMON_DESKTOPDIRECTORY: carpeta "Escritorio" común a todos los usuarios.
    CSIDL_COOKIES: carpeta donde se almacenan las cookies de Internet Explorer.
    CSIDL_DESKTOP: "Escritorio" del usuario activo.
    CSIDL_DESKTOPDIRECTORY: lo mismo que el anterior.
    CSIDL_FAVORITES: carpeta "Favoritos" del usuario activo.
    CSIDL_FONTS: carpeta donde se almacenan las fuentes (fonts).
    CSIDL_HISTORY: carpeta que contienen el historial de Internet Explorer.
    CSIDL_INTERNET_CACHE: carpeta donde se almacenan los archivos temporales de Internet Explorer.
    CSIDL_NETHOOD: carpeta de �Entorno de Red" del usuario activo.
    CSIDL_PERSONAL: carpeta de "Mis Documentos" del usuario activo.
    CSIDL_PRINTHOOD: carpeta donde se almacenan las impresoras.
    CSIDL_PROGRAMS: carpeta "Programas" del menú Inicio del usuario activo.
    CSIDL_RECENT: carpeta donde se almacenan un enlace a los ficheros abiertos recientemente.
    CSIDL_SENDTO: carpeta donde se encuentran los accesos de "Enviar a".
    CSIDL_STARTMENU: carpeta del "Menú Inicio" del usuario activo.
    CSIDL_STARTUP: carpeta "Inicio" de Inicio|Programas del usuario activo.
    CSIDL_TEMPLATES: carpeta de plantillas de documentos de Windows. }
end;

procedure TConfiguracionApp.guardarRecursoDirectorio(recurso,
  directorio: string);
var
  Recursos: TResourceStream;
begin
  Recursos := TResourceStream.create(HInstance, recurso, RT_RCDATA);
  Recursos.SaveToFile(directorio);
end;

procedure TConfiguracionApp.leerRecientes(lista: TListView);
var
  i, n: Integer;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM ProyectosProgramacion WHERE IdUsuario=' + #39
    + FIdUsuario + #39 + ' ORDER BY Titulo';
  Query.Open;
  Query.first;

  n := Query.RecordCount;
  if n > 10 then
    n := 10;

  lista.Items.Clear;

  for i := 1 to n do
  begin
    with lista.Items.Add do
    begin
      Caption := Query.FieldByName('Titulo').AsString;
      SubItems.Add(Query.FieldByName('IdProyecto').AsString);
      ImageIndex := 0;
    end;

    Query.Next;
  end;
end;

function TConfiguracionApp.MostrarMensajeBienvenida: boolean;
begin
  Result := Config.ReadBool('Configuracion', 'Bienvenida', false);
end;

procedure TConfiguracionApp.NoMostrarMensajeBienvenida;
begin
  Config.WriteBool('Configuracion', 'Bienvenida', true);
end;

procedure TConfiguracionApp.registrarReciente(nombre, IdTabla: string);
var
  freq: Integer;
  IdRegistro: string;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM Recientes WHERE IdTabla=' + #39 +
    IdTabla + #39;
  Query.Open;

  if Query.RecordCount = 1 then
  begin
    freq := Query.FieldByName('Frecuencia').AsInteger;
    IdRegistro := Query.FieldByName('IdRegistro').AsString;

    Query.Close;
    Query.SQL.Text := 'UPDATE Recientes SET ' +
      'Frecuencia=:Frecuencia WHERE IdRegistro=' + #39 + IdRegistro + #39;
    Query.Params.ParamByName('Frecuencia').Value := freq;
    Query.ExecSQL;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO Recientes (';
    Query.SQL.Add('IdRegistro, ');
    Query.SQL.Add('Nombre, ');
    Query.SQL.Add('IDTabla, ');
    Query.SQL.Add('Frecuencia, ');
    Query.SQL.Add('Aplicacion, ');
    Query.SQL.Add('IdUsuario) VALUES (');
    Query.SQL.Add(':IdRegistro, ');
    Query.SQL.Add(':Nombre, ');
    Query.SQL.Add(':IDTabla, ');
    Query.SQL.Add(':Frecuencia, ');
    Query.SQL.Add(':Aplicacion, ');
    Query.SQL.Add(':IdUsuario)');

    Query.Params.ParamByName('IdRegistro').Value := Utilidades.generarID;
    Query.Params.ParamByName('Nombre').Value := nombre;
    Query.Params.ParamByName('IDTabla').Value := IdTabla;
    Query.Params.ParamByName('Frecuencia').Value := 1;
    Query.Params.ParamByName('Aplicacion').Value := FSubaplicacion;
    Query.Params.ParamByName('IdUsuario').Value := FIdUsuario;

    Query.ExecSQL;
  end;
end;

procedure TConfiguracionApp.SetConexion(const Value: TFDConnection);
begin
  FConexion := Value;
  Query.Connection := FConexion;
end;

procedure TConfiguracionApp.SetIdUsuario(const Value: string);
begin
  FIdUsuario := Value;
end;

procedure TConfiguracionApp.SetRutaArchivos(const Value: string);
begin
  FRutaArchivos := Value;
end;

procedure TConfiguracionApp.SetRutaBD(const Value: string);
begin
  FRutaBD := Value;
end;

procedure TConfiguracionApp.SetRutaTrabajo(const Value: string);
begin
  FRutaTrabajo := Value;
end;

procedure TConfiguracionApp.SetSubaplicacion(const Value: string);
begin
  FSubaplicacion := Value;
end;

procedure TConfiguracionApp.validarRutaDirectorio(ruta: string);
begin
  if not DirectoryExists(ruta) then
    CreateDir(ruta);
end;

function TConfiguracionApp.version: string;
begin
  Result := FSubaplicacion + ' - v. ' + FVersion;
end;

end.
