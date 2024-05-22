unit uTProyectoProgramacion;

interface

uses

  Classes, FireDAC.Stan.Intf, Vcl.StdCtrls, Synedit, Contnrs, Vcl.ComCtrls,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Utilidades,
  System.SysUtils, Winapi.Windows, Winapi.ShlObj;

type

  TAutorProyecto = class(TObject)
  private
    FCorreo: string;
    FBiografia: string;
    FNombre: string;
    FIdAutor: string;
    FFotografia: string;
    procedure SetBiografia(const Value: string);
    procedure SetCorreo(const Value: string);
    procedure SetNombre(const Value: string);
    procedure SetIdAutor(const Value: string);
    procedure SetFotografia(const Value: string);
  public
    constructor create;
    destructor destroy; override;
  published
    property IdAutor: string read FIdAutor write SetIdAutor;
    property Nombre: string read FNombre write SetNombre;
    property Correo: string read FCorreo write SetCorreo;
    property Biografia: string read FBiografia write SetBiografia;
    property Fotografia: string read FFotografia write SetFotografia;
  end;

  TPasoInstalacion = class(TObject)
  private
    FTitulo: string;
    FImagen: string;
    FOrden: integer;
    FDescripcion: string;
    FIdRegistro: string;
    FRutaImagen: string;
    procedure SetDescripcion(const Value: string);
    procedure SetImagen(const Value: string);
    procedure SetOrden(const Value: integer);
    procedure SetTitulo(const Value: string);
    procedure SetIdRegistro(const Value: string);
    procedure SetRutaImagen(const Value: string);

  public
    constructor create;
    destructor destroy; override;
  published
    property Orden: integer read FOrden write SetOrden;
    property Titulo: string read FTitulo write SetTitulo;
    property Descripcion: string read FDescripcion write SetDescripcion;
    property Imagen: string read FImagen write SetImagen;
    property RutaImagen: string read FRutaImagen write SetRutaImagen;
    property IdRegistro: string read FIdRegistro write SetIdRegistro;
  end;

  TPlataformaDesarrollo = class(TObject)
  private
    FRutaImagen: string;
    FImagen: string;
    FIdPlataforma: string;
    FNombre: string;
    FDescripcion: string;
    procedure SetDescripcion(const Value: string);
    procedure SetIdPlataforma(const Value: string);
    procedure SetImagen(const Value: string);
    procedure SetNombre(const Value: string);
    procedure SetRutaImagen(const Value: string);
  public
    constructor create;
    destructor destroy; override;
  published
    property IdPlataforma: string read FIdPlataforma write SetIdPlataforma;
    property Nombre: string read FNombre write SetNombre;
    property Descripcion: string read FDescripcion write SetDescripcion;
    property Imagen: string read FImagen write SetImagen;
    property RutaImagen: string read FRutaImagen write SetRutaImagen;
  end;

  TModuloCodigo = class(TObject)
  private
    FIdModulo: string;
    FDescripcion: string;
    FModulo: string;
    procedure SetDescripcion(const Value: string);
    procedure SetIdModulo(const Value: string);
    procedure SetModulo(const Value: string);
  public
    constructor create;
    destructor destroy; override;
  published
    property IdModulo: string read FIdModulo write SetIdModulo;
    property Modulo: string read FModulo write SetModulo;
    property Descripcion: string read FDescripcion write SetDescripcion;
  end;

  TArchivoCodigo = class(TObject)
  private
    FNombre: string;
    FIdCodigo: string;
    FDescripcion: string;
    FLenguaje: string;
    FRuta: string;
    procedure SetDescripcion(const Value: string);
    procedure SetIdCodigo(const Value: string);
    procedure SetNombre(const Value: string);
    procedure SetLenguaje(const Value: string);
    procedure SetRuta(const Value: string);
  public
  published
    property IdCodigo: string read FIdCodigo write SetIdCodigo;
    property Nombre: string read FNombre write SetNombre;
    property Descripcion: string read FDescripcion write SetDescripcion;
    property Lenguaje: string read FLenguaje write SetLenguaje;
    property Ruta: string read FRuta write SetRuta;
  end;

  TSeccionManual = class(TObject)
  private
    FImagen: string;
    FIdRegistro: string;
    FOrden: integer;
    FNombre: string;
    FTipo: string;
    FDescripcion: string;
    FRutaImagen: string;
    procedure SetDescripcion(const Value: string);
    procedure SetIdRegistro(const Value: string);
    procedure SetImagen(const Value: string);
    procedure SetNombre(const Value: string);
    procedure SetOrden(const Value: integer);
    procedure SetTipo(const Value: string);
    procedure SetRutaImagen(const Value: string);
  public
  published
    property IdRegistro: string read FIdRegistro write SetIdRegistro;
    property Nombre: string read FNombre write SetNombre;
    property Orden: integer read FOrden write SetOrden;
    property Descripcion: string read FDescripcion write SetDescripcion;
    property Imagen: string read FImagen write SetImagen;
    property RutaImagen: string read FRutaImagen write SetRutaImagen;
    property Tipo: string read FTipo write SetTipo;
  end;

  TFuncionalidad = class(TObject)
  private
    FIdFuncionalidad: string;
    FFuncionalidad: string;
    FDescripcion: string;
    FValor: string;
    FIdTipo: string;
    FTipo: string;
    procedure SetDescripcion(const Value: string);
    procedure SetFuncionalidad(const Value: string);
    procedure SetIdFuncionalidad(const Value: string);
    procedure SetIdTipo(const Value: string);
    procedure SetValor(const Value: string);
    procedure SetTipo(const Value: string);
  public
    constructor create;
    destructor destroy; override;
  published
    property IdFuncionalidad: string read FIdFuncionalidad
      write SetIdFuncionalidad;
    property Funcionalidad: string read FFuncionalidad write SetFuncionalidad;
    property Descripcion: string read FDescripcion write SetDescripcion;
    property IdTipo: string read FIdTipo write SetIdTipo;
    property Valor: string read FValor write SetValor;
    property Tipo: string read FTipo write SetTipo;
  end;

  TProyectoProgramacion = class(TObject)
  private
    Query, QFunc: TFDQuery;
    FConexion: TFDConnection;
    FTitulo: string;
    FIdProyecto: string;
    FResumen: string;
    FAbierto: boolean;
    FGuardado: boolean;
    FEditorResumen: TSynEdit;
    FEditorTitulo: TEdit;
    FAutores: TObjectList;
    FFuncionalidades: TObjectList;
    FTablaAutores: TListView;
    FEditorPalabrasClave: TEdit;
    FPalabrasClave: string;
    FEditorFecha: TEdit;
    FEditorCiudad: TEdit;
    FEditorMouse: TEdit;
    FEditorFechaRegistro: TEdit;
    FEditorTeclado: TEdit;
    FEditorInternet: TEdit;
    FEditorSistemaOperativo: TEdit;
    FEditorDiscoDuro: TEdit;
    FEditorEscaner: TEdit;
    FEditorSubtitulo: TEdit;
    FEditorMicrofono: TEdit;
    FEditorPantalla: TEdit;
    FEditorVersion: TEdit;
    FEditorAltavoces: TEdit;
    FEditorImpresora: TEdit;
    FEditorRegistro: TEdit;
    FEditorMemoriaRam: TEdit;
    FEditorInstitucion: TEdit;
    FEscaner: string;
    FSubtitulo: string;
    FMicrofono: string;
    FPantalla: string;
    FVersion: string;
    FAltavoces: string;
    FImpresora: string;
    FRegistro: string;
    FMemoriaRam: string;
    FInstitucion: string;
    FFecha: string;
    FCiudad: string;
    FMouse: string;
    FFechaRegistro: string;
    FTeclado: string;
    FInternet: string;
    FSistemaOperativo: string;
    FDiscoDuro: string;
    FEditorLenguaje: TEdit;
    FEditorDisenoGrafico: TEdit;
    FDisenoGrafico: string;
    FLenguaje: string;
    FRutaTrabajo: string;
    FRutaArchivos: string;
    FTablaPasosInstalacion: TListView;
    FPasosInstalacion: TObjectList;
    FPlataformasDesarrollo: TObjectList;
    FTablaPlataformasDesarrollo: TListView;
    FEditorCodigoFuente: TEdit;
    FCodigoFuente: string;
    FTablaModulos: TListView;
    FModulos: TObjectList;
    FIdModuloSeleccionado: string;
    FArchivosCodigo: TObjectList;
    FTablaCodigo: TListView;
    FSecciones: TObjectList;
    FTablaSecciones: TListView;
    FRutaCompilacion: string;
    FEditorAportes: TSynEdit;
    FAportes: string;
    FTablaFuncionalidades: TListView;
    FEditorAImplementacion: TSynEdit;
    FEditorAnalisis: TSynEdit;
    FEditorValidacion: TSynEdit;
    FEditorAmbiente: TSynEdit;
    FEditorDiseno: TSynEdit;
    FEditorPlataforma: TSynEdit;
    FImplementacion: string;
    FPlataforma: string;
    FAnalisis: string;
    FValidacion: string;
    FAmbiente: string;
    FDiseno: string;
    procedure SetConexion(const Value: TFDConnection);
    procedure SetIdProyecto(const Value: string);
    procedure SetResumen(const Value: string);
    procedure SetTitulo(const Value: string);
    procedure SetAbierto(const Value: boolean);
    procedure SetGuardado(const Value: boolean);
    procedure SetEditorResumen(const Value: TSynEdit);
    procedure SetEditorTitulo(const Value: TEdit);
    procedure SetTablaAutores(const Value: TListView);
    procedure SetEditorPalabrasClave(const Value: TEdit);
    procedure SetPalabrasClave(const Value: string);
    procedure SetEditorAltavoces(const Value: TEdit);
    procedure SetEditorCiudad(const Value: TEdit);
    procedure SetEditorDiscoDuro(const Value: TEdit);
    procedure SetEditorEscaner(const Value: TEdit);
    procedure SetEditorFecha(const Value: TEdit);
    procedure SetEditorFechaRegistro(const Value: TEdit);
    procedure SetEditorImpresora(const Value: TEdit);
    procedure SetEditorInstitucion(const Value: TEdit);
    procedure SetEditorInternet(const Value: TEdit);
    procedure SetEditorMemoriaRam(const Value: TEdit);
    procedure SetEditorMicrofono(const Value: TEdit);
    procedure SetEditorMouse(const Value: TEdit);
    procedure SetEditorPantalla(const Value: TEdit);
    procedure SetEditorRegistro(const Value: TEdit);
    procedure SetEditorSistemaOperativo(const Value: TEdit);
    procedure SetEditorSubtitulo(const Value: TEdit);
    procedure SetEditorTeclado(const Value: TEdit);
    procedure SetEditorVersion(const Value: TEdit);
    procedure SetAltavoces(const Value: string);
    procedure SetCiudad(const Value: string);
    procedure SetDiscoDuro(const Value: string);
    procedure SetEscaner(const Value: string);
    procedure SetFecha(const Value: string);
    procedure SetFechaRegistro(const Value: string);
    procedure SetImpresora(const Value: string);
    procedure SetInstitucion(const Value: string);
    procedure SetInternet(const Value: string);
    procedure SetMemoriaRam(const Value: string);
    procedure SetMicrofono(const Value: string);
    procedure SetMouse(const Value: string);
    procedure SetPantalla(const Value: string);
    procedure SetRegistro(const Value: string);
    procedure SetSistemaOperativo(const Value: string);
    procedure SetSubtitulo(const Value: string);
    procedure SetTeclado(const Value: string);
    procedure SetVersion(const Value: string);
    procedure SetEditorDisenoGrafico(const Value: TEdit);
    procedure SetEditorLenguaje(const Value: TEdit);
    procedure SetDisenoGrafico(const Value: string);
    procedure SetLenguaje(const Value: string);
    procedure SetRutaTrabajo(const Value: string);
    procedure SetRutaArchivos(const Value: string);
    procedure SetTablaPasosInstalacion(const Value: TListView);
    procedure SetPasosInstalacion(const Value: TObjectList);
    procedure SetTablaPlataformasDesarrollo(const Value: TListView);
    procedure SetEditorCodigoFuente(const Value: TEdit);
    procedure SetCodigoFuente(const Value: string);
    procedure SetTablaModulos(const Value: TListView);
    procedure SetIdModuloSeleccionado(const Value: string);
    procedure SetTablaCodigo(const Value: TListView);
    procedure SetTablaSecciones(const Value: TListView);
    procedure SetRutaCompilacion(const Value: string);
    procedure SetEditorAportes(const Value: TSynEdit);
    procedure SetAportes(const Value: string);
    procedure SetTablaFuncionalidades(const Value: TListView);
    procedure SetEditorAImplementacion(const Value: TSynEdit);
    procedure SetEditorAmbiente(const Value: TSynEdit);
    procedure SetEditorAnalisis(const Value: TSynEdit);
    procedure SetEditorDiseno(const Value: TSynEdit);
    procedure SetEditorPlataforma(const Value: TSynEdit);
    procedure SetEditorValidacion(const Value: TSynEdit);
    procedure SetAmbiente(const Value: string);
    procedure SetAnalisis(const Value: string);
    procedure SetDiseno(const Value: string);
    procedure SetImplementacion(const Value: string);
    procedure SetPlataforma(const Value: string);
    procedure SetValidacion(const Value: string);
  public
    constructor create;
    destructor destroy; override;

    { Archivo }
    procedure leer(IdProyecto: string);
    function guardar: boolean;
    procedure actualizar;

    { Autores }
    procedure leerAutores;
    function obtenerAutor(Id: integer): TAutorProyecto;
    function obtenerAutoresCorto: string;
    function cantidadAutores: integer;

    { Pasos de Instalación }
    procedure leerPasosInstalacion;
    function obtenerPasoInstalacion(Id: integer): TPasoInstalacion;
    function cantidadPasosInstalacion: integer;

    { Plataformas de Desarrollo }
    procedure leerPlataformasDesarrollo;
    function obtenerPlataformaDesarrollo(Id: integer): TPlataformaDesarrollo;
    function cantidadPlataformasDesarrollo: integer;

    { Módulos del Código Fuente }
    procedure leerModulos;
    function obtenerModulo(Id: integer): TModuloCodigo;
    function cantidadModulos: integer;
    function leerArchivosCodigo(IdModulo: string; Orden: string): integer;
    function cantidadArchivosCodigo: integer;
    function obtenerArchivoCodigo(Id: integer): TArchivoCodigo;

    { Secciones del  Manual }
    procedure leerSeccionesManual;
    function obtenerSeccion(Id: integer): TSeccionManual;
    function cantidadSecciones: integer;
    procedure intercambiarOrden(IdSeccion1, IdSeccion2: string;
      ord1, ord2: integer);

    { Funcionalidades }
    procedure leerFuncionalidades;
    function obtenerFuncionalidad(Id: integer): TFuncionalidad;
    function cantidadFuncionalidades: integer;

    function getWindowsFolder(Folder: integer): String;

    procedure exportarArchivo(Nombre, Carpeta: string);
  published
    property Conexion: TFDConnection read FConexion write SetConexion;

    property PasosInstalacion: TObjectList read FPasosInstalacion
      write SetPasosInstalacion;

    property EditorTitulo: TEdit read FEditorTitulo write SetEditorTitulo;
    property EditorSubtitulo: TEdit read FEditorSubtitulo
      write SetEditorSubtitulo;
    property EditorInstitucion: TEdit read FEditorInstitucion
      write SetEditorInstitucion;
    property EditorCiudad: TEdit read FEditorCiudad write SetEditorCiudad;
    property EditorFecha: TEdit read FEditorFecha write SetEditorFecha;
    property EditorVersion: TEdit read FEditorVersion write SetEditorVersion;
    property EditorRegistro: TEdit read FEditorRegistro write SetEditorRegistro;
    property EditorDiscoDuro: TEdit read FEditorDiscoDuro
      write SetEditorDiscoDuro;
    property EditorMemoriaRam: TEdit read FEditorMemoriaRam
      write SetEditorMemoriaRam;
    property EditorMouse: TEdit read FEditorMouse write SetEditorMouse;
    property EditorTeclado: TEdit read FEditorTeclado write SetEditorTeclado;
    property EditorImpresora: TEdit read FEditorImpresora
      write SetEditorImpresora;
    property EditorEscaner: TEdit read FEditorEscaner write SetEditorEscaner;
    property EditorPantalla: TEdit read FEditorPantalla write SetEditorPantalla;
    property EditorMicrofono: TEdit read FEditorMicrofono
      write SetEditorMicrofono;
    property EditorAltavoces: TEdit read FEditorAltavoces
      write SetEditorAltavoces;
    property EditorSistemaOperativo: TEdit read FEditorSistemaOperativo
      write SetEditorSistemaOperativo;
    property EditorFechaRegistro: TEdit read FEditorFechaRegistro
      write SetEditorFechaRegistro;
    property EditorInternet: TEdit read FEditorInternet write SetEditorInternet;
    property EditorCodigoFuente: TEdit read FEditorCodigoFuente
      write SetEditorCodigoFuente;
    property EditorResumen: TSynEdit read FEditorResumen write SetEditorResumen;
    property EditorAportes: TSynEdit read FEditorAportes write SetEditorAportes;
    property EditorAnalisis: TSynEdit read FEditorAnalisis
      write SetEditorAnalisis;
    property EditorDiseno: TSynEdit read FEditorDiseno write SetEditorDiseno;
    property EditorAImplementacion: TSynEdit read FEditorAImplementacion
      write SetEditorAImplementacion;
    property EditorValidacion: TSynEdit read FEditorValidacion
      write SetEditorValidacion;
    property EditorPlataforma: TSynEdit read FEditorPlataforma
      write SetEditorPlataforma;
    property EditorAmbiente: TSynEdit read FEditorAmbiente
      write SetEditorAmbiente;
    property EditorPalabrasClave: TEdit read FEditorPalabrasClave
      write SetEditorPalabrasClave;
    property EditorLenguaje: TEdit read FEditorLenguaje write SetEditorLenguaje;
    property EditorDisenoGrafico: TEdit read FEditorDisenoGrafico
      write SetEditorDisenoGrafico;

    property Abierto: boolean read FAbierto write SetAbierto;
    property Guardado: boolean read FGuardado write SetGuardado;

    property IdProyecto: string read FIdProyecto write SetIdProyecto;
    property Resumen: string read FResumen write SetResumen;
    property Titulo: string read FTitulo write SetTitulo;
    property Aportes: string read FAportes write SetAportes;
    property Subtitulo: string read FSubtitulo write SetSubtitulo;
    property PalabrasClave: string read FPalabrasClave write SetPalabrasClave;
    property Institucion: string read FInstitucion write SetInstitucion;
    property Ciudad: string read FCiudad write SetCiudad;
    property Fecha: string read FFecha write SetFecha;
    property Version: string read FVersion write SetVersion;
    property Registro: string read FRegistro write SetRegistro;
    property FechaRegistro: string read FFechaRegistro write SetFechaRegistro;
    property SistemaOperativo: string read FSistemaOperativo
      write SetSistemaOperativo;
    property DiscoDuro: string read FDiscoDuro write SetDiscoDuro;
    property MemoriaRam: string read FMemoriaRam write SetMemoriaRam;
    property Mouse: string read FMouse write SetMouse;
    property Teclado: string read FTeclado write SetTeclado;
    property Impresora: string read FImpresora write SetImpresora;
    property Escaner: string read FEscaner write SetEscaner;
    property Pantalla: string read FPantalla write SetPantalla;
    property Microfono: string read FMicrofono write SetMicrofono;
    property Altavoces: string read FAltavoces write SetAltavoces;
    property Internet: string read FInternet write SetInternet;
    property DisenoGrafico: string read FDisenoGrafico write SetDisenoGrafico;
    property Lenguaje: string read FLenguaje write SetLenguaje;
    property CodigoFuente: string read FCodigoFuente write SetCodigoFuente;
    property Analisis: string read FAnalisis write SetAnalisis;
    property Diseno: string read FDiseno write SetDiseno;
    property Implementacion: string read FImplementacion
      write SetImplementacion;
    property Validacion: string read FValidacion write SetValidacion;
    property Plataforma: string read FPlataforma write SetPlataforma;
    property Ambiente: string read FAmbiente write SetAmbiente;

    property TablaSecciones: TListView read FTablaSecciones
      write SetTablaSecciones;
    property TablaArchivosCodigo: TListView read FTablaCodigo
      write SetTablaCodigo;
    property TablaModulos: TListView read FTablaModulos write SetTablaModulos;
    property TablaAutores: TListView read FTablaAutores write SetTablaAutores;
    property TablaPasosInstalacion: TListView read FTablaPasosInstalacion
      write SetTablaPasosInstalacion;
    property TablaPlataformasDesarrollo: TListView
      read FTablaPlataformasDesarrollo write SetTablaPlataformasDesarrollo;
    property TablaFuncionalidades: TListView read FTablaFuncionalidades
      write SetTablaFuncionalidades;
    property RutaTrabajo: string read FRutaTrabajo write SetRutaTrabajo;
    property RutaArchivos: string read FRutaArchivos write SetRutaArchivos;
    property RutaCompilacion: string read FRutaCompilacion
      write SetRutaCompilacion;

    property IdModuloSeleccionado: string read FIdModuloSeleccionado
      write SetIdModuloSeleccionado;
  end;

implementation

{ TProyectoProgramacion }

procedure TProyectoProgramacion.actualizar;
begin
  FTitulo := EditorTitulo.Text;
  FResumen := Utilidades.StringsToText(EditorResumen.Lines);
end;

function TProyectoProgramacion.cantidadArchivosCodigo: integer;
begin
  result := FArchivosCodigo.Count;
end;

function TProyectoProgramacion.cantidadAutores: integer;
begin
  result := FAutores.Count;
end;

function TProyectoProgramacion.cantidadFuncionalidades: integer;
begin
  result := FFuncionalidades.Count;
end;

function TProyectoProgramacion.cantidadModulos: integer;
begin
  result := FModulos.Count;
end;

function TProyectoProgramacion.cantidadPasosInstalacion: integer;
begin
  result := FPasosInstalacion.Count;
end;

function TProyectoProgramacion.cantidadPlataformasDesarrollo: integer;
begin
  result := FPlataformasDesarrollo.Count;
end;

function TProyectoProgramacion.cantidadSecciones: integer;
begin
  result := FSecciones.Count;
end;

constructor TProyectoProgramacion.create;
begin
  Query := TFDQuery.create(nil);
  QFunc := TFDQuery.create(nil);

  FAutores := TObjectList.create;
  FPasosInstalacion := TObjectList.create;
  FPlataformasDesarrollo := TObjectList.create;
  FModulos := TObjectList.create;
  FArchivosCodigo := TObjectList.create;
  FSecciones := TObjectList.create;
  FFuncionalidades := TObjectList.create;
end;

destructor TProyectoProgramacion.destroy;
begin

  Query.Free;
  FAutores.Free;
  FPasosInstalacion.Free;
  FPlataformasDesarrollo.Free;
  FModulos.Free;
  FArchivosCodigo.Free;

  inherited destroy;
end;

procedure TProyectoProgramacion.exportarArchivo(Nombre, Carpeta: string);
var
  ruta1, ruta2: string;
begin
  ruta1 := FRutaArchivos + '\' + Nombre;
  ruta2 := FRutaCompilacion + '\' + Carpeta;

  if not DirectoryExists(ruta2) then
    CreateDir(ruta2);

  ruta2 := ruta2 + '\' + Nombre;

  if FileExists(ruta1) then
    copyFile(pchar(ruta1), pchar(ruta2), true);
end;

function TProyectoProgramacion.getWindowsFolder(Folder: integer): String;
var
  sFolder: PItemIDList;
  SpecialPath: array [0 .. MAX_PATH] of char;
begin
  SHGetSpecialFolderLocation(0, Folder, sFolder);
  SHGetPathFromIDList(sFolder, SpecialPath);
  result := StrPas(SpecialPath);
end;

function TProyectoProgramacion.guardar: boolean;
begin
  try
    Query.Close;
    Query.SQL.Text := 'UPDATE ProyectosProgramacion SET ';
    Query.SQL.Add('Titulo=:Titulo, ');
    Query.SQL.Add('Subtitulo=:Subtitulo, ');
    Query.SQL.Add('Institucion=:Institucion, ');
    Query.SQL.Add('Resumen=:Resumen, ');
    Query.SQL.Add('Aportes=:Aportes, ');
    Query.SQL.Add('PalabrasClave=:PalabrasClave, ');
    Query.SQL.Add('Ciudad=:Ciudad, ');
    Query.SQL.Add('Fecha=:Fecha, ');
    Query.SQL.Add('Version=:Version, ');
    Query.SQL.Add('Registro=:Registro, ');
    Query.SQL.Add('FechaRegistro=:FechaRegistro, ');
    Query.SQL.Add('SistemaOperativo=:SistemaOperativo, ');
    Query.SQL.Add('DiscoDuro=:DiscoDuro, ');
    Query.SQL.Add('MemoriaRam=:MemoriaRam, ');
    Query.SQL.Add('Mouse=:Mouse, ');
    Query.SQL.Add('Teclado=:Teclado, ');
    Query.SQL.Add('Impresora=:Impresora, ');
    Query.SQL.Add('Escaner=:Escaner, ');
    Query.SQL.Add('Pantalla=:Pantalla, ');
    Query.SQL.Add('Microfono=:Microfono, ');
    Query.SQL.Add('Altavoces=:Altavoces, ');
    Query.SQL.Add('DisenoGrafico=:DisenoGrafico, ');
    Query.SQL.Add('Lenguaje=:Lenguaje, ');
    Query.SQL.Add('Internet=:Internet, ');
    Query.SQL.Add('Analisis=:Analisis, ');
    Query.SQL.Add('Diseno=:Diseno, ');
    Query.SQL.Add('Implementacion=:Implementacion, ');
    Query.SQL.Add('Validacion=:Validacion, ');
    Query.SQL.Add('Plataforma=:Plataforma, ');
    Query.SQL.Add('Ambiente=:Ambiente, ');
    Query.SQL.Add('CodigoFuente=:CodigoFuente ');
    Query.SQL.Add('WHERE IdProyecto=' + #39 + FIdProyecto + #39);

    Query.Params.ParamByName('Titulo').Value := EditorTitulo.Text;
    Query.Params.ParamByName('Subtitulo').Value := EditorSubtitulo.Text;
    Query.Params.ParamByName('Institucion').Value := EditorInstitucion.Text;
    Query.Params.ParamByName('Resumen').AsWideMemo :=
      Utilidades.StringsToText(EditorResumen.Lines);
    Query.Params.ParamByName('Aportes').AsWideMemo :=
      Utilidades.StringsToText(EditorAportes.Lines);
    Query.Params.ParamByName('PalabrasClave').Value := EditorPalabrasClave.Text;
    Query.Params.ParamByName('Ciudad').Value := EditorCiudad.Text;
    Query.Params.ParamByName('Fecha').Value := EditorFecha.Text;
    Query.Params.ParamByName('Version').Value := EditorVersion.Text;
    Query.Params.ParamByName('Registro').Value := EditorRegistro.Text;
    Query.Params.ParamByName('FechaRegistro').Value := EditorFechaRegistro.Text;
    Query.Params.ParamByName('SistemaOperativo').Value :=
      EditorSistemaOperativo.Text;
    Query.Params.ParamByName('DiscoDuro').Value := EditorDiscoDuro.Text;
    Query.Params.ParamByName('MemoriaRam').Value := EditorMemoriaRam.Text;
    Query.Params.ParamByName('Mouse').Value := EditorMouse.Text;
    Query.Params.ParamByName('Teclado').Value := EditorTeclado.Text;
    Query.Params.ParamByName('Impresora').Value := EditorImpresora.Text;
    Query.Params.ParamByName('Escaner').Value := EditorEscaner.Text;
    Query.Params.ParamByName('Pantalla').Value := EditorPantalla.Text;
    Query.Params.ParamByName('Microfono').Value := EditorMicrofono.Text;
    Query.Params.ParamByName('Altavoces').Value := EditorAltavoces.Text;
    Query.Params.ParamByName('Internet').Value := EditorInternet.Text;
    Query.Params.ParamByName('CodigoFuente').Value := EditorCodigoFuente.Text;
    Query.Params.ParamByName('DisenoGrafico').Value := EditorDisenoGrafico.Text;
    Query.Params.ParamByName('Lenguaje').Value := EditorLenguaje.Text;

    Query.Params.ParamByName('Analisis').AsWideMemo :=
      Utilidades.StringsToText(EditorAnalisis.Lines);
    Query.Params.ParamByName('Diseno').AsWideMemo :=
      Utilidades.StringsToText(EditorDiseno.Lines);
    Query.Params.ParamByName('Implementacion').AsWideMemo :=
      Utilidades.StringsToText(EditorAImplementacion.Lines);
    Query.Params.ParamByName('Validacion').AsWideMemo :=
      Utilidades.StringsToText(EditorValidacion.Lines);
    Query.Params.ParamByName('Plataforma').AsWideMemo :=
      Utilidades.StringsToText(EditorPlataforma.Lines);
    Query.Params.ParamByName('Ambiente').AsWideMemo :=
      Utilidades.StringsToText(EditorAmbiente.Lines);

    Query.ExecSQL;
  finally
    FGuardado := true;
    result := FGuardado;
  end;
end;

procedure TProyectoProgramacion.intercambiarOrden(IdSeccion1,
  IdSeccion2: string; ord1, ord2: integer);
begin
  Query.Close;
  Query.SQL.Text := 'UPDATE ManualUsuario SET Orden=:Orden ' +
    'WHERE IdRegistro=' + #39 + IdSeccion1 + #39;
  Query.Params.ParamByName('Orden').Value := ord2;
  Query.ExecSQL;

  Query.Close;
  Query.SQL.Text := 'UPDATE ManualUsuario SET Orden=:Orden ' +
    'WHERE IdRegistro=' + #39 + IdSeccion2 + #39;
  Query.Params.ParamByName('Orden').Value := ord1;
  Query.ExecSQL;

  leerSeccionesManual;
end;

procedure TProyectoProgramacion.leer(IdProyecto: string);
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM ProyectosProgramacion WHERE IdProyecto=' +
    #39 + IdProyecto + #39;
  Query.Open;

  FAbierto := true;

  FIdProyecto := Query.FieldByName('IdProyecto').AsString;
  FTitulo := Query.FieldByName('Titulo').AsString;
  FSubtitulo := Query.FieldByName('Subtitulo').AsString;
  FPalabrasClave := Query.FieldByName('PalabrasClave').AsString;
  FInstitucion := Query.FieldByName('Institucion').AsString;
  FCiudad := Query.FieldByName('Ciudad').AsString;
  FFecha := Query.FieldByName('Fecha').AsString;
  FVersion := Query.FieldByName('Version').AsString;
  FRegistro := Query.FieldByName('Registro').AsString;
  FFechaRegistro := Query.FieldByName('FechaRegistro').AsString;
  FSistemaOperativo := Query.FieldByName('SistemaOperativo').AsString;
  FDiscoDuro := Query.FieldByName('DiscoDuro').AsString;
  FMemoriaRam := Query.FieldByName('MemoriaRam').AsString;
  FMouse := Query.FieldByName('Mouse').AsString;
  FTeclado := Query.FieldByName('Teclado').AsString;
  FImpresora := Query.FieldByName('Impresora').AsString;
  FEscaner := Query.FieldByName('Escaner').AsString;
  FPantalla := Query.FieldByName('Pantalla').AsString;
  FMicrofono := Query.FieldByName('Microfono').AsString;
  FAltavoces := Query.FieldByName('Altavoces').AsString;
  FInternet := Query.FieldByName('Internet').AsString;
  FResumen := Query.FieldByName('Resumen').AsString;
  FDisenoGrafico := Query.FieldByName('DisenoGrafico').AsString;
  FLenguaje := Query.FieldByName('Lenguaje').AsString;
  FCodigoFuente := Query.FieldByName('CodigoFuente').AsString;
  FAportes := Query.FieldByName('Aportes').AsString;
  FAnalisis := Query.FieldByName('Analisis').AsString;
  FDiseno := Query.FieldByName('Diseno').AsString;
  FImplementacion := Query.FieldByName('Implementacion').AsString;
  FValidacion := Query.FieldByName('Validacion').AsString;
  FPlataforma := Query.FieldByName('Plataforma').AsString;
  FAmbiente := Query.FieldByName('Ambiente').AsString;

  EditorTitulo.Text := FTitulo;
  EditorSubtitulo.Text := FSubtitulo;
  EditorPalabrasClave.Text := FPalabrasClave;
  EditorInstitucion.Text := FInstitucion;
  EditorCiudad.Text := FCiudad;
  EditorFecha.Text := FFecha;
  EditorVersion.Text := FVersion;
  EditorRegistro.Text := FRegistro;
  EditorFechaRegistro.Text := FFechaRegistro;
  EditorSistemaOperativo.Text := FSistemaOperativo;
  EditorDiscoDuro.Text := FDiscoDuro;
  EditorMemoriaRam.Text := FMemoriaRam;
  EditorMouse.Text := FMouse;
  EditorTeclado.Text := FTeclado;
  EditorImpresora.Text := FImpresora;
  EditorEscaner.Text := FEscaner;
  EditorPantalla.Text := FPantalla;
  EditorMicrofono.Text := FMicrofono;
  EditorAltavoces.Text := FAltavoces;
  EditorInternet.Text := FInternet;
  EditorResumen.Text := FResumen;
  EditorDisenoGrafico.Text := FDisenoGrafico;
  EditorLenguaje.Text := FLenguaje;
  EditorCodigoFuente.Text := FCodigoFuente;
  EditorAportes.Text := FAportes;
  EditorAnalisis.Text := FAnalisis;
  EditorDiseno.Text := FDiseno;
  EditorAImplementacion.Text := FImplementacion;
  EditorValidacion.Text := FValidacion;
  EditorAmbiente.Text := FAmbiente;
  EditorPlataforma.Text := FPlataforma;

  // Actualizar la ruta de compilación
  FRutaCompilacion := getWindowsFolder(CSIDL_APPDATA) + '\JarinconApps';
  if not DirectoryExists(FRutaCompilacion) then
    CreateDir(FRutaCompilacion);
  FRutaCompilacion := FRutaCompilacion + '\' + FIdProyecto;
  if not DirectoryExists(FRutaCompilacion) then
    CreateDir(FRutaCompilacion);

  // Actualizar la ruta de archivos
  FRutaArchivos := FRutaTrabajo + '\Datos';
  if not DirectoryExists(FRutaArchivos) then
    CreateDir(FRutaArchivos);
  FRutaArchivos := FRutaArchivos + '\Proyectos-Programacion';
  if not DirectoryExists(FRutaArchivos) then
    CreateDir(FRutaArchivos);
  FRutaArchivos := FRutaArchivos + '\' + FIdProyecto;
  if not DirectoryExists(FRutaArchivos) then
    CreateDir(FRutaArchivos);
end;

function TProyectoProgramacion.leerArchivosCodigo(IdModulo: string;
  Orden: string): integer;
var
  i: integer;
  ArchivoCodigo: TArchivoCodigo;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM CodigoFuente WHERE IdModulo=' + #39 +
    IdModulo + #39 + ' ORDER BY ' + Orden;
  Query.Open;
  Query.First;

  FArchivosCodigo.Clear;
  TablaArchivosCodigo.Items.Clear;

  for i := 1 to Query.RecordCount do
  begin
    ArchivoCodigo := TArchivoCodigo.create;
    ArchivoCodigo.IdCodigo := Query.FieldByName('IdCodigo').AsString;
    ArchivoCodigo.Ruta := Query.FieldByName('Nombre').AsString;
    ArchivoCodigo.Nombre := ExtractFileName(Query.FieldByName('Nombre')
      .AsString);
    ArchivoCodigo.Descripcion := Query.FieldByName('Descripcion').AsString;
    ArchivoCodigo.Lenguaje := Query.FieldByName('Lenguaje').AsString;

    with TablaArchivosCodigo.Items.Add.SubItems do
    begin
      Add(IntToStr(i));
      Add(ArchivoCodigo.Nombre);
      Add(ArchivoCodigo.Lenguaje);
      Add(ArchivoCodigo.Descripcion);
      Add(ArchivoCodigo.IdCodigo);
    end;

    FArchivosCodigo.Add(ArchivoCodigo);
    Query.Next;
  end;

  result := Query.RecordCount;
end;

procedure TProyectoProgramacion.leerAutores;
var
  i: integer;
  Autor: TAutorProyecto;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM AutoresProyecto WHERE IdProyecto=' + #39 +
    FIdProyecto + #39 + ' ORDER BY Orden';
  Query.Open;
  Query.First;

  FAutores.Clear;
  FTablaAutores.Items.Clear;

  for i := 1 to Query.RecordCount do
  begin
    Autor := TAutorProyecto.create;

    Autor.IdAutor := Query.FieldByName('IdAutor').AsString;
    Autor.Nombre := Query.FieldByName('Nombre').AsString;
    Autor.Correo := Query.FieldByName('Correo').AsString;
    Autor.Biografia := Query.FieldByName('Biografia').AsString;
    Autor.Fotografia := Query.FieldByName('Fotografia').AsString;

    FAutores.Add(Autor);

    with FTablaAutores.Items.Add.SubItems do
    begin
      Add(IntToStr(i));
      Add(Autor.Nombre);
      Add(Autor.Correo);
      Add(Autor.IdAutor);
    end;

    Query.Next;
  end;
end;

procedure TProyectoProgramacion.leerFuncionalidades;
var
  i, Valor, suma: integer;
  Funcionalidad: TFuncionalidad;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM Funcionalidades WHERE IdProyecto=' + #39 +
    FIdProyecto + #39 + ' ORDER BY Funcionalidad';
  Query.Open;

  FTablaFuncionalidades.Items.Clear;
  FFuncionalidades.Clear;
  suma := 0;

  for i := 1 to Query.RecordCount do
  begin
    Funcionalidad := TFuncionalidad.create;
    Funcionalidad.IdFuncionalidad :=
      Query.FieldByName('IdFuncionalidad').AsString;
    Funcionalidad.Funcionalidad := Query.FieldByName('Funcionalidad').AsString;
    Funcionalidad.Descripcion := Query.FieldByName('Descripcion').AsString;

    QFunc.Close;
    QFunc.SQL.Text := 'SELECT * FROM TiposFuncionalidades WHERE IdTipo=' + #39 +
      Query.FieldByName('IdTipo').AsString + #39;
    QFunc.Open;

    Funcionalidad.Valor := QFunc.FieldByName('Valor').AsString;
    Funcionalidad.IdTipo := QFunc.FieldByName('IdTipo').AsString;
    Funcionalidad.Tipo := QFunc.FieldByName('Tipo').AsString;

    FFuncionalidades.Add(Funcionalidad);

    with FTablaFuncionalidades.Items.Add.SubItems do
    begin
      Add(IntToStr(i));
      Add(Funcionalidad.Funcionalidad);
      Add(Funcionalidad.Descripcion);
      Add(Funcionalidad.Tipo);

      Valor := StrToInt(Funcionalidad.Valor);
      suma := suma + Valor;
      Add(FloatToStrF(Valor, ffNumber, 12, 0));
      Add(Funcionalidad.IdFuncionalidad);
    end;
    Query.Next;
  end;

  FTablaFuncionalidades.Items.Add;

  with FTablaFuncionalidades.Items.Add.SubItems do
  begin
    Add('');
    Add('');
    Add('');
    Add('');

    Add(FloatToStrF(suma, ffNumber, 12, 0));
    Add('');
  end;
end;

procedure TProyectoProgramacion.leerModulos;
var
  Modulo: TModuloCodigo;
  i: integer;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM ModulosCodigo WHERE IdProyecto=' + #39 +
    FIdProyecto + #39;
  Query.Open;
  Query.First;

  TablaModulos.Items.Clear;
  FModulos.Clear;

  for i := 1 to Query.RecordCount do
  begin
    Modulo := TModuloCodigo.create;
    Modulo.IdModulo := Query.FieldByName('IdModulo').AsString;
    Modulo.Modulo := Query.FieldByName('Modulo').AsString;
    Modulo.Descripcion := Query.FieldByName('Descripcion').AsString;

    with TablaModulos.Items.Add.SubItems do
    begin
      Add(IntToStr(i));
      Add(Modulo.Modulo);
      Add(Modulo.Descripcion);
      Add(Modulo.IdModulo);
    end;

    FModulos.Add(Modulo);
    Query.Next;
  end;
end;

procedure TProyectoProgramacion.leerPasosInstalacion;
var
  i: integer;
  PasoInstalacion: TPasoInstalacion;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM PasosInstalacion WHERE IdProyecto=' + #39 +
    IdProyecto + #39 + ' ORDER BY Orden';
  Query.Open;
  Query.First;

  TablaPasosInstalacion.Items.Clear;
  FPasosInstalacion.Clear;

  for i := 1 to Query.RecordCount do
  begin
    PasoInstalacion := TPasoInstalacion.create;
    PasoInstalacion.Orden := Query.FieldByName('Orden').AsInteger;
    PasoInstalacion.Titulo := Query.FieldByName('Titulo').AsString;
    PasoInstalacion.Descripcion := Query.FieldByName('Descripcion').AsString;
    PasoInstalacion.Imagen := Query.FieldByName('Imagen').AsString;
    PasoInstalacion.RutaImagen := FRutaArchivos + '\' +
      Query.FieldByName('Imagen').AsString;
    PasoInstalacion.IdRegistro := Query.FieldByName('IdRegistro').AsString;

    FPasosInstalacion.Add(PasoInstalacion);

    with TablaPasosInstalacion.Items.Add.SubItems do
    begin
      Add(IntToStr(PasoInstalacion.Orden));
      Add(PasoInstalacion.Titulo);
      Add(PasoInstalacion.Descripcion);
      Add(PasoInstalacion.Imagen);
      Add(PasoInstalacion.IdRegistro);
    end;

    Query.Next;
  end;
end;

procedure TProyectoProgramacion.leerPlataformasDesarrollo;
var
  i: integer;
  Plataforma: TPlataformaDesarrollo;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM PlataformasDesarrollo WHERE IdProyecto=' +
    #39 + IdProyecto + #39 + ' ORDER BY Nombre';
  Query.Open;
  Query.First;

  FPlataformasDesarrollo.Clear;
  TablaPlataformasDesarrollo.Items.Clear;

  for i := 1 to Query.RecordCount do
  begin
    Plataforma := TPlataformaDesarrollo.create;
    Plataforma.IdPlataforma := Query.FieldByName('IdPlataforma').AsString;
    Plataforma.Nombre := Query.FieldByName('Nombre').AsString;
    Plataforma.Descripcion := Query.FieldByName('Descripcion').AsString;
    Plataforma.Imagen := Query.FieldByName('Imagen').AsString;
    Plataforma.RutaImagen := FRutaArchivos + '\' + Plataforma.Imagen;

    with TablaPlataformasDesarrollo.Items.Add.SubItems do
    begin
      Add(IntToStr(i));
      Add(Plataforma.Nombre);
      Add(Plataforma.Descripcion);
      Add(Plataforma.Imagen);
      Add(Plataforma.IdPlataforma);
    end;

    FPlataformasDesarrollo.Add(Plataforma);
    Query.Next;
  end;
end;

procedure TProyectoProgramacion.leerSeccionesManual;
var
  i: integer;
  Seccion: TSeccionManual;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM ManualUsuario WHERE IdProyecto=' + #39 +
    IdProyecto + #39 + ' ORDER BY Orden';
  Query.Open;
  Query.First;

  FSecciones.Clear;
  TablaSecciones.Items.Clear;

  for i := 1 to Query.RecordCount do
  begin
    Seccion := TSeccionManual.create;
    Seccion.IdRegistro := Query.FieldByName('IdRegistro').AsString;
    Seccion.Nombre := Query.FieldByName('Nombre').AsString;
    Seccion.Orden := Query.FieldByName('Orden').AsInteger;
    Seccion.Descripcion := Query.FieldByName('Descripcion').AsString;
    Seccion.Imagen := Query.FieldByName('Imagen').AsString;
    Seccion.RutaImagen := FRutaArchivos + '\' +
      Query.FieldByName('Imagen').AsString;
    Seccion.Tipo := Query.FieldByName('Tipo').AsString;

    FSecciones.Add(Seccion);

    with TablaSecciones.Items.Add.SubItems do
    begin
      Add(IntToStr(Seccion.Orden));
      Add(Seccion.Nombre);
      Add(Seccion.Descripcion);
      Add(Seccion.Imagen);
      Add(Seccion.IdRegistro);
      Add(IntToStr(Seccion.Orden));
    end;

    Query.Next;
  end;
end;

function TProyectoProgramacion.obtenerArchivoCodigo(Id: integer)
  : TArchivoCodigo;
begin
  result := (FArchivosCodigo.Items[Id] as TArchivoCodigo);
end;

function TProyectoProgramacion.obtenerAutor(Id: integer): TAutorProyecto;
begin
  result := (FAutores.Items[Id] as TAutorProyecto);
end;

function TProyectoProgramacion.obtenerAutoresCorto: string;
var
  nombres: TStringList;
  i: integer;
begin
  nombres := TStringList.create;
  nombres.Delimiter := ' ';

  result := '';

  for i := 1 to cantidadAutores do
  begin
    nombres.Clear;
    nombres.DelimitedText := obtenerAutor(i - 1).Nombre;

    if nombres.Count = 4 then
      result := result + nombres[0] + ' ' + nombres[2];

    if nombres.Count = 3 then
      result := result + nombres[0] + ' ' + nombres[1];

    if nombres.Count = 2 then
      result := result + nombres[0] + ' ' + nombres[1];

    if nombres.Count = 1 then
      result := result + nombres[0];

    if i <> cantidadAutores then
      result := result + ', ';
  end;
end;

function TProyectoProgramacion.obtenerFuncionalidad(Id: integer)
  : TFuncionalidad;
begin
  result := (FFuncionalidades.Items[Id] as TFuncionalidad);
end;

function TProyectoProgramacion.obtenerModulo(Id: integer): TModuloCodigo;
begin
  result := (FModulos.Items[Id] as TModuloCodigo);
end;

function TProyectoProgramacion.obtenerPasoInstalacion(Id: integer)
  : TPasoInstalacion;
begin
  result := (FPasosInstalacion.Items[Id] as TPasoInstalacion);
end;

function TProyectoProgramacion.obtenerPlataformaDesarrollo(Id: integer)
  : TPlataformaDesarrollo;
begin
  result := (FPlataformasDesarrollo.Items[Id] as TPlataformaDesarrollo);
end;

function TProyectoProgramacion.obtenerSeccion(Id: integer): TSeccionManual;
begin
  result := (FSecciones.Items[Id] as TSeccionManual);
end;

procedure TProyectoProgramacion.SetAbierto(const Value: boolean);
begin
  FAbierto := Value;
end;

procedure TProyectoProgramacion.SetAltavoces(const Value: string);
begin
  FAltavoces := Value;
end;

procedure TProyectoProgramacion.SetAmbiente(const Value: string);
begin
  FAmbiente := Value;
end;

procedure TProyectoProgramacion.SetAnalisis(const Value: string);
begin
  FAnalisis := Value;
end;

procedure TProyectoProgramacion.SetAportes(const Value: string);
begin
  FAportes := Value;
end;

procedure TProyectoProgramacion.SetCiudad(const Value: string);
begin
  FCiudad := Value;
end;

procedure TProyectoProgramacion.SetCodigoFuente(const Value: string);
begin
  FCodigoFuente := Value;
end;

procedure TProyectoProgramacion.SetConexion(const Value: TFDConnection);
begin
  FConexion := Value;
  Query.Connection := FConexion;
  QFunc.Connection := FConexion;
end;

procedure TProyectoProgramacion.SetDiscoDuro(const Value: string);
begin
  FDiscoDuro := Value;
end;

procedure TProyectoProgramacion.SetDiseno(const Value: string);
begin
  FDiseno := Value;
end;

procedure TProyectoProgramacion.SetDisenoGrafico(const Value: string);
begin
  FDisenoGrafico := Value;
end;

procedure TProyectoProgramacion.SetEditorAImplementacion(const Value: TSynEdit);
begin
  FEditorAImplementacion := Value;
end;

procedure TProyectoProgramacion.SetEditorAltavoces(const Value: TEdit);
begin
  FEditorAltavoces := Value;
end;

procedure TProyectoProgramacion.SetEditorAmbiente(const Value: TSynEdit);
begin
  FEditorAmbiente := Value;
end;

procedure TProyectoProgramacion.SetEditorAnalisis(const Value: TSynEdit);
begin
  FEditorAnalisis := Value;
end;

procedure TProyectoProgramacion.SetEditorAportes(const Value: TSynEdit);
begin
  FEditorAportes := Value;
end;

procedure TProyectoProgramacion.SetEditorCiudad(const Value: TEdit);
begin
  FEditorCiudad := Value;
end;

procedure TProyectoProgramacion.SetEditorCodigoFuente(const Value: TEdit);
begin
  FEditorCodigoFuente := Value;
end;

procedure TProyectoProgramacion.SetEditorDiscoDuro(const Value: TEdit);
begin
  FEditorDiscoDuro := Value;
end;

procedure TProyectoProgramacion.SetEditorDiseno(const Value: TSynEdit);
begin
  FEditorDiseno := Value;
end;

procedure TProyectoProgramacion.SetEditorDisenoGrafico(const Value: TEdit);
begin
  FEditorDisenoGrafico := Value;
end;

procedure TProyectoProgramacion.SetEditorEscaner(const Value: TEdit);
begin
  FEditorEscaner := Value;
end;

procedure TProyectoProgramacion.SetEditorFecha(const Value: TEdit);
begin
  FEditorFecha := Value;
end;

procedure TProyectoProgramacion.SetEditorFechaRegistro(const Value: TEdit);
begin
  FEditorFechaRegistro := Value;
end;

procedure TProyectoProgramacion.SetEditorImpresora(const Value: TEdit);
begin
  FEditorImpresora := Value;
end;

procedure TProyectoProgramacion.SetEditorInstitucion(const Value: TEdit);
begin
  FEditorInstitucion := Value;
end;

procedure TProyectoProgramacion.SetEditorInternet(const Value: TEdit);
begin
  FEditorInternet := Value;
end;

procedure TProyectoProgramacion.SetEditorLenguaje(const Value: TEdit);
begin
  FEditorLenguaje := Value;
end;

procedure TProyectoProgramacion.SetEditorMemoriaRam(const Value: TEdit);
begin
  FEditorMemoriaRam := Value;
end;

procedure TProyectoProgramacion.SetEditorMicrofono(const Value: TEdit);
begin
  FEditorMicrofono := Value;
end;

procedure TProyectoProgramacion.SetEditorMouse(const Value: TEdit);
begin
  FEditorMouse := Value;
end;

procedure TProyectoProgramacion.SetEditorPalabrasClave(const Value: TEdit);
begin
  FEditorPalabrasClave := Value;
end;

procedure TProyectoProgramacion.SetEditorPantalla(const Value: TEdit);
begin
  FEditorPantalla := Value;
end;

procedure TProyectoProgramacion.SetEditorPlataforma(const Value: TSynEdit);
begin
  FEditorPlataforma := Value;
end;

procedure TProyectoProgramacion.SetEditorRegistro(const Value: TEdit);
begin
  FEditorRegistro := Value;
end;

procedure TProyectoProgramacion.SetEditorResumen(const Value: TSynEdit);
begin
  FEditorResumen := Value;
end;

procedure TProyectoProgramacion.SetEditorSistemaOperativo(const Value: TEdit);
begin
  FEditorSistemaOperativo := Value;
end;

procedure TProyectoProgramacion.SetEditorSubtitulo(const Value: TEdit);
begin
  FEditorSubtitulo := Value;
end;

procedure TProyectoProgramacion.SetEditorTeclado(const Value: TEdit);
begin
  FEditorTeclado := Value;
end;

procedure TProyectoProgramacion.SetEditorTitulo(const Value: TEdit);
begin
  FEditorTitulo := Value;
end;

procedure TProyectoProgramacion.SetEditorValidacion(const Value: TSynEdit);
begin
  FEditorValidacion := Value;
end;

procedure TProyectoProgramacion.SetEditorVersion(const Value: TEdit);
begin
  FEditorVersion := Value;
end;

procedure TProyectoProgramacion.SetEscaner(const Value: string);
begin
  FEscaner := Value;
end;

procedure TProyectoProgramacion.SetFecha(const Value: string);
begin
  FFecha := Value;
end;

procedure TProyectoProgramacion.SetFechaRegistro(const Value: string);
begin
  FFechaRegistro := Value;
end;

procedure TProyectoProgramacion.SetGuardado(const Value: boolean);
begin
  FGuardado := Value;
end;

procedure TProyectoProgramacion.SetIdModuloSeleccionado(const Value: string);
begin
  FIdModuloSeleccionado := Value;
end;

procedure TProyectoProgramacion.SetIdProyecto(const Value: string);
begin
  FIdProyecto := Value;
end;

procedure TProyectoProgramacion.SetImplementacion(const Value: string);
begin
  FImplementacion := Value;
end;

procedure TProyectoProgramacion.SetImpresora(const Value: string);
begin
  FImpresora := Value;
end;

procedure TProyectoProgramacion.SetInstitucion(const Value: string);
begin
  FInstitucion := Value;
end;

procedure TProyectoProgramacion.SetInternet(const Value: string);
begin
  FInternet := Value;
end;

procedure TProyectoProgramacion.SetLenguaje(const Value: string);
begin
  FLenguaje := Value;
end;

procedure TProyectoProgramacion.SetMemoriaRam(const Value: string);
begin
  FMemoriaRam := Value;
end;

procedure TProyectoProgramacion.SetMicrofono(const Value: string);
begin
  FMicrofono := Value;
end;

procedure TProyectoProgramacion.SetMouse(const Value: string);
begin
  FMouse := Value;
end;

procedure TProyectoProgramacion.SetPalabrasClave(const Value: string);
begin
  FPalabrasClave := Value;
end;

procedure TProyectoProgramacion.SetPantalla(const Value: string);
begin
  FPantalla := Value;
end;

procedure TProyectoProgramacion.SetPasosInstalacion(const Value: TObjectList);
begin
  FPasosInstalacion := Value;
end;

procedure TProyectoProgramacion.SetPlataforma(const Value: string);
begin
  FPlataforma := Value;
end;

procedure TProyectoProgramacion.SetRegistro(const Value: string);
begin
  FRegistro := Value;
end;

procedure TProyectoProgramacion.SetResumen(const Value: string);
begin
  FResumen := Value;
end;

procedure TProyectoProgramacion.SetRutaArchivos(const Value: string);
begin
  FRutaArchivos := Value;
end;

procedure TProyectoProgramacion.SetRutaCompilacion(const Value: string);
begin
  FRutaCompilacion := Value;
end;

procedure TProyectoProgramacion.SetRutaTrabajo(const Value: string);
begin
  FRutaTrabajo := Value;
end;

procedure TProyectoProgramacion.SetSistemaOperativo(const Value: string);
begin
  FSistemaOperativo := Value;
end;

procedure TProyectoProgramacion.SetSubtitulo(const Value: string);
begin
  FSubtitulo := Value;
end;

procedure TProyectoProgramacion.SetTablaAutores(const Value: TListView);
begin
  FTablaAutores := Value;
end;

procedure TProyectoProgramacion.SetTablaCodigo(const Value: TListView);
begin
  FTablaCodigo := Value;
end;

procedure TProyectoProgramacion.SetTablaFuncionalidades(const Value: TListView);
begin
  FTablaFuncionalidades := Value;
end;

procedure TProyectoProgramacion.SetTablaModulos(const Value: TListView);
begin
  FTablaModulos := Value;
end;

procedure TProyectoProgramacion.SetTablaPasosInstalacion
  (const Value: TListView);
begin
  FTablaPasosInstalacion := Value;
end;

procedure TProyectoProgramacion.SetTablaPlataformasDesarrollo
  (const Value: TListView);
begin
  FTablaPlataformasDesarrollo := Value;
end;

procedure TProyectoProgramacion.SetTablaSecciones(const Value: TListView);
begin
  FTablaSecciones := Value;
end;

procedure TProyectoProgramacion.SetTeclado(const Value: string);
begin
  FTeclado := Value;
end;

procedure TProyectoProgramacion.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

procedure TProyectoProgramacion.SetValidacion(const Value: string);
begin
  FValidacion := Value;
end;

procedure TProyectoProgramacion.SetVersion(const Value: string);
begin
  FVersion := Value;
end;

{ TAutorProyecto }

constructor TAutorProyecto.create;
begin

end;

destructor TAutorProyecto.destroy;
begin

  inherited destroy;
end;

procedure TAutorProyecto.SetBiografia(const Value: string);
begin
  FBiografia := Value;
end;

procedure TAutorProyecto.SetCorreo(const Value: string);
begin
  FCorreo := Value;
end;

procedure TAutorProyecto.SetFotografia(const Value: string);
begin
  FFotografia := Value;
end;

procedure TAutorProyecto.SetIdAutor(const Value: string);
begin
  FIdAutor := Value;
end;

procedure TAutorProyecto.SetNombre(const Value: string);
begin
  FNombre := Value;
end;

{ TPasoInstalacion }

constructor TPasoInstalacion.create;
begin

end;

destructor TPasoInstalacion.destroy;
begin

  inherited destroy;
end;

procedure TPasoInstalacion.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure TPasoInstalacion.SetIdRegistro(const Value: string);
begin
  FIdRegistro := Value;
end;

procedure TPasoInstalacion.SetImagen(const Value: string);
begin
  FImagen := Value;
end;

procedure TPasoInstalacion.SetOrden(const Value: integer);
begin
  FOrden := Value;
end;

procedure TPasoInstalacion.SetRutaImagen(const Value: string);
begin
  FRutaImagen := Value;
end;

procedure TPasoInstalacion.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

{ TPlataformaDesarrollo }

constructor TPlataformaDesarrollo.create;
begin

end;

destructor TPlataformaDesarrollo.destroy;
begin

  inherited destroy;
end;

procedure TPlataformaDesarrollo.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure TPlataformaDesarrollo.SetIdPlataforma(const Value: string);
begin
  FIdPlataforma := Value;
end;

procedure TPlataformaDesarrollo.SetImagen(const Value: string);
begin
  FImagen := Value;
end;

procedure TPlataformaDesarrollo.SetNombre(const Value: string);
begin
  FNombre := Value;
end;

procedure TPlataformaDesarrollo.SetRutaImagen(const Value: string);
begin
  FRutaImagen := Value;
end;

{ TModuloCodigo }

constructor TModuloCodigo.create;
begin

end;

destructor TModuloCodigo.destroy;
begin

  inherited destroy;
end;

procedure TModuloCodigo.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure TModuloCodigo.SetIdModulo(const Value: string);
begin
  FIdModulo := Value;
end;

procedure TModuloCodigo.SetModulo(const Value: string);
begin
  FModulo := Value;
end;

{ TArchivoCodigo }

procedure TArchivoCodigo.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure TArchivoCodigo.SetIdCodigo(const Value: string);
begin
  FIdCodigo := Value;
end;

procedure TArchivoCodigo.SetLenguaje(const Value: string);
begin
  FLenguaje := Value;
end;

procedure TArchivoCodigo.SetNombre(const Value: string);
begin
  FNombre := Value;
end;

procedure TArchivoCodigo.SetRuta(const Value: string);
begin
  FRuta := Value;
end;

{ TSeccionManual }

procedure TSeccionManual.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure TSeccionManual.SetIdRegistro(const Value: string);
begin
  FIdRegistro := Value;
end;

procedure TSeccionManual.SetImagen(const Value: string);
begin
  FImagen := Value;
end;

procedure TSeccionManual.SetNombre(const Value: string);
begin
  FNombre := Value;
end;

procedure TSeccionManual.SetOrden(const Value: integer);
begin
  FOrden := Value;
end;

procedure TSeccionManual.SetRutaImagen(const Value: string);
begin
  FRutaImagen := Value;
end;

procedure TSeccionManual.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

{ TFuncionalidad }

constructor TFuncionalidad.create;
begin

end;

destructor TFuncionalidad.destroy;
begin
  inherited destroy;
end;

procedure TFuncionalidad.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure TFuncionalidad.SetFuncionalidad(const Value: string);
begin
  FFuncionalidad := Value;
end;

procedure TFuncionalidad.SetIdFuncionalidad(const Value: string);
begin
  FIdFuncionalidad := Value;
end;

procedure TFuncionalidad.SetIdTipo(const Value: string);
begin
  FIdTipo := Value;
end;

procedure TFuncionalidad.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure TFuncionalidad.SetValor(const Value: string);
begin
  FValor := Value;
end;

end.
