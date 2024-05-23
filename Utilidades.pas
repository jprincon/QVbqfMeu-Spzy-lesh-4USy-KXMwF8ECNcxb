{Esta corresponde a una unidad de utilidades, definiendo diferentes funciones
que se necesitan en otros formularios y clases y que se vuelven comunes
para el código general}
unit Utilidades;

interface

uses
  System.SysUtils, Classes, Vcl.Graphics, Winapi.Windows, Forms, math, uTTipos,
  Vcl.StdCtrls, System.WideStrUtils, Vcl.ExtCtrls, IdHashMessageDigest, idHash,
  IdGlobal,
  Vcl.Dialogs;

function NotacionMatriz(nombre: String; i, j: Integer): String;
function sDimension(m, n: Integer): String;
function RealRandom(Scale: Integer): Real;
function colorAleatorio: TColor;
function RealRandomIntervalo(a, b: Integer): Real;
function signo: Integer;
function ColorRGB(r, g, b: Byte): TColorRGB;
function StrToVar(sValue: String; nValue: Integer): String;
function StrToCelda(m, n: Integer): String;
function formatearNombreProyecto(nombre: String): String;
function formatearTexto(nombre: string): string;
function contarPalabras(sTexto: String): Integer;
function StrToCod(value: String): String;
function Val(n: Real): String;
function generarColor: TColor;
function CifrarContra(contra: String; correo: String): String;
function DescifrarContra(contra: String; correo: String): String;
function FormatoCedula(ssDoc: String): String;
function formatearNumeroCelular(ssTel: String): String;
function DateTimeToFileName: String;
function FechaToString(Fecha: TFecha): String;
function NumeroATexto(n: Integer): string;
function EjecutarEsperar(sProgram: string; Visible: Integer): Integer;
function Slim(ss: string): TStringList;
function Capitalizado(ss: string): string;
function esPreposicion(pp: string; pre, con: array of string): Boolean;
function generarCadena(n: Integer): string;
function generarID: string;
function diasMes(mes: word): word;
function longitudTexto(texto: string; n: Integer): string;
function obtenerMes(mm: Integer): string;
function StringsToText(lines: TStrings): string;
function validarExtension(ruta, ext: string): string;
function segundosToHora(segundos: Integer): string;
function validarDirectorio(ruta: string): string;
procedure limpiarImagen(Imagen: TImage);
function seleccionarDirectorio: string;
function numeroToLetras(n: Integer): string;
function archivosDirectorio(directorio, excluir: string; extensiones: string)
  : TStringList;
function obtenerLenguaje(ext: string): string;
function AnsiConvert(linea: string): string;
function FechaToDescripcion(Fecha: TDate): string;
function toMd5(texto: string): string;
function ValToStr(valor: Real): string;
function generarEntero(rango: Integer): Integer;
function valor(n: Real): string;
function PuntoToTex(nombre: string; x, y: Real): string;
function potencia(n: Integer): string;
function fts(n: Real): string;
function Termino(Coeff, Grado: Real; id: Integer): string;
function StringToBool(ss: string): Boolean;
function LatexIfThenElse(respuesta: string): string;
function DevolverDirectorio(ruta: string; cantidad: Integer): string;
function CambiarApellidosNombres(nombre: string): string;

const
  base = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

implementation

function CambiarApellidosNombres(nombre: string): string;
var
  Nombres: TStringList;
begin
  Nombres := TStringList.Create;
  Nombres.Delimiter := ' ';
  Nombres.DelimitedText := nombre;

  if Nombres.Count = 4 then
    nombre := Nombres[2] + ' ' + Nombres[3] + ' ' + Nombres[0] + ' ' +
      Nombres[1];

  if Nombres.Count = 3 then
    nombre := Nombres[2] + ' ' + Nombres[0] + ' ' + Nombres[1];

  result := Utilidades.Capitalizado(nombre);
  Nombres.Free;
end;

function DevolverDirectorio(ruta: string; cantidad: Integer): string;
var
  directorio: string;
  ld, i: Integer;
begin
  directorio := ExtractFileDir(ruta);

  for i := 1 to cantidad do
  begin
    ld := LastDelimiter('\', directorio);
    directorio := Copy(directorio, 1, ld - 1);
  end;

  result := directorio;
end;

function LatexIfThenElse(respuesta: string): string;
begin
  result := '\ifthenelse{\equal{\VerRespuesta}{Si}}{\textbf{Respuesta: } ' +
    respuesta + '}{}';
end;

function StringToBool(ss: string): Boolean;
begin
  result := ss = 'True';
end;

function Termino(Coeff, Grado: Real; id: Integer): string;
begin
  result := '';

  if id = 1 then
  begin
    if Coeff = 1 then
      result := '';
    if Coeff = -1 then
      result := '-';
  end
  else
  begin
    if Coeff > 0 then
    begin
      if Coeff = 1 then
        result := '+'
      else
        result := '+' + FloatToStr(Coeff);
    end
    else if Coeff = -1 then
      result := '-'
    else
      result := FloatToStr(Coeff);
  end;

  if Grado > 1 then
    result := result + 'x^' + FloatToStr(Grado)
  else if Grado = 1 then
    result := result + 'x';

  if Coeff = 0 then
    result := '';

end;

function fts(n: Real): string;
begin
  if n = 0 then
    result := '';
  if n > 0 then
    result := '+' + FloatToStr(n);
  if n < 0 then
    result := FloatToStr(n);
end;

function potencia(n: Integer): string;
begin
  if n = 1 then
    result := ''
  else
    result := '^{' + IntToStr(n) + '}';
end;

function PuntoToTex(nombre: string; x, y: Real): string;
begin
  result := '$\left(' + FloatToStr(x) + ',' + FloatToStr(y) + '\right)$';
end;

function valor(n: Real): string;
begin
  if n = 0 then
  begin
    result := '';
    Exit;
  end;

  if n = 1 then
  begin
    result := '+';
    Exit;
  end;

  if n = -1 then
  begin
    result := '-';
    Exit;
  end;

  if n < 0 then
  begin
    result := FloatToStr(n);
    Exit;
  end;

  if n > 0 then
  begin
    result := '+' + FloatToStr(n);
    Exit;
  end;
end;

function generarEntero(rango: Integer): Integer;
var
  v: Integer;
  n: Integer;
begin
  n := Random(10);
  v := Round(Power(-1, n));

  result := v * (Random(rango) + 1);
end;

function ValToStr(valor: Real): string;
var
  fs: TFormatSettings;
begin
  fs.DecimalSeparator := ',';
  result := FloatToStrF(valor, ffNumber, 12, 2, fs);
end;

function toMd5(texto: string): string;
var
  hashMessageDigest5: TIdHashMessageDigest5;
begin
  hashMessageDigest5 := nil;
  try
    hashMessageDigest5 := TIdHashMessageDigest5.Create;
    result := IdGlobal.IndyLowerCase(hashMessageDigest5.HashStringAsHex(texto));
  finally
    hashMessageDigest5.Free;
  end;
end;

function FechaToDescripcion(Fecha: TDate): string;
var
  yy, mm, dd: word;
begin
  DecodeDate(Fecha, yy, mm, dd);
  result := IntToStr(dd) + ' de ' + obtenerMes(mm) + ' del ' + IntToStr(yy);
end;

function AnsiConvert(linea: string): string;
begin
  result := linea;
  result := StringReplace(result, 'Ã¡', 'a', [rfReplaceAll]);
  result := StringReplace(result, 'Ã©', 'e', [rfReplaceAll]);
  result := StringReplace(result, 'Ã­', 'i', [rfReplaceAll]);
  result := StringReplace(result, 'Ã³', 'o', [rfReplaceAll]);
  result := StringReplace(result, 'Ãº', 'u', [rfReplaceAll]);
  result := StringReplace(result, 'Ã±', 'n', [rfReplaceAll]);
end;

function obtenerLenguaje(ext: string): string;
begin
  if ext = '.html' then
    result := LANG_HTML;

  if ext = '.css' then
    result := LANG_CSS;

  if ext = '.js' then
    result := LANG_JAVASCRIPT;

  if ext = '.ts' then
    result := LANG_TYPESCRIPT;

  if (ext = '.pas') or (ext = '.dpr') then
    result := LANG_PASCAL;

  if ext = '.py' then
    result := LANG_PYTHON;

  if ext = '.sql' then
    result := LANG_SQL;

  if ext = '.json' then
    result := LANG_JSON;
end;

function archivosDirectorio(directorio, excluir: string; extensiones: string)
  : TStringList;
var
  Busqueda: TSearchRec;
  iResultado: Integer;
  sDirectorio: string;
  slExt, slExc, subDirs: TStringList;
begin
  result := TStringList.Create;

  slExt := TStringList.Create;
  slExt.Delimiter := ',';
  slExt.DelimitedText := extensiones;

  slExc := TStringList.Create;
  slExc.Delimiter := ',';
  slExc.DelimitedText := excluir;

  sDirectorio := IncludeTrailingBackslash(directorio);
  iResultado := FindFirst(sDirectorio + '*.*', faAnyFile, Busqueda);

  while iResultado = 0 do
  begin

    if (Busqueda.Attr = faArchive) and (Busqueda.Attr <> faDirectory) then
    begin
      if (slExt.IndexOf(ExtractFileExt(Busqueda.Name)) >= 0) and
        (slExc.IndexOf(Busqueda.Name) < 0) then
      begin
        result.Add(directorio + '\' + Busqueda.Name);
      end;
    end;

    {ShowMessage('Nombre = ' + Busqueda.Name + ' Tipo = ' +
      IntToStr(Busqueda.Attr) + '; Tamaño = ' + IntToStr(Busqueda.Size));}

    if (Busqueda.Attr = 17) and (slExc.IndexOf(Busqueda.Name) < 0) then
    begin
      subDirs := TStringList.Create;
      subDirs := archivosDirectorio(directorio + '\' + Busqueda.Name, excluir,
        extensiones);
      result.AddStrings(subDirs);
    end;

    iResultado := FindNext(Busqueda);
  end;

  System.SysUtils.FindClose(Busqueda);
end;

function numeroToLetras(n: Integer): string;
begin
  case n of
    1:
      result := 'un ';
    2:
      result := 'dos ';
    3:
      result := 'tres ';
    4:
      result := 'cuatro ';
    5:
      result := 'cinco ';
    6:
      result := 'seis ';
    7:
      result := 'siete ';
    8:
      result := 'ocho ';
    9:
      result := 'nueve ';
    10:
      result := 'diez ';
  end;

  result := result + '(' + IntToStr(n) + ')';
end;

function seleccionarDirectorio: string;
begin
  with TFileOpenDialog.Create(nil) do
    try
      Options := [fdoPickFolders];
      if Execute then
        result := filename;
    finally
      Free;
    end;
end;

procedure limpiarImagen(Imagen: TImage);
var
  rect: TRect;
begin
  with Imagen.Picture.Bitmap.Canvas do
  begin
    rect.Left := 0;
    rect.Top := 0;
    rect.Right := Imagen.Width;
    rect.Bottom := Imagen.Height;

    Brush.Color := clwhite;
    Pen.Color := clwhite;

    FillRect(rect);
  end;
end;

function validarDirectorio(ruta: string): string;
begin
  if not DirectoryExists(ruta) then
    CreateDir(ruta);
end;

function segundosToHora(segundos: Integer): string;
var
  hh, mm, ss: Integer;
begin
  hh := segundos div 3600;
  ss := segundos mod 3600;
  mm := ss div 60;
  ss := ss mod 60;

  result := FormatCurr('00', hh) + ':' + FormatCurr('00', mm) + ':' +
    FormatCurr('00', ss);
end;

function validarExtension(ruta, ext: string): string;
begin
  if ExtractFileExt(ruta) = ext then
    result := ruta
  else
    result := ruta + ext;
end;

function StringsToText(lines: TStrings): string;
var
  i: Integer;
begin
  result := '';
  for i := 1 to lines.Count do
  begin
    result := result + lines[i - 1] + #13;
  end;
end;

function obtenerMes(mm: Integer): string;
begin
  case mm of
    1:
      result := 'Enero';
    2:
      result := 'Febrero';
    3:
      result := 'Marzo';
    4:
      result := 'Abril';
    5:
      result := 'Mayo';
    6:
      result := 'Junio';
    7:
      result := 'Julio';
    8:
      result := 'Agosto';
    9:
      result := 'Septiembre';
    10:
      result := 'Octubre';
    11:
      result := 'Noviembre';
    12:
      result := 'Diciembre';
  end;
end;

function longitudTexto(texto: string; n: Integer): string;
begin
  if Length(texto) > n then
    result := Copy(texto, 1, n) + ' ...'
  else
    result := texto;
end;

function diasMes(mes: word): word;
begin
  case mes of
    1:
      result := 31;
    2:
      result := 28;
    3:
      result := 31;
    4:
      result := 30;
    5:
      result := 31;
    6:
      result := 30;
    7:
      result := 31;
    8:
      result := 31;
    9:
      result := 30;
    10:
      result := 31;
    11:
      result := 30;
    12:
      result := 31;
  end;
end;

function generarCadena(n: Integer): string;
var
  i: Integer;
begin
  result := '';
  for i := 1 to n do
    result := result + base[Random(Length(base)) + 1];
end;

function generarID: string;
begin
  result := generarCadena(8) + '-' + generarCadena(4) + '-' + generarCadena(4) +
    '-' + generarCadena(4) + '-' + generarCadena(12);
end;

function esPreposicion(pp: string; pre, con: array of string): Boolean;
var
  i: Integer;
  cont: Integer;
begin
  cont := 0;

  for i := 1 to Length(pre) do
  begin
    if pp = pre[i - 1] then
      inc(cont);
  end;

  for i := 1 to Length(con) do
  begin
    if pp = con[i - 1] then
      inc(cont);
  end;

  result := cont > 0;
end;

function Capitalizado(ss: string): string;
var
  preposiciones: array of string;
  conectores: array of string;
  palabras: TStringList;
  i: Integer;
  pp: string;
begin
  try
    preposiciones := ['a', 'ante', 'bajo', 'con', 'contra', 'de', 'es', 'un',
      'desde', 'en', 'entre', 'hacia', 'hasta', 'durante', 'mediante', 'para',
      'por', 'pro', 'según', 'sin', 'so', 'sobre', 'se', 'tras',
      'versus', 'vía'];

    conectores := ['y', 'o', 'u', 'e', 'el', 'la'];

    palabras := TStringList.Create;
    pp := StringReplace(ss, ',', '_', [rfReplaceAll]);
    palabras.CommaText := StringReplace(AnsiLowerCase(ss), ' ', ',',
      [rfReplaceAll]);

    result := '';

    for i := 1 to palabras.Count do
    begin
      if not esPreposicion(palabras[i - 1], preposiciones, conectores) then
      begin
        if palabras[i - 1] <> '' then
        begin
          pp := AnsiUpperCase(palabras[i - 1][1]) + Copy(palabras[i - 1], 2,
            Length(palabras[i - 1]));
        end;
      end
      else
      begin
        pp := palabras[i - 1];
      end;

      if i = 1 then
      begin
        if palabras[i - 1] <> '' then
        begin
          pp := AnsiUpperCase(palabras[i - 1][1]) + Copy(palabras[i - 1], 2,
            Length(palabras[i - 1]));
        end;
      end;

      result := result + pp + ' ';
    end;

  except
    on E: Exception do
      result := result + '(' + E.Message + ')';
  end;

  result := StringReplace(result, '_', ',', [rfReplaceAll]);

end;

function EjecutarEsperar(sProgram: string; Visible: Integer): Integer;

var
  sApplication: array [0 .. 512] of char;
  currentDirectory: array [0 .. 255] of char;
  workingDirectory: string;
  startInformation: tstartupinfo;
  processInformation: tprocessInformation;
  iResult, iOutCode: dword;
begin
  StrPCopy(sApplication, sProgram);
  GetDir(0, workingDirectory);
  StrPCopy(currentDirectory, workingDirectory);
  FillChar(startInformation, sizeof(startInformation), #0);
  startInformation.cb := sizeof(startInformation);

  startInformation.dwFlags := STARTF_USESHOWWINDOW;
  startInformation.wShowWindow := Visible;
  CreateProcess(nil, sApplication, nil, nil, false, CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil, nil, startInformation, processInformation);

  repeat
    iOutCode := WaitForSingleObject(processInformation.hProcess, 1000);
    Application.ProcessMessages;
  until (iOutCode <> WAIT_TIMEOUT);

  GetExitCodeProcess(processInformation.hProcess, iResult);
  // MessageBeep(0);
  CloseHandle(processInformation.hProcess);
  result := iResult;
end;

function Slim(ss: string): TStringList;
var
  temp: string;
begin
  result := TStringList.Create;
  temp := StringReplace(ss, ' ', ',', [rfReplaceAll]);
  result.CommaText := temp;
end;

function NumeroATexto(n: Integer): string;
begin
  if n = 1 then
    result := 'un';

  if n = 2 then
    result := 'dos';

  if n = 3 then
    result := 'tres';

  if n = 4 then
    result := 'cuatro';

  if n = 5 then
    result := 'cinco';

  if n = 6 then
    result := 'seis';

  if n = 7 then
    result := 'siete';

  if n = 8 then
    result := 'ocho';

  if n = 9 then
    result := 'nueve';

  if n = 10 then
    result := 'diez';

  if n = 11 then
    result := 'once';

  if n = 12 then
    result := 'doce';

  if n = 13 then
    result := 'trece';

  if n = 14 then
    result := 'catorce';

  if n = 15 then
    result := 'quince';

  if n = 16 then
    result := 'dieciseis';

  if n = 17 then
    result := 'diecisiete';

  if n = 18 then
    result := 'dieciocho';

  if n = 19 then
    result := 'diecinueve';

  if n = 20 then
    result := 'veinte';

  if n = 21 then
    result := 'ventiuno';

  if n = 22 then
    result := 'ventidos';

  if n = 23 then
    result := 'ventitres';

  if n = 24 then
    result := 'venticuatro';

  if n = 25 then
    result := 'venticinco';
end;

function NotacionMatriz(nombre: String; i, j: Integer): String;
begin
  result := nombre + '[' + IntToStr(i) + ',' + IntToStr(j) + '] = ';
end;

function sDimension(m, n: Integer): String;
begin
  result := IntToStr(m) + 'x' + IntToStr(n);
end;

function RealRandom(Scale: Integer): Real;
begin
  result := Random(1000000 * Scale) / 1000000;
end;

function colorAleatorio: TColor;

var
  r, g, b: Byte;
begin
  r := Random(256);
  g := Random(256);
  b := Random(256);

  result := RGB(r, g, b);
end;

function RealRandomIntervalo(a, b: Integer): Real;
begin
  result := RandomRange(1000000 * a, 1000000 * b) / 1000000;
end;

function signo: Integer;
begin
  result := Round(Power(-1, Random(10)));
end;

function ColorRGB(r, g, b: Byte): TColorRGB;
begin
  result.r := r;
  result.g := g;
  result.b := b;
end;

function StrToVar(sValue: String; nValue: Integer): String;
begin
  result := sValue + IntToStr(nValue);
end;

function formatearNombreProyecto(nombre: String): String;
var
  sResult: String;
begin
  sResult := LowerCase(nombre);

  sResult := StringReplace(sResult, ' ', '_', [rfReplaceAll]);

  sResult := StringReplace(sResult, 'á', 'a', [rfReplaceAll]);
  sResult := StringReplace(sResult, 'é', 'e', [rfReplaceAll]);
  sResult := StringReplace(sResult, 'í', 'i', [rfReplaceAll]);
  sResult := StringReplace(sResult, 'ó', 'o', [rfReplaceAll]);
  sResult := StringReplace(sResult, 'ú', 'u', [rfReplaceAll]);

  sResult := StringReplace(sResult, 'ñ', 'n', [rfReplaceAll]);

  result := sResult;
end;

function formatearTexto(nombre: string): string;
begin
  result := formatearNombreProyecto(nombre);
end;

function contarPalabras(sTexto: String): Integer;
var
  i, cant: Integer;
begin
  result := 0;
  cant := Length(sTexto);
  for i := 1 to cant do
    if sTexto = ' ' then
      result := result + 1;
end;

function StrToCod(value: String): String;
begin
  result := LowerCase(value);

  result := StringReplace(result, 'á', 'a', [rfReplaceAll]);
  result := StringReplace(result, 'é', 'e', [rfReplaceAll]);
  result := StringReplace(result, 'í', 'i', [rfReplaceAll]);
  result := StringReplace(result, 'ó', 'o', [rfReplaceAll]);
  result := StringReplace(result, 'ú', 'u', [rfReplaceAll]);

  result := StringReplace(result, 'Á', 'A', [rfReplaceAll]);
  result := StringReplace(result, 'É', 'E', [rfReplaceAll]);
  result := StringReplace(result, 'Í', 'I', [rfReplaceAll]);
  result := StringReplace(result, 'Ó', 'O', [rfReplaceAll]);
  result := StringReplace(result, 'Ú', 'U', [rfReplaceAll]);

  result := StringReplace(result, ' ', '_', [rfReplaceAll]);
  result := UpperCase(result);
end;

function Val(n: Real): String;
begin
  if n < 0 then
    result := FloatToStr(n);
  if n > 0 then
    result := '+' + FloatToStr(n);

  if n = 1 then
    result := '+';
  if n = -1 then
    result := '-';

end;

function generarColor: TColor;
var
  r, g, b: Byte;
begin
  r := Random(256);
  g := Random(256);
  b := Random(256);

  result := RGB(r, g, b);
end;

function CifrarContra(contra: String; correo: String): String;

var
  lc: Integer;
  i, cod: Integer;
  ssCorreo: String;
begin
  result := '';
  lc := Length(contra);
  ssCorreo := UpperCase(correo);

  for i := 1 to lc do
  begin
    cod := ord(contra[i]) + ord(ssCorreo[i]) - 13;
    result := result + chr(cod);
  end;

  { Se hace la siguiente cuenta
    Cod de 0: $48
    Cod de Z: $90
    Máxima Cod 138
    Código Normal hasta el $125
    Hay que restar 13

    C = ct+cr-13 }
end;

function DescifrarContra(contra: String; correo: String): String;
var
  lc: Integer;
  i: Integer;
  ssCorreo: String;
begin
  result := '';
  lc := Length(contra);
  ssCorreo := UpperCase(correo);

  for i := 1 to lc do
  begin
    result := result + chr(ord(contra[i]) - ord(ssCorreo[i]) + 13);
  end;
end;

function FormatoCedula(ssDoc: String): String;
begin
  result := StringReplace(ssDoc, '.', '', [rfReplaceAll, rfIgnoreCase]);
  result := StringReplace(ssDoc, ',', '', [rfReplaceAll, rfIgnoreCase]);
  result := StringReplace(ssDoc, 'o', '0', [rfReplaceAll, rfIgnoreCase]);
end;

function formatearNumeroCelular(ssTel: String): String;
begin
  result := Copy(ssTel, 1, 3) + ' ' + Copy(ssTel, 4, 3) + ' ' +
    Copy(ssTel, 7, 4);
end;

function DateTimeToFileName: String;

var
  sDate, sTime, sResult: String;
begin
  sDate := DateToStr(now);
  sTime := TimeToStr(now);

  sResult := sDate + '_' + sTime;
  sResult := StringReplace(sResult, '/', '_', [rfReplaceAll]);
  sResult := StringReplace(sResult, ':', '_', [rfReplaceAll]);
  sResult := StringReplace(sResult, ' ', '_', [rfReplaceAll]);
  sResult := StringReplace(sResult, '.', '_', [rfReplaceAll]);
  result := Copy(sResult, 1, Length(sResult) - 1);
end;

function StrToCelda(m, n: Integer): String;
begin
  result := 'C[' + IntToStr(m) + IntToStr(n) + ']';
end;

function FechaToString(Fecha: TFecha): String;
begin
  result := IntToStr(Fecha.y) + '-' + IntToStr(Fecha.m) + '-' +
    IntToStr(Fecha.D);
end;

end.
