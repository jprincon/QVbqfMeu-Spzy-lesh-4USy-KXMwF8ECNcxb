unit uTEditorLatex;

interface

uses classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.CategoryButtons, Graphics,
  Vcl.ComCtrls, Forms, SynEdit, SynHighlighterTeX;

type

  TEditorLatex = class(TObject)
  private
    pContenido: TPanel;
    categoriaBotones: TCategoryButtons;
    paginaOpciones, paginaEditor: TPageControl;
    pagHer, pagEdit: TTabSheet;
    Editor: TSynEdit;
    sTex: TSynTeXSyn;

    // Enumeraciones
    bcEnumeraciones: TButtonCategory;
    biEnumerate, biItemize, biItem: TButtonItem;

    // Estilo Texto
    bcEstiloTexto: TButtonCategory;
    biBold, biItalic, biUnderline: TButtonItem;
    FText: string;
    FLines: TStrings;

    procedure crearEnumeraciones;
    procedure crearEstiloTexto;

    procedure insertarEnumerate(Sender: TObject);
    procedure insertarItemize(Sender: TObject);
    procedure insertarItem(Sender: TObject);
    procedure insertarBold(Sender: TObject);
    procedure insertarItalic(Sender: TObject);
    procedure insertarUnderline(Sender: TObject);
    procedure SetText(const Value: string);
    procedure SetLines(const Value: TStrings);
    function getLines: TStrings;
  public
    constructor create(padre: TWinControl);
    destructor destroy; override;

    procedure limpiarEditor;
    procedure escribir(texto: string);
  published
    property Text: string read FText write SetText;
    property Lines: TStrings read getLines write SetLines;
  end;

implementation

{ TEditorLatex }

procedure TEditorLatex.insertarBold(Sender: TObject);
begin
  Editor.SelText := '\textbf{' + Editor.SelText + '}';
  Editor.SetFocus;
end;

procedure TEditorLatex.insertarEnumerate(Sender: TObject);
begin
  Editor.SelText := '\begin{enumerate}' + #13 + '   \item' + #13 +
    '\end{enumerate}' + #13;
  Editor.SetFocus;
end;

procedure TEditorLatex.insertarItalic(Sender: TObject);
begin

end;

procedure TEditorLatex.insertarItem(Sender: TObject);
begin
  Editor.SelText := '\item';
  Editor.SetFocus;
end;

procedure TEditorLatex.insertarItemize(Sender: TObject);
begin
  Editor.SelText := '\begin{itemize}' + #13 + '   \item' + #13 +
    '\end{itemize}' + #13;
  Editor.SetFocus;
end;

procedure TEditorLatex.insertarUnderline(Sender: TObject);
begin

end;

procedure TEditorLatex.limpiarEditor;
begin
  Editor.Lines.Clear;
end;

procedure TEditorLatex.SetLines(const Value: TStrings);
begin
  FLines := Value;
end;

procedure TEditorLatex.SetText(const Value: string);
begin
  FText := Value;
  Editor.Text := Value;
end;

procedure TEditorLatex.crearEnumeraciones;
begin
  bcEnumeraciones := categoriaBotones.Categories.Add;
  with bcEnumeraciones do
  begin
    caption := 'Enumeraciones';
    Collapsed := true;
  end;

  biEnumerate := bcEnumeraciones.Items.Add;
  with biEnumerate do
  begin
    caption := 'Enumerate';
    OnClick := insertarEnumerate;
  end;

  biItemize := bcEnumeraciones.Items.Add;
  with biItemize do
  begin
    caption := 'Itemize';
    OnClick := insertarItemize;
  end;

  biItem := bcEnumeraciones.Items.Add;
  with biItem do
  begin
    caption := 'Item';
    OnClick := insertarItem;
  end;
end;

procedure TEditorLatex.crearEstiloTexto;
begin
  bcEstiloTexto := categoriaBotones.Categories.Add;
  with bcEstiloTexto do
  begin
    caption := 'Estílo Texto';
    Collapsed := true;
  end;

  biBold := bcEstiloTexto.Items.Add;
  with biBold do
  begin
    caption := 'Bold';
    OnClick := insertarBold;
  end;

  biItalic := bcEstiloTexto.Items.Add;
  with biItalic do
  begin
    caption := 'Italic';
    OnClick := insertarItalic;
  end;

  biUnderline := bcEstiloTexto.Items.Add;
  with biUnderline do
  begin
    caption := 'Underline';
    OnClick := insertarUnderline;
  end;
end;

constructor TEditorLatex.create(padre: TWinControl);
begin
  pContenido := TPanel.create(nil);
  with pContenido do
  begin
    parent := padre;
    Align := alClient;
    BevelOuter := bvNone;
  end;

  paginaOpciones := TPageControl.create(nil);
  with paginaOpciones do
  begin
    parent := padre;
    Align := alLeft;
    Width := 250;
    TabPosition := tpLeft;
  end;

  pagHer := TTabSheet.create(nil);
  with pagHer do
  begin
    caption := 'Herramientas';
    PageControl := paginaOpciones;
  end;

  categoriaBotones := TCategoryButtons.create(nil);
  with categoriaBotones do
  begin
    parent := pagHer;
    Align := alClient;
    Color := clWhite;
    BorderStyle := bsNone;
    ButtonOptions := [boFullSize, boGradientFill, boShowCaptions,
      boVerticalCategoryCaptions, boUsePlusMinus]
  end;

  crearEnumeraciones;
  crearEstiloTexto;

  paginaEditor := TPageControl.create(nil);
  with paginaEditor do
  begin
    parent := padre;
    Align := alClient;
  end;

  pagEdit := TTabSheet.create(nil);
  with pagEdit do
  begin
    caption := 'Editor';
    PageControl := paginaEditor;
  end;

  Editor := TSynEdit.create(nil);
  with Editor do
  begin
    parent := pagEdit;
    Align := alClient;
    Gutter.ShowLineNumbers := true;
    Gutter.Font.Style := [fsbold];
    Gutter.Font.Size := 16;
    Gutter.Font.Color := $00FF0080;
    Font.Size := 16;
    WordWrap := true;
    WantTabs := true;
  end;

  sTex := TSynTeXSyn.create(nil);
  Editor.Highlighter := sTex;
end;

destructor TEditorLatex.destroy;
begin

  inherited destroy;
end;

procedure TEditorLatex.escribir(texto: string);
begin
  Editor.Text := texto;
end;

function TEditorLatex.getLines: TStrings;
begin
  result := Editor.Lines;
end;

end.
