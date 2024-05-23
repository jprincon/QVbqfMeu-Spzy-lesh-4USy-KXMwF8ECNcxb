{Este formulario muestra un indicador de espera, presentando al usuario
una forma visual de que algo se esta procesando en la aplicación}
unit uFIndicador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls;

type
  TFIndicador = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    ActivityIndicator1: TActivityIndicator;
    pContenido: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Actualizar;
  end;

var
  FIndicador: TFIndicador;

implementation

{$R *.dfm}

procedure TFIndicador.Actualizar;
begin
  Application.ProcessMessages;
end;

procedure TFIndicador.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TFIndicador.Timer1Timer(Sender: TObject);
begin
  Application.ProcessMessages;
end;

end.
