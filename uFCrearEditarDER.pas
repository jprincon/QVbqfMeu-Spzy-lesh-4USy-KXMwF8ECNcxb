unit uFCrearEditarDER;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SynEditHighlighter,
  SynHighlighterSQL, SynEdit, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  uModuloDatos, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFCrearEditarDER = class(TForm)
    pTitulo: TPanel;
    paginaTabla: TPageControl;
    TabTabla: TTabSheet;
    GroupBox1: TGroupBox;
    edNombre: TEdit;
    lvAtributos: TListView;
    pDatos: TPanel;
    Panel2: TPanel;
    edAtributo: TEdit;
    Panel3: TPanel;
    edDefinicion: TComboBox;
    sbCrear: TSpeedButton;
    paginaVistaCodigo: TPageControl;
    TabCodigo: TTabSheet;
    seCodigo: TSynEdit;
    SynSQLSyn1: TSynSQLSyn;
    GroupBox2: TGroupBox;
    edTipoBD: TComboBox;
    pContent: TPanel;
    pOpciones: TPanel;
    edPK: TCheckBox;
    edFK: TCheckBox;
    edTablaFK: TEdit;
    Panel4: TPanel;
    edAtributoFK: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    sbGuardar: TSpeedButton;
    pVista: TPanel;
    Query: TFDQuery;
    procedure edTipoBDChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edFKClick(Sender: TObject);
    procedure edPKClick(Sender: TObject);
    procedure edAtributoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTablaFKKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAtributoFKKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDefinicionChange(Sender: TObject);
    procedure sbCrearClick(Sender: TObject);
    procedure edNombreKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure ActualizarCodigo;
    procedure ActualizarTabla;
  end;

var
  FCrearEditarDER: TFCrearEditarDER;

implementation

{$R *.dfm}

procedure TFCrearEditarDER.ActualizarCodigo;
begin
  pVista.Caption := edAtributo.Text + ' ' + edDefinicion.Items
    [edDefinicion.ItemIndex];

  if edPK.Checked then
    pVista.Caption := pVista.Caption + ' Primary Key Not Null,';

  if edFK.Checked then
    pVista.Caption := pVista.Caption + ' References ' + edTablaFK.Text + '(' +
      edAtributoFK.Text + '),';
end;

procedure TFCrearEditarDER.ActualizarTabla;
var
  i: Integer;
begin
  seCodigo.Lines.Clear;

  seCodigo.Lines.Add('create table if not exists ' + edNombre.Text + '(');

  for i := 1 to lvAtributos.Items.Count do
  begin
    seCodigo.Lines.Add('    ' + lvAtributos.Items[i - 1].SubItems[1] + ' ' +
      lvAtributos.Items[i - 1].SubItems[2]);
  end;

  seCodigo.Lines.Add(');');
end;

procedure TFCrearEditarDER.edAtributoFKKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ActualizarCodigo;
end;

procedure TFCrearEditarDER.edAtributoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ActualizarCodigo;
end;

procedure TFCrearEditarDER.edDefinicionChange(Sender: TObject);
begin
  ActualizarCodigo;
end;

procedure TFCrearEditarDER.edFKClick(Sender: TObject);
begin
  edAtributoFK.Enabled := edFK.Checked;
  edTablaFK.Enabled := edFK.Checked;

  if edFK.Checked then
  begin
    if edPK.Checked then
    begin
      edPK.Checked := false;
    end;
  end;

  ActualizarCodigo
end;

procedure TFCrearEditarDER.edNombreKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ActualizarTabla;
end;

procedure TFCrearEditarDER.edPKClick(Sender: TObject);
begin
  if edPK.Checked then
  begin
    if edFK.Checked then
    begin
      edFK.Checked := false;
      edTablaFK.Enabled := false;
      edAtributoFK.Enabled := false;
    end;
  end;

  ActualizarCodigo;
end;

procedure TFCrearEditarDER.edTablaFKKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ActualizarCodigo;
end;

procedure TFCrearEditarDER.edTipoBDChange(Sender: TObject);
begin
  if edTipoBD.Items[edTipoBD.ItemIndex] = 'Microsoft Access' then
  begin
    edDefinicion.Items.Clear;
    edDefinicion.Items.Add('String(255)');
    edDefinicion.Items.Add('Text');
    edDefinicion.Items.Add('Number');
    edDefinicion.Items.Add('Date');
  end;

  if edTipoBD.Items[edTipoBD.ItemIndex] = 'PostgreSQL' then
  begin
    edDefinicion.Items.Clear;
    edDefinicion.Items.Add('Varchar(255)');
    edDefinicion.Items.Add('Text');
    edDefinicion.Items.Add('Integer');
    edDefinicion.Items.Add('Date');
    edDefinicion.Items.Add('Boolean');
  end;

end;

procedure TFCrearEditarDER.FormShow(Sender: TObject);
begin
  edAtributo.Clear;
  edPK.Checked := false;
  edFK.Checked := false;
  edTablaFK.Clear;
  edTablaFK.Enabled := false;
  edAtributoFK.Clear;
  edAtributoFK.Enabled := false;
  edNombre.Clear;
  seCodigo.Lines.Clear;

  edDefinicion.Items.Clear;
  edDefinicion.Items.Add('String(255)');
  edDefinicion.Items.Add('Text');
  edDefinicion.Items.Add('Number');
  edDefinicion.Items.Add('Date');

  edTipoBD.ItemIndex := 0;
end;

procedure TFCrearEditarDER.sbCrearClick(Sender: TObject);
begin
  with lvAtributos.Items.Add.SubItems do
  begin
    if edPK.Checked then
      Add('PK')
    else if edFK.Checked then
      Add('FK')
    else
      Add('');

    Add(edAtributo.Text);

    if edPK.Checked then
      Add(edDefinicion.Items[edDefinicion.ItemIndex] + ' Primary Key Not Null');

    if edFK.Checked then
      Add(edDefinicion.Items[edDefinicion.ItemIndex] + ' References ' +
        edTablaFK.Text + '(' + edAtributoFK.Text + '),');
  end;

  edAtributo.Clear;
  edFK.Checked := false;
  edPK.Checked := false;
  edTablaFK.Clear;
  edAtributoFK.Clear;

  ActualizarTabla;
end;

end.
