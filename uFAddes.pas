{Este es el formulario principal de la aplicación. Contiene todos los
elementos y componentes que permiten enlazar otros subformularios y
unidades funcionales de la aplicación}
unit uFAddes;

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
  uFCrearEditarDER, uCrearEditarFuncionalidad, uFCrearEditarTipoFuncionalidad,
  uFCrearEditarTabla, SynHighlighterSQL, uFCrearEditarAtributoTabla, uTHtml,
  SynHighlighterHtml, Vcl.OleCtrls, SHDocVw;

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
    sbConfigurarRutaBD: TSpeedButton;
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
    paginaDescripcionSeccion: TPageControl;
    TabVistaPrevia: TTabSheet;
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
    paginaTablas: TPageControl;
    TabTablasBaseDatos: TTabSheet;
    lvTablasBD: TListView;
    Panel42: TPanel;
    sbCrearTabla: TSpeedButton;
    sbEditarTabla: TSpeedButton;
    sbEliminarTabla: TSpeedButton;
    Panel24: TPanel;
    SpeedButton3: TSpeedButton;
    paginaAtributos: TPageControl;
    TabAtributos: TTabSheet;
    lvAtributosTabla: TListView;
    Panel58: TPanel;
    sbCrearAtributo: TSpeedButton;
    sbEditarAtributo: TSpeedButton;
    sbEliminarAtributo: TSpeedButton;
    sSQL: TSynSQLSyn;
    DiagramaEntidadRelacin1: TMenuItem;
    ablas1: TMenuItem;
    Atributos1: TMenuItem;
    CrearTabla1: TMenuItem;
    EditarTabla1: TMenuItem;
    EliminarTabla1: TMenuItem;
    Crearatributo1: TMenuItem;
    Editaratributo1: TMenuItem;
    Eliminaratributo1: TMenuItem;
    Funcionalidades1: TMenuItem;
    Agregarfuncionalidad1: TMenuItem;
    Editarfuncionalidad1: TMenuItem;
    Eliminarfuncionalidad1: TMenuItem;
    sHTML: TSynHTMLSyn;
    vistaPreviaManual: TWebBrowser;
    ManualdeUsuario1: TMenuItem;
    AgregarSeccin1: TMenuItem;
    EditarSeccin1: TMenuItem;
    EliminarSeccin1: TMenuItem;
    Panel59: TPanel;
    sbActualizarFotoPerfil: TSpeedButton;
    Label19: TLabel;
    cardAnalisis: TCard;
    Panel60: TPanel;
    Panel61: TPanel;
    sbGuardar3: TSpeedButton;
    paginaDatosAnalisis: TPageControl;
    TabPA_Analisis: TTabSheet;
    edAnalisis: TSynEdit;
    TabPA_Diseno: TTabSheet;
    TabPA_Implementacion: TTabSheet;
    TabPA_Validacion: TTabSheet;
    TabPA_Plataforma: TTabSheet;
    TabPA_Ambiente: TTabSheet;
    Panel62: TPanel;
    Label20: TLabel;
    Panel63: TPanel;
    Label21: TLabel;
    Panel64: TPanel;
    Label22: TLabel;
    Panel65: TPanel;
    Label23: TLabel;
    Panel66: TPanel;
    Label24: TLabel;
    Panel67: TPanel;
    Label25: TLabel;
    edDiseno: TSynEdit;
    edImplementacion: TSynEdit;
    edValidacion: TSynEdit;
    edPlataforma: TSynEdit;
    edAmbiente: TSynEdit;
    seCodigoTabla: TSynEdit;
    Splitter7: TSplitter;
    QAtributos: TFDQuery;
    opcionesPro: TPopupMenu;
    CrearNuevoProyecto1: TMenuItem;
    SeleccionarProyecto1: TMenuItem;
    EliminarProyecto1: TMenuItem;
    Panel29: TPanel;
    sbCrearProyecto2: TSpeedButton;
    sbSeleccionarProyecto: TSpeedButton;
    sbEliminarProyecto: TSpeedButton;
    paginaDatos: TPageControl;
    TabDatosBasicos: TTabSheet;
    gb0: TGroupBox;
    edIdProyecto: TEdit;
    gb1: TGroupBox;
    edTitulo: TEdit;
    gb2: TGroupBox;
    edSubtituloProyecto: TEdit;
    gb3: TGroupBox;
    edPalabrasClave: TEdit;
    gb4: TGroupBox;
    edInstitucion: TEdit;
    TanRegistro: TTabSheet;
    gb7: TGroupBox;
    edVersion: TEdit;
    gb8: TGroupBox;
    edRegistro: TEdit;
    gb9: TGroupBox;
    edFechaRegistro: TEdit;
    TabDiseno: TTabSheet;
    gb10: TGroupBox;
    edLenguaje: TEdit;
    gb11: TGroupBox;
    edDisenoGrafico: TEdit;
    TabTecnico: TTabSheet;
    gb5: TGroupBox;
    edCiudad: TEdit;
    gb6: TGroupBox;
    edFecha: TEdit;
    TabDescripcion: TTabSheet;
    gb24: TGroupBox;
    edResumen: TSynEdit;
    gb23: TGroupBox;
    sbCodigoFuente: TSpeedButton;
    edCodigoFuente: TEdit;
    pDT1: TPanel;
    gb17: TGroupBox;
    edImpresora: TEdit;
    pDT2: TPanel;
    gb16: TGroupBox;
    edTeclado: TEdit;
    gb15: TGroupBox;
    edMouse: TEdit;
    gb22: TGroupBox;
    edInterner: TEdit;
    gb14: TGroupBox;
    edMemoriaRam: TEdit;
    gb13: TGroupBox;
    edDiscoDuro: TEdit;
    gb12: TGroupBox;
    edSistemaOperativo: TEdit;
    gb18: TGroupBox;
    edEscaner: TEdit;
    gb19: TGroupBox;
    edPantalla: TEdit;
    gb20: TGroupBox;
    edMicrofono: TEdit;
    gb21: TGroupBox;
    edAltavoces: TEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure sbCerrarSesionClick(Sender: TObject);
    procedure sbConfigurarRutaBDClick(Sender: TObject);
    procedure crearProyecto(Sender: TObject);
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
    procedure agregarSeccionClick(Sender: TObject);
    procedure editarSeccionClick(Sender: TObject);
    procedure eliminarSeccionClick(Sender: TObject);
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
    procedure actualizarFotoPerfil(Sender: TObject);
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
    procedure crearTablaClick(Sender: TObject);
    procedure agregarFuncionalidadClick(Sender: TObject);
    procedure editarFuncionalidadClick(Sender: TObject);
    procedure sbAgregarTipoFuncionalidadClick(Sender: TObject);
    procedure editarTipoFuncionalidad(Sender: TObject);
    procedure EliminarTipoFuncionalidad(Sender: TObject);
    procedure lvTiposFuncionalidadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbEliminarTodosArchivosClick(Sender: TObject);
    procedure seleccionarTabla(Sender: TObject);
    procedure opcionesTecladoTablas(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure crearAtributoClick(Sender: TObject);
    procedure editarAtributoClick(Sender: TObject);
    procedure eliminarAtributoClick(Sender: TObject);
    procedure editarTablaClick(Sender: TObject);
    procedure EliminarTablaClick(Sender: TObject);
    procedure opcionesTecladoAtributos(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbAbrirRutaCompiladoClick(Sender: TObject);
    procedure eliminarFuncionalidadClick(Sender: TObject);
    procedure eliminarFuncionalidadKD(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure exportarManualUsuarioHtml(Sender: TObject);
    procedure exportarManualTecnicoHtml(Sender: TObject);
    procedure eliminarProyecto(Sender: TObject);
    procedure opcionesProyectos(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    RegistroInicio: TRegistroInicio;
    ProyectoProgramacion: TProyectoProgramacion;
    LR: TLectorRecursos;
    Config: TInifile;
    rutaAutor: string;
    FRutaArchivoPDF: string;
    IdProyectoSel: string;
    IdTablaSel: string;
    ManualUsuario, ManualTecnico, CodigoFuente: THtml;
    procedure SetRutaArchivoPDF(const Value: string);
  public

    procedure InicioSesion(Evento: Boolean);
    procedure Registro(Evento: Boolean);
    procedure crearMenu(nombre: string; imagen: integer);
    procedure crearMenus;
    procedure limpiarBarraEstado;
    procedure limpiarEditores;
    procedure leerTiposFuncionalidades;
    procedure leerTablasBaseDatos;
    procedure leerAtributosTabla(IdTabla: string);
    procedure eliminarTabla;
    procedure eliminarAtributo;
    procedure eliminarFuncionalidad;

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
  EST_ANALISIS = 'Análisis de Diseño';

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
  crearMenu(EST_AUTORS, 3);
  crearMenu(EST_ANALISIS, 14);
  crearMenu(EST_APORTES_CONOCIMIENTO, 10);
  crearMenu(EST_LOGO, 6);
  crearMenu(EST_DIAGRAMA_ENTIDAD_RELACION, 11);
  crearMenu(EST_FUNCIONALIDADES, 12);
  crearMenu(EST_PLATAFORMAS, 7);
  crearMenu(EST_MANUAL_USUARIO, 9);
  crearMenu(EST_DATOS_BASICOS, 0);
  crearMenu(EST_INSTALACION, 2);
  crearMenu(EST_ARCHIVOS, 1);
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

  paginaDatos.TabIndex := 0;

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
    EditorAnalisis := edAnalisis;
    EditorDiseno := edDiseno;
    EditorAImplementacion := edImplementacion;
    EditorValidacion := edValidacion;
    EditorPlataforma := edPlataforma;
    EditorAmbiente := edAmbiente;

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

  (* crear los archivos de los manuales *)
  ManualUsuario := THtml.create;
  ManualTecnico := THtml.create;
  CodigoFuente := THtml.create;
end;

procedure TFGestorProyectosProgramacion.FormResize(Sender: TObject);
begin
  RegistroInicio.centrar(Width, Height);
  PaginaDescripcionInstalacion.Width := Round(0.55 * Width);
  lvSecciones.Height := Round(0.35 * Height);
  pPasosInst.Height := Round(0.4 * Height);
  PaginaSecciones.Width := Round(0.6 * Width);
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

procedure TFGestorProyectosProgramacion.leerAtributosTabla(IdTabla: string);
var
  i: integer;
  nombre, tipo, tref, aref, codigo: string;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM AtributosTabla WHERE IdTabla=' + #39 +
    IdTabla + #39;
  Query.Open;
  Query.First;

  lvAtributosTabla.Items.Clear;

  seCodigoTabla.Lines.Clear;
  seCodigoTabla.Lines.Add('Create Table If Not Exists ' +
    lvTablasBD.Selected.SubItems[0] + ' (');

  for i := 1 to Query.RecordCount do
  begin
    with lvAtributosTabla.Items.Add.SubItems do
    begin
      nombre := Query.FieldByName('Nombre').AsString;
      tipo := Query.FieldByName('Tipo').AsString;
      tref := Query.FieldByName('TableReference').AsString;
      aref := Query.FieldByName('AtributeReference').AsString;
      codigo := '';

      if Query.FieldByName('TableReference').AsString <> '' then
      begin
        codigo := nombre + ' ' + tipo + ' references ' + tref + '(' +
          aref + ')';
        Add('FK');
      end
      else if Query.FieldByName('PrimaryKey').AsString <> '' then
      begin
        codigo := nombre + ' ' + tipo + ' Primary Key Not Null ';
        Add('PK');
      end
      else
      begin
        codigo := nombre + ' ' + tipo;
        Add('');
      end;

      Add(nombre);
      Add(tipo);
      Add(Query.FieldByName('IdAtributo').AsString);
    end;

    if i < Query.RecordCount then
      codigo := codigo + ',';

    seCodigoTabla.Lines.Add('   ' + codigo);

    Query.Next;
  end;

  seCodigoTabla.Lines.Add(');');
end;

procedure TFGestorProyectosProgramacion.leerTablasBaseDatos;
var
  i: integer;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM TablasBaseDatos WHERE IdProyecto=' + #39 +
    IdProyectoSel + #39 + ' ORDER BY Nombre';
  Query.Open;
  Query.First;

  lvTablasBD.Items.Clear;

  for i := 1 to Query.RecordCount do
  begin
    with lvTablasBD.Items.Add.SubItems do
    begin
      Add(Query.FieldByName('Nombre').AsString);
      Add(Query.FieldByName('IdTabla').AsString);
    end;

    Query.Next;
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

procedure TFGestorProyectosProgramacion.opcionesTecladoAtributos
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    eliminarAtributo;

  if Key = VK_RETURN then
    editarAtributoClick(self);

  if Key = VK_ADD then
    crearAtributoClick(self);
end;

procedure TFGestorProyectosProgramacion.lvAutoresKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    eliminarAutor(self);
  end;
end;

procedure TFGestorProyectosProgramacion.eliminarFuncionalidadKD(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    eliminarFuncionalidad;
end;

procedure TFGestorProyectosProgramacion.editarFuncionalidadClick
  (Sender: TObject);
var
  IdFuncionalidad: string;
begin
  if LvFuncionalidades.Selected <> nil then
  begin
    IdFuncionalidad := LvFuncionalidades.Selected.SubItems[5];
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
  vp: THtml;
begin
  if lvSecciones.Selected <> nil then
  begin
    vp := THtml.create;

    ruta := ProyectoProgramacion.RutaArchivos + '\' +
      lvSecciones.Selected.SubItems[3];

    vp.h3(lvSecciones.Selected.SubItems[1], '', '');
    vp.insertarParrafo(lvSecciones.Selected.SubItems[2],
      'text-align: justify; font-size: 24px', '');
    vp.beginDiv('', '', 'align=center');
    vp.img(ruta, 'width: 800px', '');
    vp.endDiv;

    barraEstado.Panels[2].Text := ruta;

    vp.exportar(ProyectoProgramacion.RutaArchivos + 'vista-manual.html');
    vistaPreviaManual.Navigate(ProyectoProgramacion.RutaArchivos +
      'vista-manual.html');

    vp.Free;
  end;
end;

procedure TFGestorProyectosProgramacion.lvSeccionesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    eliminarSeccionClick(self);
end;

procedure TFGestorProyectosProgramacion.opcionesTecladoTablas(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    eliminarTabla;

  if Key = VK_RETURN then
    editarTablaClick(self);

  if Key = VK_ADD then
    crearTablaClick(self);
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

procedure TFGestorProyectosProgramacion.opcionesProyectos(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    abrirProyecto(self);
  end;

  if Key = VK_ADD then
  begin
    crearProyecto(self);
  end;

  if Key = VK_DELETE then
  begin
    eliminarProyecto(self);
  end;
end;

procedure TFGestorProyectosProgramacion.actualizarFotoPerfil(Sender: TObject);
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
    IdProyectoSel := FAbrirProyecto.ProyectoSeleccionado.IdProyecto;

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

procedure TFGestorProyectosProgramacion.sbAbrirRutaCompiladoClick
  (Sender: TObject);
begin
  ShellExecute(Handle, 'open', pchar(ProyectoProgramacion.RutaCompilacion), nil,
    nil, SW_NORMAL);
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

procedure TFGestorProyectosProgramacion.agregarFuncionalidadClick
  (Sender: TObject);
begin

  if FCrearEditarFuncionalidad.creo(ProyectoProgramacion.IdProyecto) then
  begin
    ProyectoProgramacion.leerFuncionalidades;
    FMensaje.mensaje(FCrearEditarFuncionalidad.Respuesta, tmInfo);
  end;
end;

procedure TFGestorProyectosProgramacion.agregarSeccionClick(Sender: TObject);
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
    IdProyectoSel := lvRecientes.Selected.SubItems[0];

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

procedure TFGestorProyectosProgramacion.exportarManualUsuarioHtml
  (Sender: TObject);
var
  ruta: string;
  i: integer;
begin
  ManualUsuario.limpiar(ProyectoProgramacion.Titulo);

  (* se agrega el título del documento *)
  ManualUsuario.h1(ProyectoProgramacion.Titulo, 'text-align: center', '');
  ManualUsuario.h2(ProyectoProgramacion.Subtitulo, 'text-align: center', '');

  (* se agrega el logo *)
  ManualUsuario.beginDiv('', '', 'align=center');
  ManualUsuario.img('Logo.png', 'width: 256px', '');
  ManualUsuario.endDiv;

  (* se agrega institucion, ciudad, fecha y versión *)
  ManualUsuario.h3(ProyectoProgramacion.Institucion, 'text-align: center', '');
  ManualUsuario.h4(ProyectoProgramacion.Ciudad, 'text-align: center', '');
  ManualUsuario.h4(ProyectoProgramacion.fecha, 'text-align: center', '');
  ManualUsuario.h5(ProyectoProgramacion.version, 'text-align: center', '');
  ManualUsuario.hr;

  (* se agregran los autores *)
  ManualUsuario.h3('Autores', '', '');
  ManualUsuario.hr;

  for i := 1 to ProyectoProgramacion.cantidadAutores do
  begin
    ManualUsuario.beginDiv('', 'card shadow mt-3', '');
    ManualUsuario.beginDiv('', 'card-body', '');
    ManualUsuario.beginDiv('', 'row', '');
    ManualUsuario.beginDiv('', 'col-md-2', '');
    ManualUsuario.img(ProyectoProgramacion.obtenerAutor(i - 1).Fotografia, '',
      'card-img-top');
    ManualUsuario.endDiv;
    ManualUsuario.beginDiv('', 'col-md-10', '');
    ManualUsuario.h3(ProyectoProgramacion.obtenerAutor(i - 1).nombre, '', '');
    ManualUsuario.hr;
    ManualUsuario.insertarParrafo(ProyectoProgramacion.obtenerAutor(i - 1)
      .Biografia, 'text-align: justify', '');
    ManualUsuario.insertarParrafo('<b>Correo: </b>' +
      ProyectoProgramacion.obtenerAutor(i - 1).Correo,
      'text-align: justify', '');
    ManualUsuario.endDiv;
    ManualUsuario.endDiv;
    ManualUsuario.endDiv;
    ManualUsuario.endDiv;
  end;
  ManualUsuario.hr;

  (* se agrega la descripción *)
  ManualUsuario.h3('Descripción', '', 'mt-3');
  ManualUsuario.hr;
  ManualUsuario.insertarParrafo(ProyectoProgramacion.Resumen,
    'text-align: justify', '');
  ManualUsuario.hr;

  (* iniciar el manual de usuario *)
  ManualUsuario.h1('Manual de Usuario', '', 'mt-3');
  ManualUsuario.hr;

  for i := 1 to ProyectoProgramacion.cantidadSecciones do
  begin
    ManualUsuario.h3(ProyectoProgramacion.obtenerSeccion(i - 1).nombre,
      '', 'mt-3');
    ManualUsuario.insertarParrafo(ProyectoProgramacion.obtenerSeccion(i - 1)
      .descripcion, 'text-align: justify', '');
    ManualUsuario.beginDiv('', '', 'align=center');
    ManualUsuario.img(ProyectoProgramacion.obtenerSeccion(i - 1).imagen,
      'width: 800px', '');
    ManualUsuario.endDiv;
  end;

  ruta := ProyectoProgramacion.RutaArchivos + '\manual-usuario.html';
  ManualUsuario.exportar(ruta);

  Consola.log(ruta, 'exportarManualUsuarioHtml');

  ShellExecute(Handle, 'open', pchar(ruta), nil, nil, SW_NORMAL);
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
      Add('\' + seccionManual.tipo + '{' + seccionManual.nombre + '}');
      Add(seccionManual.descripcion);
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
  verProceso := SW_SHOWNORMAL;

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
      Add(plataforma.descripcion);
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
      Add(funcionalidad.descripcion);
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
      Add(pasoInstalacion.descripcion);
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
          archivoCodigo.descripcion + ' \tabularnewline');
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
  verProceso := SW_SHOWNORMAL;

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

procedure TFGestorProyectosProgramacion.exportarManualTecnicoHtml
  (Sender: TObject);
var
  ruta: string;
  i, j: integer;
begin
  ManualTecnico.limpiar(ProyectoProgramacion.Titulo);

  (* se agrega el título del documento *)
  ManualTecnico.h1(ProyectoProgramacion.Titulo, 'text-align: center', '');
  ManualTecnico.h2(ProyectoProgramacion.Subtitulo, 'text-align: center', '');

  (* se agrega el logo *)
  ManualTecnico.beginDiv('', '', 'align=center');
  ManualTecnico.img('Logo.png', 'width: 256px', '');
  ManualTecnico.endDiv;

  (* se agrega institucion, ciudad, fecha y versión *)
  ManualTecnico.h3(ProyectoProgramacion.Institucion, 'text-align: center', '');
  ManualTecnico.h4(ProyectoProgramacion.Ciudad, 'text-align: center', '');
  ManualTecnico.h4(ProyectoProgramacion.fecha, 'text-align: center', '');
  ManualTecnico.h5(ProyectoProgramacion.version, 'text-align: center', '');
  ManualTecnico.hr;

  (* se agregran los autores *)
  ManualTecnico.h3('Autores', '', '');
  ManualTecnico.hr;

  for i := 1 to ProyectoProgramacion.cantidadAutores do
  begin
    ManualTecnico.beginDiv('', 'card shadow mt-3', '');
    ManualTecnico.beginDiv('', 'card-body', '');
    ManualTecnico.beginDiv('', 'row', '');
    ManualTecnico.beginDiv('', 'col-md-2', '');
    ManualTecnico.img(ProyectoProgramacion.obtenerAutor(i - 1).Fotografia, '',
      'card-img-top');
    ManualTecnico.endDiv;
    ManualTecnico.beginDiv('', 'col-md-10', '');
    ManualTecnico.h3(ProyectoProgramacion.obtenerAutor(i - 1).nombre, '', '');
    ManualTecnico.hr;
    ManualTecnico.insertarParrafo(ProyectoProgramacion.obtenerAutor(i - 1)
      .Biografia, 'text-align: justify', '');
    ManualTecnico.insertarParrafo('<b>Correo: </b>' +
      ProyectoProgramacion.obtenerAutor(i - 1).Correo,
      'text-align: justify', '');
    ManualTecnico.endDiv;
    ManualTecnico.endDiv;
    ManualTecnico.endDiv;
    ManualTecnico.endDiv;
  end;
  ManualTecnico.hr;

  (* se agrega la descripción *)
  ManualTecnico.h3('Descripción', '', 'mt-3');
  ManualTecnico.hr;
  ManualTecnico.insertarParrafo(ProyectoProgramacion.Resumen,
    'text-align: justify', '');
  ManualTecnico.hr;

  (* iniciar el manual técnico *)
  ManualTecnico.h1('Manual Técnico', '', 'mt-3');
  ManualTecnico.hr;

  (* agregar los datos del análisis *)
  ManualTecnico.h3('Análisis', '', 'mt-3');
  ManualTecnico.insertarParrafo(ProyectoProgramacion.Analisis,
    'text-align: justify', '');
  ManualTecnico.h3('Diseño', '', 'mt-3');
  ManualTecnico.insertarParrafo(ProyectoProgramacion.Diseno,
    'text-align: justify', '');
  ManualTecnico.h3('Implementación', '', 'mt-3');
  ManualTecnico.insertarParrafo(ProyectoProgramacion.Implementacion,
    'text-align: justify', '');
  ManualTecnico.h3('Validación', '', 'mt-3');
  ManualTecnico.insertarParrafo(ProyectoProgramacion.Validacion,
    'text-align: justify', '');
  ManualTecnico.h3('Plataforma', '', 'mt-3');
  ManualTecnico.insertarParrafo(ProyectoProgramacion.plataforma,
    'text-align: justify', '');
  ManualTecnico.h3('Ambiente', '', 'mt-3');
  ManualTecnico.insertarParrafo(ProyectoProgramacion.Ambiente,
    'text-align: justify', '');
  ManualTecnico.hr;

  ManualTecnico.beginDiv('', 'card shadow mt-3', '');
  ManualTecnico.beginDiv('', 'card-body', '');

  ManualTecnico.beginTabla('text-align: justify', 'table table-hover mt-3');
  ManualTecnico.beginTHead('', 'table-dark');
  ManualTecnico.beginTr;
  ManualTecnico.th('Característica');
  ManualTecnico.th('Descripción');
  ManualTecnico.endTr;
  ManualTecnico.endTHead;
  ManualTecnico.beginTBody;

  ManualTecnico.beginTr;
  ManualTecnico.th('Fecha de Registro');
  ManualTecnico.td(ProyectoProgramacion.FechaRegistro);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.th('Número del Registro');
  ManualTecnico.td(ProyectoProgramacion.Registro);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.th('Palabras Clave');
  ManualTecnico.td(ProyectoProgramacion.PalabrasClave);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.th('Lenguaje');
  ManualTecnico.td(ProyectoProgramacion.Lenguaje);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.th('Diseño Gráfico');
  ManualTecnico.td(ProyectoProgramacion.DisenoGrafico);
  ManualTecnico.endTr;

  ManualTecnico.endTBody;
  ManualTecnico.endTabla;

  ManualTecnico.endDiv;
  ManualTecnico.endDiv;

  (* agregar las funcionalidades *)
  ManualTecnico.h3('Funcionalidades', '', 'mt-3');
  ManualTecnico.insertarParrafo('A continuación se muestran una tabla' +
    ' con las funcionalidades del software', 'text-align: justify', '');

  ManualTecnico.beginTabla('text-align: justify', 'table table-hover mt-3');
  ManualTecnico.beginTHead('', 'table-dark');
  ManualTecnico.beginTr;
  ManualTecnico.th('Funcionalidad');
  ManualTecnico.th('Descripción');
  ManualTecnico.endTr;
  ManualTecnico.endTHead;
  ManualTecnico.beginTBody;

  for i := 1 to ProyectoProgramacion.cantidadFuncionalidades do
  begin
    ManualTecnico.beginTr;
    ManualTecnico.td(ProyectoProgramacion.obtenerFuncionalidad(i - 1)
      .funcionalidad);
    ManualTecnico.td(ProyectoProgramacion.obtenerFuncionalidad(i - 1)
      .descripcion);
    ManualTecnico.endTr;
  end;
  ManualTecnico.endTBody;
  ManualTecnico.endTabla;

  (* agregar las tablas de la base de datos *)
  ManualTecnico.h3('Base de Datos', '', 'mt-3');
  ManualTecnico.insertarParrafo('A continuación se muestran las tablas' +
    ' del módulo de la base de datos', 'text-align: justify', '');

  Query.Close;
  Query.SQL.Text := 'SELECT * FROM TablasBaseDatos WHERE IdProyecto=' + #39 +
    IdProyectoSel + #39 + ' ORDER BY Nombre';
  Query.Open;
  Query.First;

  for i := 1 to Query.RecordCount do
  begin
    ManualTecnico.beginDiv('', 'card shadow mt-3', '');
    ManualTecnico.beginDiv('', 'card-body', '');
    ManualTecnico.h4(Query.FieldByName('Nombre').AsString, '', 'mt-3');
    ManualTecnico.insertarParrafo(Query.FieldByName('Descripcion').AsString,
      'text-align: justify', '');

    ManualTecnico.beginTabla('text-align: justify', 'table table-hover mt-3');
    ManualTecnico.beginTHead('', 'table-dark');
    ManualTecnico.beginTr;
    ManualTecnico.th('');
    ManualTecnico.th('Atributo');
    ManualTecnico.th('Tipo');
    ManualTecnico.endTr;
    ManualTecnico.endTHead;
    ManualTecnico.beginTBody;

    QAtributos.Close;
    QAtributos.SQL.Text := 'SELECT * FROM AtributosTabla WHERE IdTabla=' + #39 +
      Query.FieldByName('IdTabla').AsString + #39;
    QAtributos.Open;
    QAtributos.First;

    for j := 1 to QAtributos.RecordCount do
    begin
      ManualTecnico.beginTr;

      if QAtributos.FieldByName('TableReference').AsString <> '' then
      begin
        ManualTecnico.th('FK');
      end
      else if QAtributos.FieldByName('PrimaryKey').AsString <> '' then
      begin
        ManualTecnico.th('PK');
      end
      else
      begin
        ManualTecnico.th('');
      end;

      ManualTecnico.td(QAtributos.FieldByName('Nombre').AsString);
      ManualTecnico.td(QAtributos.FieldByName('Tipo').AsString);

      ManualTecnico.endTr;

      QAtributos.Next;
    end;
    ManualTecnico.endTBody;
    ManualTecnico.endTabla;
    ManualTecnico.endDiv;
    ManualTecnico.endDiv;

    Query.Next;
  end;

  ManualTecnico.h3('Aportes al Conocimiento', '', 'mt-3');
  ManualTecnico.insertarParrafo(ProyectoProgramacion.Aportes,
    'text-align: justify', '');

  ManualTecnico.h3('Requisitos y Requerimientos', '', 'mt-3');
  ManualTecnico.beginTabla('', 'table table-hover mt-3');
  ManualTecnico.beginTHead('', 'table-dark');
  ManualTecnico.beginTr;
  ManualTecnico.th('Requerimiento');
  ManualTecnico.th('Descripción');
  ManualTecnico.endTr;
  ManualTecnico.endTHead;
  ManualTecnico.beginTBody;

  ManualTecnico.beginTr;
  ManualTecnico.td('Sistema Operativo');
  ManualTecnico.td(ProyectoProgramacion.SistemaOperativo);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Espacio en Disco Duro');
  ManualTecnico.td(ProyectoProgramacion.DiscoDuro);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Memoria RAM');
  ManualTecnico.td(ProyectoProgramacion.MemoriaRam);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Mouse');
  ManualTecnico.td(ProyectoProgramacion.Mouse);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Teclado');
  ManualTecnico.td(ProyectoProgramacion.Teclado);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Impresora');
  ManualTecnico.td(ProyectoProgramacion.Impresora);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Escaner');
  ManualTecnico.td(ProyectoProgramacion.Escaner);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Pantalla');
  ManualTecnico.td(ProyectoProgramacion.Pantalla);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Micrófono');
  ManualTecnico.td(ProyectoProgramacion.Microfono);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Altavoces');
  ManualTecnico.td(ProyectoProgramacion.Altavoces);
  ManualTecnico.endTr;

  ManualTecnico.beginTr;
  ManualTecnico.td('Conexión a Internet');
  ManualTecnico.td(ProyectoProgramacion.Internet);
  ManualTecnico.endTr;

  ManualTecnico.endTBody;
  ManualTecnico.endTabla;

  ManualTecnico.h3('Diseño y Desarrollo', '', 'mt-3');
  ManualTecnico.insertarParrafo('A continuación se describen las aplicaciones' +
    ' e IDEs con los cuales se desarrollo el software',
    'text-align: justify', '');

  for i := 1 to ProyectoProgramacion.cantidadPlataformasDesarrollo do
  begin
    ManualTecnico.h4(ProyectoProgramacion.obtenerPlataformaDesarrollo(i - 1)
      .nombre, '', 'mt-3');
    ManualTecnico.insertarParrafo
      (ProyectoProgramacion.obtenerPlataformaDesarrollo(i - 1).descripcion,
      'text-align: justify', 'mt-3');
    ManualTecnico.beginDiv('', '', 'align=center');
    ManualTecnico.img(ProyectoProgramacion.obtenerPlataformaDesarrollo(i - 1)
      .imagen, 'width: 800px', '');
    ManualTecnico.endDiv;
  end;
  ManualTecnico.hr;

  ManualTecnico.h3('Instalación', '', 'mt-3');
  ManualTecnico.insertarParrafo('A continuación se describen los pasos' +
    ' para instalar la aplicación', 'text-align: justify', '');

  for i := 1 to ProyectoProgramacion.cantidadPasosInstalacion do
  begin
    ManualTecnico.h4(ProyectoProgramacion.obtenerPasoInstalacion(i - 1).Titulo,
      '', 'mt-3');
    ManualTecnico.insertarParrafo(ProyectoProgramacion.obtenerPasoInstalacion
      (i - 1).descripcion, 'text-align: justify', 'mt-3');
    ManualTecnico.beginDiv('', '', 'align=center');
    ManualTecnico.img(ProyectoProgramacion.obtenerPasoInstalacion(i - 1).imagen,
      'width: 800px', '');
    ManualTecnico.endDiv;
  end;
  ManualTecnico.hr;

  ruta := ProyectoProgramacion.RutaArchivos + '\manual-tecnico.html';
  ManualTecnico.exportar(ruta);

  Consola.log(ruta, 'exportarManualTecnicoHtml');

  ShellExecute(Handle, 'open', pchar(ruta), nil, nil, SW_NORMAL);
end;

procedure TFGestorProyectosProgramacion.crearAtributoClick(Sender: TObject);
begin
  FCrearEditarAtributoTabla.IdProyecto := IdProyectoSel;
  if FCrearEditarAtributoTabla.crear(IdTablaSel) then
  begin
    leerAtributosTabla(IdTablaSel);
    FMensaje.info(FCrearEditarAtributoTabla.Respuesta);
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

procedure TFGestorProyectosProgramacion.crearTablaClick(Sender: TObject);
begin
  if FCrearEditarTabla.crear(IdProyectoSel) then
  begin
    leerTablasBaseDatos;
    FMensaje.info(FCrearEditarTabla.Respuesta);
  end;
end;

procedure TFGestorProyectosProgramacion.sbDefectoClick(Sender: TObject);
begin
  if FPasosInstalacionDefecto.seleccionoPaso then
  begin
    if FCrearEditarPasoInstalacion.crearDesdePlantilla
      (ProyectoProgramacion.IdProyecto, FPasosInstalacionDefecto.descripcion,
      FPasosInstalacionDefecto.nombre, FPasosInstalacionDefecto.ruta,
      lvPasosInstalacion.Items.Count + 1) then
    begin
      ProyectoProgramacion.LeerPasosInstalacion;
      FMensaje.mensaje(FCrearEditarPasoInstalacion.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.editarSeccionClick(Sender: TObject);
var
  IdProyecto, IdSeccion: string;
begin
  if lvSecciones.Selected <> nil then
  begin
    IdProyecto := ProyectoProgramacion.IdProyecto;
    IdSeccion := lvSecciones.Selected.SubItems[4];
    if FCrearEditarSeccion.editar(IdSeccion, IdProyecto) then
    begin
      ProyectoProgramacion.leerSeccionesManual;

      FMensaje.mensaje(FCrearEditarSeccion.Respuesta, tmInfo);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.eliminarSeccionClick(Sender: TObject);
var
  IdSeccion, Seccion: string;
begin
  if lvSecciones.Selected <> nil then
  begin
    Seccion := lvSecciones.Selected.SubItems[2];
    IdSeccion := lvSecciones.Selected.SubItems[4];
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

procedure TFGestorProyectosProgramacion.eliminarTabla;
begin
  if lvTablasBD.Selected <> nil then
  begin
    if FMensaje.confirmacion('¿Está seguro de eliminar la tabla?') then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM AtributosTabla WHERE IdTabla=' + #39 +
        IdTablaSel + #39;
      Query.ExecSQL;

      Query.Close;
      Query.SQL.Text := 'DELETE FROM TablasBaseDatos WHERE IdTabla=' + #39 +
        IdTablaSel + #39;
      Query.ExecSQL;

      leerTablasBaseDatos;
      FMensaje.info('La tabla de la base de datos se eliminó correctamente');
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

procedure TFGestorProyectosProgramacion.eliminarAtributo;
var
  id: string;
begin
  if lvAtributosTabla.Selected <> nil then
  begin
    id := lvAtributosTabla.Selected.SubItems[3];
    if FMensaje.confirmacion('¿Está seguro de eliminar el atributo?') then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM AtributosTabla WHERE IdAtributo=' + #39
        + id + #39;
      Query.ExecSQL;

      leerAtributosTabla(IdTablaSel);
      FMensaje.info('El atributo se eliminó correctamente');
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

procedure TFGestorProyectosProgramacion.eliminarFuncionalidad;
var
  id: string;
begin
  if LvFuncionalidades.Selected <> nil then
  begin
    id := LvFuncionalidades.Selected.SubItems[5];
    if FMensaje.confirmacion('¿Está seguro de eliminar la funcionalidad?') then
    begin
      Query.Close;
      Query.SQL.Text := 'DELETE FROM Funcionalidades WHERE IdFuncionalidad=' +
        #39 + id + #39;
      Query.ExecSQL;

      ProyectoProgramacion.leerFuncionalidades;
      FMensaje.info('La funcionalidad se eliminó correctamente');
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.eliminarFuncionalidadClick
  (Sender: TObject);
begin
  eliminarFuncionalidad;
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

procedure TFGestorProyectosProgramacion.eliminarProyecto(Sender: TObject);
var
  id: string;
begin
  if lvRecientes.Selected <> nil then
  begin
    id := lvRecientes.Selected.SubItems[0];
    if FMensaje.confirmacion('¿Está seguro de eliminar el proyecto?') then
    begin
      try
        Query.Close;
        Query.SQL.Text := 'DELETE FROM ProyectosProgramacion WHERE IdProyecto='
          + #39 + id + #39;
        Query.ExecSQL;

        ModuloDatos.ConfigApp.leerRecientes(lvRecientes);
        FMensaje.info('El proyecto se eliminó correctamente');
      except
        FMensaje.warning('No se puede eliminar el proyecto. ' +
          'Este ya tiene otros datos relacionados.');
      end;
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
procedure TFGestorProyectosProgramacion.editarAtributoClick(Sender: TObject);
var
  id: string;
begin
  if lvAtributosTabla.Selected <> nil then
  begin
    id := lvAtributosTabla.Selected.SubItems[3];
    if FCrearEditarAtributoTabla.editar(id) then
    begin
      leerAtributosTabla(IdTablaSel);
      FMensaje.info(FCrearEditarAtributoTabla.Respuesta);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.eliminarAtributoClick(Sender: TObject);
begin
  eliminarAtributo;
end;

procedure TFGestorProyectosProgramacion.editarTablaClick(Sender: TObject);
begin
  if lvTablasBD.Selected <> nil then
  begin
    if FCrearEditarTabla.editar(IdTablaSel) then
    begin
      leerTablasBaseDatos;
      FMensaje.info(FCrearEditarTabla.Respuesta);
    end;
  end;
end;

procedure TFGestorProyectosProgramacion.EliminarTablaClick(Sender: TObject);
begin
  eliminarTabla;
end;

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
      FImportarPlataforma.descripcion, FImportarPlataforma.RutaImagen) then
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

procedure TFGestorProyectosProgramacion.crearProyecto(Sender: TObject);
begin
  if FCrearEditarProyecto.crearEditar(ACCION_CREAR, '') then
  begin
    pGuardar.Visible := true;
    pCerrarProyecto.Visible := true;
    pCompilar.Visible := true;

    ModuloDatos.ConfigApp.leerRecientes(lvRecientes);

    Proyecto.ActiveCard := cardDatosBasicos;
    sbContenido.VertScrollBar.Position := 0;

    barraEstado.Panels[2].Text := FCrearEditarProyecto.IdProyecto;
    edIdProyecto.Text := FCrearEditarProyecto.IdProyecto;
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
    begin
      leerTablasBaseDatos;
      Proyecto.ActiveCard := cardDER;
    end;

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

    if sMenu = EST_ANALISIS then
    begin
      Proyecto.ActiveCard := cardAnalisis;
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

procedure TFGestorProyectosProgramacion.seleccionarTabla(Sender: TObject);
begin
  if lvTablasBD.Selected <> nil then
  begin
    IdTablaSel := lvTablasBD.Selected.SubItems[1];
    leerAtributosTabla(IdTablaSel);
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
      Add(Modulo.descripcion);
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
        Add(archivoCodigo.descripcion);
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
  verProceso := SW_SHOWNORMAL;

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

procedure TFGestorProyectosProgramacion.sbConfigurarRutaBDClick
  (Sender: TObject);
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
