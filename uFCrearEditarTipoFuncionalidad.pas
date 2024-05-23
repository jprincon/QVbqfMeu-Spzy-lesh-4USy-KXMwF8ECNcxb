{Este formulario permite crear los tipos de funcionalidad para la plataforma
completa. Se debe ingresar el nombre de la funcionalidad, el valor o precio
por desarrollarla y una descripción de la funcionalidad}
unit uFCrearEditarTipoFuncionalidad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModuloDatos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, SynEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, Constantes, Utilidades;

type
  TFCrearEditarTipoFuncionalidad = class(TForm)
    pTitulo: TPanel;
    GroupBox1: TGroupBox;
    edTipo: TEdit;
    GroupBox2: TGroupBox;
    edDescripcion: TSynEdit;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    GroupBox3: TGroupBox;
    edValor: TEdit;
    Query: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure sbGuardarClick(Sender: TObject);
  private
    FRespuesta: string;
    FAccion: string;
    FIdTipo: string;
    FCreoEdito: boolean;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdTipo(const Value: string);
    procedure SetRespuesta(const Value: string);
    { Private declarations }
  public
    function creo: boolean;
    function edito(IdTipo: string): boolean;

    property IdTipo: string read FIdTipo write SetIdTipo;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property Accion: string read FAccion write SetAccion;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
  end;

var
  FCrearEditarTipoFuncionalidad: TFCrearEditarTipoFuncionalidad;

implementation

{$R *.dfm}

function TFCrearEditarTipoFuncionalidad.creo: boolean;
begin
  FRespuesta := '';
  FAccion := ACCION_CREAR;
  FCreoEdito := false;

  ShowModal;

  result := FCreoEdito;
end;

function TFCrearEditarTipoFuncionalidad.edito(IdTipo: string): boolean;
begin
  FRespuesta := '';
  FAccion := ACCION_EDITAR;
  FCreoEdito := false;
  FIdTipo := IdTipo;

  ShowModal;

  result := FCreoEdito;
end;

procedure TFCrearEditarTipoFuncionalidad.FormShow(Sender: TObject);
begin
  edTipo.Clear;
  edDescripcion.Lines.Clear;
  edValor.Text := '0'; // 38000

  if FAccion = ACCION_EDITAR then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM TiposFuncionalidades WHERE IdTipo=' + #39 +
      FIdTipo + #39;
    Query.Open;

    edTipo.Text := Query.FieldByName('Tipo').AsString;
    edDescripcion.Text := Query.FieldByName('Descripcion').AsString;
    edValor.Text := Query.FieldByName('Valor').AsString;
  end;
end;

procedure TFCrearEditarTipoFuncionalidad.sbGuardarClick(Sender: TObject);
begin
  if FAccion = ACCION_CREAR then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO TiposFuncionalidades (';
    Query.SQL.Add('IdTipo, ');
    Query.SQL.Add('Tipo, ');
    Query.SQL.Add('Descripcion, ');
    Query.SQL.Add('Valor) VALUES (');
    Query.SQL.Add(':IdTipo, ');
    Query.SQL.Add(':Tipo, ');
    Query.SQL.Add(':Descripcion, ');
    Query.SQL.Add(':Valor)');

    Query.Params.ParamByName('IdTipo').Value := Utilidades.generarID;
    Query.Params.ParamByName('Tipo').Value := edTipo.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('Valor').Value := StrToInt(edValor.Text);

    Query.ExecSQL;
    FRespuesta := 'El tipo de funcionalidad se creó correctamente';
    FCreoEdito := true;
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE TiposFuncionalidades SET';
    Query.SQL.Add('Tipo=:Tipo, ');
    Query.SQL.Add('Descripcion=:Descripcion, ');
    Query.SQL.Add('Valor=:Valor ');
    Query.SQL.Add('WHERE IdTipo=' + #39 + FIdTipo + #39);

    Query.Params.ParamByName('Tipo').Value := edTipo.Text;
    Query.Params.ParamByName('Descripcion').AsWideMemo :=
      Utilidades.StringsToText(edDescripcion.Lines);
    Query.Params.ParamByName('Valor').Value := StrToInt(edValor.Text);

    Query.ExecSQL;
    FRespuesta := 'El tipo de funcionalidad se actializó correctamente';
    FCreoEdito := true;
    Close;
  end;
end;

procedure TFCrearEditarTipoFuncionalidad.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarTipoFuncionalidad.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarTipoFuncionalidad.SetIdTipo(const Value: string);
begin
  FIdTipo := Value;
end;

procedure TFCrearEditarTipoFuncionalidad.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

end.
