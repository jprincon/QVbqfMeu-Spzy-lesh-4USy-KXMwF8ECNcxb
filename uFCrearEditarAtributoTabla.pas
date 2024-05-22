unit uFCrearEditarAtributoTabla;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModuloDatos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFCrearEditarAtributoTabla = class(TForm)
    pTitulo: TPanel;
    gb1: TGroupBox;
    edNombre: TEdit;
    pBotones: TPanel;
    sbGuardar: TSpeedButton;
    cbPrimaryKey: TCheckBox;
    cbNotNull: TCheckBox;
    gb3: TGroupBox;
    edTableReference: TEdit;
    gb4: TGroupBox;
    edAtributeReference: TEdit;
    gb2: TGroupBox;
    Query: TFDQuery;
    cbTipo: TComboBox;
    edTipo: TEdit;
    cbTablas: TComboBox;
    cbAtributos: TComboBox;
    procedure sbGuardarClick(Sender: TObject);
    procedure cbPrimaryKeyClick(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTablasChange(Sender: TObject);
    procedure cbAtributosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FRespuesta: string;
    FAccion: string;
    FIdTabla: string;
    FCreoEdito: boolean;
    FIdAtributo: string;
    FIdProyecto: string;
    IDsTablas, IDsAtributos: TStringList;
    procedure SetAccion(const Value: string);
    procedure SetCreoEdito(const Value: boolean);
    procedure SetIdAtributo(const Value: string);
    procedure SetIdTabla(const Value: string);
    procedure SetRespuesta(const Value: string);
    procedure SetIdProyecto(const Value: string);
    { Private declarations }
  public
    function Crear(Tabla: string): boolean;
    function Editar(Atributo: string): boolean;

    property Accion: string read FAccion write SetAccion;
    property Respuesta: string read FRespuesta write SetRespuesta;
    property IdAtributo: string read FIdAtributo write SetIdAtributo;
    property IdTabla: string read FIdTabla write SetIdTabla;
    property CreoEdito: boolean read FCreoEdito write SetCreoEdito;
    property IdProyecto: string read FIdProyecto write SetIdProyecto;
  end;

var
  FCrearEditarAtributoTabla: TFCrearEditarAtributoTabla;

implementation

{$R *.dfm}

procedure TFCrearEditarAtributoTabla.cbAtributosChange(Sender: TObject);
begin
  if cbAtributos.ItemIndex >= 0 then
  begin
    edAtributeReference.Text := cbAtributos.Items[cbAtributos.ItemIndex];
  end;
end;

procedure TFCrearEditarAtributoTabla.cbPrimaryKeyClick(Sender: TObject);
begin
  if cbPrimaryKey.Checked then
  begin
    edTableReference.Enabled := false;
    edAtributeReference.Enabled := false;
  end;
end;

procedure TFCrearEditarAtributoTabla.cbTablasChange(Sender: TObject);
var
  i: integer;
begin
  if cbTablas.ItemIndex >= 0 then
  begin
    edTableReference.Text := cbTablas.Items[cbTablas.ItemIndex];

    Query.Close;
    Query.SQL.Text := 'SELECT * FROM AtributosTabla WHERE IdTabla=' + #39 +
      IDsTablas[cbTablas.ItemIndex] + #39 + ' ORDER BY Nombre';
    Query.Open;
    Query.First;

    cbAtributos.Items.Clear;
    IDsAtributos.Clear;
    for i := 1 to Query.RecordCount do
    begin
      cbAtributos.Items.Add(Query.FieldByName('Nombre').AsString);
      IDsAtributos.Add(Query.FieldByName('IdAtributo').AsString);

      Query.Next;
    end;
  end;
end;

procedure TFCrearEditarAtributoTabla.cbTipoChange(Sender: TObject);
begin
  edTipo.Text := cbTipo.Items[cbTipo.ItemIndex];
end;

function TFCrearEditarAtributoTabla.Crear(Tabla: string): boolean;
begin
  edNombre.Clear;
  edTableReference.Clear;
  edAtributeReference.Clear;
  edTipo.Clear;

  cbTipo.ItemIndex := -1;

  cbTablas.ItemIndex := -1;
  cbAtributos.Items.Clear;

  cbPrimaryKey.Checked := false;
  cbNotNull.Checked := false;

  edTableReference.Enabled := false;
  edAtributeReference.Enabled := false;

  FAccion := 'Crear';
  FRespuesta := '';
  FCreoEdito := false;
  FIdTabla := Tabla;

  ShowModal;
  result := FCreoEdito;
end;

function TFCrearEditarAtributoTabla.Editar(Atributo: string): boolean;
begin
  FIdAtributo := Atributo;

  Query.Close;
  Query.SQL.Text := 'SELECT * FROM AtributosTabla WHERE IdAtributo=' + #39 +
    FIdAtributo + #39;
  Query.Open;

  edNombre.Text := Query.FieldByName('Nombre').AsString;
  edTipo.Text := Query.FieldByName('Tipo').AsString;
  edTableReference.Text := Query.FieldByName('TableReference').AsString;
  edAtributeReference.Text := Query.FieldByName('AtributeReference').AsString;
  cbPrimaryKey.Checked := Query.FieldByName('PrimaryKey').AsString <> '';
  cbNotNull.Checked := Query.FieldByName('NotNull').AsString <> '';

  edTableReference.Enabled := false;
  edAtributeReference.Enabled := false;

  FAccion := 'Editar';
  FRespuesta := '';
  FCreoEdito := false;

  ShowModal;
  result := FCreoEdito;
end;

procedure TFCrearEditarAtributoTabla.edNombreKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    sbGuardarClick(self);
end;

procedure TFCrearEditarAtributoTabla.FormCreate(Sender: TObject);
begin
  IDsTablas := TStringList.Create;
  IDsAtributos := TStringList.Create;
end;

procedure TFCrearEditarAtributoTabla.FormShow(Sender: TObject);
begin
  edNombre.SetFocus;
end;

procedure TFCrearEditarAtributoTabla.sbGuardarClick(Sender: TObject);
begin
  if FAccion = 'Crear' then
  begin
    Query.Close;
    Query.SQL.Text := 'INSERT INTO AtributosTabla (';
    Query.SQL.Add('IdAtributo, ');
    Query.SQL.Add('Nombre, ');
    Query.SQL.Add('Tipo, ');
    Query.SQL.Add('PrimaryKey, ');
    Query.SQL.Add('NotNull, ');
    Query.SQL.Add('TableReference, ');
    Query.SQL.Add('AtributeReference, ');
    Query.SQL.Add('IdTabla) VALUES (');
    Query.SQL.Add(':IdAtributo, ');
    Query.SQL.Add(':Nombre, ');
    Query.SQL.Add(':Tipo, ');
    Query.SQL.Add(':PrimaryKey, ');
    Query.SQL.Add(':NotNull, ');
    Query.SQL.Add(':TableReference, ');
    Query.SQL.Add(':AtributeReference, ');
    Query.SQL.Add(':IdTabla)');

    FIdAtributo := ModuloDatos.Util.generadID;
    Query.Params.ParamByName('IdAtributo').Value := FIdAtributo;
    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Tipo').Value := edTipo.Text;

    if cbPrimaryKey.Checked then
      Query.Params.ParamByName('PrimaryKey').Value := 'Primary Key'
    else
      Query.Params.ParamByName('PrimaryKey').Value := '';

    if cbNotNull.Checked then
      Query.Params.ParamByName('NotNull').Value := 'Not Null'
    else
      Query.Params.ParamByName('NotNull').Value := '';

    Query.Params.ParamByName('TableReference').Value := edTableReference.Text;
    Query.Params.ParamByName('AtributeReference').Value :=
      edAtributeReference.Text;
    Query.Params.ParamByName('IdTabla').Value := FIdTabla;

    Query.ExecSQL;
    FCreoEdito := true;
    FRespuesta := 'El atributo se creó correctamente';
    Close;
  end
  else
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE AtributosTabla SET ';
    Query.SQL.Add('Nombre=:Nombre, ');
    Query.SQL.Add('Tipo=:Tipo, ');
    Query.SQL.Add('PrimaryKey=:PrimaryKey, ');
    Query.SQL.Add('NotNull=:NotNull, ');
    Query.SQL.Add('TableReference=:TableReference, ');
    Query.SQL.Add('AtributeReference=:AtributeReference ');
    Query.SQL.Add('WHERE IdAtributo=' + #39 + FIdAtributo + #39);

    Query.Params.ParamByName('Nombre').Value := edNombre.Text;
    Query.Params.ParamByName('Tipo').Value := edTipo.Text;

    if cbPrimaryKey.Checked then
      Query.Params.ParamByName('PrimaryKey').Value := 'Primary Key'
    else
      Query.Params.ParamByName('PrimaryKey').Value := '';

    if cbNotNull.Checked then
      Query.Params.ParamByName('NotNull').Value := 'Not Null'
    else
      Query.Params.ParamByName('NotNull').Value := '';

    Query.Params.ParamByName('TableReference').Value := edTableReference.Text;
    Query.Params.ParamByName('AtributeReference').Value :=
      edAtributeReference.Text;

    Query.ExecSQL;
    FCreoEdito := true;
    FRespuesta := 'El atributo se actualizó correctamente';
    Close;
  end;
end;

procedure TFCrearEditarAtributoTabla.SetAccion(const Value: string);
begin
  FAccion := Value;
end;

procedure TFCrearEditarAtributoTabla.SetCreoEdito(const Value: boolean);
begin
  FCreoEdito := Value;
end;

procedure TFCrearEditarAtributoTabla.SetIdAtributo(const Value: string);
begin
  FIdAtributo := Value;
end;

procedure TFCrearEditarAtributoTabla.SetIdProyecto(const Value: string);
var
  i: integer;
begin
  FIdProyecto := Value;

  Query.Close;
  Query.SQL.Text := 'SELECT * FROM TablasBaseDatos WHERE IdProyecto=' + #39 +
    FIdProyecto + #39 + ' ORDER BY Nombre';
  Query.Open;
  Query.First;

  cbTablas.Items.Clear;
  IDsTablas.Clear;
  for i := 1 to Query.RecordCount do
  begin
    cbTablas.Items.Add(Query.FieldByName('Nombre').AsString);
    IDsTablas.Add(Query.FieldByName('IdTabla').AsString);

    Query.Next;
  end;
end;

procedure TFCrearEditarAtributoTabla.SetIdTabla(const Value: string);
begin
  FIdTabla := Value;
end;

procedure TFCrearEditarAtributoTabla.SetRespuesta(const Value: string);
begin
  FRespuesta := Value;
end;

end.
