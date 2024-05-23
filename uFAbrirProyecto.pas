{Este corresponde al formulario que muestra la lista de proyectos, de los
cuales el usuario puede seleccionar y abrir uno mediante la acción de
doble clic}
unit uFAbrirProyecto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModuloDatos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TProyectoSeleccionado = record
    Titulo: string;
    IdProyecto: string;
    Seleccionado: boolean;
    Resumen: string;
    Guardado: boolean;
  end;

  TFAbrirProyecto = class(TForm)
    pTitulo: TPanel;
    lvProyectos: TListView;
    iconos96: TImageList;
    Query: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    procedure seleccionarProyectoLista(Sender: TObject);
  private
    FProyectoSeleccionado: TProyectoSeleccionado;
  public
    procedure leerProyectos;

    function seleccionarProyecto: TProyectoSeleccionado;

    property ProyectoSeleccionado: TProyectoSeleccionado
      read FProyectoSeleccionado;
  end;

var
  FAbrirProyecto: TFAbrirProyecto;

implementation

{$R *.dfm}
{ TForm1 }

procedure TFAbrirProyecto.leerProyectos;
var
  i: Integer;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM ProyectosProgramacion WHERE IdUsuario=' + #39
    + ModuloDatos.IdUsuario + #39;
  Query.Open;
  Query.First;

  lvProyectos.Items.Clear;

  for i := 1 to Query.RecordCount do
  begin
    with lvProyectos.Items.Add do
    begin
      ImageIndex := 0;
      Caption := Query.FieldByName('Titulo').AsString;
      SubItems.Add(Query.FieldByName('IdProyecto').AsString);
    end;

    Query.Next;
  end;
end;

function TFAbrirProyecto.seleccionarProyecto: TProyectoSeleccionado;
begin
  FProyectoSeleccionado.Seleccionado := false;
  leerProyectos;

  ShowModal;

  result := FProyectoSeleccionado;
end;

procedure TFAbrirProyecto.seleccionarProyectoLista(Sender: TObject);
begin
  if lvProyectos.Selected <> nil then
  begin
    FProyectoSeleccionado.Seleccionado := true;
    FProyectoSeleccionado.Titulo := lvProyectos.Selected.Caption;
    FProyectoSeleccionado.IdProyecto := lvProyectos.Selected.SubItems[0];

    Close;
  end;
end;

end.
