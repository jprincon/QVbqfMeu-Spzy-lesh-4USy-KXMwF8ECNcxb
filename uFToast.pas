{Este formulario muestra un mensaje temporal al usuario. Se muestra de forma
transparente y desaparece luego de tres segundos.}
unit uFToast;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFToast = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    lbMsg: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    tiempo: integer;
  public
    procedure Mostrar(msg: string);
  end;

var
  FToast: TFToast;

implementation

{$R *.dfm}
{ TFToast }

procedure TFToast.Mostrar(msg: string);
begin
  tiempo := 0;
  lbMsg.Caption := msg;
  Show;
end;

procedure TFToast.Timer1Timer(Sender: TObject);
begin
  if tiempo < 3 then
  begin
    Inc(tiempo);
    if tiempo >= 3 then
      close;
  end;
end;

end.
