unit uFCrearEditarModulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModuloDatos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, SynEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Utilidades, Constantes,
  SynEditHighlighter, SynHighlighterTeX;

type
  TFCrearEditarModulo = class(TForm)
    pTitulo: TPanel;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    GroupBox1: TGroupBox;
    edModulo: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edDescripcion: TSynEdit;
    Query: TFDQuery;
    sTEX: TSynTeXSyn;
    procedure sbGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FRespuesta: string;
    FAccion: string;
    FIdModulo: string;
    FCreoEdito: boolean;
    FIdProyecto: string;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdModulo(const Value: string);
    procedure SetRespuesta(const Value: string);
    procedure SetIdProyecto(const Value: string);
    { Private declarations }
  public
    function crear(IdProyecto: string): boolean;
    function editar(IdModulo: string): boolean;

    property Accion: string read FAccion write SetAccion;
    property IdModulo: string read FIdModulo write SetIdModulo;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
    property IdProyecto: string read FIdProyecto write SetIdProyecto;
  end;

var
  FCrearEditarModulo: TFCrearEditarModulo;

implementation

{$R *.dfm}

function TFCrearEditarModulo.crear(IdProyecto: string): boolean;
begin
  FAccion := ACCION_CREAR;
  FCreoEdito := false;
  FIdProyecto := IdProyecto;
  ShowModal;
  result := FCreoEdito;
end;

function TFCrearEditarModulo.editar(IdModulo: string): boolean;
begin
  FAccion := ACCION_EDITAR;
  FIdModulo := IdModulo;
  FCreoEdito := false;
  ShowModal;
  result := FCreoEdito;
end;

procedure TFCrearEditarModulo.FormShow(Sender: TObject);
begin
  edModulo.Clear;
  edDescripcion.Lines.Clear;

  if FAccion = ACCION_EDITAR then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM ModulosCodigo WHERE IdModulo=' + #39 +
      FIdModulo + #39;
    Query.Open;

    edModulo.Text := Query.FieldByName('Modulo').AsString;
    edDescripcion.Text := Query.FieldByName('Descripcion').AsString;
  end;
end;

procedure TFCrearEditarModulo.sbGuardarClick(Sender: TObject);
begin
  if FAccion = ACCION_CREAR then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO ModulosCodigo (';
    Query.SQL.Add('IdModulo, ');
    Query.SQL.Add('Modulo, ');
    Query.SQL.Add('Descripcion, ');
    Query.SQL.Add('IdProyecto) VALUES (');
    Query.SQL.Add(':IdModulo, ');
    Query.SQL.Add(':Modulo, ');
    Query.SQL.Add(':Descripcion, ');
    Query.SQL.Add(':IdProyecto)');

    Query.Params.ParamByName('IdModulo').Value := Utilidades.generarID;
    Query.Params.ParamByName('Modulo').Value := edModulo.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('IdProyecto').Value := IdProyecto;

    Query.ExecSQL;
    FRespuesta := 'El módulo se creó correctamente';
    FCreoEdito := true;
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE ModulosCodigo SET ';
    Query.SQL.Add('Modulo=:Modulo, ');
    Query.SQL.Add('Descripcion=:Descripcion ');
    Query.SQL.Add('WHERE IdModulo=' + #39 + IdModulo + #39);

    Query.Params.ParamByName('Modulo').Value := edModulo.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);

    Query.ExecSQL;
    FRespuesta := 'El módulo se actualizó correctamente';
    FCreoEdito := true;
    Close;
  end;
end;

procedure TFCrearEditarModulo.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarModulo.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarModulo.SetIdModulo(const Value: string);
begin
  FIdModulo := Value;
end;

procedure TFCrearEditarModulo.SetIdProyecto(const Value: string);
begin
  FIdProyecto := Value;
end;

procedure TFCrearEditarModulo.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

end.
