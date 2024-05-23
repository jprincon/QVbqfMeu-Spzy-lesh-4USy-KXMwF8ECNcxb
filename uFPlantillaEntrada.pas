{Este corresponde a una plantilla para crear aquellos formularios en los que
se requiere que el usuario ingrese o manipule algun tipo de información}
unit uFPlantillaEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  SynEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFPlantillaEdicion = class(TForm)
    pTitulo: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Panel2: TPanel;
    sbGuardar: TSpeedButton;
    GroupBox2: TGroupBox;
    seResumen: TSynEdit;
    Query: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlantillaEdicion: TFPlantillaEdicion;

implementation

{$R *.dfm}

end.
