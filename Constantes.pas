{Esta corresponde a la Unidad de Constantes. En esta se definen todas
las contantes que se usan en el código}
unit Constantes;

interface

uses System.SysUtils;

const

  { Encabezados }
  S_CONFIGURACION = 'Configuracion';
  S_USUARIO = 'Usuario';
  S_DATOS = 'DATOS';
  S_ATRIBUTO = 'ATRIBUTO';

  { Variables }
  V_SERVIDOR_CONECTADO = 'ServidorConectado';
  V_CANTIDAD = 'Cantidad';
  V_CONSULTAS = 'Consultas';
  V_TABLA = 'TABLA';
  V_ID_PRINCIPAL = 'ID_PRINCIPAL';
  V_NOMBRE_LISTVIEW = 'NOMBRE_LISTVIEW';
  V_ATRIBUTO = 'ATRIBUTO';
  V_EDITOR = 'EDITOR';
  V_ES_MEMO = 'ES_MEMO';
  V_METODO_LEER = 'METODO_LEER';
  V_RUTA_BD = 'RUTA_BD';
  V_RUTA_TRABAJO = 'RUTA_TRABAJO';
  V_RUTA_RECURSOS = 'RUTA_RECURSOS';
  V_RUTA_ARCHIVOS = 'RUTA_ARCHIVOS';
  V_RUTA_SERVIDOR_ARCHIVOS = 'RUTA_SERVIDOR_ARCHIVOS';
  V_RUTA_IMAGENES_DESCRIPCIONES = 'RUTA_IMAGENES_DESCRIPCIONES';

  JSON_RESPUESTA = 'Respuesta';
  JSON_ERROR = 'Error';
  JSON_ESTADO = 'Estado';

  JSON_STATUS = 'Status';
  JSON_RESPONSE = 'Response';
  JSON_OBJECT = 'Object';
  JSON_RESULTS = 'Results';
  JSON_PAGINACION = 'Paginacion';

  RESPONSE_CORRECTO = 'Correcto';
  RESPONSE_INCORRECTO = 'Incorrecto';

  ACCION_EDITAR = 'EDITAR';
  ACCION_CREAR = 'CREAR';

  { Valores }
  DS_ = '';
  DI_ = 0;
  DB_ = False;

function VarToStr(ss: string; n: integer): string;

implementation

function VarToStr(ss: string; n: integer): string;
begin
  result := ss + IntToStr(n);
end;

end.
