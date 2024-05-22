unit uFCrearEditarImagen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, SynEdit,
  Vcl.Buttons, Constantes, uModuloDatos, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, SynEditHighlighter,
  SynHighlighterTeX, Vcl.ComCtrls;

type
  TFCrearEditarSeccion = class(TForm)
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    pTitulo: TPanel;
    dlgImagen: TOpenDialog;
    Query: TFDQuery;
    pContenido: TPanel;
    paginaDescripcion: TPageControl;
    TabSecciones2: TTabSheet;
    PaginaImagen: TPageControl;
    TabSheet1: TTabSheet;
    imagen: TImage;
    GroupBox1: TGroupBox;
    sbBuscarImagen: TSpeedButton;
    edImagen: TSynEdit;
    edDescripcion: TSynEdit;
    sTEX: TSynTeXSyn;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    edEtiqueta: TEdit;
    GroupBox3: TGroupBox;
    edTipo: TComboBox;
    procedure sbBuscarImagenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FCargoImagen: boolean;
    FAccion: string;
    FIdImagen: string;
    procedure SetCargoImagen(const Value: boolean);
    procedure SetAccion(const Value: string);
    procedure SetIdImagen(const Value: string);
    { Private declarations }
  public
    function cargar: boolean;

    property IdImagen: string read FIdImagen write SetIdImagen;
    property Accion: string read FAccion write SetAccion;
    property CargoImagen: boolean read FCargoImagen write SetCargoImagen;
  end;

var
  FCrearEditarSeccion: TFCrearEditarSeccion;

implementation

{$R *.dfm}

function TFCrearEditarSeccion.cargar: boolean;
begin
  FCargoImagen := false;
  ShowModal;

  result := FCargoImagen;
end;

procedure TFCrearEditarSeccion.FormShow(Sender: TObject);
begin
  width := round(0.8 * Screen.width);
  Height := round(0.8 * Screen.Height);
  paginaDescripcion.width := round(0.5 * width);

  edEtiqueta.Clear;

  if Accion = ACCION_EDITAR then
  begin

  end;
end;

procedure TFCrearEditarSeccion.sbBuscarImagenClick(Sender: TObject);
begin
  if dlgImagen.Execute then
  begin
    imagen.Picture.LoadFromFile(dlgImagen.FileName);
    edImagen.Text := dlgImagen.FileName;
  end;
end;

procedure TFCrearEditarSeccion.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarSeccion.SetCargoImagen(const Value: boolean);
begin
  FCargoImagen := Value;
end;

procedure TFCrearEditarSeccion.SetIdImagen(const Value: string);
begin
  FIdImagen := Value;
end;

end.
