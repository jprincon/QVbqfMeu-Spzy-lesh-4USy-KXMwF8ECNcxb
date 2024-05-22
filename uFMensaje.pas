unit uFMensaje;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.WinXPanels;

type

  TTipoMensaje = (tmInfo, tmError, tmWarning, tmQuestion);

  TFMensaje = class(TForm)
    Contenido: TCardPanel;
    cardInfo: TCard;
    cardError: TCard;
    cardWarning: TCard;
    cardQuestion: TCard;
    lbInfo: TLabel;
    imgInfo: TImage;
    pTituloInfo: TPanel;
    pBotonesInfo: TPanel;
    sbInfo: TSpeedButton;
    imgError: TImage;
    lbError: TLabel;
    pBotonesError: TPanel;
    sbError: TSpeedButton;
    pTituloError: TPanel;
    lbQuestion: TLabel;
    pTituloQuestion: TPanel;
    pBotonesQuestion: TPanel;
    sbQuestionAceptar: TSpeedButton;
    imgQuestion: TImage;
    lbWarning: TLabel;
    pTituloWarning: TPanel;
    pBotonesWarning: TPanel;
    sbWarning: TSpeedButton;
    imgWarning: TImage;
    sbQuestionCancelar: TSpeedButton;
    procedure sbWarningClick(Sender: TObject);
    procedure sbErrorClick(Sender: TObject);
    procedure sbQuestionAceptarClick(Sender: TObject);
    procedure sbInfoClick(Sender: TObject);
    procedure sbQuestionCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FAcepta: boolean;
    FTitulo: string;
    procedure SetTitulo(const Value: string);
  public
    procedure info(msg: string);
    procedure warning(msg: string);
    procedure error(msg: string);

    function mensaje(msg: string; tipo: TTipoMensaje): boolean;
    function confirmacion(msg: string): boolean;

    property Titulo: string read FTitulo write SetTitulo;
  end;

var
  FMensaje: TFMensaje;

implementation

{$R *.dfm}

function TFMensaje.confirmacion(msg: string): boolean;
begin
  result := mensaje(msg, tmQuestion);
end;

procedure TFMensaje.error(msg: string);
begin
  mensaje(msg, tmError);
end;

procedure TFMensaje.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = $0D then
  begin
    sbQuestionAceptarClick(Self);
  end;
end;

procedure TFMensaje.info(msg: string);
begin
  mensaje(msg, tmInfo);
end;

function TFMensaje.mensaje(msg: string; tipo: TTipoMensaje): boolean;
begin

  case tipo of
    tmInfo:
      begin
        lbInfo.Caption := msg;
        Contenido.ActiveCard := cardInfo;
      end;
    tmError:
      begin
        lbError.Caption := msg;
        Contenido.ActiveCard := cardError;
      end;
    tmWarning:
      begin
        lbWarning.Caption := msg;
        Contenido.ActiveCard := cardWarning;
      end;
    tmQuestion:
      begin
        lbQuestion.Caption := msg;
        Contenido.ActiveCard := cardQuestion;
      end;
  end;

  FAcepta := false;

  ShowModal;

  result := FAcepta;
end;

procedure TFMensaje.sbErrorClick(Sender: TObject);
begin
  close;
end;

procedure TFMensaje.sbInfoClick(Sender: TObject);
begin
  close;
end;

procedure TFMensaje.sbQuestionAceptarClick(Sender: TObject);
begin
  FAcepta := true;
  close;
end;

procedure TFMensaje.sbQuestionCancelarClick(Sender: TObject);
begin
  FAcepta := false;
  close;
end;

procedure TFMensaje.sbWarningClick(Sender: TObject);
begin
  close;
end;

procedure TFMensaje.SetTitulo(const Value: string);
begin
  FTitulo := Value;
  pTituloInfo.Caption := Value;
end;

procedure TFMensaje.warning(msg: string);
begin
  mensaje(msg, tmWarning);
end;

end.
