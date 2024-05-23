{Este formulario corresponde al dise�o de una plantilla y fue usado para
crear los nuevos formularios requeridos en la aplicaci�n. Su funci�n solamente
se da en tiempo de dise�o y no tiene utilidad en tiempo de ejecuci�n}
unit uFPlantilla;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.WinXCalendars, System.ImageList, Vcl.ImgList, uFAutores,
  uModuloDatos, uFActualizaciones;

type
  TFPlantilla = class(TForm)
    MenuPrincipal: TPageControl;
    TabMM_Archivo: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    barraEstado: TStatusBar;
    Panel7: TPanel;
    Panel8: TPanel;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    edFecha: TCalendarPicker;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    iconos32: TImageList;
    TabHerramientas: TTabSheet;
    TabSesion: TTabSheet;
    Panel6: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    sbCerrarSesion: TSpeedButton;
    Label2: TLabel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    SpeedButton3: TSpeedButton;
    Label5: TLabel;
    iconos24: TImageList;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    ListView1: TListView;
    TabSheet3: TTabSheet;
    pTitulo: TPanel;
    lvProyecto: TListView;
    TabSheet4: TTabSheet;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    sbActualizaciones: TSpeedButton;
    Label10: TLabel;
    Panel24: TPanel;
    sbAutores: TSpeedButton;
    Label11: TLabel;
    Panel25: TPanel;
    sbSoftware: TSpeedButton;
    Label12: TLabel;
    procedure sbAutoresClick(Sender: TObject);
    procedure sbSoftwareClick(Sender: TObject);
    procedure sbActualizacionesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlantilla: TFPlantilla;

implementation

{$R *.dfm}

uses uFSoftware;

procedure TFPlantilla.sbActualizacionesClick(Sender: TObject);
var
  Actualizacion: TActualizacion;
  fecha: tdate;
begin
  FActualizaciones.limpiar;

  fecha := EncodeDate(2022, 12, 19);
  Actualizacion := FActualizaciones.Actualizacion(fecha);
  with Actualizacion do
  begin
    addDesc('Descripci�n ...');
  end;

  FActualizaciones.MostrarActualizaciones(ModuloDatos.ConfigApp.version);
end;

procedure TFPlantilla.sbAutoresClick(Sender: TObject);
begin
  FAutores.agregarAutor('Juli�n Andr�s Rinc�n Penagos',
    'jarincon@uniquindio.edu.co', 'Licenciado en Matem�ticas y Magister en' +
    ' Ciencias de la Educaci�n (2007-2016); Docente del Programa de Licenciatura en'
    + ' Matem�ticas de la Universidad del Quind�o (2013-2022)',
    'Julian_Andres_Rincon_Penagos');

  FAutores.ShowModal;
end;

procedure TFPlantilla.sbSoftwareClick(Sender: TObject);
begin
  FAcercaSoftware.Nombre := ModuloDatos.ConfigApp.subaplicacion;
  FAcercaSoftware.version := ModuloDatos.ConfigApp.version;
  FAcercaSoftware.descripcion := 'Descripci�n del Software ...';

  FAcercaSoftware.SistemaOperativo := 'Windows 10';
  FAcercaSoftware.MemoriaRAM := '4 GB';
  FAcercaSoftware.DiscoDuro := '23.6 MB';
  FAcercaSoftware.TarjetaGrafica := 'No requiere';

  FAcercaSoftware.Pantalla := 'Resoluci�n de 1366px * 768px';
  FAcercaSoftware.PantallaTactil := 'Opcional';
  FAcercaSoftware.TabletaDigitalizadora := 'Opcional';
  FAcercaSoftware.Teclado := 'Si';
  FAcercaSoftware.Mouse := 'Si';

  FAcercaSoftware.LectorRFIDs := 'No Requiere';
  FAcercaSoftware.LectorCodigos := 'No Requiere';

  FAcercaSoftware.Microfono := 'No requiere';
  FAcercaSoftware.Altavoces := 'No requiere';

  FAcercaSoftware.Impresora := 'No Requiere';
  FAcercaSoftware.Escaner := 'No requiere';

  FAcercaSoftware.ConexionUSB := 'Si';
  FAcercaSoftware.Internet := 'Opcional';
  FAcercaSoftware.UnidadCD := 'Opcional';

  FAcercaSoftware.imprimirLista;
end;

end.
