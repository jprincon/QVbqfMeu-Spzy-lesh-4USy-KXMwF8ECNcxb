unit uTLectorRecursos;

interface

uses Classes, Winapi.Windows;

type

  TLectorRecursos = class(TObject)
  private
  public
    constructor create;
    destructor destroy; override;

    function obtenerRecurso(nombre: string): TResourceStream;
    function recursoToStream(nombre: string): TStream;
    procedure guardarRecursoDirectorio(nombreRecurso, rutaGuardar: string);
  published
  end;

implementation

{ TLectorRecursos }

constructor TLectorRecursos.create;
begin

end;

destructor TLectorRecursos.destroy;
begin

  inherited destroy;
end;

procedure TLectorRecursos.guardarRecursoDirectorio(nombreRecurso,
  rutaGuardar: string);
var
  Recursos: TResourceStream;
begin
  Recursos := TResourceStream.create(HInstance, nombreRecurso, RT_RCDATA);
  Recursos.SaveToFile(rutaGuardar);
end;

function TLectorRecursos.obtenerRecurso(nombre: string): TResourceStream;
var
  Recursos: TResourceStream;
begin
  Recursos := TResourceStream.create(HInstance, nombre, RT_RCDATA);
  Result := Recursos;
end;

function TLectorRecursos.recursoToStream(nombre: string): TStream;
var
  salida: TStream;
begin
  salida := TStream.create;
  obtenerRecurso(nombre).SaveToStream(salida);
  Result := salida;
end;

end.
