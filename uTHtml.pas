{Esta unidad contiene la definición de la clase THtml que permite
crear códigos html desde el lenguaje Pascal.}
unit uTHtml;

interface

uses Classes, System.SysUtils;

type
  THtml = class(Tobject)
  private
    Html: TStringList;
    Recursos: TStringList;
    Rutas: TStringList;
    Encoding: TEncoding;
  public
    constructor create;
    destructor destroy; override;

    procedure h1(texto, estilo, clases: string);
    procedure h2(texto, estilo, clases: string);
    procedure h3(texto, estilo, clases: string);
    procedure h4(texto, estilo, clases: string);
    procedure h5(texto, estilo, clases: string);
    procedure h6(texto, estilo, clases: string);
    procedure beginDiv(estilo, clases: string; propiedad: string);
    procedure endDiv;
    procedure img(src: string; estilo, clases: string);
    procedure insertarParrafo(texto, estilo, clases: string);
    procedure negrita(texto: string);
    procedure hr;
    procedure beginOL(estilo, clases: string);
    procedure endOL;
    procedure beginUL(estilo, clases: string);
    procedure endUL;
    procedure beginLI(estilo, clases: string);
    procedure endLI;
    procedure exportar(ruta: string);
    procedure agregarRecurso(src, path: string);
    procedure Limpiar(Titulo: string);
    procedure beginTabla(estilo, clases: string);
    procedure endTabla;
    procedure beginTHead(estilo, clases: string);
    procedure endTHead;
    procedure beginTBody;
    procedure endTBody;
    procedure beginTr;
    procedure endTr;
    procedure beginTd;
    procedure endTd;
    procedure beginTh;
    procedure endTh;
    procedure th(texto: string);
    procedure td(texto: string);
  published
  end;

implementation

{ THtml }

procedure THtml.agregarRecurso(src, path: string);
begin
  Recursos.Add(src);
  Rutas.Add(path);
end;

procedure THtml.beginDiv(estilo, clases, propiedad: string);
begin
  Html.Add('<div style="' + estilo + '" ' + propiedad + ' class="' +
    clases + '">');
end;

procedure THtml.beginLI(estilo, clases: string);
begin
  Html.Add('<li style="' + estilo + '" class="' + clases + '">');
end;

procedure THtml.beginOL(estilo, clases: string);
begin
  Html.Add('<ol style="' + estilo + '" class="' + clases + '">');
end;

procedure THtml.beginTabla(estilo, clases: string);
begin
  Html.Add('<Table style="' + estilo + '" class="' + clases + '">');
end;

procedure THtml.beginTBody;
begin
  Html.Add('<Tbody>');
end;

procedure THtml.beginTd;
begin
  Html.Add('</td>');
end;

procedure THtml.beginTh;
begin
  Html.Add('<th>');
end;

procedure THtml.beginTHead(estilo, clases: string);
begin
  Html.Add('<Thead style="' + estilo + '" class="' + clases + '">');
end;

procedure THtml.beginTr;
begin
  Html.Add('<tr>');
end;

procedure THtml.insertarParrafo(texto, estilo, clases: string);
begin
  Html.Add('<p style="' + estilo + '" class="' + clases + '">');
  Html.Add(texto);
  Html.Add('</p>');
end;

procedure THtml.Limpiar(Titulo: string);
begin
  Html.Clear;

  Html.Add('<!doctype html>');
  Html.Add('<html lang="es">');
  Html.Add('<head>');
  Html.Add('<meta charset="utf-8">');
  Html.Add('<meta name="viewport" content="width=device-width, initial-scale=1">');
  Html.Add('<title>' + Titulo + '</title>');
  Html.Add('<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/di' +
    'st/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6C' +
    'oIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" cross' +
    'origin="anonymous">');
  Html.Add('</head>');
  Html.Add('<body class="container">');
end;

procedure THtml.beginUL(estilo, clases: string);
begin
  Html.Add('<ul style="' + estilo + '" class="' + clases + '">');
end;

constructor THtml.create;
begin
  Html := TStringList.create;
  Recursos := TStringList.create;
  Rutas := TStringList.create;
end;

destructor THtml.destroy;
begin
  Html.Free;
  Recursos.Free;
  Rutas.Free;
  inherited destroy;
end;

procedure THtml.endDiv;
begin
  Html.Add('</div>');
end;

procedure THtml.endLI;
begin
  Html.Add('</li>');
end;

procedure THtml.endOL;
begin
  Html.Add('</ol>');
end;

procedure THtml.endTabla;
begin
  Html.Add('</Table>');
end;

procedure THtml.endTBody;
begin
  Html.Add('</Tbody>');
end;

procedure THtml.endTd;
begin
  Html.Add('</td>');
end;

procedure THtml.endTh;
begin
  Html.Add('</th>');
end;

procedure THtml.endTHead;
begin
  Html.Add('</thead>');
end;

procedure THtml.endTr;
begin
  Html.Add('</tr>');
end;

procedure THtml.endUL;
begin
  Html.Add('</ul>');
end;

procedure THtml.exportar(ruta: string);
begin

  Html.Add('<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/d' +
    'ist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNe' +
    'T87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="ano' +
    'nymous"></script>');
  Html.Add('</body>');
  Html.Add('</html>');

  Encoding := TUTF8Encoding.create;
  Html.SaveToFile(ruta, Encoding);
end;

procedure THtml.h1(texto, estilo, clases: string);
begin
  Html.Add('<h1 style="' + estilo + '" class="' + clases + '">' + texto
    + '</h1>');
end;

procedure THtml.h2(texto, estilo, clases: string);
begin
  Html.Add('<h2 style="' + estilo + '" class="' + clases + '">' + texto
    + '</h2>');
end;

procedure THtml.h3(texto, estilo, clases: string);
begin
  Html.Add('<h3 style="' + estilo + '" class="' + clases + '">' + texto
    + '</h3>');
end;

procedure THtml.h4(texto, estilo, clases: string);
begin
  Html.Add('<h4 style="' + estilo + '" class="' + clases + '">' + texto
    + '</h4>');
end;

procedure THtml.h5(texto, estilo, clases: string);
begin
  Html.Add('<h5 style="' + estilo + '" class="' + clases + '">' + texto
    + '</h5>');
end;

procedure THtml.h6(texto, estilo, clases: string);
begin
  Html.Add('<h6 style="' + estilo + '" class="' + clases + '">' + texto
    + '</h6>');
end;

procedure THtml.hr;
begin
  Html.Add('<hr>');
end;

procedure THtml.img(src, estilo, clases: string);
begin
  Html.Add('<img style="' + estilo + '" src="' + src + '" class="' +
    clases + '">');
end;

procedure THtml.negrita(texto: string);
begin
  Html.Add('<b>' + texto + '</b>');
end;

procedure THtml.td(texto: string);
begin
  Html.Add('<td>' + texto + '</td>');
end;

procedure THtml.th(texto: string);
begin
  Html.Add('<td>' + texto + '</td>');
end;

end.
