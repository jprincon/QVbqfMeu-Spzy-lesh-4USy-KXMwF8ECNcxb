{Esta corresponde a la Unidad donde se define la clase TRegistroInicio. Esta
clase es la definición de un panel en tiempo de ejecución en la cual los
usuarios se pueden registrar o iniciar sesión en la aplicación}
unit uTRegistroInicio;

interface

uses
  classes, Vcl.Controls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Graphics,
  Vcl.Buttons, dialogs, FireDAC.Comp.Client, uFMensaje, Vcl.ExtCtrls,
  IdHashMessageDigest, idHash, IdGlobal, System.SysUtils;

type

  TNotificacionBooleana = procedure(Notificacion: boolean) of Object;

  TRegistroInicio = class(TObject)
  private
    PaginaRegistroInicio: TPageControl;
    Registro, Inicio: TTabSheet;
    pNombreReg, pCorreoReg, pContraReg1, pContraReg2: TPanel;
    pCorreoIni, pContraIni: TPanel;
    lbNombreReg, lbCorreoReg, lbContra1Reg, lbContra2Reg: TLabel;
    lbCorreoIni, lbContraIni: TLabel;
    edNombreReg, edCorreoReg, edContra1Reg, edContra2Reg: TEdit;
    edCorreoIni, edContraIni: TEdit;
    spIniciar, sbRegistrar: TSpeedButton;
    imgNombreReg, imgCorreoReg, imgContraReg1, imgContraReg2: TImage;
    imgCorreoIni, imgContraIni: TImage;
    cbMantenerSesion: TCheckBox;
    imagen32: TImageList;
    FQuery: TFDQuery;
    FMensajes: TFMensaje;
    FOnInicioSesion: TNotificacionBooleana;
    FOnRegistro: TNotificacionBooleana;
    FIdUsuario: string;
    FUsuario: string;
    FImagen: string;

    procedure iniciarSesion(Sender: TObject);
    procedure registrarme(Sender: TObject);
    procedure SetQuery(const Value: TFDQuery);
    procedure SetMensajes(const Value: TFMensaje);
    procedure SetOnInicioSesion(const Value: TNotificacionBooleana);
    procedure SetOnRegistro(const Value: TNotificacionBooleana);

    function toMd5(texto: string): string;
    function generarID: string;
    function generarCadena(n: integer): string;
    procedure SetIdUsuario(const Value: string);
    procedure SetUsuario(const Value: string);
    procedure SetImagen(const Value: string);
  public
    constructor create(padre: TWinControl);
    destructor destroy; override;

    procedure centrar(w, h: integer);
    procedure limpiarFormulario;
    procedure inicioAutomatico;
    procedure cerrarSesion;
  published
    property Query: TFDQuery read FQuery write SetQuery;
    property Mensajes: TFMensaje read FMensajes write SetMensajes;
    property IdUsuario: string read FIdUsuario write SetIdUsuario;
    property Usuario: string read FUsuario write SetUsuario;
    property Imagen: string read FImagen write SetImagen;

    property OnInicioSesion: TNotificacionBooleana read FOnInicioSesion
      write SetOnInicioSesion;
    property OnRegistro: TNotificacionBooleana read FOnRegistro
      write SetOnRegistro;

  end;

implementation

{ TRegistroInicio }

procedure TRegistroInicio.centrar(w, h: integer);
begin
  if Assigned(PaginaRegistroInicio) then
  begin
    PaginaRegistroInicio.Left := (w - PaginaRegistroInicio.Width) div 2;
    PaginaRegistroInicio.Top := (h - PaginaRegistroInicio.Height) div 2;
  end;
end;

procedure TRegistroInicio.cerrarSesion;
begin
  Query.Close;
  Query.SQL.Text := 'DELETE FROM SesionIniciada';
  Query.ExecSQL;
end;

constructor TRegistroInicio.create(padre: TWinControl);
var
  posicion, incremento: integer;
  rutaImagenes: string;
  bmp: TBitmap;
begin

  incremento := 3;
  rutaImagenes := 'Imagenes-Registro-Inicio';

  if not DirectoryExists(rutaImagenes) then
    ShowMessage('Debe copiar la carpeta: ' + rutaImagenes);

  imagen32 := TImageList.create(nil);
  imagen32.Width := 32;
  imagen32.Height := 32;

  bmp := TBitmap.create;
  bmp.LoadFromFile(rutaImagenes + '\Ingresar.bmp');
  imagen32.Add(bmp, bmp);

  bmp := TBitmap.create;
  bmp.LoadFromFile(rutaImagenes + '\Iniciar-Sesion.bmp');
  imagen32.Add(bmp, bmp);

  PaginaRegistroInicio := TPageControl.create(nil);
  with PaginaRegistroInicio do
  begin
    Parent := padre;
    Width := 350;
    Height := Round(560);
    Images := imagen32;
  end;

  // Pestaña de Inicio
  Inicio := TTabSheet.create(nil);
  with Inicio do
  begin
    Parent := PaginaRegistroInicio;
    Caption := 'Iniciar Sesión';
    PageControl := PaginaRegistroInicio;
    ImageIndex := 1;
  end;

  // Correo
  lbCorreoIni := TLabel.create(nil);
  with lbCorreoIni do
  begin
    Parent := Inicio;
    Caption := 'Ingrese su correo';
    Align := alTop;
    AlignWithMargins := true;
    Margins.Left := 60;
    Font.Style := [fsBold];
    Font.Size := 11;
  end;

  pCorreoIni := TPanel.create(nil);
  with pCorreoIni do
  begin
    Parent := Inicio;
    Align := alTop;
    AlignWithMargins := true;
    Margins.Left := 20;
    Margins.Right := 20;
    BevelOuter := bvNone;
    Height := 38;
    Top := lbCorreoIni.Top + lbCorreoIni.Height + incremento;
  end;

  imgCorreoIni := TImage.create(nil);
  with imgCorreoIni do
  begin
    Parent := pCorreoIni;
    Align := alLeft;
    AlignWithMargins := true;
    Width := 32;
    Picture.LoadFromFile(rutaImagenes + '\Correo.png');
  end;

  edCorreoIni := TEdit.create(nil);
  with edCorreoIni do
  begin
    Parent := pCorreoIni;
    Align := alclient;
    AlignWithMargins := true;
    Alignment := taCenter;
    Margins.Right := 20;
    Font.Color := clBlue;
  end;

  // Contraseña
  lbContraIni := TLabel.create(nil);
  with lbContraIni do
  begin
    Parent := Inicio;
    Caption := 'Ingrese su contraseña';
    Align := alTop;
    AlignWithMargins := true;
    Margins.Left := 60;
    Font.Style := [fsBold];
    Font.Size := 11;
    Top := pCorreoIni.Top + pCorreoIni.Height + incremento;
  end;

  pContraIni := TPanel.create(nil);
  with pContraIni do
  begin
    Parent := Inicio;
    Align := alTop;
    AlignWithMargins := true;
    Margins.Left := 20;
    Margins.Right := 20;
    BevelOuter := bvNone;
    Height := 38;
    Top := lbContraIni.Top + lbContraIni.Height + incremento;
  end;

  imgContraIni := TImage.create(nil);
  with imgContraIni do
  begin
    Parent := pContraIni;
    Align := alLeft;
    AlignWithMargins := true;
    Width := 32;
    Picture.LoadFromFile(rutaImagenes + '\Contra.png');
  end;

  edContraIni := TEdit.create(nil);
  with edContraIni do
  begin
    Parent := pContraIni;
    Align := alclient;
    AlignWithMargins := true;
    Alignment := taCenter;
    Margins.Right := 20;
    Font.Color := $008000FF;
    PasswordChar := '*';
  end;

  cbMantenerSesion := TCheckBox.create(nil);
  with cbMantenerSesion do
  begin
    Parent := Inicio;
    Align := alTop;
    AlignWithMargins := true;
    Margins.Left := 60;
    Margins.Right := 20;
    Margins.Top := 20;
    Caption := '¿Mantener Sesión?';
    Top := pContraIni.Top + pContraIni.Height + incremento;
  end;

  spIniciar := TSpeedButton.create(nil);
  with spIniciar do
  begin
    Parent := Inicio;
    Align := alBottom;
    AlignWithMargins := true;
    Margins.Left := 20;
    Margins.Right := 20;
    Caption := 'Iniciar Sesión';
    Flat := true;
    Height := 40;
    OnClick := iniciarSesion;
    Glyph.LoadFromFile(rutaImagenes + '\Ingresar.bmp');
  end;

  // Pestaña de Registro
  Registro := TTabSheet.create(nil);
  with Registro do
  begin
    Parent := PaginaRegistroInicio;
    Caption := 'Registrarme';
    PageControl := PaginaRegistroInicio;
    ImageIndex := 0;
  end;

  // Nombre
  lbNombreReg := TLabel.create(nil);
  with lbNombreReg do
  begin
    Parent := Registro;
    Caption := 'Ingrese su nombre';
    Align := alTop;
    Margins.Left := 60;
    AlignWithMargins := true;
    Font.Style := [fsBold];
    Font.Size := 11;
    Top := 0;
  end;

  pNombreReg := TPanel.create(nil);
  with pNombreReg do
  begin
    Parent := Registro;
    Align := alTop;
    AlignWithMargins := true;
    Margins.Left := 20;
    Margins.Right := 20;
    BevelOuter := bvNone;
    Height := 38;
    Top := lbNombreReg.Top + lbNombreReg.Height + incremento;
  end;

  imgNombreReg := TImage.create(nil);
  with imgNombreReg do
  begin
    Parent := pNombreReg;
    Align := alLeft;
    AlignWithMargins := true;
    Width := 32;
    Picture.LoadFromFile(rutaImagenes + '\Nombre.png');
  end;

  edNombreReg := TEdit.create(nil);
  with edNombreReg do
  begin
    Parent := pNombreReg;
    Align := alclient;
    AlignWithMargins := true;
    Alignment := taCenter;
    Margins.Right := 20;
    Font.Color := $00FF0080;
    Top := lbNombreReg.Top + lbNombreReg.Height + incremento;
  end;

  // Correo
  lbCorreoReg := TLabel.create(nil);
  with lbCorreoReg do
  begin
    Parent := Registro;
    Caption := 'Ingrese su correo';
    Align := alTop;
    Margins.Left := 60;
    AlignWithMargins := true;
    Font.Style := [fsBold];
    Font.Size := 11;
    Top := pNombreReg.Top + pNombreReg.Height + incremento;
  end;

  pCorreoReg := TPanel.create(nil);
  with pCorreoReg do
  begin
    Parent := Registro;
    Align := alTop;
    AlignWithMargins := true;
    Margins.Left := 20;
    Margins.Right := 20;
    BevelOuter := bvNone;
    Height := 38;
    Top := lbCorreoReg.Top + lbCorreoReg.Height + incremento;
  end;

  imgCorreoReg := TImage.create(nil);
  with imgCorreoReg do
  begin
    Parent := pCorreoReg;
    Align := alLeft;
    AlignWithMargins := true;
    Width := 32;
    Picture.LoadFromFile(rutaImagenes + '\Correo.png');
  end;

  edCorreoReg := TEdit.create(nil);
  with edCorreoReg do
  begin
    Parent := pCorreoReg;
    Align := alclient;
    AlignWithMargins := true;
    Alignment := taCenter;
    Margins.Right := 20;
    Font.Color := clBlue;
    Top := pCorreoReg.Top + pCorreoReg.Height + incremento;
  end;

  // Contraseña 1
  lbContra1Reg := TLabel.create(nil);
  with lbContra1Reg do
  begin
    Parent := Registro;
    Caption := 'Ingrese una contraseña';
    Align := alTop;
    Margins.Left := 60;
    AlignWithMargins := true;
    Font.Style := [fsBold];
    Font.Size := 11;
    Top := pCorreoReg.Top + pCorreoReg.Height + incremento;
  end;

  pContraReg1 := TPanel.create(nil);
  with pContraReg1 do
  begin
    Parent := Registro;
    Align := alTop;
    AlignWithMargins := true;
    Margins.Left := 20;
    Margins.Right := 20;
    BevelOuter := bvNone;
    Height := 38;
    Top := lbContra1Reg.Top + lbContra1Reg.Height + incremento;
  end;

  imgContraReg1 := TImage.create(nil);
  with imgContraReg1 do
  begin
    Parent := pContraReg1;
    Align := alLeft;
    AlignWithMargins := true;
    Width := 32;
    Picture.LoadFromFile(rutaImagenes + '\Contra.png');
  end;

  edContra1Reg := TEdit.create(nil);
  with edContra1Reg do
  begin
    Parent := pContraReg1;
    Align := alclient;
    AlignWithMargins := true;
    Alignment := taCenter;
    Margins.Right := 20;
    Font.Color := $008000FF;
    PasswordChar := '*';
  end;

  // Contraseña 2
  lbContra2Reg := TLabel.create(nil);
  with lbContra2Reg do
  begin
    Parent := Registro;
    Caption := 'Repita la contraseña';
    Align := alTop;
    Margins.Left := 60;
    AlignWithMargins := true;
    Font.Style := [fsBold];
    Font.Size := 11;
    Top := pContraReg1.Top + pContraReg1.Height + incremento;
  end;

  pContraReg2 := TPanel.create(nil);
  with pContraReg2 do
  begin
    Parent := Registro;
    Align := alTop;
    AlignWithMargins := true;
    Margins.Left := 20;
    Margins.Right := 20;
    BevelOuter := bvNone;
    Height := 38;
    Top := lbContra2Reg.Top + lbContra2Reg.Height + incremento;
  end;

  imgContraReg2 := TImage.create(nil);
  with imgContraReg2 do
  begin
    Parent := pContraReg2;
    Align := alLeft;
    AlignWithMargins := true;
    Width := 32;
    Picture.LoadFromFile(rutaImagenes + '\Repite-Contra.bmp');
  end;

  edContra2Reg := TEdit.create(nil);
  with edContra2Reg do
  begin
    Parent := pContraReg2;
    Align := alclient;
    AlignWithMargins := true;
    Alignment := taCenter;
    Margins.Right := 20;
    Font.Color := $008000FF;
    PasswordChar := '*';
  end;

  sbRegistrar := TSpeedButton.create(nil);
  with sbRegistrar do
  begin
    Parent := Registro;
    Align := alBottom;
    AlignWithMargins := true;
    Margins.Left := 20;
    Margins.Right := 20;
    Caption := 'Registrarme';
    Flat := true;
    Height := 40;
    OnClick := registrarme;
    Glyph.LoadFromFile(rutaImagenes + '\Registro.bmp');
  end;

  PaginaRegistroInicio.ActivePageIndex := 0;
end;

destructor TRegistroInicio.destroy;
begin

  inherited destroy;
end;

function TRegistroInicio.generarCadena(n: integer): string;
var
  base: string;
  i: integer;
begin
  base := 'abcdefghijklmnopqrstuvwxyzABCEDFGHIJKLMNOPQRSTUVWXYZ0123456789';

  result := '';

  for i := 1 to n do
    result := result + base[Random(length(base)) + 1];
end;

function TRegistroInicio.generarID: string;
begin
  result := generarCadena(8) + '-' + generarCadena(4) + '-' + generarCadena(4) +
    '-' + generarCadena(4) + '-' + generarCadena(12);
end;

procedure TRegistroInicio.iniciarSesion(Sender: TObject);
var
  correo, contra1, contra2: string;
begin
  correo := edCorreoIni.Text;
  contra1 := edContraIni.Text;

  if not Assigned(FMensajes) then
    ShowMessage('No tenemos formulario de mensajes');

  if correo = '' then
  begin
    FMensajes.mensaje('Debe ingresar un correo válido', tmWarning);
    exit;
  end;

  if contra1 = '' then
  begin
    FMensajes.mensaje('Debe ingresar la contraseña', tmWarning);
    exit;
  end;

  // Preguntar si el usuario ya esta registrado
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM Usuarios WHERE Correo=' + #39 + correo + #39;
  Query.Open;

  if Query.RecordCount = 0 then
  begin
    FMensajes.mensaje('El usuario con correo (' + correo +
      ') no esta registrado', tmWarning);
    exit;
  end;

  contra1 := toMd5(contra1);
  contra2 := Query.FieldByName('Contra').AsString;

  if contra1 <> contra2 then
  begin
    FMensajes.mensaje('La contraseña es incorrecta', tmError);
    exit;
  end;

  FIdUsuario := Query.FieldByName('IdUsuario').AsString;
  FUsuario := Query.FieldByName('Nombre').AsString;
  FImagen := Query.FieldByName('Imagen').AsString;

  if cbMantenerSesion.Checked then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO SesionIniciada (';
    Query.SQL.Add('IdRegistro, ');
    Query.SQL.Add('Correo, ');
    Query.SQL.Add('Contra) VALUES (');
    Query.SQL.Add(':IdRegistro, ');
    Query.SQL.Add(':Correo, ');
    Query.SQL.Add(':Contra)');

    Query.Params.ParamByName('IdRegistro').Value := generarID;
    Query.Params.ParamByName('Correo').Value := correo;
    Query.Params.ParamByName('Contra').Value := edContraIni.Text;

    Query.ExecSQL;

  end;

  FOnInicioSesion(true);
end;

procedure TRegistroInicio.inicioAutomatico;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM SesionIniciada';
  Query.Open;

  if Query.RecordCount >= 1 then
  begin
    edCorreoIni.Text := Query.FieldByName('Correo').AsString;
    edContraIni.Text := Query.FieldByName('Contra').AsString;

    iniciarSesion(self);
  end;
end;

procedure TRegistroInicio.limpiarFormulario;
begin
  edNombreReg.Clear;
  edCorreoReg.Clear;
  edContra1Reg.Clear;
  edContra2Reg.Clear;
  edCorreoIni.Clear;
  edContraIni.Clear;
end;

procedure TRegistroInicio.registrarme(Sender: TObject);
var
  nombre, correo, contra1, contra2: string;
begin
  nombre := edNombreReg.Text;
  correo := edCorreoReg.Text;
  contra1 := edContra1Reg.Text;
  contra2 := edContra2Reg.Text;

  if nombre = '' then
  begin
    FMensajes.mensaje('Debe ingresar un nombre válido', tmWarning);
    exit;
  end;

  if correo = '' then
  begin
    FMensajes.mensaje('Debe ingresar un correo válido', tmWarning);
    exit;
  end;

  if contra1 = '' then
  begin
    FMensajes.mensaje('Debe ingresar una contraseña', tmWarning);
    exit;
  end;

  if contra1 <> contra2 then
  begin
    FMensajes.mensaje('Las contraseñas no coinciden', tmWarning);
    exit;
  end;

  // Determinar si el usuario ya esta registrado
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM Usuarios WHERE Correo=' + #39 + correo + #39;
  Query.Open;

  if Query.RecordCount >= 1 then
  begin
    FMensajes.mensaje('El usuario con correo (' + correo +
      ') ya esta registrado', tmWarning);
    exit;
  end;

  Query.Close;
  Query.SQL.Text := 'INSERT INTO Usuarios (';
  Query.SQL.Add('IdUsuario, ');
  Query.SQL.Add('Nombre, ');
  Query.SQL.Add('Correo, ');
  Query.SQL.Add('Contra) VALUES (');
  Query.SQL.Add(':IdUsuario, ');
  Query.SQL.Add(':Nombre, ');
  Query.SQL.Add(':Correo, ');
  Query.SQL.Add(':Contra)');

  FIdUsuario := generarID;
  FUsuario := nombre;

  Query.Params.ParamByName('IdUsuario').Value := generarID;
  Query.Params.ParamByName('Nombre').Value := nombre;
  Query.Params.ParamByName('Correo').Value := correo;
  Query.Params.ParamByName('Contra').Value := toMd5(contra1);

  Query.ExecSQL;

  FOnRegistro(true);
end;

procedure TRegistroInicio.SetIdUsuario(const Value: string);
begin
  FIdUsuario := Value;
end;

procedure TRegistroInicio.SetImagen(const Value: string);
begin
  FImagen := Value;
end;

procedure TRegistroInicio.SetMensajes(const Value: TFMensaje);
begin
  FMensajes := Value;
end;

procedure TRegistroInicio.SetOnInicioSesion(const Value: TNotificacionBooleana);
begin
  FOnInicioSesion := Value;
end;

procedure TRegistroInicio.SetOnRegistro(const Value: TNotificacionBooleana);
begin
  FOnRegistro := Value;
end;

procedure TRegistroInicio.SetQuery(const Value: TFDQuery);
begin
  FQuery := Value;
end;

procedure TRegistroInicio.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

function TRegistroInicio.toMd5(texto: string): string;
var
  hashMessageDigest5: TIdHashMessageDigest5;
begin
  hashMessageDigest5 := nil;
  try
    hashMessageDigest5 := TIdHashMessageDigest5.create;
    result := IdGlobal.IndyLowerCase(hashMessageDigest5.HashStringAsHex(texto));
  finally
    hashMessageDigest5.Free;
  end;
end;

end.
