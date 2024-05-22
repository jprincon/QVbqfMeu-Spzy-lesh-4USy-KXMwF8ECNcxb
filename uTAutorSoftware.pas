unit uTAutorSoftware;

interface

uses
  classes, Vcl.Controls, System.SysUtils, Vcl.ExtCtrls, graphics, System.Types,
  Vcl.StdCtrls;

type
  TAutorSoftware = class(TObject)
  private
    pAutor, pContenido: TPanel;
    imgAutor: TImage;
    lbNombre: TLabel;
    lbCorreo: TLabel;
    lbBiografia: TLabel;
    FCorreo: string;
    FFoto: string;
    FBiografia: string;
    FNombre: string;
    FRutaTrabajo: string;
    procedure SetBiografia(const Value: string);
    procedure SetCorreo(const Value: string);
    procedure SetFoto(const Value: string);
    procedure SetNombre(const Value: string);
    procedure SetRutaTrabajo(const Value: string);
  public
    constructor create(Padre: TWinControl);
    destructor destroy; override;
  published
    property Nombre: string read FNombre write SetNombre;
    property Correo: string read FCorreo write SetCorreo;
    property Biografia: string read FBiografia write SetBiografia;
    property Foto: string read FFoto write SetFoto;

    property RutaTrabajo: string read FRutaTrabajo write SetRutaTrabajo;
  end;

implementation

{ TAutorSoftware }

constructor TAutorSoftware.create(Padre: TWinControl);
var
  punto: TPoint;
begin
  pAutor := TPanel.create(nil);
  with pAutor do
  begin
    Parent := Padre;
    Align := alTop;
    AlignWithMargins := true;
    Margins.SetBounds(10, 10, 10, 0);
    BevelOuter := bvNone;
    Height := 200;
    BevelKind := bkTile;
  end;

  imgAutor := TImage.create(nil);
  with imgAutor do
  begin
    Parent := pAutor;
    Align := alLeft;
    AlignWithMargins := true;
    Width := 200;
    Proportional := true;
    center := true;
  end;

  pContenido := TPanel.create(nil);
  with pContenido do
  begin
    Parent := pAutor;
    Align := alClient;
    AlignWithMargins := true;
    Margins.SetBounds(20, 5, 5, 5);
    BevelOuter := bvNone;
  end;

  lbNombre := TLabel.create(nil);
  with lbNombre do
  begin
    Parent := pContenido;
    Align := alTop;
    AutoSize := true;
    Height := 30;
    font.Size := 16;
    font.Color := $00C08000;
    font.Style := [fsBold];
  end;

  lbCorreo := TLabel.create(nil);
  with lbCorreo do
  begin
    Parent := pContenido;
    Align := alTop;
    AutoSize := true;
    font.Size := 12;
    font.Color := clBlue;
    font.Style := [fsItalic];
  end;

  lbBiografia := TLabel.create(nil);
  with lbBiografia do
  begin
    Parent := pContenido;
    Align := alClient;
    WordWrap := true;
    font.Size := 12;
  end;
end;

destructor TAutorSoftware.destroy;
begin
  lbBiografia.Free;
  lbCorreo.Free;
  lbNombre.Free;
  pContenido.Free;
  imgAutor.Free;
  pAutor.Free;

  inherited destroy;
end;

procedure TAutorSoftware.SetBiografia(const Value: string);
begin
  FBiografia := Value;
  lbBiografia.Caption := Value;
end;

procedure TAutorSoftware.SetCorreo(const Value: string);
begin
  FCorreo := Value;
  lbCorreo.Caption := Value;
end;

procedure TAutorSoftware.SetFoto(const Value: string);
begin
  FFoto := Value;
  if fileexists(Value) then
    imgAutor.Picture.LoadFromFile(Value);
end;

procedure TAutorSoftware.SetNombre(const Value: string);
begin
  FNombre := Value;
  lbNombre.Caption := Value;
end;

procedure TAutorSoftware.SetRutaTrabajo(const Value: string);
begin
  FRutaTrabajo := Value;
end;

end.
