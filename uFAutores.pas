{Este formulario muestra una lista de los autores. Cada autor es creado
mediante una clase y exportada a este formulario}
unit uFAutores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, contnrs, uTAutorSoftware,
  uModuloDatos, uTLectorRecursos;

type
  TFAutores = class(TForm)
    pTitulo: TPanel;
    pAutores: TScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    listaAutores: TObjectList;
    LR: TLectorRecursos;
  public
    procedure limpiarAutores;
    procedure agregarAutor(nombre, correo, biografia, foto: string);
  end;

var
  FAutores: TFAutores;

implementation

{$R *.dfm}
{ TFAutores }

procedure TFAutores.agregarAutor(nombre, correo, biografia, foto: string);
var
  autor: TAutorSoftware;
  ruta: string;
begin
  autor := TAutorSoftware.create(pAutores);

  ruta := ModuloDatos.ConfigApp.RutaTrabajo + '\' + foto + '.png';
  LR.guardarRecursoDirectorio(foto, ruta);

  autor.nombre := nombre;
  autor.correo := correo;
  autor.biografia := biografia;
  autor.foto := ruta;

  listaAutores.Add(autor);
end;

procedure TFAutores.FormCreate(Sender: TObject);
begin
  listaAutores := TObjectList.create;
end;

procedure TFAutores.FormShow(Sender: TObject);
begin
  if listaAutores.Count = 1 then
    Height := 410;

  if listaAutores.Count >= 2 then
    Height := 730;
end;

procedure TFAutores.limpiarAutores;
var
  i: Integer;
begin
  { for i := 1 to listaAutores.Count do
    begin
    (listaAutores.Items[i - 1] as TAutorSoftware).Free;
    end; }
  listaAutores.Clear;
end;

end.

