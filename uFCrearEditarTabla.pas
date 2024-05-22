unit uFCrearEditarTabla;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, SynEdit, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uFCrearEditarModulo, uModuloDatos;

type
  TFCrearEditarTabla = class(TForm)
    pTitulo: TPanel;
    Panel6: TPanel;
    sbGuardar: TSpeedButton;
    GroupBox1: TGroupBox;
    edTabla: TEdit;
    GroupBox2: TGroupBox;
    edDescripcion: TSynEdit;
    Query: TFDQuery;
    procedure sbGuardarClick(Sender: TObject);
  private
    FRespuesta: string;
    FAccion: string;
    FIdProyecto: string;
    FIdTabla: string;
    FCreoEdito: boolean;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdProyecto(const Value: string);
    procedure SetIdTabla(const Value: string);
    procedure SetRespuesta(const Value: string);
    { Private declarations }
  public
    function Crear(Proyecto: string): boolean;
    function Editar(Tabla: string): boolean;

    property Accion: string read FAccion write SetAccion;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property IdTabla: string read FIdTabla write SetIdTabla;
    property IdProyecto: string read FIdProyecto write SetIdProyecto;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
  end;

var
  FCrearEditarTabla: TFCrearEditarTabla;

implementation

{$R *.dfm}

function TFCrearEditarTabla.Crear(Proyecto: string): boolean;
begin
  edTabla.Clear;
  edDescripcion.Lines.Clear;

  FAccion := 'Crear';
  FRespuesta := '';
  FCreoEdito := false;
  FIdProyecto := Proyecto;

  ShowModal;
  result := FCreoEdito;
end;

function TFCrearEditarTabla.Editar(Tabla: string): boolean;
begin
  FIdTabla := Tabla;

  Query.Close;
  Query.SQL.Text := 'SELECT * FROM TablasBaseDatos WHERE IdTabla=' + #39 +
    FIdTabla + #39;
  Query.Open;

  edTabla.Text := Query.FieldByName('Nombre').AsString;
  edDescripcion.Text := Query.FieldByName('Descripcion').AsString;

  FAccion := 'Editar';
  FRespuesta := '';
  FCreoEdito := false;

  ShowModal;
  result := FCreoEdito;
end;

procedure TFCrearEditarTabla.sbGuardarClick(Sender: TObject);
begin
  if FAccion = 'Crear' then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO TablasBaseDatos (';
    Query.SQL.Add('IdTabla, ');
    Query.SQL.Add('Nombre, ');
    Query.SQL.Add('Descripcion, ');
    Query.SQL.Add('IdProyecto) VALUES (');
    Query.SQL.Add(':IdTabla, ');
    Query.SQL.Add(':Nombre, ');
    Query.SQL.Add(':Descripcion, ');
    Query.SQL.Add(':IdProyecto)');

    FIdTabla := ModuloDatos.Util.generadID;
    Query.Params.ParamByName('IdTabla').Value := FIdTabla;
    Query.Params.ParamByName('Nombre').Value := edTabla.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      edDescripcion.Lines.Text;
    Query.Params.ParamByName('IdProyecto').AsString := FIdProyecto;
    Query.ExecSQL;

    FCreoEdito := true;
    FRespuesta := 'La tabla se creó correctamente';
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE TablasBaseDatos SET ';
    Query.SQL.Add('Nombre=:Nombre, ');
    Query.SQL.Add('Descripcion=:Descripcion ');
    Query.SQL.Add('WHERE IdTabla=' + #39 + FIdTabla + #39);

    Query.Params.ParamByName('Nombre').Value := edTabla.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      edDescripcion.Lines.Text;
    Query.ExecSQL;

    FCreoEdito := true;
    FRespuesta := 'La tabla se actualizó correctamente';
    Close;
  end;
end;

procedure TFCrearEditarTabla.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarTabla.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarTabla.SetIdProyecto(const Value: string);
begin
  FIdProyecto := Value;
end;

procedure TFCrearEditarTabla.SetIdTabla(const Value: string);
begin
  FIdTabla := Value;
end;

procedure TFCrearEditarTabla.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

end.
