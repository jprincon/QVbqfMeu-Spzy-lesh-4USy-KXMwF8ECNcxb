{Este corresponde al programa principal. Desde este código se gestiona cada
uno de las unidades y formulario y se lanzan o ejecutan cuando la aplicación
se inicia}
program ADDES;

{$R *.dres}

uses
  Vcl.Forms,
  uFAddes in 'uFAddes.pas' {FGestorProyectosProgramacion},
  uFMensaje in 'uFMensaje.pas' {FMensaje},
  uModuloDatos in 'uModuloDatos.pas' {ModuloDatos: TDataModule},
  uTConfiguracionApp in 'uTConfiguracionApp.pas',
  uTTablasBD in 'uTTablasBD.pas',
  uTRegistroInicio in 'uTRegistroInicio.pas',
  uFPlantilla in 'uFPlantilla.pas' {FPlantilla},
  uConfiguracionRutaBD in 'uConfiguracionRutaBD.pas' {FConfiguracionBD},
  uFCrearEditarProyecto in 'uFCrearEditarProyecto.pas' {FCrearEditarProyecto},
  uFPlantillaEntrada in 'uFPlantillaEntrada.pas' {FPlantillaEdicion},
  Constantes in 'Constantes.pas',
  Utilidades in 'Utilidades.pas',
  uTTipos in 'uTTipos.pas',
  uFAbrirProyecto in 'uFAbrirProyecto.pas' {FAbrirProyecto},
  uTProyectoProgramacion in 'uTProyectoProgramacion.pas',
  uFCrearEditarAutor in 'uFCrearEditarAutor.pas' {FCrearEditarAutor},
  uTLectorRecursos in 'uTLectorRecursos.pas',
  uFCrearEditarPasoInstalacion in 'uFCrearEditarPasoInstalacion.pas' {FCrearEditarPasoInstalacion},
  uFIndicador in 'uFIndicador.pas' {FIndicador},
  uFCrearEditarPlataformaDesarrollo in 'uFCrearEditarPlataformaDesarrollo.pas' {FCrearEditarPlataformaDesarrollo},
  uFToast in 'uFToast.pas' {FToast},
  uFCrearEditarModulo in 'uFCrearEditarModulo.pas' {FCrearEditarModulo},
  uFCrearEditarCodigoFuente in 'uFCrearEditarCodigoFuente.pas' {uFCrearEditarCodigoFuente},
  uFCrearEditarSeccion in 'uFCrearEditarSeccion.pas' {FCrearEditarSeccion},
  uTEditorLatex in 'uTEditorLatex.pas',
  uFImportarPlataforma in 'uFImportarPlataforma.pas' {FImportarPlataforma},
  uFAutores in 'uFAutores.pas' {FAutores},
  uTAutorSoftware in 'uTAutorSoftware.pas',
  uFActualizaciones in 'uFActualizaciones.pas' {FActualizaciones},
  uFSoftware in 'uFSoftware.pas' {FAcercaSoftware},
  uFPasosInstalacionDefecto in 'uFPasosInstalacionDefecto.pas' {FPasosInstalacionDefecto},
  uFConsola in 'uFConsola.pas' {Consola},
  uFCrearEditarDER in 'uFCrearEditarDER.pas' {FCrearEditarDER},
  uCrearEditarFuncionalidad in 'uCrearEditarFuncionalidad.pas' {FCrearEditarFuncionalidad},
  uFCrearEditarTipoFuncionalidad in 'uFCrearEditarTipoFuncionalidad.pas' {FCrearEditarTipoFuncionalidad},
  uFCrearEditarTabla in 'uFCrearEditarTabla.pas' {FCrearEditarTabla},
  uTUtilidades in 'uTUtilidades.pas',
  uFCrearEditarAtributoTabla in 'uFCrearEditarAtributoTabla.pas' {FCrearEditarAtributoTabla},
  uTHtml in 'uTHtml.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Gestor de Proyectos de Programación';
  Application.CreateForm(TModuloDatos, ModuloDatos);
  Application.CreateForm(TFGestorProyectosProgramacion, FGestorProyectosProgramacion);
  Application.CreateForm(TFMensaje, FMensaje);
  Application.CreateForm(TFPlantilla, FPlantilla);
  Application.CreateForm(TFConfiguracionBD, FConfiguracionBD);
  Application.CreateForm(TFCrearEditarProyecto, FCrearEditarProyecto);
  Application.CreateForm(TFPlantillaEdicion, FPlantillaEdicion);
  Application.CreateForm(TFAbrirProyecto, FAbrirProyecto);
  Application.CreateForm(TFCrearEditarAutor, FCrearEditarAutor);
  Application.CreateForm(TFCrearEditarPasoInstalacion, FCrearEditarPasoInstalacion);
  Application.CreateForm(TFIndicador, FIndicador);
  Application.CreateForm(TFCrearEditarPlataformaDesarrollo, FCrearEditarPlataformaDesarrollo);
  Application.CreateForm(TFToast, FToast);
  Application.CreateForm(TFCrearEditarModulo, FCrearEditarModulo);
  Application.CreateForm(TFCrearEditarCodigoFuente, FCrearEditarCodigoFuente);
  Application.CreateForm(TFCrearEditarSeccion, FCrearEditarSeccion);
  Application.CreateForm(TFImportarPlataforma, FImportarPlataforma);
  Application.CreateForm(TFAutores, FAutores);
  Application.CreateForm(TFActualizaciones, FActualizaciones);
  Application.CreateForm(TFAcercaSoftware, FAcercaSoftware);
  Application.CreateForm(TFPasosInstalacionDefecto, FPasosInstalacionDefecto);
  Application.CreateForm(TConsola, Consola);
  Application.CreateForm(TFCrearEditarDER, FCrearEditarDER);
  Application.CreateForm(TFCrearEditarFuncionalidad, FCrearEditarFuncionalidad);
  Application.CreateForm(TFCrearEditarTipoFuncionalidad, FCrearEditarTipoFuncionalidad);
  Application.CreateForm(TFCrearEditarTabla, FCrearEditarTabla);
  Application.CreateForm(TFCrearEditarAtributoTabla, FCrearEditarAtributoTabla);
  Application.Run;
end.
