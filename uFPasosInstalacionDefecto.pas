unit uFPasosInstalacionDefecto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ExtCtrls, SynEditHighlighter, SynHighlighterTeX, SynEdit,
  Vcl.Buttons, Utilidades;

type
  TFPasosInstalacionDefecto = class(TForm)
    pTitulo: TPanel;
    paginaLista: TPageControl;
    TabSheet1: TTabSheet;
    lvPasos: TListView;
    iconos24: TImageList;
    Panel1: TPanel;
    paginaCodigo: TPageControl;
    TabSheet2: TTabSheet;
    edDescripcion: TSynEdit;
    sTEX: TSynTeXSyn;
    paginaImagen: TPageControl;
    TabSheet3: TTabSheet;
    imgVista: TImage;
    pBoton: TPanel;
    sbImportar: TSpeedButton;
    procedure sbImportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure seleccionarPaso(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fileXampp: TStringList;
    rutaXampp: string;
    filePostgres: TStringList;
    rutaPostgres: string;
    filePM2: TStringList;
    rutaPM2: string;
    fileNodeJS: TStringList;
    rutaNodeJS: string;
    FNombre: string;
    FDescripcion: TStringList;
    Fselecciono: boolean;
    Fruta: string;
    procedure SetDescripcion(const Value: TStringList);
    procedure SetNombre(const Value: string);
    procedure Setruta(const Value: string);
    procedure Setselecciono(const Value: boolean);
  public
    procedure crearXampp;
    procedure crearPostgres;
    procedure crearPM2;
    procedure crearNodeJS;

    procedure crearPasos;
    procedure crearPaso(nombre, imagen: string);

    function seleccionoPaso: boolean;

    property Descripcion: TStringList read FDescripcion write SetDescripcion;
    property nombre: string read FNombre write SetNombre;
    property selecciono: boolean read Fselecciono write Setselecciono;
    property ruta: string read Fruta write Setruta;
  end;

var
  FPasosInstalacionDefecto: TFPasosInstalacionDefecto;

implementation

{$R *.dfm}

procedure TFPasosInstalacionDefecto.crearNodeJS;
begin
  fileNodeJS := TStringList.Create;
  rutaNodeJS := ExtractFilePath(ParamStr(0)) + '\Instalaciones\node.png';

  With fileNodeJS do
  begin
    Add('<p style="text-align: justify">Para instalar Node.js siga el v�nculo '
      + '<a href="https://nodejs.org/en/download/current/">' +
      'https://nodejs.org/en/download/current/</a> y descargue la opci�n para su sistema operativo.'
      + ' En esta caso el manual se esta escribiendo sobre Windows 10.</p>');
    Add('');
    Add('<p style="text-align: justify">Una vez que descargue el instalador, haga clic en [Next] hasta'
      + ' terminar la instalaci�n. Esta instalaci�n no requiere de ' +
      'configuraciones especiales.</p>');
  end;
end;

procedure TFPasosInstalacionDefecto.crearPaso(nombre, imagen: string);
begin
  with lvPasos.Items.Add.SubItems do
  begin
    Add(IntToStr(lvPasos.Items.Count));
    Add(nombre);
    Add(imagen);
  end;
end;

procedure TFPasosInstalacionDefecto.crearPasos;
begin
  lvPasos.Items.Clear;

  crearPaso('Xampp', rutaXampp);
  crearPaso('Postgres', rutaPostgres);
  crearPaso('Node.js', rutaNodeJS);
  crearPaso('Pm2', rutaPM2);
end;

procedure TFPasosInstalacionDefecto.crearPM2;
begin
  filePM2 := TStringList.Create;
  rutaPM2 := ExtractFilePath(ParamStr(0)) + '\Instalaciones\pm2.png';

  With filePM2 do
  begin
    Add('<p style="text-align: justify">Dado que la aplicaci�n del <b>Backend</b> esta desarrollada'
      + ' en <b>Node.js</b> es necesario instalar un paquete que nos permita' +
      ' ejecutar la aplicaci�n sin interrupciones, y que frente a un fallo,' +
      ' reinicie la aplicaci�n y nos deje un log del problema o error.</p>');
    Add('');
    Add('<p style="text-align: justify">Para instalar la aplicaci�n, debe tener instalado Node.js en el'
      + ' sistema, tal como se hizo en el paso anterior.</p>');
    Add('');
    Add('<p style="text-align: justify">Abra una consola de comandos o PowerShell con derechos de'
      + ' administrador y escriba el siguiente comando: npm install pm2 -g' +
      ' y presione la tecla [Enter]. Se iniciar� la instalaci�n tal como ' +
      'se muestra en la siguiente imagen.</p>');
    Add('');
  end;
end;

procedure TFPasosInstalacionDefecto.crearPostgres;
begin
  filePostgres := TStringList.Create;
  rutaPostgres := ExtractFilePath(ParamStr(0)) + '\Instalaciones\postgres.png';

  With filePostgres do
  begin
    Add('<p style="text-align: justify">Descargar Postgres SQL en la versi�n 12.xx. Al momento de escribir'
      + ' esta manual se encuentra en la versi�n 12.13. Este software requiera'
      + ' que sea la versi�n 12. Para descargar siga el siguiente v�nculo' +
      '<a href="https://www.enterprisedb.com/downloads/postgres-postgresql-downloads">'
      + 'https://www.enterprisedb.com/downloads/postgres-postgresql-downloads</a>.</p>');
    Add('');
    Add('<p style="text-align: justify">Una vez realizada la descarga haga doble clic en el instalador y'
      + ' siga los siguientes pasos:</p>');
    Add('');
    Add('<ol style="text-align: justify">');
    Add('   <li>Haga clic en el bot�n [Siguiente >]</li>');
    Add('   <li>Seleccione el directorio en el cual quiere que quede ' +
      'instalado el software, por defecto ser� en C:\Program ' +
      'Files\textbackslash PostgreSQL\textbackslash 12. Si tiene otro disco ' +
      'duro en el cual instale sus programas puede cambiar �sta ruta. Haga ' +
      'clic en [Siguiente >]</li>');
    Add('   <li>En la ventana donde se muestran los componentes, haga ' +
      'clic en [Siguiente >]</li>');
    Add('   <li>Se mostrar� una ventana preguntando la ruta o directorio ' +
      'donde se almacenanaran sus datos. Si tiene un disco duro para almacenar'
      + ' los datos eliga la nueva ruta, de lo contrario haga clic en [Siguiente >]</li>');
    Add('   <li>Ahora escriba la siguiente contrase�a ' +
      '5716f2746fdaf169c35b4b5d79f7d813 esta se ha elegido para la aplicaci�n' +
      '. Presione el  bot�n [Siguiente >]</li>');
    Add('   <li>En la siguiente ventana se le preguntar� por el puerto,' +
      ' que por defecto debemos dejar en 5432</li>');
    Add('   <li>En la siguiente ventana se pregunta por opciones' +
      ' avanzadas, dejaremos por defecto la configuraci�n del instalador' +
      ' y presionamos en [Siguiente >]</li>');
    Add('   <li>El instalador nos mostrar� un resumen de lo que se ha' +
      ' elegido para instalar, presionamos en [Siguiente >]<li>' +
      '<li>Finalmente' +
      ' nos mostrar� una ventana indicando que todo esta listo para instalar,' +
      ' presionamos en [Siguiente >] y la instalaci�n comenzar�.</li>');
    Add('   <li>Terminada la instalaci�n, desmarcamos la casilla de ' +
      '(Stack Builder ...) y hacemos clic en el bot�n [Terminar]</li>');
    Add('</ol>');
    Add('');
  end;
end;

procedure TFPasosInstalacionDefecto.crearXampp;
begin
  fileXampp := TStringList.Create;
  rutaXampp := ExtractFilePath(ParamStr(0)) + '\Instalaciones\xampp.png';

  With fileXampp do
  begin
    Add('<p style="text-align: justify">Para ejecutar la aplicaci�n se requiere de un servicio Apache para'
      + ' visualizar la aplicaci�n Web, para ello se recomienda descargar XAMPP'
      + ' (desde el siguiente v�nculo <a href="https://www.apachefriends.org/download.html">'
      + 'https://www.apachefriends.org/download.html</a>) una aplicaci�n que contiene un conjunto de aplicaciones para'
      + ' la gesti�n de servicios web, entre ellos apache.</p>');
    Add('');
    Add('<p style="text-align: justify">Una vez descargada la aplicaci�n procedemos a hacer doble clic '
      + 'sobre el ejecutabla y seguir los pasos.</p>');
    Add('');
    Add('<ol style="text-align: justify">');
    Add('   <li>Clic en siguiente [Next >] cuando aparece la primera ventana.</li>');
    Add('   <li>Clic en siguiente [Next >] en la ventana selecci�n de ' +
      'componentes.</li>');
    Add('   <li>Si su disco de instalaci�n por defecto es el dicso C:/ ' +
      'puede hacer clic en siguiente [Next >] de lo contrario cambie la ruta ' +
      'de instalaci�n por una deseada por usted y haga clic en siguiente [Next >]</li>');
    Add('   <li>En la siguiente ventana ver� el idioma, que por defecto' +
      ' esta en Ingl�s, hacemos clic en siguiente [Next >]</li>');
    Add('   <li>A continuaci�n encontraremos una pantalla indicando que ' +
      'todo esta listo para la instalaci�n (Ready to Install), presionamos el' +
      ' bot�n siguiente [Next >] y luego se iniciar� la instalaci�n.</li>');
    Add('   <li>Terminada la instalaci�n, hacemos clic en finalizar ' +
      '[Finish] y se iniciar� la consola de Xampp.</li>');
    Add('</ol>');
    Add('');
    Add('<p style="text-align: justify">Una vez instalado Xampp, debemos iniciarlo y hacer clic en el '
      + 'bot�n [Start] en la consola de mensajes frente a la etiqueta de ' +
      'Apache. Este se iniciar� en los puertos <b>80</b> y <b>443</b> que corresponden'
      + ' a los puertos para la navegaci�n de internet.</p>');
  end;
end;

procedure TFPasosInstalacionDefecto.FormCreate(Sender: TObject);
begin
  FDescripcion := TStringList.Create;

  crearXampp;
  crearPostgres;
  crearPM2;
  crearNodeJS;

  crearPasos;
end;

procedure TFPasosInstalacionDefecto.FormShow(Sender: TObject);
begin
  edDescripcion.Lines.Clear;
  Utilidades.limpiarImagen(imgVista);
end;

procedure TFPasosInstalacionDefecto.sbImportarClick(Sender: TObject);
begin
  if lvPasos.Selected <> nil then
  begin
    FNombre := lvPasos.Selected.SubItems[1];
    Fruta := lvPasos.Selected.SubItems[2];
    Fselecciono := true;

    close;
  end;
end;

procedure TFPasosInstalacionDefecto.seleccionarPaso(Sender: TObject);
var
  nombre, ruta: string;
begin
  if lvPasos.Selected <> nil then
  begin
    nombre := lvPasos.Selected.SubItems[1];
    ruta := lvPasos.Selected.SubItems[2];

    edDescripcion.Lines.Clear;

    if FileExists(ruta) then
      imgVista.Picture.LoadFromFile(ruta);

    if nombre = 'Xampp' then
      edDescripcion.Lines.AddStrings(fileXampp);

    if nombre = 'Postgres' then
      edDescripcion.Lines.AddStrings(filePostgres);

    if nombre = 'Node.js' then
      edDescripcion.Lines.AddStrings(fileNodeJS);

    if nombre = 'Pm2' then
      edDescripcion.Lines.AddStrings(filePM2);

    FDescripcion.Clear;
    FDescripcion.AddStrings(edDescripcion.Lines);
  end;
end;

function TFPasosInstalacionDefecto.seleccionoPaso: boolean;
begin
  FDescripcion.Clear;
  FNombre := '';
  Fruta := '';
  Fselecciono := false;
  ShowModal;

  result := Fselecciono;
end;

procedure TFPasosInstalacionDefecto.SetDescripcion(const Value: TStringList);
begin
  FDescripcion := Value;
end;

procedure TFPasosInstalacionDefecto.SetNombre(const Value: string);
begin
  FNombre := Value;
end;

procedure TFPasosInstalacionDefecto.Setruta(const Value: string);
begin
  Fruta := Value;
end;

procedure TFPasosInstalacionDefecto.Setselecciono(const Value: boolean);
begin
  Fselecciono := Value;
end;

end.
