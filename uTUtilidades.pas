{La Unidad de Utilidades ofrece una serie de procedimientos y funciones que
agilizan diversos procesos en otras unidades. Por ejemplo, permite generar
cadenas de caracteres para identificadores aleatorios o la creación de
colores aleatorios. }
unit uTUtilidades;

interface

uses Classes, WinApi.WIndows, System.SysUtils, Vcl.Graphics;

Type

  { Type = Class
    Name = TUtilidades
    Description = Esta clase contiene procedimientos y funciones que facilitan la programación en unidades, formularios y módulos de datos. }
  TUtilidades = class(TObject)
  private
    meses: TStringList;
  public
    constructor create;
    destructor destroy; override;

    function GetAppVersion: string;
    function generarCadena(n: integer): string;
    function generadID: string;

    function FechaCarta: string;
    function TransformasMinutos(tiempo: integer): string;

    function generarColorClaro: TColor;
  published
  end;

implementation

{ TUtilidades }

{ Type = Constructor
  Name = Create
  Description = Crea las variables y objetos en la memoria para el uso de la clase }
constructor TUtilidades.create;
begin
  meses := TStringList.create;
  meses.Add('Enero');
  meses.Add('Febrero');
  meses.Add('Marzo');
  meses.Add('Abril');
  meses.Add('Mayo');
  meses.Add('Junio');
  meses.Add('Julio');
  meses.Add('Agosto');
  meses.Add('Septiembre');
  meses.Add('Octubre');
  meses.Add('Noviembre');
  meses.Add('Diciembre');
end;

{ Type = Desctructor
  Name = Destroy
  Description = Libera los objetos creados en la instancia de la clase }
destructor TUtilidades.destroy;
begin

  inherited;
end;

function TUtilidades.FechaCarta: string;
var
  yy, mm, dd: word;
begin
  DecodeDate(now, yy, mm, dd);
  result := IntToStr(dd) + ' de ' + meses[mm - 1] + ' de ' + IntToStr(yy);
end;

{ Type = Function
  Name = generarID
  Return = string
  Description = Genera un Identificador Único Universal (UUID) Aleatorio de 32 caracterés con el siguiente formato: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx }
function TUtilidades.generadID: string;
begin
  result := generarCadena(12) + '-' + generarCadena(4) + '-' + generarCadena(4)
    + '-' + generarCadena(4) + '-' + generarCadena(8);
end;

{ Type = Function
  Name = generarCadena
  Return = string
  Param1 = n: integer - cantidad de caracteres a generar
  Description = La función es la base para la función generarID, puesto que esta genera cadenas aleatorias de n elementos lo que posibilita crear el formato xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx }
function TUtilidades.generarCadena(n: integer): string;
var
  base: string;
  i: integer;
begin
  base := 'abcdefghijklmnopqrstuvwxyz0123456789';
  result := '';
  for i := 1 to n do
  begin
    result := result + base[Random(Length(base)) + 1];
  end;
end;

{ Type = Function
  Name = generarColorClaro
  Return = TColor
  Description = Genera los componentes aleatorios R,G,B y luego usa la función RGB(r,g,b) para generar el color TColor. Esta función genera colores R,G,B a partir del valor 180 para que sean colores claros. }
function TUtilidades.generarColorClaro: TColor;
var
  r, g, b: word;
begin
  (* generar los componentes r,g,b aleatorios con valor superior a 180 *)
  r := Random(75) + 180;
  g := Random(75) + 180;
  b := Random(75) + 180;
  result := RGB(r, g, b);
end;

{ Type = Function
  Name = GetAppVersion
  Return = string
  Description = Consulta a través de un puntero el número de la versión de la aplicación. }
function TUtilidades.GetAppVersion: string;
var
  Size, Size2: DWORD;
  Pt: Pointer;
  Buffer: TBytes;
  FileInfo: PVSFixedFileInfo;
begin
  Size := GetFileVersionInfoSize(PChar(ParamStr(0)), Size2);
  if Size > 0 then
  begin
    SetLength(Buffer, Size);
    if GetFileVersionInfo(PChar(ParamStr(0)), 0, Size, Buffer) then
    begin
      if VerQueryValue(Buffer, '\', Pt, Size2) then
      begin
        FileInfo := Pt;
        result := Format('%d.%d.%d.%d', [HiWord(FileInfo.dwFileVersionMS),
          LoWord(FileInfo.dwFileVersionMS), HiWord(FileInfo.dwFileVersionLS),
          LoWord(FileInfo.dwFileVersionLS)]);
      end;
    end;
  end;
end;

function TUtilidades.TransformasMinutos(tiempo: integer): string;
var
  hh, mm: integer;
begin
  hh := tiempo div 60;
  mm := tiempo mod 60;

  result := FormatCurr('00', hh) + ' : ' + FormatCurr('00', mm);
end;

end.
