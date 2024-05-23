{Este formulario corresponde a una consola de mensajes en la que el programador
puede determinar el estado de algunas variables}
unit uFConsola;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls;

type
  TConsola = class(TForm)
    pTitulo: TPanel;
    lvConsola: TListView;
    paginaVistaPrevia: TPageControl;
    TabVistaPrevia: TTabSheet;
    Label1: TLabel;
    iconos24: TImageList;
  private
    { Private declarations }
  public
    procedure log(msg: string; procedimiento: string);
  end;

var
  Consola: TConsola;

implementation

{$R *.dfm}
{ TFConsola }

procedure TConsola.log(msg, procedimiento: string);
begin
  with lvConsola.Items.Add.SubItems do
  begin
    Add(IntToStr(lvConsola.Items.Count));
    Add(msg);
    Add(procedimiento);
  end;
end;

end.
