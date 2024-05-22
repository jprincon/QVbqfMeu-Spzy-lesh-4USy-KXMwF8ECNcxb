unit uFGestorProyectosProgramacion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, shellapi, inifiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModuloDatos, uTRegistroInicio,
  Vcl.WinXPanels, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFMensaje, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXCalendars, Vcl.ComCtrls,
  uConfiguracionRutaBD, uFCrearEditarProyecto, Constantes, uFAbrirProyecto,
  SynEdit, Utilidades, uTProyectoProgramacion, uFCrearEditarAutor,
  SynEditHighlighter, SynHighlighterTeX, uTLectorRecursos, Vcl.ExtDlgs,
  uFCrearEditarPasoInstalacion, uFIndicador, uFCrearEditarPlataformaDesarrollo,
  uFToast, uFCrearEditarModulo, uFCrearEditarCodigoFuente, uFCrearEditarSeccion,
  Vcl.CategoryButtons, Vcl.Menus, uFImportarPlataforma, Vcl.Imaging.jpeg,
  uFPasosInstalacionDefecto, uFActualizaciones, Vcl.Imaging.pngimage, uFConsola,
  uFCrearEditarDER, uCrearEditarFuncionalidad, uFCrearEditarTipoFuncionalidad;

type
  TFGestorProyectosProgramacion = class(TForm)
    Principal: TCardPanel;
    cardPriContenido: TCard;
    cardPriRegistroInicio: TCard;
    Query: TFDQuery;
    MenuPrincipal: TPageControl;
    TabMM_Archivo: TTabSheet;
    pCompilar: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    sbNuevoProyecto: TSpeedButton;
    Label3: TLabel;
    TabHerramientas: TTabSheet;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    SpeedButton3: TSpeedButton;
    Label5: TLabel;
    TabSesion: TTabSheet;
    Panel6: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    sbCerrarSesion: TSpeedButton;
    Label2: TLabel;
    iconos24: TImageList;
    iconos32: TImageList;
    Panel1: TPanel;
    sbAbrirProyecto: TSpeedButton;
    Label1: TLabel;
    Contenido: TCardPanel;
    cardContenido: TCard;
    cardVacio: TCard;
    paginaProyecto: TPageControl;
    TabProyecto: TTabSheet;
    Splitter1: TSplitter;
    tvEstructura: TTreeView;
    Proyecto: TCardPanel;
    cardDatosBasicos: TCard;
    pTitulo: TPanel;
    pGuardar: TPanel;
    sbGuardar: TSpeedButton;
    Label6: TLabel;
    barraEstado: TStatusBar;
    Panel4: TPanel;
    sbCompilarManualTecnico: TSpeedButton;
    Label7: TLabel;
    cardAutores: TCard;
    pAutores: TPanel;
    lvAutores: TListView;
    bBotonesAutores: TPanel;
    sbAgregarAutor: TSpeedButton;
    cardExportarTEX: TCard;
    PaginaCodigoFuente: TPageControl;
    TabManualTecnico: TTabSheet;
    TabCodigoFuente: TTabSheet;
    seManualTecnico: TSynEdit;
    sTEX: TSynTeXSyn;
    seCodigoFuente: TSynEdit;
    Panel2: TPanel;
    sbVerPDF: TSpeedButton;
    sbContenido: TScrollBox;
    gb1: TGroupBox;
    edTitulo: TEdit;
    gb2: TGroupBox;
    edSubtituloProyecto: TEdit;
    gb3: TGroupBox;
    edPalabrasClave: TEdit;
    gb24: TGroupBox;
    edResumen: TSynEdit;
    gb4: TGroupBox;
    edInstitucion: TEdit;
    gb5: TGroupBox;
    edCiudad: TEdit;
    gb6: TGroupBox;
    edFecha: TEdit;
    gb7: TGroupBox;
    edVersion: TEdit;
    gb8: TGroupBox;
    edRegistro: TEdit;
    gb9: TGroupBox;
    edFechaRegistro: TEdit;
    gb22: TGroupBox;
    edInterner: TEdit;
    gb21: TGroupBox;
    edAltavoces: TEdit;
    gb20: TGroupBox;
    edMicrofono: TEdit;
    gb19: TGroupBox;
    edPantalla: TEdit;
    gb18: TGroupBox;
    edEscaner: TEdit;
    gb17: TGroupBox;
    edImpresora: TEdit;
    gb16: TGroupBox;
    edTeclado: TEdit;
    gb15: TGroupBox;
    edMouse: TEdit;
    gb14: TGroupBox;
    edMemoriaRam: TEdit;
    gb13: TGroupBox;
    edDiscoDuro: TEdit;
    gb12: TGroupBox;
    edSistemaOperativo: TEdit;
    gb10: TGroupBox;
    edLenguaje: TEdit;
    gb11: TGroupBox;
    edDisenoGrafico: TEdit;
    cardPlataformas: TCard;
    LvPlataformas: TListView;
    Panel5: TPanel;
    Panel12: TPanel;
    sbAgregarPlataforma: TSpeedButton;
    pCerrarProyecto: TPanel;
    sbCerrarProyecto: TSpeedButton;
    Label8: TLabel;
    cardLogo: TCard;
    Panel3: TPanel;
    Panel7: TPanel;
    sbLeerLogo: TSpeedButton;
    imgLogo: TImage;
    dlgLogo: TOpenPictureDialog;
    cardInstalacion: TCard;
    Panel18: TPanel;
    Panel19: TPanel;
    sbAgregarPaso: TSpeedButton;
    lvPasosInstalacion: TListView;
    pPasosInst: TPanel;
    PaginaDescripcionInstalacion: TPageControl;
    TabSheet1: TTabSheet;
    edDescripcion: TSynEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    imgInst: TImage;
    Splitter2: TSplitter;
    SpeedButton1: TSpeedButton;
    sbEliminarPaso: TSpeedButton;
    Panel21: TPanel;
    SpeedButton2: TSpeedButton;
    Label9: TLabel;
    cardArchivos: TCard;
    Panel22: TPanel;
    PaginaModulos: TPageControl;
    TabSheet3: TTabSheet;
    PaginaArchivos: TPageControl;
    TabArchivos: TTabSheet;
    lvModulos: TListView;
    lvArchivos: TListView;
    gb23: TGroupBox;
    edCodigoFuente: TEdit;
    sbCodigoFuente: TSpeedButton;
    seDescMod: TSynEdit;
    Splitter3: TSplitter;
    Panel31: TPanel;
    Label13: TLabel;
    Label10: TLabel;
    ProyectosRecientes: TPageControl;
    TabSheet4: TTabSheet;
    lvRecientes: TListView;
    iconos48: TImageList;
    TabSheet5: TTabSheet;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    sbAcercaAutor: TSpeedButton;
    Label11: TLabel;
    Panel28: TPanel;
    sbAcercaSoftware: TSpeedButton;
    Label12: TLabel;
    Panel29: TPanel;
    cbVerProceso: TCheckBox;
    QArchivo: TFDQuery;
    cardManualUsuario: TCard;
    Panel32: TPanel;
    PaginaSecciones: TPageControl;
    TabSecciones2: TTabSheet;
    lvSecciones: TListView;
    Panel30: TPanel;
    sbAgregarSeccion: TSpeedButton;
    sbEliminarSeccion: TSpeedButton;
    sbEditarSeccion: TSpeedButton;
    pContenidoVistaSeccion: TPanel;
    paginaDescripcionSeccion: TPageControl;
    TabSheet6: TTabSheet;
    edDescSeccion: TSynEdit;
    paginaImagenSeccion: TPageControl;
    TabSheet7: TTabSheet;
    imgSeccion: TImage;
    opcionesMenu: TPopupMenu;
    Proyecto1: TMenuItem;
    Guardar1: TMenuItem;
    Archivos1: TMenuItem;
    Eliminartodoslosarchivos1: TMenuItem;
    Panel20: TPanel;
    pagDescPlat: TPageControl;
    TabSheet8: TTabSheet;
    edDescPlat: TSynEdit;
    pagImgPlat: TPageControl;
    TabSheet9: TTabSheet;
    imgPlat: TImage;
    Splitter4: TSplitter;
    PlataformasdeDesarrollo1: TMenuItem;
    AgregarPlataforma1: TMenuItem;
    Panel33: TPanel;
    sbImportarPlataforma: TSpeedButton;
    Label14: TLabel;
    Eliminararchivossindescripcin1: TMenuItem;
    pDatosAutor: TPanel;
    PageControl1: TPageControl;
    TabSheet10: TTabSheet;
    edBioAutor: TSynEdit;
    PageControl3: TPageControl;
    TabSheet11: TTabSheet;
    imgAutor: TImage;
    iconos96: TImageList;
    Splitter5: TSplitter;
    GroupBox1: TGroupBox;
    edIdProyecto: TEdit;
    sbDefecto: TSpeedButton;
    sbActualizarListaPasosInstalacion: TSpeedButton;
    GroupBox2: TGroupBox;
    seRutaProyecto: TSynEdit;
    Panel34: TPanel;
    sbActualizaciones: TSpeedButton;
    Label15: TLabel;
    Splitter6: TSplitter;
    Panel35: TPanel;
    sbCompilarManualUsuario: TSpeedButton;
    Label16: TLabel;
    dlgPerfil: TOpenPictureDialog;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    sbConsolaMensajes: TSpeedButton;
    Label17: TLabel;
    sbArribaSeccion: TSpeedButton;
    sbAbajoSeccion: TSpeedButton;
    cardAportesConocimiento: TCard;
    Panel39: TPanel;
    Panel40: TPanel;
    sbGuardar2: TSpeedButton;
    PageControl4: TPageControl;
    TabSheet12: TTabSheet;
    edAportes: TSynEdit;
    SpeedButton4: TSpeedButton;
    dlgGuardar: TSaveDialog;
    sbEditarAutor: TSpeedButton;
    sbEliminarAutor: TSpeedButton;
    sbEditarPlataforma: TSpeedButton;
    sbEliminarPlataforma: TSpeedButton;
    cardDER: TCard;
    Panel41: TPanel;
    Panel42: TPanel;
    sbCrearTabla: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    cardFuncionalidades: TCard;
    Panel43: TPanel;
    Panel44: TPanel;
    sbAgregarFuncionalidad: TSpeedButton;
    sbEditarFuncionalidad: TSpeedButton;
    sbEliminarFuncionalidad: TSpeedButton;
    LvFuncionalidades: TListView;
    cardTiposFuncionalidad: TCard;
    Panel45: TPanel;
    sbAgregarTipoFuncionalidad: TSpeedButton;
    sbEditarTipoFuncionalidad: TSpeedButton;
    sbEliminarTipoFuncionalidad: TSpeedButton;
    Panel46: TPanel;
    lvTiposFuncionalidad: TListView;
    Panel47: TPanel;
    Image1: TImage;
    Label18: TLabel;
    Panel92: TPanel;
    imgPerfil: TImage;
    pActualizarPerfil: TPanel;
    paginaOpcionesArchivos: TPageControl;
    TabOpcionesArchivos: TTabSheet;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    sbCrearModulo: TSpeedButton;
    sbEliminarModulo: TSpeedButton;
    sbEditarModulo: TSpeedButton;
    sbCrearCodigo: TSpeedButton;
    sbEditarCodigo: TSpeedButton;
    sbEliminarCodigo: TSpeedButton;
    sbEliminarTodosArchivos: TSpeedButton;
    Panel23: TPanel;
    sbExaminarDirectorio: TSpeedButton;

    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure sbCerrarSesionClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sbNuevoProyectoClick(Sender: TObject);
    procedure sbAbrirProyectoClick(Sender: TObject);
    procedure sbGuardarClick(Sender: TObject);
    procedure proyectoEditado(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure seleccionarMenu(Sender: TObject);
    procedure sbAgregarAutorClick(Sender: TObject);
    procedure editarAutor(Sender: TObject);
    procedure compilarManualTecnico(Sender: TObject);
    procedure sbCerrarProyectoClick(Sender: TObject);
    procedure sbLeerLogoClick(Sender: TObject);
    procedure sbAgregarPasoClick(Sender: TObject);
    procedure editarPasoInstalacion(Sender: TObject);
    procedure verPaso(Sender: TObject);
    procedure eliminarPasoInstalacion(Sender: TObject);
    procedure lvPasosInstalacionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure agregarPlataformaDesarrollo(Sender: TObject);
    procedure editarPlataformaDesarrollo(Sender: TObject);
    procedure sbCodigoFuenteClick(Sender: TObject);
    procedure sbCrearModuloClick(Sender: TObject);
    procedure seleccionarModulo(Sender: TObject);
    procedure editarModuloCodigo(Sender: TObject);
    procedure eliminarModuloCodigo(Sender: TObject);
    procedure lvModulosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbCrearCodigoClick(Sender: TObject);
    procedure editarArchivoCodigo(Sender: TObject);
    procedure eliminarArchivoCodigo(Sender: TObject);
    procedure lvArchivosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbAcercaAutorClick(Sender: TObject);
    procedure sbAcercaSoftwareClick(Sender: TObject);
    procedure sbExaminarDirectorioClick(Sender: TObject);
    procedure sbAgregarSeccionClick(Sender: TObject);
    procedure editarSeccionManual(Sender: TObject);
    procedure eliminarSeccion(Sender: TObject);
    procedure lvSeccionesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure verSeccion(Sender: TObject);
    procedure compilarCodigoFuente(Sender: TObject);
    procedure Eliminartodoslosarchivos1Click(Sender: TObject);
    procedure verPlataforma(Sender: TObject);
    procedure importarPlataformaDesarrollo(Sender: TObject);
    procedure Eliminararchivossindescripcin1Click(Sender: TObject);
    procedure abrirProyecto(Sender: TObject);
    procedure verAutor(Sender: TObject);
    procedure sbDefectoClick(Sender: TObject);
    procedure sbActualizarListaPasosInstalacionClick(Sender: TObject);
    procedure sbActualizacionesClick(Sender: TObject);
    procedure compilarManualUsuario(Sender: TObject);
    procedure pActualizarPerfilMouseEnter(Sender: TObject);
    procedure pActualizarPerfilMouseLeave(Sender: TObject);
    procedure pActualizarPerfilClick(Sender: TObject);
    procedure sbConsolaMensajesClick(Sender: TObject);
    procedure moverSeccionArriba(Sender: TObject);
    procedure sbAbajoSeccionClick(Sender: TObject);
    procedure sbVerPDFClick(Sender: TObject);
    procedure guardarPDFComo(Sender: TObject);
    procedure eliminarAutor(Sender: TObject);
    procedure lvAutoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eliminarPlataformaDesarrollo(Sender: TObject);
    procedure LvPlataformasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbCrearTablaClick(Sender: TObject);
    procedure sbAgregarFuncionalidadClick(Sender: TObject);
    procedure editarFuncionalidad(Sender: TObject);
    procedure sbAgregarTipoFuncionalidadClick(Sender: TObject);
    procedure editarTipoFuncionalidad(Sender: TObject);
    procedure EliminarTipoFuncionalidad(Sender: TObject);
    procedure lvTiposFuncionalidadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbEliminarTodosArchivosClick(Sender: TObject);
  private
    RegistroInicio: TRegistroInicio;
    ProyectoProgramacion: TProyectoProgramacion;
    LR: TLectorRecursos;
    Config: TInifile;
    rutaAutor: string;
    FRutaArchivoPDF: string;
    procedure SetRutaArchivoPDF(const Value: string);
  public

    procedure InicioSesion(Evento: Boolean);
    procedure Registro(Evento: Boolean);
    procedure crearMenu(nombre: string; imagen: integer);
    procedure crearMenus;
    procedure limpiarBarraEstado;
    procedure limpiarEditores;
    procedure leerTiposFuncionalidades;

    function existeArchivo(ruta: string; idmodulo: string): Boolean;

    property RutaArchivoPDF: string read FRutaArchivoPDF
      write SetRutaArchivoPDF;
  end;

const
  EST_DATOS_BASICOS = 'Datos Básicos';
  EST_ARCHIVOS = 'Archivos';
  EST_INSTALACION = 'Instalación';
  EST_AUTORS = 'Autores';
  EST_LOGO = 'Logo';
  EST_PLATAFORMAS = 'Plataformas Desarrollo';
  EST_MANUAL_USUARIO = 'Manual de Usuario';
  EST_APORTES_CONOCIMIENTO = 'Aportes al Conocimiento';
  EST_DIAGRAMA_ENTIDAD_RELACION = 'Diagrama Entidad Relación';
  EST_FUNCIONALIDADES = 'Funcionalidades';
  EST_TIPOS_FUNCIONALIDADES = 'Tipos de Funcionalidad';

var
  FGestorProyectosProgramacion: TFGestorProyectosProgramacion;

implementation

{$R *.dfm}

procedure TFGestorProyectosProgramacion.crearMenu(nombre: string;
  imagen: integer);
begin
  with tvEstructura.Items.Add(nil, nombre) do
  begin
    ImageIndex := imagen;
    SelectedIndex := imagen;
  end;
end;

procedure TFGestorProyectosProgramacion.crearMenus;
begin
  crearMenu(EST_DIAGRAMA_ENTIDAD_RELACION, 11);
  crearMenu(EST_PLATAFORMAS, 7);
  crearMenu(EST_FUNCIONALIDADES, 12);
  crearMenu(EST_DATOS_BASICOS, 0);
  crearMenu(EST_LOGO, 6);
  crearMenu(EST_INSTALACION, 2);
  crearMenu(EST_ARCHIVOS, 1);
  crearMenu(EST_MANUAL_USUARIO, 9);
  crearMenu(EST_APORTES_CONOCIMIENTO, 10);
  crearMenu(EST_AUTORS, 3);
  crearMenu(EST_TIPOS_FUNCIONALIDADES, 13);
end;

procedure TFGestorProyectosProgramacion.editarArchivoCodigo(Sender: TObject);
begin
  if lvArchivos.Selected <> nil then
  begin
    if FCrearEditarCodigoFuente.editar(lvArchivos.Selected.SubItems[4]) then
    begin
      ProyectoProgramacion.leerArchivosCodigo
        (ProyectoProgramacion.IdModuloSeleccionado, 'Descripcion');
      FMensaje.mensaje(FCrearEditarCodigoFuente.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.editarAutor(Sender: TObject);
var
  ruta: string;
begin
  if lvAutores.Selected <> nil then
  begin
    FCrearEditarAutor.RutaFotografia := rutaAutor;
    if FCrearEditarAutor.crearEditar(ACCION_EDITAR,
      lvAutores.Selected.SubItems[3], '') then
    begin
      if FCrearEditarAutor.CargoImagen then
      begin
        ruta := ProyectoProgramacion.RutaArchivos + '\' +
          FCrearEditarAutor.IdAutor + FCrearEditarAutor.ExtensionImagen;
        FMensaje.mensaje(ruta, tmInfo);
        FCrearEditarAutor.guardarFotografiaAutor(ruta);
      end;

      ProyectoProgramacion.leerAutores;
      FMensaje.mensaje(FCrearEditarAutor.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.editarPasoInstalacion(Sender: TObject);
begin
  if lvPasosInstalacion.Selected <> nil then
  begin
    if FCrearEditarPasoInstalacion.editar(lvPasosInstalacion.Selected.SubItems
      [4], ProyectoProgramacion.IdProyecto) then
    begin
      ProyectoProgramacion.LeerPasosInstalacion;
      FMensaje.mensaje(FCrearEditarPasoInstalacion.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.editarPlataformaDesarrollo
  (Sender: TObject);
begin
  if LvPlataformas.Selected <> nil then
  begin
    if FCrearEditarPlataformaDesarrollo.editar(LvPlataformas.Selected.SubItems
      [4], ProyectoProgramacion.IdProyecto) then
    begin
      ProyectoProgramacion.leerPlataformasDesarrollo;
      FMensaje.mensaje(FCrearEditarPlataformaDesarrollo.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.FormCreate(Sender: TObject);
begin
  RegistroInicio := TRegistroInicio.create(cardPriRegistroInicio);
  RegistroInicio.Query := Query;
  RegistroInicio.OnInicioSesion := InicioSesion;
  RegistroInicio.OnRegistro := Registro;
  RegistroInicio.limpiarFormulario;

  Principal.ActiveCard := cardPriRegistroInicio;
  MenuPrincipal.ActivePageIndex := 0;
  Contenido.ActiveCard := cardVacio;

  crearMenus;

  pGuardar.Visible := false;
  pCerrarProyecto.Visible := false;
  pCompilar.Visible := false;

  ProyectoProgramacion := TProyectoProgramacion.create;
  with ProyectoProgramacion do
  begin
    Conexion := ModuloDatos.Conexion;
    RutaTrabajo := ModuloDatos.ConfigApp.RutaArchivos;
    barraEstado.Panels[2].Text := ModuloDatos.ConfigApp.RutaArchivos;

    EditorCodigoFuente := edCodigoFuente;
    EditorTitulo := edTitulo;
    EditorSubtitulo := edSubtituloProyecto;
    EditorInstitucion := edInstitucion;
    EditorCiudad := edCiudad;
    EditorFecha := edFecha;
    EditorVersion := edVersion;
    EditorRegistro := edRegistro;
    EditorFechaRegistro := edFechaRegistro;
    EditorSistemaOperativo := edSistemaOperativo;
    EditorDiscoDuro := edDiscoDuro;
    EditorMemoriaRam := edMemoriaRam;
    EditorMouse := edMouse;
    EditorTeclado := edTeclado;
    EditorImpresora := edImpresora;
    EditorEscaner := edEscaner;
    EditorPantalla := edPantalla;
    EditorMicrofono := edMicrofono;
    EditorAltavoces := edAltavoces;
    EditorPalabrasClave := edPalabrasClave;
    EditorInternet := edInterner;
    EditorResumen := edResumen;
    EditorAportes := edAportes;
    EditorDisenoGrafico := edDisenoGrafico;
    EditorLenguaje := edLenguaje;

    TablaAutores := lvAutores;
    TablaPasosInstalacion := lvPasosInstalacion;
    TablaPlataformasDesarrollo := LvPlataformas;
    TablaModulos := lvModulos;
    TablaArchivosCodigo := lvArchivos;
    TablaSecciones := lvSecciones;
    TablaFuncionalidades := LvFuncionalidades;
  end;

  LR := TLectorRecursos.create;

  Config := TInifile.create(ModuloDatos.ConfigApp.RutaTrabajo +
    '\Proyectos.ini');
end;

procedure TFGestorProyectosProgramacion.FormResize(Sender: TObject);
begin
  RegistroInicio.centrar(Width, Height);
  PaginaDescripcionInstalacion.Width := Round(0.55 * Width);
  lvSecciones.Height := Round(0.35 * Height);
  pPasosInst.Height := Round(0.4 * Height);
  pContenidoVistaSeccion.Width := Round(0.4 * Width);
end;

procedure TFGestorProyectosProgramacion.FormShow(Sender: TObject);
begin
  RegistroInicio.Mensajes := FMensaje;
  RegistroInicio.inicioAutomatico;

  Caption := ModuloDatos.ConfigApp.version;
end;

procedure TFGestorProyectosProgramacion.guardarPDFComo(Sender: TObject);
var
  ruta: string;
begin
  if FRutaArchivoPDF <> '' then
  begin
    dlgGuardar.FileName := ExtractFileName(FRutaArchivoPDF);
    if dlgGuardar.Execute then
    begin
      ruta := dlgGuardar.FileName;
      ruta := Utilidades.validarExtension(ruta, '.pdf');

      if CopyFile(pchar(FRutaArchivoPDF), pchar(ruta), true) then
      begin
        FMensaje.mensaje('El archivo se guardo correctamente', tmInfo);
      end;
    end;
  end
  else
    FMensaje.mensaje('No hay archivos PDF para guardar', tmWarning);
end;

procedure TFGestorProyectosProgramacion.InicioSesion(Evento: Boolean);
var
  ruta: string;
begin
  if Evento then
  begin
    Principal.ActiveCard := cardPriContenido;
    ModuloDatos.IdUsuario := RegistroInicio.IdUsuario;
    ModuloDatos.Usuario := RegistroInicio.Usuario;

    ruta := ModuloDatos.ConfigApp.RutaArchivos + '\' + RegistroInicio.imagen;
    if FileExists(ruta) then
      imgPerfil.Picture.LoadFromFile(ruta);

    ModuloDatos.ConfigApp.leerRecientes(lvRecientes);
  end;
end;

procedure TFGestorProyectosProgramacion.leerTiposFuncionalidades;
var
  i, valor: integer;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM TiposFuncionalidades ORDER BY Valor desc';
  Query.Open;
  Query.First;

  lvTiposFuncionalidad.Items.Clear;
  for i := 1 to Query.RecordCount do
  begin
    with lvTiposFuncionalidad.Items.Add.SubItems do
    begin
      Add(IntToStr(i));
      Add(Query.FieldByName('Tipo').AsString);
      Add(Query.FieldByName('Descripcion').AsString);

      valor := Query.FieldByName('Valor').AsInteger;
      Add(FloatToStrF(valor, ffCurrency, 12, 0));
      Add(Query.FieldByName('IdTipo').AsString)
    end;
    Query.Next;
  end;

end;

procedure TFGestorProyectosProgramacion.limpiarBarraEstado;
var
  i: integer;
begin
  for i := 1 to barraEstado.Panels.Count do
    barraEstado.Panels[i - 1].Text := '';
end;

procedure TFGestorProyectosProgramacion.limpiarEditores;
begin
  seDescMod.Lines.Clear;
  lvArchivos.Items.Clear;
  edBioAutor.Lines.Clear;
  Utilidades.limpiarImagen(imgAutor);
  seManualTecnico.Lines.Clear;
  seCodigoFuente.Lines.Clear;
  edDescripcion.Lines.Clear;
  Utilidades.limpiarImagen(imgInst);
  Utilidades.limpiarImagen(imgLogo);
  edDescSeccion.Lines.Clear;
  Utilidades.limpiarImagen(imgSeccion);
  edDescPlat.Lines.Clear;
  Utilidades.limpiarImagen(imgPlat);
end;

procedure TFGestorProyectosProgramacion.lvArchivosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    eliminarArchivoCodigo(self);
  end;
end;

procedure TFGestorProyectosProgramacion.lvAutoresKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    eliminarAutor(self);
  end;
end;

procedure TFGestorProyectosProgramacion.editarFuncionalidad(Sender: TObject);
var
  IdFuncionalidad: string;
begin
  if LvFuncionalidades.Selected <> nil then
  begin
    IdFuncionalidad := LvFuncionalidades.Selected.SubItems[3];
    if FCrearEditarFuncionalidad.edito(IdFuncionalidad) then
    begin
      ProyectoProgramacion.leerFuncionalidades;
      FMensaje.mensaje(FCrearEditarFuncionalidad.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.lvModulosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    eliminarModuloCodigo(self);
end;

procedure TFGestorProyectosProgramacion.lvPasosInstalacionKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    eliminarPasoInstalacion(self);
  end;
end;

procedure TFGestorProyectosProgramacion.LvPlataformasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    eliminarPlataformaDesarrollo(self);
  end;
end;

procedure TFGestorProyectosProgramacion.verSeccion(Sender: TObject);
var
  ruta: string;
begin
  if lvSecciones.Selected <> nil then
  begin
    edDescSeccion.Text := lvSecciones.Selected.SubItems[3];

    Utilidades.limpiarImagen(imgSeccion);
    ruta := ProyectoProgramacion.RutaArchivos + '\' +
      lvSecciones.Selected.SubItems[4];

    barraEstado.Panels[2].Text := ruta;

    if FileExists(ruta) then
      imgSeccion.Picture.LoadFromFile(ruta);

  end;
end;

procedure TFGestorProyectosProgramacion.lvSeccionesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    eliminarSeccion(self);
end;

procedure TFGestorProyectosProgramacion.lvTiposFuncionalidadKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    EliminarTipoFuncionalidad(self);
  end;
end;

procedure TFGestorProyectosProgramacion.moverSeccionArriba(Sender: TObject);
var
  ord1, ord2, id: integer;
  IdSeccion1, IdSeccion2: string;
begin
  if lvSecciones.Selected <> nil then
  begin
    id := lvSecciones.Selected.Index;
    if id > 0 then
    begin

      ord1 := StrToInt(lvSecciones.Items[id - 1].SubItems[6]);
      ord2 := StrToInt(lvSecciones.Items[id].SubItems[6]);
      IdSeccion1 := lvSecciones.Items[id - 1].SubItems[5];
      IdSeccion2 := lvSecciones.Items[id].SubItems[5];

      ProyectoProgramacion.intercambiarOrden(IdSeccion1, IdSeccion2,
        ord1, ord2);

      lvSecciones.Items[id - 1].Selected := true;
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.pActualizarPerfilClick(Sender: TObject);
var
  ruta1, ruta2: string;
begin
  if dlgPerfil.Execute then
  begin
    ruta1 := dlgPerfil.FileName;
    imgPerfil.Picture.LoadFromFile(ruta1);
    ruta2 := ModuloDatos.ConfigApp.RutaArchivos + '\' + ModuloDatos.IdUsuario +
      ExtractFileExt(ruta1);
    imgPerfil.Picture.SaveToFile(ruta2);

    Query.Close;
    Query.SQL.Text := 'UPDATE Usuarios SET Imagen=:Imagen WHERE IdUsuario=' +
      #39 + ModuloDatos.IdUsuario + #39;
    Query.Params.ParamByName('Imagen').Value := ExtractFileName(ruta2);
    Query.ExecSQL;
  end;
end;

procedure TFGestorProyectosProgramacion.pActualizarPerfilMouseEnter
  (Sender: TObject);
begin
  pActualizarPerfil.Font.Color := clwhite;
  pActualizarPerfil.Font.Style := [fsBold];
end;

procedure TFGestorProyectosProgramacion.pActualizarPerfilMouseLeave
  (Sender: TObject);
begin
  pActualizarPerfil.Font.Color := clBlack;
  pActualizarPerfil.Font.Style := [];
end;

procedure TFGestorProyectosProgramacion.proyectoEditado(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  ProyectoProgramacion.actualizar;
  TabProyecto.Caption := '* ' + ProyectoProgramacion.Titulo;
  barraEstado.Panels[0].Text := 'Modificado';
  barraEstado.Panels[3].Text := '';
end;

procedure TFGestorProyectosProgramacion.Registro(Evento: Boolean);
begin
  if Evento then
  begin
    Principal.ActiveCard := cardPriContenido;
    ModuloDatos.IdUsuario := RegistroInicio.IdUsuario;
    ModuloDatos.Usuario := RegistroInicio.Usuario;

    FMensaje.mensaje('Hola ' + RegistroInicio.Usuario +
      ', bienvenido(a)', tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.sbAbajoSeccionClick(Sender: TObject);
var
  ord1, ord2, id: integer;
  IdSeccion1, IdSeccion2: string;
begin
  if lvSecciones.Selected <> nil then
  begin
    id := lvSecciones.Selected.Index;
    if id < (lvSecciones.Items.Count - 1) then
    begin

      ord1 := StrToInt(lvSecciones.Items[id].SubItems[6]);
      ord2 := StrToInt(lvSecciones.Items[id + 1].SubItems[6]);
      IdSeccion1 := lvSecciones.Items[id].SubItems[5];
      IdSeccion2 := lvSecciones.Items[id + 1].SubItems[5];

      ProyectoProgramacion.intercambiarOrden(IdSeccion1, IdSeccion2,
        ord1, ord2);

      lvSecciones.Items[id + 1].Selected := true;
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.sbAbrirProyectoClick(Sender: TObject);
var
  ruta: string;
  nombre, IdTabla, IdUsuario: string;
begin
  if FAbrirProyecto.seleccionarProyecto.Seleccionado then
  begin
    limpiarBarraEstado;
    limpiarEditores;

    pGuardar.Visible := true;
    pCerrarProyecto.Visible := true;
    pCompilar.Visible := true;

    Proyecto.ActiveCard := cardDatosBasicos;
    sbContenido.VertScrollBar.Position := 0;

    barraEstado.Panels[2].Text := FAbrirProyecto.ProyectoSeleccionado.
      IdProyecto;
    ProyectoProgramacion.leer(FAbrirProyecto.ProyectoSeleccionado.IdProyecto);

    edIdProyecto.Text := FAbrirProyecto.ProyectoSeleccionado.IdProyecto;

    ruta := ProyectoProgramacion.RutaTrabajo + '\Logo.png';

    if FileExists(ruta) then
      imgLogo.Picture.LoadFromFile(ruta);

    seRutaProyecto.Text := ProyectoProgramacion.RutaArchivos;
    seRutaProyecto.Lines.Add(ProyectoProgramacion.RutaTrabajo);

    ProyectoProgramacion.leerAutores;
    ProyectoProgramacion.LeerPasosInstalacion;
    ProyectoProgramacion.leerPlataformasDesarrollo;
    ProyectoProgramacion.leerModulos;
    ProyectoProgramacion.leerSeccionesManual;
    ProyectoProgramacion.leerFuncionalidades;

    TabProyecto.Caption := ProyectoProgramacion.Titulo;
    Contenido.ActiveCard := cardContenido;

    // Registrar en proyectos recientes
    nombre := ProyectoProgramacion.Titulo;
    IdTabla := ProyectoProgramacion.IdProyecto;
    ModuloDatos.ConfigApp.registrarReciente(nombre, IdTabla);
  end;
end;

procedure TFGestorProyectosProgramacion.sbAcercaAutorClick(Sender: TObject);
begin
  { }
end;

procedure TFGestorProyectosProgramacion.sbAcercaSoftwareClick(Sender: TObject);
begin
  { }
end;

procedure TFGestorProyectosProgramacion.sbActualizacionesClick(Sender: TObject);
var
  Actualizacion: TActualizacion;
  fecha: tdate;
begin
  FActualizaciones.limpiar;

  fecha := EncodeDate(2023, 1, 29);
  Actualizacion := FActualizaciones.Actualizacion(fecha);
  with Actualizacion do
  begin
    addDesc('Se agregaron los botones para editar y eliminar de autores' +
      ' y plataformas de desarrollo');
    addDesc('Se creó el módulo de diagramas entidad relación.');
    Add('Se crearon los manuales de la aplicación');
    Add('Se creó el instalador de la aplicación');
  end;

  fecha := EncodeDate(2023, 1, 26);
  Actualizacion := FActualizaciones.Actualizacion(fecha);
  with Actualizacion do
  begin
    addDesc('Se arreglo el problema de compilación de logo del código fuente');
    addDesc('Se agregó el atributo de orden a los autores.');
  end;

  fecha := EncodeDate(2023, 1, 19);
  Actualizacion := FActualizaciones.Actualizacion(fecha);
  with Actualizacion do
  begin
    addDesc('Se arreglo el sistema de rutas de archivos y compilación.');
    addDesc('Se terminó el código para abrir los proyectos desde la lista de' +
      ' proyectos recientes.');
    addDesc('Se creó formulario para importar pasos de instalación por defecto.');
  end;

  fecha := EncodeDate(2022, 11, 19);
  Actualizacion := FActualizaciones.Actualizacion(fecha);
  with Actualizacion do
  begin
    addDesc('Se creó el proyecto.');
  end;

  FActualizaciones.MostrarActualizaciones(ModuloDatos.ConfigApp.version);
end;

procedure TFGestorProyectosProgramacion.sbActualizarListaPasosInstalacionClick
  (Sender: TObject);
begin
  ProyectoProgramacion.LeerPasosInstalacion;
end;

procedure TFGestorProyectosProgramacion.sbAgregarAutorClick(Sender: TObject);
var
  ruta: string;
begin
  if FCrearEditarAutor.crearEditar(ACCION_CREAR, '',
    ProyectoProgramacion.IdProyecto) then
  begin
    if FCrearEditarAutor.CargoImagen then
    begin
      ruta := ProyectoProgramacion.RutaArchivos + '\' +
        FCrearEditarAutor.IdAutor + FCrearEditarAutor.ExtensionImagen;
      FCrearEditarAutor.guardarFotografiaAutor(ruta);
    end;

    ProyectoProgramacion.leerAutores;
    FMensaje.mensaje(FCrearEditarAutor.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.sbAgregarFuncionalidadClick
  (Sender: TObject);
begin
  if FCrearEditarFuncionalidad.creo(ProyectoProgramacion.IdProyecto) then
  begin
    ProyectoProgramacion.leerFuncionalidades;
    FMensaje.mensaje(FCrearEditarFuncionalidad.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.sbAgregarSeccionClick(Sender: TObject);
begin
  if FCrearEditarSeccion.crear(ProyectoProgramacion.IdProyecto,
    lvSecciones.Items.Count + 1) then
  begin
    ProyectoProgramacion.leerSeccionesManual;

    FMensaje.mensaje(FCrearEditarSeccion.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.sbAgregarTipoFuncionalidadClick
  (Sender: TObject);
begin
  if FCrearEditarTipoFuncionalidad.creo then
  begin
    leerTiposFuncionalidades;
    FMensaje.mensaje(FCrearEditarTipoFuncionalidad.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.sbAgregarPasoClick(Sender: TObject);
begin
  if FCrearEditarPasoInstalacion.crear(ProyectoProgramacion.IdProyecto,
    lvPasosInstalacion.Items.Count + 1) then
  begin
    ProyectoProgramacion.LeerPasosInstalacion;
    FMensaje.mensaje(FCrearEditarPasoInstalacion.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.abrirProyecto(Sender: TObject);
var
  ruta, nombre, IdTabla: string;
begin
  if lvRecientes.Selected <> nil then
  begin
    limpiarBarraEstado;
    limpiarEditores;

    pGuardar.Visible := true;
    pCerrarProyecto.Visible := true;
    pCompilar.Visible := true;

    Proyecto.ActiveCard := cardDatosBasicos;
    sbContenido.VertScrollBar.Position := 0;

    barraEstado.Panels[2].Text := FAbrirProyecto.ProyectoSeleccionado.
      IdProyecto;
    ProyectoProgramacion.leer(lvRecientes.Selected.SubItems[0]);
    ruta := ProyectoProgramacion.RutaArchivos + '\Logo.png';

    edIdProyecto.Text := lvRecientes.Selected.SubItems[0];

    if FileExists(ruta) then
      imgLogo.Picture.LoadFromFile(ruta);

    seRutaProyecto.Text := ProyectoProgramacion.RutaArchivos;
    seRutaProyecto.Lines.Add(ProyectoProgramacion.RutaTrabajo);

    ProyectoProgramacion.leerAutores;
    ProyectoProgramacion.LeerPasosInstalacion;
    ProyectoProgramacion.leerPlataformasDesarrollo;
    ProyectoProgramacion.leerModulos;
    ProyectoProgramacion.leerSeccionesManual;
    ProyectoProgramacion.leerFuncionalidades;

    TabProyecto.Caption := ProyectoProgramacion.Titulo;
    Contenido.ActiveCard := cardContenido;

    // Registrar en proyectos recientes
    nombre := ProyectoProgramacion.Titulo;
    IdTabla := ProyectoProgramacion.IdProyecto;
    ModuloDatos.ConfigApp.registrarReciente(nombre, IdTabla);
  end;
end;

procedure TFGestorProyectosProgramacion.agregarPlataformaDesarrollo
  (Sender: TObject);
begin
  if FCrearEditarPlataformaDesarrollo.crear(ProyectoProgramacion.IdProyecto)
  then
  begin

    ProyectoProgramacion.leerPlataformasDesarrollo;
    FMensaje.mensaje(FCrearEditarPlataformaDesarrollo.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.sbCerrarProyectoClick(Sender: TObject);
begin
  Contenido.ActiveCard := cardVacio;
  pGuardar.Visible := false;
  pCerrarProyecto.Visible := false;
  pCompilar.Visible := false;
end;

procedure TFGestorProyectosProgramacion.sbCerrarSesionClick(Sender: TObject);
begin
  RegistroInicio.cerrarSesion;
  RegistroInicio.limpiarFormulario;
  Principal.ActiveCard := cardPriRegistroInicio;
end;

procedure TFGestorProyectosProgramacion.eliminarPasoInstalacion
  (Sender: TObject);
var
  ruta: string;
begin
  if lvPasosInstalacion.Selected <> nil then
  begin
    if FMensaje.mensaje('¿Está seguro(a) de eliminar el paso (' +
      lvPasosInstalacion.Selected.SubItems[1] + ')?', tmQuestion) then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM PasosInstalacion WHERE IdRegistro=' + #39 +
        lvPasosInstalacion.Selected.SubItems[4] + #39;
      Query.ExecSQL;

      ruta := ProyectoProgramacion.RutaArchivos + '\' +
        lvPasosInstalacion.Selected.SubItems[3];

      if FileExists(ruta) then
        DeleteFile(ruta);

      ProyectoProgramacion.LeerPasosInstalacion;

      FMensaje.mensaje('El paso se eliminó correctamente', tmInfo);
    end;
  end;
end;

function TFGestorProyectosProgramacion.existeArchivo(ruta,
  idmodulo: string): Boolean;
begin
  QArchivo.Close;
  QArchivo.SQL.Text := 'SELECT * FROM CodigoFuente WHERE IdModulo=' + #39 +
    idmodulo + #39 + ' AND Nombre=' + #39 + ruta + #39;
  QArchivo.Open;

  result := QArchivo.RecordCount >= 1;
end;

procedure TFGestorProyectosProgramacion.sbCodigoFuenteClick(Sender: TObject);
begin
  edCodigoFuente.Text := Utilidades.seleccionarDirectorio;
end;

procedure TFGestorProyectosProgramacion.sbConsolaMensajesClick(Sender: TObject);
begin
  Consola.Show;
end;

procedure TFGestorProyectosProgramacion.compilarManualUsuario(Sender: TObject);
var
  i, j, n: integer;
  fileBat: TStringList;
  directorio, nombreArchivo, RutaArchivos, ruta, nombrePDF, idmodulo: string;
  resultado: integer;
  verProceso: integer;
  seccionManual: TSeccionManual;
  autorProyecto: TAutorProyecto;
begin
  Proyecto.ActiveCard := cardExportarTEX;

  seManualTecnico.Lines.Clear;

  With seManualTecnico.Lines do
  begin
    Add('\documentclass[12pt,oneside,spanish,openany]{Plantilla}');
    Add('\usepackage[T1]{fontenc}');
    Add('\usepackage[latin9]{inputenc}');
    Add('\usepackage[letterpaper]{geometry}');
    Add('\geometry{verbose,tmargin=3cm,bmargin=3cm,lmargin=3cm,rmargin=3cm}');
    Add('\setcounter{secnumdepth}{5}');
    Add('\setcounter{tocdepth}{3}');
    Add('\usepackage{babel}');
    Add('\usepackage{longtable}');
    Add('\usepackage{array}');
    Add('\addto\shorthandsspanish{\spanishdeactivate{~<>}}');
    Add('');
    Add('\usepackage{pifont}');
    Add('\usepackage{float}');
    Add('\usepackage{textcomp}');
    Add('\usepackage[unicode=true,');
    Add(' bookmarks=true,bookmarksnumbered=false,bookmarksopen=false,');
    Add(' breaklinks=false,pdfborder={0 0 0},pdfborderstyle={},backref=false,colorlinks=false]');
    Add(' {hyperref}');
    Add('\hypersetup{pdftitle={' + edTitulo.Text + '},');
    Add(' pdfauthor={Julián Andrés Rincón Penagos},');
    Add(' pdfsubject={Manual Técnico de Software},');
    Add(' pdfkeywords={' + edPalabrasClave.Text + '}}');
    Add('');
    Add('\makeatletter');
    Add('');
    Add('\providecommand{\tabularnewline}{\\}');
    Add('');
    Add('\usepackage{Plantilla}');
    Add('');
    Add('\AtBeginDocument{');
    Add('  \def\labelitemi{\ding{109}}');
    Add('  \def\labelitemii{\ding{113}}');
    Add('  \def\labelitemiii{\Pisymbol{psy}{68}}');
    Add('  \def\labelitemiv{\ding{226}}');
    Add('}');
    Add('');
    Add('\makeatother');
    Add('');
    Add('\begin{document}');
    Add('');
    Add('\Titulo{' + edTitulo.Text + '}');
    Add('');
    Add('\Subtitulo{' + edSubtituloProyecto.Text + '}');
    Add('');

    // Leer a los autores
    Add('\Autores{%');
    Add('\begin{tabular}{c}');

    ProyectoProgramacion.leerAutores;
    for i := 1 to ProyectoProgramacion.cantidadAutores do
      Add(ProyectoProgramacion.obtenerAutor(i - 1).nombre + '\tabularnewline');
    Add('\end{tabular}}');

    Add('');
    Add('\AutoresCorto{' + ProyectoProgramacion.obtenerAutoresCorto + '}');
    Add('');
    Add('\Institucion{' + edInstitucion.Text + '}');
    Add('');
    Add('\Ciudad{' + edCiudad.Text + '}');
    Add('');
    Add('\Fecha{' + edFecha.Text + '}');
    Add('');
    Add('\Version{' + edVersion.Text + '}');
    Add('');
    Add('\Logo{Imagenes/Logo.png}');
    Add('');
    Add('\GenerarPortada{}');
    Add('');
    Add('\DerechosAutor{}');
    Add('');
    Add('\tableofcontents{}');
    Add('');
    Add('\TipoCapitulo{Capítulo}');
    Add('');
    Add('\chapter*{Acerca de los autores}');
    Add('\begin{center}');
    Add('\begin{tabular}{>{\centering}m{3.5cm}>{\raggedright}m{11cm}}');

    for i := 1 to ProyectoProgramacion.cantidadAutores do
    begin
      autorProyecto := ProyectoProgramacion.obtenerAutor(i - 1);

      ProyectoProgramacion.exportarArchivo(autorProyecto.Fotografia,
        'Imagenes');

      Add(' & \textbf{' + autorProyecto.nombre + ' (' + autorProyecto.Correo +
        ')}\tabularnewline');
      Add('\includegraphics[width=3.25cm]{Imagenes/' + autorProyecto.Fotografia
        + '} & ');
      Add('\begin{minipage}[t]{11cm}%');
      Add(autorProyecto.Biografia);
      Add('\vspace{5mm}');
      Add('\end{minipage}\tabularnewline');
    end;
    Add('\end{tabular}');
    Add('\par\end{center}');
    Add('');
    Add('\chapter{Introducción}');
    Add('');
    Add(ProyectoProgramacion.Resumen);
    Add('');
    Add('\chapter{Manual de Usuario}');
    Add('');

    barraEstado.Panels[1].Text := 'Secciones = ' +
      IntToStr(ProyectoProgramacion.cantidadSecciones);
    for i := 1 to ProyectoProgramacion.cantidadSecciones do
    begin
      seccionManual := ProyectoProgramacion.obtenerSeccion(i - 1);
      Add('\' + seccionManual.Tipo + '{' + seccionManual.nombre + '}');
      Add(seccionManual.Descripcion);
      Add('');

      Consola.log(seccionManual.RutaImagen, 'compilarManualUsuario');
      Consola.log(ProyectoProgramacion.RutaCompilacion, 'RutaCompilación');
      ProyectoProgramacion.exportarArchivo
        (ExtractFileName(seccionManual.RutaImagen), 'Imagenes');

      if FileExists(seccionManual.RutaImagen) then
      begin
        Add('\begin{figure}[H]');
        Add('\begin{centering}');
        Add('\includegraphics[width=15cm]{Imagenes/' +
          seccionManual.imagen + '}');
        Add('\par\end{centering}');
        Add('\caption{' + seccionManual.nombre + '}');
        Add('\end{figure}');
        Add('');
      end;
    end;

    Add('\end{document}');
    Add('');
  end;

  directorio := ProyectoProgramacion.RutaCompilacion;
  barraEstado.Panels[2].Text := directorio;
  nombreArchivo := 'Manual-Usuario.tex';
  seManualTecnico.Lines.SaveToFile(directorio + '\' + nombreArchivo);

  LR.guardarRecursoDirectorio('CLS', directorio + '\Plantilla.cls');
  LR.guardarRecursoDirectorio('STY', directorio + '\Plantilla.sty');

  { Exportar imágenes }
  ProyectoProgramacion.exportarArchivo('Logo.png', 'Imagenes');

  fileBat := TStringList.create;
  fileBat.Add('pdflatex -file-line-error ' + nombreArchivo);
  fileBat.SaveToFile(directorio + '\compilar.bat');

  nombrePDF := Copy(nombreArchivo, 1, length(nombreArchivo) - 4) + '.pdf';
  FRutaArchivoPDF := directorio + '\' + nombrePDF;

  FIndicador.Show;
  Application.ProcessMessages;
  if cbVerProceso.Checked then
    verProceso := SW_SHOWNORMAL
  else
    verProceso := SW_HIDE;

  if FileExists(directorio + '\' + nombrePDF) then
    DeleteFile(directorio + '\' + nombrePDF);

  resultado := ShellExecute(Handle, 'open', pchar(directorio + '\compilar.bat'),
    nil, pchar(directorio), verProceso);

  while not FileExists(directorio + '\' + nombrePDF) do
  begin
    Sleep(100);
    FIndicador.actualizar;
  end;
  FIndicador.Close;

  if resultado = 42 then
  begin
    FMensaje.mensaje('El manual se exportó correctamente: código (' +
      IntToStr(resultado) + ')', tmInfo);

    resultado := ShellExecute(Handle, 'open',
      pchar(directorio + '\' + nombrePDF), nil, pchar(directorio), SW_NORMAL);
  end;
end;

procedure TFGestorProyectosProgramacion.compilarManualTecnico(Sender: TObject);
var
  i, j, n: integer;
  fileBat: TStringList;
  directorio, nombreArchivo, RutaArchivos, ruta, nombrePDF, idmodulo: string;
  resultado: integer;
  pasoInstalacion: TPasoInstalacion;
  plataforma: TPlataformaDesarrollo;
  funcionalidad: TFuncionalidad;
  archivoCodigo: TArchivoCodigo;
  verProceso: integer;
  autorProyecto: TAutorProyecto;
begin
  Proyecto.ActiveCard := cardExportarTEX;

  seManualTecnico.Lines.Clear;

  With seManualTecnico.Lines do
  begin
    Add('\documentclass[12pt,oneside,spanish,openany]{Plantilla}');
    Add('\usepackage[T1]{fontenc}');
    Add('\usepackage[latin9]{inputenc}');
    Add('\usepackage[letterpaper]{geometry}');
    Add('\geometry{verbose,tmargin=3cm,bmargin=3cm,lmargin=3cm,rmargin=3cm}');
    Add('\setcounter{secnumdepth}{5}');
    Add('\setcounter{tocdepth}{3}');
    Add('\usepackage{babel}');
    Add('\usepackage{longtable}');
    Add('\usepackage{array}');
    Add('\addto\shorthandsspanish{\spanishdeactivate{~<>}}');
    Add('');
    Add('\usepackage{pifont}');
    Add('\usepackage{float}');
    Add('\usepackage{textcomp}');
    Add('\usepackage[unicode=true,');
    Add(' bookmarks=true,bookmarksnumbered=false,bookmarksopen=false,');
    Add(' breaklinks=false,pdfborder={0 0 0},pdfborderstyle={},backref=false,colorlinks=false]');
    Add(' {hyperref}');
    Add('\hypersetup{pdftitle={' + edTitulo.Text + '},');
    Add(' pdfauthor={Julián Andrés Rincón Penagos},');
    Add(' pdfsubject={Manual Técnico de Software},');
    Add(' pdfkeywords={' + edPalabrasClave.Text + '}}');
    Add('');
    Add('\makeatletter');
    Add('');
    Add('\providecommand{\tabularnewline}{\\}');
    Add('');
    Add('\usepackage{Plantilla}');
    Add('');
    Add('\AtBeginDocument{');
    Add('  \def\labelitemi{\ding{109}}');
    Add('  \def\labelitemii{\ding{113}}');
    Add('  \def\labelitemiii{\Pisymbol{psy}{68}}');
    Add('  \def\labelitemiv{\ding{226}}');
    Add('}');
    Add('');
    Add('\makeatother');
    Add('');
    Add('\begin{document}');
    Add('');
    Add('\Titulo{' + edTitulo.Text + '}');
    Add('');
    Add('\Subtitulo{' + edSubtituloProyecto.Text + '}');
    Add('');

    // Leer a los autores
    Add('\Autores{%');
    Add('\begin{tabular}{c}');

    ProyectoProgramacion.leerAutores;
    for i := 1 to ProyectoProgramacion.cantidadAutores do
      Add(ProyectoProgramacion.obtenerAutor(i - 1).nombre + '\tabularnewline');
    Add('\end{tabular}}');

    Add('');
    Add('\AutoresCorto{' + ProyectoProgramacion.obtenerAutoresCorto + '}');
    Add('');
    Add('\Institucion{' + edInstitucion.Text + '}');
    Add('');
    Add('\Ciudad{' + edCiudad.Text + '}');
    Add('');
    Add('\Fecha{' + edFecha.Text + '}');
    Add('');
    Add('\Version{' + edVersion.Text + '}');
    Add('');
    Add('\Logo{Imagenes/Logo.png}');
    Add('');
    Add('\GenerarPortada{}');
    Add('');
    Add('\DerechosAutor{}');
    Add('');
    Add('\tableofcontents{}');
    Add('');
    Add('\TipoCapitulo{Capítulo}');
    Add('');
    Add('\chapter*{Acerca de los autores}');
    Add('\begin{center}');
    Add('\begin{tabular}{>{\centering}m{3.5cm}>{\raggedright}m{11cm}}');

    for i := 1 to ProyectoProgramacion.cantidadAutores do
    begin
      autorProyecto := ProyectoProgramacion.obtenerAutor(i - 1);

      ProyectoProgramacion.exportarArchivo(autorProyecto.Fotografia,
        'Imagenes');

      Add(' & \textbf{' + autorProyecto.nombre + '}\tabularnewline');
      Add('\includegraphics[width=3.25cm]{Imagenes/' + autorProyecto.Fotografia
        + '} & ');
      Add('\begin{minipage}[t]{11cm}%');
      Add(autorProyecto.Biografia);
      Add('\vspace{5mm}');
      Add('\end{minipage}\tabularnewline');
    end;
    Add('\end{tabular}');
    Add('\par\end{center}');

    Add('\chapter*{Datos de Publicación}');
    Add('\begin{itemize}');
    Add('\item Certificado de Registro de Soporte Lógico - Software');
    Add('\item Libro Tomo Partida: \textbf{' + edRegistro.Text + '}');
    Add('\item Fecha de Registro:\textbf{' + edFechaRegistro.Text + '}');
    Add('\item Título Original: \textbf{\dTitulo}');
    Add('\item Ministerio del Interior - Dirección Nacional de Derecho de Autor\\');
    Add('\item Copyright © \textbf{\dFecha}');
    Add('\end{itemize}');
    Add('');
    Add('\chapter{Introducción}');
    Add('');
    Add(ProyectoProgramacion.Resumen);
    Add('');
    Add('\chapter{Aportes al Conocimiento}');
    Add('');
    Add(ProyectoProgramacion.Aportes);
    Add('');
    Add('\chapter{Diseño y Desarrollo}');
    Add('');
    Add('El software se ha desarrollado a través de plataformas de');
    Add(' programación y editores gráficos, así como algunos softwares');
    Add('  de terceros que se describiran a continuación.');

    // Leer las Plataformas
    Add('\section{Plataformas e IDEs usados para el desarrollo del Software}');
    Add('');
    ProyectoProgramacion.leerPlataformasDesarrollo;
    for i := 1 to ProyectoProgramacion.cantidadPlataformasDesarrollo do
    begin
      plataforma := ProyectoProgramacion.obtenerPlataformaDesarrollo(i - 1);
      Add('\subsection{' + plataforma.nombre + '}');
      Add(plataforma.Descripcion);
      Add('');

      // Copiar la imagen a la carpeta de Imagenes
      ruta := ExtractFileName(plataforma.RutaImagen);
      ProyectoProgramacion.exportarArchivo(ruta, 'Imagenes');

      Add('\begin{figure}[H]');
      Add('\begin{centering}');
      Add('\includegraphics[width=12cm]{Imagenes/' + plataforma.imagen + '}');
      Add('\par\end{centering}');
      Add('\caption{' + plataforma.nombre + '}');
      Add('\end{figure}');
      Add('');
    end;

    // Funcionalidades
    Add('\section{Funcionalidades}');
    Add('A continuación se realiza un listado de las funcionalidades que' +
      ' componen al software/aplicación');
    Add('\begin{enumerate}');
    ProyectoProgramacion.leerFuncionalidades;
    for i := 1 to ProyectoProgramacion.cantidadFuncionalidades do
    begin
      funcionalidad := ProyectoProgramacion.obtenerFuncionalidad(i - 1);
      Add('\item \textbf{' + funcionalidad.funcionalidad + ': }');
      Add(funcionalidad.Descripcion);
      Add('');
    end;
    Add('\end{enumerate}');

    { Instalación y Datos del Software }
    Add('\chapter{Instalación y Datos del Software}');
    Add('');
    Add('A continuación se presenta el instructivo para la instalación');
    Add(' del software. Se muestra la ficha técnica, los requisitos');
    Add(' mínimos del sistema y los pasos para la instalación.');
    Add('');
    Add('\section{Ficha Técnica del Software}');
    Add('\begin{itemize}');
    Add('\item \textbf{Nombre:} ' + edTitulo.Text);
    Add('\item \textbf{Versión:} ' + edVersion.Text);
    Add('\item \textbf{Fecha de Publicación:} ' + edFecha.Text);
    Add('\item \textbf{Autores:} ' + ProyectoProgramacion.obtenerAutoresCorto);
    Add('\item \textbf{Institutución:} ' + edInstitucion.Text);
    Add('\item \textbf{Lenguaje(s) utilizado(s):} ' + edLenguaje.Text);
    Add('\item \textbf{Diseño Gráfico:} ' + edDisenoGrafico.Text);
    Add('\item \textbf{Plataforma:} ' + edSistemaOperativo.Text);
    Add('\end{itemize}');
    Add('');
    Add('\section{Requisitos de Instalación}');
    Add('\begin{itemize}');
    Add('\item \textbf{Sistema Operativo:} ' + edSistemaOperativo.Text);
    Add('\item \textbf{Capacidad en Disco Duro:} ' + edDiscoDuro.Text);
    Add('\item \textbf{Capacidad en Memoria Ram:} ' + edMemoriaRam.Text);
    Add('\item \textbf{Tamaño de Pantalla:} ' + edPantalla.Text);
    Add('\item \textbf{Requiere Mouse:} ' + edMouse.Text);
    Add('\item \textbf{Requiere Teclado:} ' + edTeclado.Text);
    Add('\item \textbf{Requiere Impresora:} ' + edImpresora.Text);
    Add('\item \textbf{Requiere Escaner:} ' + edEscaner.Text);
    Add('\item \textbf{Requiere Micrófono:} ' + edMicrofono.Text);
    Add('\item \textbf{Requiere Altavoces:} ' + edAltavoces.Text);
    Add('\item \textbf{Requiere Conexión a Internet:} ' + edInterner.Text);
    Add('\end{itemize}');
    Add('');

    { Pasos de Instalación }
    Add('\section{Pasos de Instalación}');
    ProyectoProgramacion.LeerPasosInstalacion;
    for i := 1 to ProyectoProgramacion.cantidadPasosInstalacion do
    begin
      pasoInstalacion := ProyectoProgramacion.obtenerPasoInstalacion(i - 1);
      Add('\subsection{Paso ' + IntToStr(i) + ': ' +
        pasoInstalacion.Titulo + '}');
      Add(pasoInstalacion.Descripcion);
      Add('');

      // Copiar la imagen a la carpeta de Imagenes
      // Copiar la imagen a la carpeta de Imagenes
      ruta := ExtractFileName(pasoInstalacion.RutaImagen);
      ProyectoProgramacion.exportarArchivo(ruta, 'Imagenes');

      Add('\begin{figure}[H]');
      Add('\begin{centering}');
      Add('\includegraphics[width=12cm]{Imagenes/' +
        pasoInstalacion.imagen + '}');
      Add('\par\end{centering}');
      Add('\caption{' + pasoInstalacion.Titulo + '}');
      Add('\end{figure}');
      Add('');
    end;

    Add('');
    Add('\chapter{Estructura y Diseño de la Aplicación}');
    ProyectoProgramacion.leerModulos;
    Add('La aplicación cuenta con ' + Utilidades.numeroToLetras
      (ProyectoProgramacion.cantidadModulos) +
      ' módulos que componen al código, estos son:');
    Add('');
    Add('\begin{enumerate}');
    for i := 1 to ProyectoProgramacion.cantidadModulos do
    begin
      Add('   \item ' + ProyectoProgramacion.obtenerModulo(i - 1).Modulo);
    end;
    Add('\end{enumerate}');
    Add('');
    Add('A contiuación se muestra un listado del contenido de cada módulo.');

    for i := 1 to ProyectoProgramacion.cantidadModulos do
    begin
      idmodulo := ProyectoProgramacion.obtenerModulo(i - 1).idmodulo;

      Add('');
      Add('\section{' + ProyectoProgramacion.obtenerModulo(i - 1).Modulo + '}');
      Add('');

      Add('\begin{longtable}[c]{|>{\centering}p{1cm}|>{\raggedright}p{7cm}|>{\raggedright}p{6cm}|}');
      Add('\hline ');
      Add('\textbf{No} & \textbf{Nombre} & \textbf{Descripción}\tabularnewline');
      Add('\hline ');
      n := ProyectoProgramacion.leerArchivosCodigo(idmodulo, 'Nombre');
      for j := 1 to n do
      begin
        archivoCodigo := ProyectoProgramacion.obtenerArchivoCodigo(j - 1);

        nombreArchivo := ExtractFileName(archivoCodigo.nombre);
        nombreArchivo := StringReplace(nombreArchivo, '_', '\_',
          [rfReplaceAll]);
        Add(IntToStr(j) + ' & ' + nombreArchivo + ' & ' +
          archivoCodigo.Descripcion + ' \tabularnewline');
        Add('\hline ');
      end;
      Add('\end{longtable}');
      Add('');
    end;

    Add('\end{document}');
    Add('');
  end;

  directorio := ProyectoProgramacion.RutaCompilacion;
  barraEstado.Panels[2].Text := directorio;
  nombreArchivo := 'Manual-Tecnico.tex';
  seManualTecnico.Lines.SaveToFile(directorio + '\' + nombreArchivo);

  LR.guardarRecursoDirectorio('CLS', directorio + '\Plantilla.cls');
  LR.guardarRecursoDirectorio('STY', directorio + '\Plantilla.sty');

  { Exportar imágenes }
  ProyectoProgramacion.exportarArchivo('Logo.png', 'Imagenes');

  fileBat := TStringList.create;
  fileBat.Add('pdflatex -file-line-error ' + nombreArchivo);
  fileBat.SaveToFile(directorio + '\compilar.bat');

  nombrePDF := Copy(nombreArchivo, 1, length(nombreArchivo) - 4) + '.pdf';
  FRutaArchivoPDF := directorio + '\' + nombrePDF;

  FIndicador.Show;
  Application.ProcessMessages;
  if cbVerProceso.Checked then
    verProceso := SW_SHOWNORMAL
  else
    verProceso := SW_HIDE;

  if FileExists(directorio + '\' + nombrePDF) then
    DeleteFile(directorio + '\' + nombrePDF);

  resultado := ShellExecute(Handle, 'open', pchar(directorio + '\compilar.bat'),
    nil, pchar(directorio), SW_HIDE);

  while not FileExists(directorio + '\' + nombrePDF) do
  begin
    Sleep(100);
    FIndicador.actualizar;
  end;
  FIndicador.Close;

  if resultado = 42 then
  begin
    FMensaje.mensaje('El manual se exportó correctamente: código (' +
      IntToStr(resultado) + ')', tmInfo);

    resultado := ShellExecute(Handle, 'open',
      pchar(directorio + '\' + nombrePDF), nil, pchar(directorio), SW_NORMAL);
  end;
end;

procedure TFGestorProyectosProgramacion.sbCrearCodigoClick(Sender: TObject);
begin
  if lvModulos.Selected <> nil then
  begin
    if FCrearEditarCodigoFuente.crear(ProyectoProgramacion.IdModuloSeleccionado)
    then
    begin
      ProyectoProgramacion.leerArchivosCodigo
        (ProyectoProgramacion.IdModuloSeleccionado, 'Nombre');
      FMensaje.mensaje(FCrearEditarCodigoFuente.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.sbCrearModuloClick(Sender: TObject);
begin
  if FCrearEditarModulo.crear(ProyectoProgramacion.IdProyecto) then
  begin
    ProyectoProgramacion.leerModulos;
    FMensaje.mensaje(FCrearEditarModulo.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.sbCrearTablaClick(Sender: TObject);
begin
  FCrearEditarDER.ShowModal;
end;

procedure TFGestorProyectosProgramacion.sbDefectoClick(Sender: TObject);
begin
  if FPasosInstalacionDefecto.seleccionoPaso then
  begin
    if FCrearEditarPasoInstalacion.crearDesdePlantilla
      (ProyectoProgramacion.IdProyecto, FPasosInstalacionDefecto.Descripcion,
      FPasosInstalacionDefecto.nombre, FPasosInstalacionDefecto.ruta,
      lvPasosInstalacion.Items.Count + 1) then
    begin
      ProyectoProgramacion.LeerPasosInstalacion;
      FMensaje.mensaje(FCrearEditarPasoInstalacion.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.editarSeccionManual(Sender: TObject);
var
  IdProyecto, IdSeccion: string;
begin
  if lvSecciones.Selected <> nil then
  begin
    IdProyecto := ProyectoProgramacion.IdProyecto;
    IdSeccion := lvSecciones.Selected.SubItems[5];
    if FCrearEditarSeccion.editar(IdSeccion, IdProyecto) then
    begin
      ProyectoProgramacion.leerSeccionesManual;

      FMensaje.mensaje(FCrearEditarSeccion.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.eliminarSeccion(Sender: TObject);
var
  IdSeccion, Seccion: string;
begin
  if lvSecciones.Selected <> nil then
  begin
    Seccion := lvSecciones.Selected.SubItems[2];
    IdSeccion := lvSecciones.Selected.SubItems[5];
    if FMensaje.mensaje('¿Está seguro de eliminar la sección (' + Seccion +
      ')?', tmQuestion) then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM ManualUsuario WHERE IdRegistro=' + #39 +
        IdSeccion + #39;
      Query.ExecSQL;

      ProyectoProgramacion.leerSeccionesManual;

      FMensaje.mensaje('La sección se eliminó correctamente', tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.Eliminartodoslosarchivos1Click
  (Sender: TObject);
var
  idmodulo: string;
begin
  if lvModulos.Selected <> Nil then
  begin
    idmodulo := lvModulos.Selected.SubItems[3];

    if FMensaje.mensaje('¿Está seguro de eliminar todos los archivos?',
      tmQuestion) then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM CodigoFuente WHERE IdModulo=' + #39 +
        idmodulo + #39;
      Query.ExecSQL;

      ProyectoProgramacion.leerArchivosCodigo(idmodulo, 'Nombre');
      FMensaje.mensaje('Los archivos se eliminaron correctamente', tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.eliminarAutor(Sender: TObject);
begin
  if lvAutores.Selected <> nil then
  begin
    if FMensaje.mensaje('¿Está seguro de eliminar al autor: ' +
      lvAutores.Selected.SubItems[1] + '?', tmQuestion) then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM AutoresProyecto WHERE IdAutor=' + #39 +
        lvAutores.Selected.SubItems[3] + #39;
      Query.ExecSQL;

      ProyectoProgramacion.leerAutores;
      FMensaje.mensaje('El autor se eliminó correctamente', tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.eliminarPlataformaDesarrollo
  (Sender: TObject);
begin
  if LvPlataformas.Selected <> nil then
  begin
    if FMensaje.mensaje('¿Está seguro(a) de eliminar la plataforma: ' +
      LvPlataformas.Selected.SubItems[1] + '?', tmQuestion) then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM PlataformasDesarrollo WHERE IdPlataforma='
        + #39 + LvPlataformas.Selected.SubItems[4] + #39;
      Query.ExecSQL;

      ProyectoProgramacion.leerPlataformasDesarrollo;
      FMensaje.mensaje
        ('La plataforma de desarrollo se eliminó correctamente', tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.editarTipoFuncionalidad
  (Sender: TObject);
var
  IdTipo: string;
begin
  if lvTiposFuncionalidad.Selected <> nil then
  begin
    IdTipo := lvTiposFuncionalidad.Selected.SubItems[4];
    if FCrearEditarTipoFuncionalidad.edito(IdTipo) then
    begin
      leerTiposFuncionalidades;
      FMensaje.mensaje(FCrearEditarTipoFuncionalidad.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.EliminarTipoFuncionalidad
  (Sender: TObject);
var
  IdTipo: string;
begin
  if lvTiposFuncionalidad.Selected <> nil then
  begin
    if FMensaje.mensaje('¿Está seguro(a) de eliminar el tipo de funcionalidad: '
      + lvTiposFuncionalidad.Selected.SubItems[1] + '?', tmQuestion) then
    begin
      IdTipo := lvTiposFuncionalidad.Selected.SubItems[4];
      Query.Close;
      Query.SQL.Text := 'DELETE FROM TiposFuncionalidades WHERE IdTipo=' + #39 +
        IdTipo + #39;
      Query.ExecSQL;

      leerTiposFuncionalidades;
      FMensaje.mensaje
        ('El tipo de funcionalidad se eliminó correcamtente', tmInfo);
    end;
  end;
end;

{ procedure = sbEliminarTodosArchivosClick
  description = elimina todos los archivos asociados a un módulo de programación }
procedure TFGestorProyectosProgramacion.sbEliminarTodosArchivosClick
  (Sender: TObject);
begin
  if lvModulos.Selected <> nil then
  begin
    Query.Close;
    Query.SQL.Text := 'DELETE FROM CodigoFuente WHERE IdModulo=' + #39 +
      lvModulos.Selected.SubItems[3] + #39;
    Query.ExecSQL;

    ProyectoProgramacion.IdModuloSeleccionado := lvModulos.Selected.SubItems[3];
    ProyectoProgramacion.leerArchivosCodigo
      (ProyectoProgramacion.IdModuloSeleccionado, 'Nombre');
    sbExaminarDirectorio.Visible := true;
  end;
end;

procedure TFGestorProyectosProgramacion.sbExaminarDirectorioClick
  (Sender: TObject);
var
  directorio, Extensiones, Excluir, Ext: string;
  Archivos: TStringList;
  i: integer;
begin
  directorio := Utilidades.seleccionarDirectorio;
  Extensiones := '.html, .css, .ts, .js, .json, .pas, .dpr, .py, .sql';
  Excluir := 'node_modules, dist, ., .., environment.prod.ts, environment.ts,' +
    ' karma.conf.js, polyfills.ts, test.ts, tsconfig.app.json, ' +
    'tsconfig.spec.json, tslint.json';
  Archivos := Utilidades.archivosDirectorio(directorio, Excluir, Extensiones);

  if FMensaje.mensaje
    ('¿Está seguro de importar todos los archivos del directorio: ' + #39 +
    directorio + #39 + ', son ' + IntToStr(Archivos.Count) + ' archivos?',
    tmQuestion) then
  begin
    // Guardar los archivos en la base de datos
    for i := 1 to Archivos.Count do
    begin
      if not existeArchivo(Archivos[i - 1],
        ProyectoProgramacion.IdModuloSeleccionado) then
      begin
        Query.Close;
        Query.SQL.Text := 'INSERT INTO CodigoFuente (';
        Query.SQL.Add('IdCodigo, ');
        Query.SQL.Add('Nombre, ');
        Query.SQL.Add('Lenguaje, ');
        Query.SQL.Add('IdModulo) VALUES (');
        Query.SQL.Add(':IdCodigo, ');
        Query.SQL.Add(':Nombre, ');
        Query.SQL.Add(':Lenguaje, ');
        Query.SQL.Add(':IdModulo)');

        Query.Params.ParamByName('IdCodigo').Value := Utilidades.generarID;
        Query.Params.ParamByName('Nombre').Value := Archivos[i - 1];

        Ext := ExtractFileExt(Archivos[i - 1]);
        Query.Params.ParamByName('Lenguaje').Value :=
          Utilidades.obtenerLenguaje(Ext);
        Query.Params.ParamByName('IdModulo').Value :=
          ProyectoProgramacion.IdModuloSeleccionado;

        Query.ExecSQL;
      end;
    end;

    ProyectoProgramacion.leerArchivosCodigo
      (ProyectoProgramacion.IdModuloSeleccionado, 'Descripcion');
    FMensaje.mensaje('El directorio se importó correctamente', tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.eliminarArchivoCodigo(Sender: TObject);
begin
  if lvArchivos.Selected <> nil then
  begin
    if FMensaje.mensaje('¿Está seguro de eliminar el archivo (' +
      lvArchivos.Selected.SubItems[1] + ')?', tmQuestion) then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM CodigoFuente WHERE IdCodigo=' + #39 +
        lvArchivos.Selected.SubItems[4] + #39;
      Query.ExecSQL;

      ProyectoProgramacion.leerArchivosCodigo
        (ProyectoProgramacion.IdModuloSeleccionado, 'Descripcion');

      FMensaje.mensaje('El archivo de eliminó correctamente', tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.Eliminararchivossindescripcin1Click
  (Sender: TObject);
var
  idmodulo, idcodigo: string;
  i: integer;
begin
  if lvModulos.Selected <> Nil then
  begin
    idmodulo := lvModulos.Selected.SubItems[3];

    if FMensaje.mensaje
      ('¿Está seguro de eliminar los archivos sin descripción?', tmQuestion)
    then
    begin
      for i := 1 to lvArchivos.Items.Count do
      begin
        if length(lvArchivos.Items[i - 1].SubItems[3]) = 0 then
        begin
          idcodigo := lvArchivos.Items[i - 1].SubItems[4];

          Query.Close;
          Query.SQL.Text := 'DELETE FROM CodigoFuente WHERE IdCodigo=' + #39 +
            idcodigo + #39;
          Query.ExecSQL;
        end;
      end;

      ProyectoProgramacion.leerArchivosCodigo(idmodulo, 'Nombre');
      FMensaje.mensaje('Los archivos se eliminaron correctamente', tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.editarModuloCodigo(Sender: TObject);
begin
  if FCrearEditarModulo.editar(lvModulos.Selected.SubItems[3]) then
  begin
    ProyectoProgramacion.leerModulos;
    FMensaje.mensaje(FCrearEditarModulo.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.eliminarModuloCodigo(Sender: TObject);
begin
  if lvModulos.Selected <> Nil then
  begin
    if FMensaje.mensaje('¿Está seguro de eliminar el módulo (' +
      lvModulos.Selected.SubItems[1] + ')?', tmQuestion) then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM ModulosCodigo WHERE IdModulo=' + #39 +
        lvModulos.Selected.SubItems[3] + #39;
      Query.ExecSQL;

      ProyectoProgramacion.leerModulos;
      FMensaje.mensaje('El módulo se eliminó correctamente', tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.sbGuardarClick(Sender: TObject);
begin
  if ProyectoProgramacion.Abierto then
  begin
    limpiarBarraEstado;

    ProyectoProgramacion.guardar;
    barraEstado.Panels[3].Text := 'Proyecto actualizado correctamente';
    Caption := ModuloDatos.ConfigApp.version + ' (' +
      ProyectoProgramacion.Titulo + ' - Guardado)';
    TabProyecto.Caption := ProyectoProgramacion.Titulo;

    FToast.mostrar('Proyecto actualizado correctamente');
  end;
end;

procedure TFGestorProyectosProgramacion.importarPlataformaDesarrollo
  (Sender: TObject);
begin
  if FImportarPlataforma.seleccionoPlataforma then
  begin
    if FCrearEditarPlataformaDesarrollo.crearDesdePlantilla
      (ProyectoProgramacion.IdProyecto, FImportarPlataforma.nombre,
      FImportarPlataforma.Descripcion, FImportarPlataforma.RutaImagen) then
    begin
      ProyectoProgramacion.leerPlataformasDesarrollo;
      FMensaje.mensaje(FCrearEditarPlataformaDesarrollo.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.sbLeerLogoClick(Sender: TObject);
var
  ruta: string;
begin
  if dlgLogo.Execute then
  begin
    imgLogo.Picture.LoadFromFile(dlgLogo.FileName);
    ruta := ProyectoProgramacion.RutaArchivos + '\Logo.png';
    barraEstado.Panels[2].Text := ruta;
    imgLogo.Picture.SaveToFile(ruta);

    FMensaje.mensaje('El  logo se leyó correctamente', tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.sbNuevoProyectoClick(Sender: TObject);
begin
  if FCrearEditarProyecto.crearEditar(ACCION_CREAR, '') then
  begin
    pGuardar.Visible := true;
    pCerrarProyecto.Visible := true;
    pCompilar.Visible := true;

    Proyecto.ActiveCard := cardDatosBasicos;
    sbContenido.VertScrollBar.Position := 0;

    barraEstado.Panels[2].Text := FCrearEditarProyecto.IdProyecto;
    ProyectoProgramacion.leer(FCrearEditarProyecto.IdProyecto);

    barraEstado.Panels[3].Text := ProyectoProgramacion.RutaTrabajo;

    ProyectoProgramacion.leerAutores;
    ProyectoProgramacion.LeerPasosInstalacion;
    ProyectoProgramacion.leerPlataformasDesarrollo;
    ProyectoProgramacion.leerModulos;

    TabProyecto.Caption := ProyectoProgramacion.Titulo;
    Contenido.ActiveCard := cardContenido;

    FMensaje.mensaje(FCrearEditarProyecto.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.sbVerPDFClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', pchar(FRutaArchivoPDF), nil, nil, SW_NORMAL);
end;

procedure TFGestorProyectosProgramacion.seleccionarMenu(Sender: TObject);
var
  sMenu: string;
begin
  if tvEstructura.Selected <> nil then
  begin
    sMenu := tvEstructura.Selected.Text;

    if sMenu = EST_DATOS_BASICOS then
      Proyecto.ActiveCard := cardDatosBasicos;

    if sMenu = EST_LOGO then
      Proyecto.ActiveCard := cardLogo;

    if sMenu = EST_APORTES_CONOCIMIENTO then
      Proyecto.ActiveCard := cardAportesConocimiento;

    if sMenu = EST_DIAGRAMA_ENTIDAD_RELACION then
      Proyecto.ActiveCard := cardDER;

    if sMenu = EST_FUNCIONALIDADES then
      Proyecto.ActiveCard := cardFuncionalidades;

    if sMenu = EST_ARCHIVOS then
    begin
      Proyecto.ActiveCard := cardArchivos;
      sbExaminarDirectorio.Visible := false;
    end;

    if sMenu = EST_INSTALACION then
      Proyecto.ActiveCard := cardInstalacion;

    if sMenu = EST_AUTORS then
      Proyecto.ActiveCard := cardAutores;

    if sMenu = EST_PLATAFORMAS then
      Proyecto.ActiveCard := cardPlataformas;

    if sMenu = EST_MANUAL_USUARIO then
      Proyecto.ActiveCard := cardManualUsuario;

    if sMenu = EST_TIPOS_FUNCIONALIDADES then
    begin
      Proyecto.ActiveCard := cardTiposFuncionalidad;
      leerTiposFuncionalidades;
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.seleccionarModulo(Sender: TObject);
begin
  if lvModulos.Selected <> nil then
  begin
    TabArchivos.Caption := lvModulos.Selected.SubItems[1];
    seDescMod.Text := lvModulos.Selected.SubItems[2];
    ProyectoProgramacion.IdModuloSeleccionado := lvModulos.Selected.SubItems[3];
    ProyectoProgramacion.leerArchivosCodigo
      (ProyectoProgramacion.IdModuloSeleccionado, 'Nombre');
    sbExaminarDirectorio.Visible := true;
  end;
end;

procedure TFGestorProyectosProgramacion.compilarCodigoFuente(Sender: TObject);
var
  j, i, k, n, m, resultado, verProceso: integer;
  Modulo: TModuloCodigo;
  archivoCodigo: TArchivoCodigo;
  directorio, nombreArchivo, nombrePDF, linea: string;
  fileBat, codigo: TStringList;
  Encoding: TEncoding;
begin

  Encoding := TUTF8Encoding.create;

  With seCodigoFuente.Lines do
  begin
    Clear;
    Add('\documentclass[12pt,twoside,spanish]{Plantilla}');
    Add('\usepackage[T1]{fontenc}');
    Add('\usepackage[latin9]{inputenc}');
    Add('\usepackage[landscape,letterpaper]{geometry}');
    Add('\geometry{verbose,tmargin=5cm,bmargin=3cm,lmargin=3cm,rmargin=3cm}');
    Add('\setcounter{secnumdepth}{5}');
    Add('\setcounter{tocdepth}{3}');
    Add('\usepackage{babel}');
    Add('\addto\shorthandsspanish{\spanishdeactivate{~<>}}');
    Add('');
    Add('\usepackage{pifont}');
    Add('\usepackage{float}');
    Add('\usepackage[unicode=true,pdfusetitle,');
    Add(' bookmarks=true,bookmarksnumbered=false,bookmarksopen=false,');
    Add(' breaklinks=false,pdfborder={0 0 0},pdfborderstyle={},backref=false,colorlinks=false]');
    Add(' {hyperref}');
    Add('');
    Add('\makeatletter');
    Add('');
    Add('\providecommand{\tabularnewline}{\\}');
    Add('');
    Add('\usepackage{Plantilla}');
    Add('');
    Add('\AtBeginDocument{');
    Add('  \def\labelitemi{\ding{109}}');
    Add('  \def\labelitemii{\ding{113}}');
    Add('  \def\labelitemiii{\Pisymbol{psy}{68}}');
    Add('  \def\labelitemiv{\ding{226}}');
    Add('}');
    Add('');
    Add('\makeatother');
    Add('');
    Add('\begin{document}');
    Add('');
    Add('\Titulo{' + edTitulo.Text + '}');
    Add('');
    Add('\Subtitulo{' + edSubtituloProyecto.Text + '}');
    Add('');

    // Leer a los autores
    Add('\Autores{%');
    Add('\begin{tabular}{c}');

    ProyectoProgramacion.leerAutores;
    for i := 1 to ProyectoProgramacion.cantidadAutores do
      Add(ProyectoProgramacion.obtenerAutor(i - 1).nombre + '\tabularnewline');
    Add('\end{tabular}}');

    Add('');
    Add('\AutoresCorto{' + ProyectoProgramacion.obtenerAutoresCorto + '}');
    Add('');
    Add('\Institucion{' + edInstitucion.Text + '}');
    Add('');
    Add('\Ciudad{' + edCiudad.Text + '}');
    Add('');
    Add('\Fecha{' + edFecha.Text + '}');
    Add('');
    Add('\Version{' + edVersion.Text + '}');
    Add('');
    Add('\Logo{Imagenes/Logo.png}');
    Add('');
    Add('\GenerarPortada{}');
    Add('');
    Add('\tableofcontents{}');
    Add('');
    Add('\TipoCapitulo{Capítulo}');
    Add('');
    Add('\lstset{style=codigoJavascript}');
    Add('');
    Add('\chapter{Código Fuente}');
    Add('');
    Add('A continuación se presenta una lista de cada uno de los archivos creados necesarios para el desarrollo de la aplicación.');
    Add('');

    ProyectoProgramacion.leerModulos;
    n := ProyectoProgramacion.cantidadModulos;
    for j := 1 to n do
    begin
      Modulo := ProyectoProgramacion.obtenerModulo(j - 1);

      Add('%%%%%%% Módulo %%%%%%%');
      nombreArchivo := Modulo.Modulo;
      nombreArchivo := StringReplace(nombreArchivo, '_', '\_', [rfReplaceAll]);
      Add('\section{' + nombreArchivo + '}');
      Add(Modulo.Descripcion);
      Add('');

      ProyectoProgramacion.leerArchivosCodigo(Modulo.idmodulo, 'Nombre');

      m := ProyectoProgramacion.cantidadArchivosCodigo;
      for i := 1 to m do
      begin
        archivoCodigo := ProyectoProgramacion.obtenerArchivoCodigo(i - 1);

        nombreArchivo := archivoCodigo.nombre;
        nombreArchivo := StringReplace(nombreArchivo, '_', '\_',
          [rfReplaceAll]);

        Add('\subsection{ \hspace{4mm} ' + nombreArchivo + ' (' +
          archivoCodigo.Lenguaje + ')}');
        Add(archivoCodigo.Descripcion);
        // Add('\url{' + archivoCodigo.ruta + '}');

        Add('');
        codigo := TStringList.create;
        codigo.LoadFromFile(archivoCodigo.ruta, Encoding);
        Add('\begin{lstlisting}');

        for k := 1 to codigo.Count do
        begin
          linea := Utilidades.AnsiConvert(codigo[k - 1]);

          if length(linea) < 130 then
            Add(linea)
          else
          begin
            Add(Copy(linea, 1, 130));
            Add(Copy(linea, 131, length(linea)));
          end;
        end;

        Add('\end{lstlisting}');
        Add('');
      end;
    end;

    Add('\end{document}');
    Add('');
  end;

  Proyecto.ActiveCard := cardExportarTEX;
  PaginaCodigoFuente.ActivePageIndex := 1;

  directorio := ProyectoProgramacion.RutaCompilacion;
  barraEstado.Panels[2].Text := directorio;
  nombreArchivo := 'Codigo-Fuente.tex';
  seCodigoFuente.Lines.SaveToFile(directorio + '\' + nombreArchivo);

  LR.guardarRecursoDirectorio('CLS', directorio + '\Plantilla.cls');
  LR.guardarRecursoDirectorio('STY', directorio + '\Plantilla.sty');

  { Exportar imágenes }
  ProyectoProgramacion.exportarArchivo('Logo.png', 'Imagenes');

  fileBat := TStringList.create;
  fileBat.Add('pdflatex -file-line-error ' + nombreArchivo);
  fileBat.SaveToFile(directorio + '\compilar.bat');

  nombrePDF := Copy(nombreArchivo, 1, length(nombreArchivo) - 4) + '.pdf';
  FRutaArchivoPDF := directorio + '\' + nombrePDF;

  FIndicador.Show;
  Application.ProcessMessages;
  if cbVerProceso.Checked then
    verProceso := SW_SHOWNORMAL
  else
    verProceso := SW_HIDE;

  if FileExists(directorio + '\' + nombrePDF) then
    DeleteFile(directorio + '\' + nombrePDF);

  resultado := ShellExecute(Handle, 'open', pchar(directorio + '\compilar.bat'),
    nil, pchar(directorio), verProceso);

  while not FileExists(directorio + '\' + nombrePDF) do
  begin
    Sleep(100);
    FIndicador.actualizar;
  end;
  FIndicador.Close;

  if resultado = 42 then
  begin
    FMensaje.mensaje('El manual se exportó correctamente: código (' +
      IntToStr(resultado) + ')', tmInfo);

    resultado := ShellExecute(Handle, 'open',
      pchar(directorio + '\' + nombrePDF), nil, pchar(directorio), SW_NORMAL);
  end;
end;

procedure TFGestorProyectosProgramacion.SetRutaArchivoPDF(const Value: string);
begin
  FRutaArchivoPDF := Value;
end;

procedure TFGestorProyectosProgramacion.SpeedButton3Click(Sender: TObject);
var
  ruta: string;
begin
  ruta := FConfiguracionBD.rutaBD(ModuloDatos.ConfigApp.rutaBD);
  if ruta <> '' then
  begin
    ModuloDatos.ConfigApp.actualizarRutaBD(ruta);
    FMensaje.mensaje
      ('La ruta de la base de datos se actualizó correctamente', tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.verAutor(Sender: TObject);
begin
  if lvAutores.Selected <> nil then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM AutoresProyecto WHERE IdAutor=' + #39 +
      lvAutores.Selected.SubItems[3] + #39;
    Query.Open;

    rutaAutor := ProyectoProgramacion.RutaArchivos + '\' +
      Query.FieldByName('Fotografia').AsString;

    Utilidades.limpiarImagen(imgAutor);

    if FileExists(rutaAutor) then
      imgAutor.Picture.LoadFromFile(rutaAutor);

    edBioAutor.Text := Query.FieldByName('Biografia').AsString;
  end;
end;

procedure TFGestorProyectosProgramacion.verPaso(Sender: TObject);
var
  ruta: string;
begin
  if lvPasosInstalacion.Selected <> nil then
  begin
    edDescripcion.Text := lvPasosInstalacion.Selected.SubItems[2];

    Utilidades.limpiarImagen(imgInst);
    ruta := ProyectoProgramacion.RutaArchivos + '\' +
      lvPasosInstalacion.Selected.SubItems[3];
    barraEstado.Panels[3].Text := ruta;
    if FileExists(ruta) then
      imgInst.Picture.LoadFromFile(ruta);
  end;
end;

procedure TFGestorProyectosProgramacion.verPlataforma(Sender: TObject);
var
  ruta: string;
begin
  if LvPlataformas.Selected <> nil then
  begin
    edDescPlat.Text := LvPlataformas.Selected.SubItems[2];

    ruta := ProyectoProgramacion.RutaArchivos + '\' +
      LvPlataformas.Selected.SubItems[3];
    if FileExists(ruta) then
      imgPlat.Picture.LoadFromFile(ruta);
  end;
end;

end.
