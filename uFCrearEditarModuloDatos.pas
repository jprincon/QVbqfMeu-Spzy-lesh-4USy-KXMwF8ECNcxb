unit uFCrearEditarModuloDatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uModuloDatos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, SynEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TuFCrearEditarCodigoFuente = class(TForm)
    pTitulo: TPanel;
    GroupBox1: TGroupBox;
    sbCodigoFuente: TSpeedButton;
    edCodigo: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edDescripcion: TSynEdit;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    Query: TFDQuery;
    dlgArchivo: TOpenDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFCrearEditarCodigoFuente: TuFCrearEditarCodigoFuente;

implementation

{$R *.dfm}

end.
