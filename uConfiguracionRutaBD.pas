{Este formulario permite configurar la ruta de la base de datos. Guarda la ruta
en un archivo de configuración *.ini para que la aplicación pueda iniciarse
con la ruta de la base de datos adecuada}
unit uConfiguracionRutaBD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFConfiguracionBD = class(TForm)
    pTitulo: TPanel;
    GroupBox1: TGroupBox;
    edRutaBD: TEdit;
    sbAbrirRutaBD: TSpeedButton;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    dlgBD: TOpenDialog;
    procedure sbGuardarClick(Sender: TObject);
    procedure sbAbrirRutaBDClick(Sender: TObject);
  private
    FRutaBD: string;
  public
    function rutaBD(ruta: string): string;
  end;

var
  FConfiguracionBD: TFConfiguracionBD;

implementation

{$R *.dfm}

function TFConfiguracionBD.rutaBD(ruta: string): string;
begin
  edRutaBD.Text := ruta;
  ShowModal;

  result := FRutaBD;
end;

procedure TFConfiguracionBD.sbAbrirRutaBDClick(Sender: TObject);
begin
  if dlgBD.Execute then
    edRutaBD.Text := dlgBD.FileName;
end;

procedure TFConfiguracionBD.sbGuardarClick(Sender: TObject);
begin
  FRutaBD := edRutaBD.Text;
  close;
end;

end.
