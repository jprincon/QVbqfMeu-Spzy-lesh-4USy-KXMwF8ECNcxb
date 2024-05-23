{Este formulario permite crear o editar un proyecto. Se pide el nombre del
proyecto y el resumen}
unit uFCrearEditarProyecto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  SynEditHighlighter, SynHighlighterTeX, SynEdit, uModuloDatos,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Constantes, Utilidades;

type
  TFCrearEditarProyecto = class(TForm)
    pTitulo: TPanel;
    GroupBox1: TGroupBox;
    edTitulo: TEdit;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    GroupBox2: TGroupBox;
    seDescripcion: TSynEdit;
    SynTeXSyn1: TSynTeXSyn;
    Query: TFDQuery;
    procedure sbGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FRespuesta: string;
    FAccion: string;
    FIdProyecto: string;
    FCreoEdito: boolean;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdProyecto(const Value: string);
    procedure SetRespuesta(const Value: string);
    { Private declarations }
  public
    function crearEditar(accion, idproyecto: string): boolean;

    property accion: string read FAccion write SetAccion;
    property idproyecto: string read FIdProyecto write SetIdProyecto;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
  end;

var
  FCrearEditarProyecto: TFCrearEditarProyecto;

implementation

{$R *.dfm}
{ TFCrearEditarProyecto }

function TFCrearEditarProyecto.crearEditar(accion, idproyecto: string): boolean;
begin
  FAccion := accion;
  FIdProyecto := idproyecto;
  FCreoEdito := false;

  ShowModal;

  result := FCreoEdito;
end;

procedure TFCrearEditarProyecto.FormShow(Sender: TObject);
begin
  edTitulo.Clear;
  seDescripcion.Lines.Clear;

  if FAccion = ACCION_EDITAR then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM ProyectosProgramacion WHERE IdProyecto=' +
      #39 + FIdProyecto + #39;
    Query.Open;

    edTitulo.Text := Query.FieldByName('Titulo').AsString;
    seDescripcion.Text := Query.FieldByName('Resumen').AsString;
  end;
end;

procedure TFCrearEditarProyecto.sbGuardarClick(Sender: TObject);
begin
  if FAccion = ACCION_CREAR then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO ProyectosProgramacion (';
    Query.SQL.Add('IdProyecto, ');
    Query.SQL.Add('Titulo, ');
    Query.SQL.Add('Resumen, ');
    Query.SQL.Add('IdUsuario) VALUES (');
    Query.SQL.Add(':IdProyecto, ');
    Query.SQL.Add(':Titulo, ');
    Query.SQL.Add(':Resumen, ');
    Query.SQL.Add(':IdUsuario)');

    FIdProyecto := Utilidades.generarID;
    Query.Params.ParamByName('IdProyecto').Value := FIdProyecto;
    Query.Params.ParamByName('Titulo').Value := edTitulo.Text;
    Query.Params.ParamByName('Resumen').AsWideMemo :=
      Utilidades.StringsToText(seDescripcion.Lines);
    Query.Params.ParamByName('IdUsuario').Value := ModuloDatos.IdUsuario;

    Query.ExecSQL;
    FRespuesta := 'El proyecto se creó correctamente';
    FCreoEdito := true;
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE ProyectosProgramacion SET ';
    Query.SQL.Add('Titulo=:Titulo, ');
    Query.SQL.Add('Resumen=:Resumen ');
    Query.SQL.Add('WHERE IdProyecto=' + #39 + idproyecto + #39);

    Query.Params.ParamByName('Titulo').Value := edTitulo.Text;
    Query.Params.ParamByName('Resumen').AsWideMemo :=
      Utilidades.StringsToText(seDescripcion.Lines);

    Query.ExecSQL;
    FRespuesta := 'El proyecto se actualizó correctamente';
    FCreoEdito := true;
    Close;
  end;
end;

procedure TFCrearEditarProyecto.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarProyecto.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarProyecto.SetIdProyecto(const Value: string);
begin
  FIdProyecto := Value;
end;

procedure TFCrearEditarProyecto.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

end.
