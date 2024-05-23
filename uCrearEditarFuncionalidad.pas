{Este formulario permite crear o editar funcionalidades del proyecto. Se deben
ingresar el nombre de la funcionalidad, el tipo y la descripción}
unit uCrearEditarFuncionalidad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModuloDatos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, SynEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, Constantes, Utilidades, SynEditHighlighter,
  SynHighlighterTeX;

type
  TFCrearEditarFuncionalidad = class(TForm)
    pTitulo: TPanel;
    GroupBox1: TGroupBox;
    edFuncionalidad: TEdit;
    GroupBox2: TGroupBox;
    edDescripcion: TSynEdit;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    Query: TFDQuery;
    SynTeXSyn1: TSynTeXSyn;
    GroupBox3: TGroupBox;
    edTipo: TComboBox;
    QTipo: TFDQuery;
    procedure sbGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edTipoChange(Sender: TObject);
    procedure edDescripcionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FRespuesta: string;
    FIdFuncionalidad: string;
    FAccion: string;
    FIdProyecto: string;
    FCreoEdito: boolean;
    IDsTipos: TStringList;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdFuncionalidad(const Value: string);
    procedure SetIdProyecto(const Value: string);
    procedure SetRespuesta(const Value: string);
    { Private declarations }
  public
    procedure leerTiposFuncionalidades;

    function creo(IdProyecto: string): boolean;
    function edito(IdFuncionalidad: string): boolean;

    property IdProyecto: string read FIdProyecto write SetIdProyecto;
    property IdFuncionalidad: string read FIdFuncionalidad
      write SetIdFuncionalidad;
    property Accion: string read FAccion write SetAccion;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
  end;

var
  FCrearEditarFuncionalidad: TFCrearEditarFuncionalidad;

implementation

{$R *.dfm}

function TFCrearEditarFuncionalidad.creo(IdProyecto: string): boolean;
begin
  FAccion := ACCION_CREAR;
  FRespuesta := '';
  FCreoEdito := false;
  FIdProyecto := IdProyecto;

  edFuncionalidad.Clear;
  edDescripcion.Lines.Clear;

  ShowModal;

  result := FCreoEdito;
end;

procedure TFCrearEditarFuncionalidad.edDescripcionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    sbGuardarClick(self);
  end;
end;

function TFCrearEditarFuncionalidad.edito(IdFuncionalidad: string): boolean;
begin
  FAccion := ACCION_EDITAR;
  FRespuesta := '';
  FCreoEdito := false;
  FIdFuncionalidad := IdFuncionalidad;

  ShowModal;

  result := FCreoEdito;
end;

procedure TFCrearEditarFuncionalidad.edTipoChange(Sender: TObject);
begin
  edDescripcion.SetFocus;
end;

procedure TFCrearEditarFuncionalidad.FormCreate(Sender: TObject);
begin
  IDsTipos := TStringList.Create;
end;

procedure TFCrearEditarFuncionalidad.FormShow(Sender: TObject);
var
  pp: integer;
  func: string;
begin
  edFuncionalidad.Clear;
  edDescripcion.Lines.Clear;

  leerTiposFuncionalidades;

  if FAccion = ACCION_EDITAR then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM Funcionalidades WHERE IdFuncionalidad=' +
      #39 + FIdFuncionalidad + #39;
    Query.Open;

    edFuncionalidad.Text := Query.FieldByName('Funcionalidad').AsString;
    edDescripcion.Text := Query.FieldByName('Descripcion').AsString;

    QTipo.Close;
    QTipo.SQL.Text := 'SELECT * FROM TiposFuncionalidades WHERE ' + 'IdTipo=' +
      #39 + Query.FieldByName('IdTipo').AsString + #39;
    QTipo.Open;

    edTipo.ItemIndex := edTipo.Items.IndexOf(QTipo.FieldByName('Tipo')
      .AsString);
  end;
end;

procedure TFCrearEditarFuncionalidad.leerTiposFuncionalidades;
var
  i: integer;
begin
  IDsTipos.Clear;
  edTipo.Items.Clear;

  Query.Close;
  Query.SQL.Text := 'SELECT * FROM TiposFuncionalidades ORDER BY Valor desc';
  Query.Open;
  Query.First;

  for i := 1 to Query.RecordCount do
  begin
    edTipo.Items.Add(Query.FieldByName('Tipo').AsString);
    IDsTipos.Add(Query.FieldByName('IdTipo').AsString);
    Query.Next;
  end;
end;

procedure TFCrearEditarFuncionalidad.sbGuardarClick(Sender: TObject);
begin
  if FAccion = ACCION_CREAR then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO Funcionalidades (';
    Query.SQL.Add('IdFuncionalidad,');
    Query.SQL.Add('Funcionalidad,');
    Query.SQL.Add('Descripcion,');
    Query.SQL.Add('IdTipo,');
    Query.SQL.Add('IdProyecto) VALUES (');
    Query.SQL.Add(':IdFuncionalidad,');
    Query.SQL.Add(':Funcionalidad,');
    Query.SQL.Add(':Descripcion,');
    Query.SQL.Add(':IdTipo,');
    Query.SQL.Add(':IdProyecto)');

    Query.Params.ParamByName('IdFuncionalidad').Value := Utilidades.generarID;
    Query.Params.ParamByName('Funcionalidad').Value := edFuncionalidad.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('IdProyecto').Value := FIdProyecto;
    Query.Params.ParamByName('IdTipo').Value := IDsTipos[edTipo.ItemIndex];

    Query.ExecSQL;
    FRespuesta := 'La funcionalidad se creó correctamente';
    FCreoEdito := true;
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE Funcionalidades SET ';
    Query.SQL.Add('Funcionalidad=:Funcionalidad,');
    Query.SQL.Add('IdTipo=:IdTipo,');
    Query.SQL.Add('Descripcion=:Descripcion ');
    Query.SQL.Add('WHERE IdFuncionalidad=' + #39 + FIdFuncionalidad + #39);

    Query.Params.ParamByName('Funcionalidad').Value := edFuncionalidad.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('IdTipo').Value := IDsTipos[edTipo.ItemIndex];

    Query.ExecSQL;
    FRespuesta := 'La funcionalidad se actualizó correctamente';
    FCreoEdito := true;
    Close;
  end;
end;

procedure TFCrearEditarFuncionalidad.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarFuncionalidad.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarFuncionalidad.SetIdFuncionalidad(const Value: string);
begin
  FIdFuncionalidad := Value;
end;

procedure TFCrearEditarFuncionalidad.SetIdProyecto(const Value: string);
begin
  FIdProyecto := Value;
end;

procedure TFCrearEditarFuncionalidad.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

end.
