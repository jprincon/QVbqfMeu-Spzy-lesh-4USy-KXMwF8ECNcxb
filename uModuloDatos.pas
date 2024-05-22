unit uModuloDatos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  uTConfiguracionApp, uTTablasBD, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, uTUtilidades;

type
  TModuloDatos = class(TDataModule)
    Conexion: TFDConnection;
    Query: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FIdUsuario: string;
    FUsuario: string;

    gestorTablas: TTablasBD;

    procedure SetIdUsuario(const Value: string);
    procedure SetUsuario(const Value: string);

  public
    ConfigApp: TConfiguracionApp;
    Util: TUtilidades;

    procedure crearActualizarBaseDatos;
    procedure tablaUsuario;
    procedure tablaProyectos;
    procedure tablaAutoresProyecto;
    procedure tablaPasosInstalacion;
    procedure tablasPlataformasDesarrollo;
    procedure tablaModulosCodigo;
    procedure tablaCodigoFuente;
    procedure tablaManualUsuario;
    procedure tablaRecientes;
    procedure tablaFuncionalidades;
    procedure tablaTiposFuncionalidad;
    procedure tablaTablasBaseDatos;
    procedure tablaAtributosTabla;

    property IdUsuario: string read FIdUsuario write SetIdUsuario;
    property Usuario: string read FUsuario write SetUsuario;
  end;

var
  ModuloDatos: TModuloDatos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TModuloDatos.crearActualizarBaseDatos;
begin
  gestorTablas.Conexion := Conexion;
  gestorTablas.obtenerTablas;

  tablaUsuario;
  tablaProyectos;
  tablaAutoresProyecto;
  tablaPasosInstalacion;
  tablasPlataformasDesarrollo;
  tablaModulosCodigo;
  tablaCodigoFuente;
  tablaManualUsuario;
  tablaRecientes;
  tablaFuncionalidades;
  tablaTiposFuncionalidad;
  tablaTablasBaseDatos;
  tablaAtributosTabla;
end;

procedure TModuloDatos.DataModuleCreate(Sender: TObject);
begin
  Util := TUtilidades.create;

  ConfigApp := TConfiguracionApp.create;
  ConfigApp.Conexion := Conexion;
  ConfigApp.ConfigurarAplicacion('JarinconApps',
    'Administrador de Documentación de Desarrollo de Software',
    Util.GetAppVersion);

  gestorTablas := TTablasBD.create;
  crearActualizarBaseDatos;
end;

procedure TModuloDatos.SetIdUsuario(const Value: string);
begin
  FIdUsuario := Value;
  ConfigApp.IdUsuario := Value;
end;

procedure TModuloDatos.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

procedure TModuloDatos.tablaAtributosTabla;
begin
  gestorTablas.iniciarTabla('AtributosTabla');
  gestorTablas.agregarAtributo('IdAtributo String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Nombre String(255), ');
  gestorTablas.agregarAtributo('Tipo String(255), ');
  gestorTablas.agregarAtributo('PrimaryKey String(255), ');
  gestorTablas.agregarAtributo('NotNull String(255), ');
  gestorTablas.agregarAtributo('TableReference String(255), ');
  gestorTablas.agregarAtributo('AtributeReference String(255), ');
  gestorTablas.agregarAtributo
    ('IdTabla String(255) references TablasBaseDatos(IdTabla)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaAutoresProyecto;
begin
  gestorTablas.iniciarTabla('AutoresProyecto');
  gestorTablas.agregarAtributo('IdAutor String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Nombre String(255), ');
  gestorTablas.agregarAtributo('Correo String(255), ');
  gestorTablas.agregarAtributo('Orden Number, ');
  gestorTablas.agregarAtributo('Fotografia String(255), ');
  gestorTablas.agregarAtributo('Biografia Text, ');
  gestorTablas.agregarAtributo
    ('IdProyecto String(255) references ProyectosProgramacion(IdProyecto), ');
  gestorTablas.agregarAtributo('IdUsuario String(255)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaCodigoFuente;
begin
  gestorTablas.iniciarTabla('CodigoFuente');
  gestorTablas.agregarAtributo('IdCodigo String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Nombre String(255), ');
  gestorTablas.agregarAtributo('Lenguaje String(255), ');
  gestorTablas.agregarAtributo('Descripcion Text, ');
  gestorTablas.agregarAtributo
    ('IdModulo String(255) references ModulosCodigo(IdModulo), ');
  gestorTablas.agregarAtributo('IdUsuario String(255)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaFuncionalidades;
begin
  gestorTablas.iniciarTabla('Funcionalidades');
  gestorTablas.agregarAtributo
    ('IdFuncionalidad String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Funcionalidad String(255), ');
  gestorTablas.agregarAtributo('Descripcion Text, ');
  gestorTablas.agregarAtributo
    ('IdTipo String(255) references TiposFuncionalidades(IdTipo), ');
  gestorTablas.agregarAtributo
    ('IdProyecto String(255) references ProyectosProgramacion(IdProyecto)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaManualUsuario;
begin
  gestorTablas.iniciarTabla('ManualUsuario');
  gestorTablas.agregarAtributo('IdRegistro String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Nombre String(255), ');
  gestorTablas.agregarAtributo('Orden Number, ');
  gestorTablas.agregarAtributo('Descripcion Text, ');
  gestorTablas.agregarAtributo('Imagen String(255), ');
  gestorTablas.agregarAtributo('Tipo String(255), ');
  gestorTablas.agregarAtributo
    ('IdProyecto String(255) references ProyectosProgramacion(IdProyecto), ');
  gestorTablas.agregarAtributo('IdUsuario String(255)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaModulosCodigo;
begin
  gestorTablas.iniciarTabla('ModulosCodigo');
  gestorTablas.agregarAtributo('IdModulo String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Modulo String(255), ');
  gestorTablas.agregarAtributo('Descripcion Text, ');
  gestorTablas.agregarAtributo
    ('IdProyecto String(255) references ProyectosProgramacion(IdProyecto), ');
  gestorTablas.agregarAtributo('IdUsuario String(255)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaPasosInstalacion;
begin
  gestorTablas.iniciarTabla('PasosInstalacion');
  gestorTablas.agregarAtributo('IdRegistro String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Titulo String(255), ');
  gestorTablas.agregarAtributo('Orden Number, ');
  gestorTablas.agregarAtributo('Descripcion Text, ');
  gestorTablas.agregarAtributo('Imagen String(255), ');
  gestorTablas.agregarAtributo
    ('IdProyecto String(255) references ProyectosProgramacion(IdProyecto), ');
  gestorTablas.agregarAtributo('IdUsuario String(255)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaProyectos;
begin
  gestorTablas.iniciarTabla('ProyectosProgramacion');
  gestorTablas.agregarAtributo('IdProyecto String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Titulo String(255), ');
  gestorTablas.agregarAtributo('Subtitulo String(255), ');
  gestorTablas.agregarAtributo('Institucion String(255), ');
  gestorTablas.agregarAtributo('Ciudad String(255), ');
  gestorTablas.agregarAtributo('Fecha String(255), ');
  gestorTablas.agregarAtributo('Version String(255), ');
  gestorTablas.agregarAtributo('Registro String(255), ');
  gestorTablas.agregarAtributo('FechaRegistro String(255), ');
  gestorTablas.agregarAtributo('SistemaOperativo String(255), ');
  gestorTablas.agregarAtributo('DiscoDuro String(255), ');
  gestorTablas.agregarAtributo('MemoriaRam String(255), ');
  gestorTablas.agregarAtributo('Mouse String(255), ');
  gestorTablas.agregarAtributo('Teclado String(255), ');
  gestorTablas.agregarAtributo('Impresora String(255), ');
  gestorTablas.agregarAtributo('Escaner String(255), ');
  gestorTablas.agregarAtributo('Pantalla String(255), ');
  gestorTablas.agregarAtributo('Microfono String(255), ');
  gestorTablas.agregarAtributo('Altavoces String(255), ');
  gestorTablas.agregarAtributo('Internet String(255), ');
  gestorTablas.agregarAtributo('CodigoFuente String(255), ');
  gestorTablas.agregarAtributo('Resumen Text, ');
  gestorTablas.agregarAtributo('Aportes Text, ');
  gestorTablas.agregarAtributo('Analisis Text, ');
  gestorTablas.agregarAtributo('Diseno Text, ');
  gestorTablas.agregarAtributo('Implementacion Text, ');
  gestorTablas.agregarAtributo('Validacion Text, ');
  gestorTablas.agregarAtributo('Plataforma Text, ');
  gestorTablas.agregarAtributo('Ambiente Text, ');
  gestorTablas.agregarAtributo('PalabrasClave Text, ');
  gestorTablas.agregarAtributo('IdUsuario String(255)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaRecientes;
begin
  gestorTablas.iniciarTabla('Recientes');
  gestorTablas.agregarAtributo('IdRegistro String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Nombre String(255), ');
  gestorTablas.agregarAtributo('IDTabla String(255), ');
  gestorTablas.agregarAtributo('Frecuencia Number, ');
  gestorTablas.agregarAtributo('Aplicacion String(255), ');
  gestorTablas.agregarAtributo('IdUsuario String(255)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablasPlataformasDesarrollo;
begin
  gestorTablas.iniciarTabla('PlataformasDesarrollo');
  gestorTablas.agregarAtributo
    ('IdPlataforma String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Nombre String(255), ');
  gestorTablas.agregarAtributo('Descripcion Text, ');
  gestorTablas.agregarAtributo('Imagen String(255), ');
  gestorTablas.agregarAtributo
    ('IdProyecto String(255) references ProyectosProgramacion(IdProyecto), ');
  gestorTablas.agregarAtributo('IdUsuario String(255)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaTablasBaseDatos;
begin
  gestorTablas.iniciarTabla('TablasBaseDatos');
  gestorTablas.agregarAtributo('IdTabla String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Nombre String(255), ');
  gestorTablas.agregarAtributo('Descripcion Text, ');
  gestorTablas.agregarAtributo
    ('IdProyecto String(255) references ProyectosProgramacion(IdProyecto)');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaTiposFuncionalidad;
begin
  gestorTablas.iniciarTabla('TiposFuncionalidades');
  gestorTablas.agregarAtributo('IdTipo String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Tipo String(255), ');
  gestorTablas.agregarAtributo('Descripcion Text, ');
  gestorTablas.agregarAtributo('Valor Number');
  gestorTablas.crearActualizarTabla;
end;

procedure TModuloDatos.tablaUsuario;
begin
  gestorTablas.iniciarTabla('Usuarios');
  gestorTablas.agregarAtributo('IdUsuario String(255) primary key not null, ');
  gestorTablas.agregarAtributo('Nombre String(255), ');
  gestorTablas.agregarAtributo('Correo String(255), ');
  gestorTablas.agregarAtributo('Imagen String(255), ');
  gestorTablas.agregarAtributo('Contra String(255)');
  gestorTablas.crearActualizarTabla;
end;

end.
