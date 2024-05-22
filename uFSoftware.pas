unit uFSoftware;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFAcercaSoftware = class(TForm)
    pTitulo: TPanel;
    lvSoftware: TListView;
    iconos32: TImageList;
    lbTitulo: TLabel;
    lbDescripcion: TLabel;
  private
    FEscaner: string;
    FMicrofono: string;
    FPantalla: string;
    FAltavoces: string;
    FImpresora: string;
    FMemoriaRAM: string;
    FMouse: string;
    FTeclado: string;
    FPantallaTactil: string;
    FConexionUSB: string;
    FInternet: string;
    FSistemaOperativo: string;
    FDiscoDuro: string;
    FUnidadCD: string;
    FTabletaDigitalizadora: string;
    FTarjetaGrafica: string;
    FLectorCodigos: string;
    FLectorRFIDs: string;
    FDescripcion: string;
    FVersion: string;
    FNombre: string;
    FCamara: string;
    procedure SetAltavoces(const Value: string);
    procedure SetConexionUSB(const Value: string);
    procedure SetDiscoDuro(const Value: string);
    procedure SetEscaner(const Value: string);
    procedure SetImpresora(const Value: string);
    procedure SetInternet(const Value: string);
    procedure SetMemoriaRAM(const Value: string);
    procedure SetMicrofono(const Value: string);
    procedure SetMouse(const Value: string);
    procedure SetPantalla(const Value: string);
    procedure SetPantallaTactil(const Value: string);
    procedure SetSistemaOperativo(const Value: string);
    procedure SetTabletaDigitalizadora(const Value: string);
    procedure SetTarjetaGrafica(const Value: string);
    procedure SetTeclado(const Value: string);
    procedure SetUnidadCD(const Value: string);
    procedure SetLectorCodigos(const Value: string);
    procedure SetLectorRFIDs(const Value: string);
    procedure SetDescripcion(const Value: string);
    procedure SetNombre(const Value: string);
    procedure SetVersion(const Value: string);
    procedure SetCamara(const Value: string);
    { Private declarations }
  public

    procedure imprimirLista;
    procedure agregarItem(imagen: integer; descripcion, minimo: string);

    property MemoriaRAM: string read FMemoriaRAM write SetMemoriaRAM;
    property DiscoDuro: string read FDiscoDuro write SetDiscoDuro;
    property Pantalla: string read FPantalla write SetPantalla;
    property SistemaOperativo: string read FSistemaOperativo
      write SetSistemaOperativo;
    property TarjetaGrafica: string read FTarjetaGrafica
      write SetTarjetaGrafica;
    property Internet: string read FInternet write SetInternet;
    property Teclado: string read FTeclado write SetTeclado;
    property Mouse: string read FMouse write SetMouse;
    property Impresora: string read FImpresora write SetImpresora;
    property Escaner: string read FEscaner write SetEscaner;
    property Microfono: string read FMicrofono write SetMicrofono;
    property Altavoces: string read FAltavoces write SetAltavoces;
    property Camara: string read FCamara write SetCamara;
    property UnidadCD: string read FUnidadCD write SetUnidadCD;
    property ConexionUSB: string read FConexionUSB write SetConexionUSB;
    property PantallaTactil: string read FPantallaTactil
      write SetPantallaTactil;
    property TabletaDigitalizadora: string read FTabletaDigitalizadora
      write SetTabletaDigitalizadora;
    property LectorRFIDs: string read FLectorRFIDs write SetLectorRFIDs;
    property LectorCodigos: string read FLectorCodigos write SetLectorCodigos;
    property descripcion: string read FDescripcion write SetDescripcion;
    property Nombre: string read FNombre write SetNombre;
    property Version: string read FVersion write SetVersion;
  end;

var
  FAcercaSoftware: TFAcercaSoftware;

implementation

{$R *.dfm}
{ TFAcercaSoftware }

procedure TFAcercaSoftware.agregarItem(imagen: integer;
  descripcion, minimo: string);
begin
  with lvSoftware.Items.Add do
  begin
    SubItems.Add(IntToStr(lvSoftware.Items.count));
    SubItems.Add(descripcion);
    SubItems.Add(minimo);

    ImageIndex := imagen;
  end;
end;

procedure TFAcercaSoftware.imprimirLista;
begin
  lbTitulo.Caption := FVersion;
  lbDescripcion.Caption := FDescripcion;

  lvSoftware.Items.Clear;

  agregarItem(0, 'Sistema Operativo', FSistemaOperativo);
  agregarItem(1, 'Memoria RAM', FMemoriaRAM);
  agregarItem(2, 'Espacio en Disco', FDiscoDuro);
  agregarItem(3, 'Tarjeta Gráfica', FTarjetaGrafica);

  agregarItem(4, 'Pantalla', FPantalla);
  agregarItem(5, 'Pantalla Táctil', FPantallaTactil);
  agregarItem(6, 'Tableta Digitalizadora', FTabletaDigitalizadora);
  agregarItem(7, 'Mouse', FMouse);
  agregarItem(8, 'Teclado', FTeclado);

  agregarItem(9, 'Lector de Tarjetas RFIDs', FLectorRFIDs);
  agregarItem(10, 'Lector de Códigos de Barras/QR', FLectorCodigos);

  agregarItem(11, 'Micrófono', FMicrofono);
  agregarItem(12, 'Altavoces', FAltavoces);
  agregarItem(18, 'Cámara', FCamara);

  agregarItem(13, 'Impresora', FImpresora);
  agregarItem(14, 'Escaner', FEscaner);

  agregarItem(15, 'Conexión a Internet', FInternet);
  agregarItem(16, 'Conexión USB', FConexionUSB);
  agregarItem(17, 'Unidad de CDs/DVDs', FUnidadCD);

  ShowModal;
end;

procedure TFAcercaSoftware.SetAltavoces(const Value: string);
begin
  FAltavoces := Value;
end;

procedure TFAcercaSoftware.SetCamara(const Value: string);
begin
  FCamara := Value;
end;

procedure TFAcercaSoftware.SetConexionUSB(const Value: string);
begin
  FConexionUSB := Value;
end;

procedure TFAcercaSoftware.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure TFAcercaSoftware.SetDiscoDuro(const Value: string);
begin
  FDiscoDuro := Value;
end;

procedure TFAcercaSoftware.SetEscaner(const Value: string);
begin
  FEscaner := Value;
end;

procedure TFAcercaSoftware.SetImpresora(const Value: string);
begin
  FImpresora := Value;
end;

procedure TFAcercaSoftware.SetInternet(const Value: string);
begin
  FInternet := Value;
end;

procedure TFAcercaSoftware.SetLectorCodigos(const Value: string);
begin
  FLectorCodigos := Value;
end;

procedure TFAcercaSoftware.SetLectorRFIDs(const Value: string);
begin
  FLectorRFIDs := Value;
end;

procedure TFAcercaSoftware.SetMemoriaRAM(const Value: string);
begin
  FMemoriaRAM := Value;
end;

procedure TFAcercaSoftware.SetMicrofono(const Value: string);
begin
  FMicrofono := Value;
end;

procedure TFAcercaSoftware.SetMouse(const Value: string);
begin
  FMouse := Value;
end;

procedure TFAcercaSoftware.SetNombre(const Value: string);
begin
  FNombre := Value;
end;

procedure TFAcercaSoftware.SetPantalla(const Value: string);
begin
  FPantalla := Value;
end;

procedure TFAcercaSoftware.SetPantallaTactil(const Value: string);
begin
  FPantallaTactil := Value;
end;

procedure TFAcercaSoftware.SetSistemaOperativo(const Value: string);
begin
  FSistemaOperativo := Value;
end;

procedure TFAcercaSoftware.SetTabletaDigitalizadora(const Value: string);
begin
  FTabletaDigitalizadora := Value;
end;

procedure TFAcercaSoftware.SetTarjetaGrafica(const Value: string);
begin
  FTarjetaGrafica := Value;
end;

procedure TFAcercaSoftware.SetTeclado(const Value: string);
begin
  FTeclado := Value;
end;

procedure TFAcercaSoftware.SetUnidadCD(const Value: string);
begin
  FUnidadCD := Value;
end;

procedure TFAcercaSoftware.SetVersion(const Value: string);
begin
  FVersion := Value;
end;

end.
