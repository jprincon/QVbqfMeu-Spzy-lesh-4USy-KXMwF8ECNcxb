{Este formulario permite importar informaci�n por defecto de las plataformas
e IDEs usados para el desarrollo de la aplicaci�n. La aplicaci�n cuenta con
una informaci�n por defecto que le permite al usuario importarla para
la descripci�n t�cnica de su software}
unit uFImportarPlataforma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls, Vcl.ComCtrls, Utilidades;

type
  TFImportarPlataforma = class(TForm)
    lvPlataformas: TListView;
    pTitulo: TPanel;
    iconos128: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure seleccionarAplicacion(Sender: TObject);
  private
    platDescripcion: TStringList;
    FNombre: string;
    FDescripcion: string;
    FSelecciono: boolean;
    FrutaImagenes: string;
    FrutaImagen: string;
    procedure SetDescripcion(const Value: string);
    procedure SetNombre(const Value: string);
    procedure SetSelecciono(const Value: boolean);
    procedure SetrutaImagenes(const Value: string);
    procedure SetrutaImagen(const Value: string);
  public
    procedure agregarAplicacion(nombre, descripcion: string; imagen: integer;
      rutaImagen: string);

    procedure crearCorelDraw;
    procedure crearFlatIcon;
    procedure crearInkScape;

    procedure crearPostgreSQL;
    procedure crearMicrosoftAccess;

    procedure crearDelphi;
    procedure crearLazarus;
    procedure crearNodeJS;

    procedure crearVisualStudio;

    function seleccionoPlataforma: boolean;

    property nombre: string read FNombre write SetNombre;
    property descripcion: string read FDescripcion write SetDescripcion;
    property rutaImagen: string read FrutaImagen write SetrutaImagen;
    property Selecciono: boolean read FSelecciono write SetSelecciono;
    property rutaImagenes: string read FrutaImagenes write SetrutaImagenes;
  end;

var
  FImportarPlataforma: TFImportarPlataforma;

implementation

{$R *.dfm}
{ TFPlataformasConocidas }

procedure TFImportarPlataforma.agregarAplicacion(nombre, descripcion: string;
  imagen: integer; rutaImagen: string);
begin
  with lvPlataformas.Items.Add do
  begin
    ImageIndex := imagen;
    Caption := nombre;
    SubItems.Add(descripcion);
    SubItems.Add(rutaImagen);
  end;
end;

procedure TFImportarPlataforma.crearCorelDraw;
begin
  platDescripcion.Clear;
  With platDescripcion do
  begin
    Add('<p style="text-align: justify">CorelDRAW� Graphics Suite 2020 es un programa l�der de software de dise�o ');
    Add('gr�fico preferido por millones de profesionales, peque�os empresarios y ');
    Add('aficionados al dise�o de todo el mundo. Ofrece una experiencia de dise�o ');
    Add('transparente para gr�ficos, dise�o de p�ginas, ilustraci�n, edici�n de ');
    Add('fotograf�as, vectorizaci�n, im�genes para Web, proyectos para impresi�n, ');
    Add('arte, tipograf�a y mucho m�s.</p>');
    Add('');
    Add('<p style="text-align: justify">El programa CorelDRAW es parte del paquete de Corel Graphics Suite dise�ado ');
    Add('por Corel Corporation, que cuenta con varias versiones desde la m�s b�sica ');
    Add('hasta la m�s avanzada y reciente.</p>');
    Add('');
    Add('<p style="text-align: justify">Este software se utiliza en �mbitos de artes gr�ficas y comunicaci�n con el ');
    Add('prop�sito de producir, editar y transformar im�genes a nivel digital. Se trata');
    Add(' de una aplicaci�n de dibujo vectorial, con herramientas de diagramaci�n, ');
    Add(' efectos y funciones sobre im�genes y p�ginas y alternativas de retoque y ');
    Add(' dici�n m�ltiples. Se utiliza a menudo para generar im�genes y gr�ficos desde');
    Add('  cero, pero tambi�n permite editar fotograf�as, dibujos y otro tipo de ');
    Add('  grafismos para corregir imperfecciones o defectos o incluso para brindar ');
    Add('  diversos efectos de cromatismo, brillo, contrate, curva tonal, efectos ');
    Add('  especiales, transparencias, mezclas y fundidos y otros.</p>');
    Add('');
    Add('<p style="text-align: justify">Entre sus versiones, el software incluye el CorelDRAW 9, 10, 12, Graphics ');
    Add('Suite X3 y X4,X5,X6,X7,X8 y X9 y 2020. Es parte de un paquete de programas, ');
    Add('que incluye el editor de mapa de bits o bitmap Photo-Paint, el vectorizador ');
    Add('Corel POWERTrace, el Bitstream, y otras aplicaciones como CorelMOTION o ');
    Add('CorelDREAM 3D. Por otro lado, el paquete incluye fuentes, fotos, pinceles, ');
    Add('clip art y otros agregados complementarios.</p>');
    Add('');
    Add('<p style="text-align: justify">Adem�s de ser uno de los programas m�s populares, el CorelDRAW es tambi�n ');
    Add('reconocido como uno de los m�s sofisticados softwares en edici�n de im�genes.</p>');
    Add('');
    Add('<p style="text-align: justify">Entre sus caracter�sticas m�s reconocidas en el mercado, se cuentan la ');
    Add('versatilidad que tiene para usarlo en diferentes tareas y operaciones de ');
    Add('dise�o gr�fico, publicidad, prensa, dise�o web, arquitectura, dise�o ');
    Add('industrial y textil, gigantograf�as y otros, la compatibilidad con archivos ');
    Add('de diversos formatos de gr�ficos vectoriales, mapas de bits y otros, y con ');
    Add('programas similares y la usabilidad en cuanto a posibilidades de ');
    Add('personalizarlo al gusto y elecci�n de cada usuario.</p>');
    Add('');
  end;
  agregarAplicacion('Corel Draw', Utilidades.StringsToText(platDescripcion), 0,
    FrutaImagenes + 'CorelDraw.jpg');
end;

procedure TFImportarPlataforma.crearDelphi;
begin
  platDescripcion.Clear;
  With platDescripcion do
  begin
    Add('<p style="text-align: justify">Embarcadero es una compa��a de software norteamericana.');
    Add(' Fue fundada en 1993 y desde entonces se ha dedicado al ');
    Add(' desarrollo de herramientas, IDEs y compiladores para ');
    Add(' desarrolladores de software, DBA' + #39 + 's y arquitectos de ');
    Add(' software. El primer CEO fue Ben T. Smith IV, siendo el ');
    Add(' actual Jim Douglas. El 7 de mayo de 2008 Borland y ');
    Add(' Embarcadero Technologies anunciaron que Embarcadero hab�a ');
    Add(' llegado a un acuerdo con Borland para la compra de CodeGear.');
    Add('  El proceso de compra finaliz� en junio de 2008.</p>');
    Add('  ');
    Add('<p style="text-align: justify">RAD Studio� es la manera m�s r�pida de desarrollar apps ');
    Add(' nativas multiplataforma con servicios flexibles de nube');
    Add(' y amplia conectividad con IoT. Ofrece controles VCL ');
    Add(' para Windows 10 y posibilita el desarrollo con FMX');
    Add(' para Windows, Mac y m�viles. RAD Studio es compatible ');
    Add(' con Delphi o C++ y ofrece una amplia variedad de ');
    Add(' servicios para Enterprise Strong Development�. ');
    Add(' Aprovecha m�s memoria para proyectos m�s grandes, ');
    Add(' soporte extendido para m�ltiples monitores, un ');
    Add(' Inspector de objetos mejorado y mucho m�s. RAD Studio es ');
    Add(' 5 veces m�s r�pido en el desarrollo y la implementaci�n ');
    Add(' para m�ltiples plataformas m�viles, de escritorio, ');
    Add(' nubes y bases de datos, incluido Windows 10 de 32 bits y ');
    Add(' 64 bits.</p>');
    Add(' ');
    Add('<p style="text-align: justify">El desarrollo r�pido de aplicaciones o RAD (acr�nimo en ingl�s');
    Add(' de rapid application development) es un proceso de desarrollo');
    Add(' de software, desarrollado inicialmente por James Martin en');
    Add(' 1991 basado en el trabajo hecho por Scott Shultz en los 80.');
    Add(' El m�todo comprende el desarrollo interactivo, la construcci�n');
    Add(' de prototipos y el uso de utilidades CASE (ingenier�a ');
    Add(' asistida por computadora). Tradicionalmente, el desarrollo');
    Add(' r�pido de aplicaciones tiende a englobar tambi�n la ');
    Add(' usabilidad, utilidad y la rapidez de ejecuci�n.</p>');
    Add('');
    Add('<p style="text-align: justify">Hoy en d�a se suele utilizar para referirnos al desarrollo r�pido');
    Add(' de interfaces gr�ficas de usuario tales como Glade, o entornos');
    Add(' de desarrollo integrado completos. Algunas de las plataformas');
    Add(' m�s conocidas son Visual Studio, Lazarus, Gambas, Delphi, ');
    Add(' Foxpro, Anjuta o Game Maker. En el �rea de la autor�a ');
    Add(' multimedia, software como Neosoft Neobook y MediaChance ');
    Add(' Multimedia Builder proveen plataformas de desarrollo ');
    Add(' r�pido de aplicaciones, dentro de ciertos l�mites.</p>');
    Add('');
    Add('<p style="text-align: justify">Principios b�sicos:</p>');
    Add('  ');
    Add('<ol style="text-align: justify">');
    Add(' <li>Objetivo clave es para un r�pido desarrollo y entrega de ');
    Add(' una alta calidad en un sistema de relativamente bajo coste de ');
    Add(' inversi�n.</li>');
    Add(' <li>Intenta reducir los riesgos inherentes del proyecto ');
    Add(' parti�ndolo en segmentos m�s peque�os y proporcionar m�s ');
    Add(' facilidad de cambio durante el proceso de desarrollo.</li>');
    Add(' <li>Orientaci�n dedicada a producir sistemas de alta ');
    Add(' calidad con rapidez, principalmente mediante el uso de ');
    Add(' iteraci�n por prototipos (en cualquier etapa de desarrollo), ');
    Add(' promueve la participaci�n de los usuarios y el uso de ');
    Add(' herramientas de desarrollo computarizadas. Estas herramientas');
    Add('  pueden incluir constructores de Interfaz gr�fica de usuario ');
    Add('  (GUI), Computer Aided Software Engineering (CASE) las ');
    Add('  herramientas, los sistemas de gesti�n de bases de datos ');
    Add('  (DBMS), lenguajes de programaci�n de cuarta generaci�n, ');
    Add('  generadores de c�digo, y t�cnicas orientada a objetos.</li>');
    Add(' <li>Hace especial hincapi� en el cumplimiento de la necesidad');
    Add('  comercial, mientras que la ingenier�a tecnol�gica o la ');
    Add('  excelencia es de menor importancia.</li>');
    Add(' <li>Control de proyecto implica el desarrollo de prioridades');
    Add('  y la definici�n de los plazos de entrega. Si el proyecto empieza');
    Add('   a aplazarse, se hace hincapi� en la reducci�n de requisitos ');
    Add('   para el ajuste, no en el aumento de la fecha l�mite.</li>');
    Add(' <li>La participaci�n activa de los usuarios es imprescindible.</li>');
    Add(' <li>Iterativamente realiza la producci�n de software, en ');
    Add(' lugar de enfocarse en un prototipo.</li>');
    Add(' <li>Produce la documentaci�n necesaria para facilitar el ');
    Add(' futuro desarrollo y mantenimiento.</li>');
    Add('<ol>');
  end;
  agregarAplicacion('Delphi Rad Studio',
    Utilidades.StringsToText(platDescripcion), 4, FrutaImagenes + 'Delphi.jpg');
end;

procedure TFImportarPlataforma.crearFlatIcon;
begin
  platDescripcion.Clear;
  With platDescripcion do
  begin
    Add('<p style="text-align: justify">Flaticon tiene una enorme base de datos de varios iconos en ');
    Add('diferentes paquetes de iconos. Para encontrar un icono, ');
    Add('todo lo que tiene que hacer es simplemente buscarlo en el ');
    Add('cuadro de b�squeda o encontrar el paquete de iconos apropiado.</p>');
    Add('');
    Add('<p style="text-align: justify">Contiene todos los iconos que necesita, desde mascotas hasta ');
    Add('computadoras. Nunca tendr� que usar otro sitio web de ');
    Add('iconos despu�s de usar Flaticon.</p>');
    Add('');
    Add('<p style="text-align: justify">Facilidad en el uso: A diferencia de muchos otros sitios web');
    Add(' de descarga de iconos que requieren numerosos pasos para');
    Add('  descargar un icono, Flaticon tiene uno de los m�todos m�s ');
    Add('  simples. Todo lo que tiene que hacer es encontrar un icono ');
    Add('  perfecto para su necesidad, hacer clic en �l, elegir el ');
    Add('  formato y elegir el tama�o. El icono se descargar� de ');
    Add('  inmediato.</p>');
    Add('');
    Add('<p style="text-align: justify">Adem�s, si se registra para obtener una cuenta gratuita de ');
    Add('Flaticon, puede crear sus propias colecciones de iconos y ');
    Add('descargarlas todas a la vez. Pero los usuarios solo tendr�n ');
    Add('una cantidad limitada de descargas / d�a.</p>');
    Add('');
    Add('<p style="text-align: justify">Paquetes de iconos Flaticon: El paquete de iconos es un grupo');
    Add(' de iconos. Los paquetes de iconos facilitan la b�squeda de ');
    Add(' iconos o iconos relacionados del mismo autor. De esta manera,');
    Add('  puede encontrar los mejores y m�s perfectos iconos para sus ');
    Add('  necesidades.</p>');
    Add('');
    Add('<p style="text-align: justify">Descarga en diferentes formatos: Flaticon permite descargar');
    Add(' sus iconos favoritos en cualquiera de los formatos PNG, ');
    Add(' SVG, EPS, PSD, Base 64. Si descargas el icono en formato ');
    Add(' PNG, tendr� la opci�n de seleccionar los tama�os preferidos');
    Add('  (16px, 24px, 32px, a 512px) y colores.</p>');
    Add('');
    Add('<p style="text-align: justify">Por lo tanto, puede personalizar los iconos incluso antes');
    Add(' de descargarlos. En otros formatos, no hay necesidad de ');
    Add(' tales opciones, por ejemplo, las im�genes SVG no perder�n');
    Add('  su calidad a un tama�o enorme, por lo que no lo incluyeron.</p>');
    Add('');
    Add('<p style="text-align: justify">�Por qu� Flaticon ofrece iconos gratis?: Los iconos gratis');
    Add(' forman parte del modelo de negocio freemium, que significa');
    Add('  que la mayor�a de los recursos que se ofrecen en Flaticon');
    Add('   se pueden utilizar de forma gratuita atribuyendo el ');
    Add('   recurso a Flaticon. Adem�s, solo pagando una peque�a ');
    Add('   cantidad, un usuario puede suscribirse al Plan Premium');
    Add('    y podr� utilizar todas las ilustraciones sin tener que');
    Add('     atribuirlas al autor.</p>');
    Add('');
    Add('<p style="text-align: justify">Durante 10 d�as se puede utilizar la extensi�n sin limitaci�n');
    Add(' alguna y pasado este per�odo, se sigue teniendo acceso gratuito');
    Add('  a los 10 primeros iconos de cada b�squeda que hagas con la');
    Add('   extensi�n. La versi�n de pago no tiene limitaci�n.</p>');
    Add('');
    Add('<p style="text-align: justify">Importancia de los iconos en la usabilidad: Los iconos tienen');
    Add(' como objetivo representar una acci�n o idea de manera visual');
    Add('  a trav�s de un color, estilo y atractivo espec�ficos.</p>');
    Add('');
    Add('<p style="text-align: justify">El prop�sito de un icono en una interfaz de usuario es');
    Add(' resonar con la personalidad de la marca de una manera');
    Add('  clara y coherente. Esto permite al usuario realizar su');
    Add('   tarea con mayor facilidad y flexibilidad.</p>');
    Add('');
    Add('<p style="text-align: justify">Es fundamental que el icono mantenga la claridad y la ');
    Add('coherencia. El icono es m�s que un elemento llamativo para');
    Add(' los usuarios. A muchos dise�adores les ha resultado dif�cil');
    Add('  decidir entre icono y texto en t�rminos de usabilidad.</p>');
    Add('');
    Add('<p style="text-align: justify">El viejo dicho de que �una imagen vale m�s que mil palabras�');
    Add(' es v�lido para la usabilidad y la eficiencia del icono');
    Add('  sobre el texto.</p>');
    Add('');
    Add('<p style="text-align: justify">�Qu� pueden hacer los iconos?: Los iconos son un medio ');
    Add('eficaz para definir el significado en un espacio peque�o');
    Add(' en comparaci�n con el texto. Esto se vuelve a�n m�s ');
    Add(' importante en una era en la que los tama�os de pantalla ');
    Add(' se han reducido y los est�ndares de dise�o receptivo han ');
    Add(' hecho que sea obligatorio redefinir el dise�o seg�n el ');
    Add(' tama�o de la pantalla. Los iconos elevan el elemento ');
    Add(' intuitivo del dise�o web, un est�ndar de dise�o importante.</p>');
    Add('');
    Add('<p style="text-align: justify">Prop�sito del icono para la interfaz de usuario: Para las ');
    Add('pantallas peque�as, los �conos se pueden mejorar con el tacto');
    Add(' y sirven como buenos objetivos. Las barras de herramientas');
    Add('  y los elementos del men� de navegaci�n tienen m�s espacio');
    Add('   para mostrarse porque los iconos liberan mucho espacio');
    Add('    que, de otro modo, ser�a utilizado por el texto.</p>');
    Add('');
    Add('<p style="text-align: justify">La memorabilidad se mejora mediante el uso de iconos porque');
    Add(' las im�genes se registran durante m�s tiempo en el cerebro');
    Add('  en comparaci�n con el texto.</p>');
    Add('');
    Add('<p style="text-align: justify">Por lo tanto, los �conos permanecen m�s frescos en su mente,');
    Add(' lo que facilita que los usuarios los reconozcan. Los iconos');
    Add('  mejoran el atractivo visual del dise�o y la coherencia');
    Add('   refuerza una clase de producto o servicio.</p>');
    Add('');
    Add('<p style="text-align: justify">Dise�o de iconos: Un icono funciona bien en dispositivos');
    Add(' m�viles ya que hay menos elementos en la pantalla del m�vil');
    Add('  y el icono se destaca entre otros elementos.</p>');
    Add('');
    Add('<p style="text-align: justify">El caso se invierte cuando se mejora el tama�o de la ');
    Add('pantalla. En tales casos, el tama�o del icono deber�a ser ');
    Add('mayor y la navegaci�n deber�a ser visible y no oculta ');
    Add('debajo del icono. Esto proporciona una mayor visibilidad de');
    Add(' las opciones del men� y evita problemas de usabilidad del');
    Add('  dise�o. </p>');
    Add('');
    Add('<p style="text-align: justify">El enfoque debe estar en mejorar la memorabilidad para los');
    Add(' usuarios. El icono deber�a tardar unos segundos en ');
    Add(' transmitir su mensaje y significado.</p>');
    Add('');
    Add('<p style="text-align: justify">El dise�o debe basarse en la funcionalidad y las ');
    Add('caracter�sticas espec�ficas, en lugar de solo el atractivo');
    Add(' visual y la imagen gr�fica. Los iconos deben probarse en ');
    Add(' cuanto a la memorabilidad (para verificar la naturaleza ');
    Add(' intuitiva y el refuerzo de la marca) con los usuarios para');
    Add('  medir la efectividad.</p>');
    Add('');
    Add('<p style="text-align: justify">Los �conos est�ticos cuidadosamente dise�ados con etiquetas');
    Add(' de texto aumentan tanto el atractivo como el alcance para');
    Add('  todo tipo de p�blico. El enfoque del dise�o debe ser ');
    Add('  trascender las barreras idiom�ticas y culturales para ');
    Add('  destacar como un �cono verdaderamente global.</p>');
    Add('');
    Add('<p style="text-align: justify">Tomado de <a ' +
      'href="https://www.cevagraf.coop/blog/flaticon/">https://www.cevagraf.coop/blog/flaticon/</a>');
  end;
  agregarAplicacion('Flat Icon', Utilidades.StringsToText(platDescripcion), 1,
    FrutaImagenes + 'FlatIcon.jpg');
end;

procedure TFImportarPlataforma.crearInkScape;
begin
  platDescripcion.Clear;
  With platDescripcion do
  begin
    Add('<p style="text-align: justify">Inkscape es un software de vectores gr�ficos de calidad profesional para ');
    Add('Windows, Mac OS X y GNU/Linux. Es usado por dise�adores profesionales y ');
    Add('aficionados de todo el mundo para crear una gran variedad de gr�ficos como ');
    Add('ilustraciones, iconos, logos, diagramas, mapas y dise�os web. Inkscape es ');
    Add('un software libre y de c�digo abierto, que utiliza SVG (Scalable Vector ');
    Add('Graphic), el est�ndar abierto de W3C, como formato nativo.</p>');
    Add('');
    Add('<p style="text-align: justify">Inkscape tiene herramientas de dibujo vectorial sofisticadas con capacidades');
    Add(' comparables con los est�ndares de la industria. Puede exportar e importar ');
    Add(' varios formatos de archivo, incluyendo SVG, AI, EPS, PDF, PS y PNG. Tiene ');
    Add(' funcionalidades muy f�ciles de comprender, una interfaz sencilla, soporte ');
    Add(' multi-idiomas y est� dise�ado para ser extensible, los usuarios pueden ');
    Add(' personalizar las funcionalidades de Inkscape con sus m�ltiples extensiones.</p>');
    Add('');
    Add('<p style="text-align: justify">El proyecto de Inkscape tiene una comunidad de usuarios internacional en ');
    Add('constante crecimiento y existen muchos materiales de aprendizaje para ayudar ');
    Add('a empezar con creaciones. La ayuda y el soporte son proporcionados por la ');
    Add('comunidad y hay muchas maneras de contribuir para ayudar a promover el proyecto');
    Add(' de Inkscape.</p>');
    Add('');
    Add('<p style="text-align: justify">Tomado de <a ' +
      'href="https://inkscape.org/es/acerca-de/">https://inkscape.org/es/acerca-de/</a>');
  end;
  agregarAplicacion('InkScape', Utilidades.StringsToText(platDescripcion), 2,
    FrutaImagenes + 'InkScape.jpg');
end;

procedure TFImportarPlataforma.crearLazarus;
begin
  platDescripcion.Clear;
  With platDescripcion do
  begin
    Add('<p style="text-align: justify">Lazarus es una herramienta de desarrollo r�pido de aplicaciones');
    Add(' (RAD) basada en el lenguaje de programaci�n Object Pascal, ');
    Add(' disponible para los sistemas operativos Windows, GNU/Linux y');
    Add(' Mac OS X.</p>');
    Add('');
    Add('<p style="text-align: justify">Se trata de una alternativa libre y gratuita a Delphi, ');
    Add('desarrollada como proyecto de software libre a partir de Free ');
    Add('Pascal. La web y la mayor�a de la documentaci�n est�n en ingl�s, ');
    Add('pero el entorno de desarrollo (IDE) s� est� traducido al espa�ol ');
    Add('en gran parte.</p>');
    Add('');
    Add('<p style="text-align: justify">Lazarus fue creado en febrero de 1999 por Cliff Baeseman, ');
    Add('Shane Miller y Michael A. Hess, quienes luego de un frustrado ');
    Add('paso por el proyecto Megido, decidieron crear su propio software ');
    Add('de desarrollo r�pido para Object Pascal.</p>');
    Add('');
    Add('<p style="text-align: justify">Lazarus es compatible con varios motores de bases de datos, ');
    Add('sin embargo el desarrollador debe instalar paquetes adicionales ');
    Add('para gestionar cada uno. El programador puede acceder a la ');
    Add('base de datos mediante c�digo o bien arrastrando componentes ');
    Add('en un formulario visual. Los componentes de la base de datos ');
    Add('representan campos y son conectados por la correcta configuraci�n ');
    Add('de propiedades a un TDataSource, que representa una tabla y ');
    Add('es tambi�n conectado a los componentes de la base de datos, ');
    Add('ya sea TPSQLDatabase, TSQLiteDataSet o alg�n otro.</p>');
    Add('');
    Add('<p style="text-align: justify">Los siguientes motores de bases de' +
      ' datos son compatibles:</p>');
    Add('');
    Add('<ol style="text-align: justify">');
    Add(' <li>PostgreSQL requiere el paquete PSQL</li>');
    Add(' <li>dBase y FoxPro pueden ser usados sin necesidad de un ');
    Add(' servidor externo o biblioteca mediante el componente TDbf</li>');
    Add(' <li>MySQL funciona correctamente</li>');
    Add(' <li>SQLite, necesita s�lo una simple biblioteca externa y el ');
    Add(' componente TSQLiteDataSet o ZeosLib</li>');
    Add(' <li>Microsoft SQL Server, funciona con la biblioteca ZeosLib</li>');
    Add(' <li>InterBase / Firebird, componente de acceso nativo, ');
    Add(' tambi�n trabaja con ZeosLib</li>');
    Add(' <li>Oracle, tambi�n trabaja con ZeosLib</li>');
    Add(' <li>MariaDB, accesible a trav�s de ZeosLib y a carpeta de ');
    Add(' archivo</li>');
    Add('</ol>');
    Add('');
    Add('<p style="text-align: justify">Aunque el software Lazarus est� licenciado bajo la GPL, el ');
    Add('software desarrollado mediante el uso de esta herramienta ');
    Add('puede ser distribuido bajo alguna otra licencia. La biblioteca ');
    Add('de componentes de Lazarus (LCL) se vincula est�ticamente dentro ');
    Add('de los programas y es licenciada usando una versi�n modificada ');
    Add('de la LGPL dise�ada especialmente para permitir vinculaciones ');
    Add('est�ticas a programas privativos.</p>');
    Add('');
    Add('<p style="text-align: justify">N�tese que instalar un paquete en tiempo de dise�o equivale a ');
    Add('vincular al IDE. Distribuir el IDE Lazarus junto a paquetes en ');
    Add('tiempo de dise�o con una licencia no compatible con GPL ');
    Add('(por ejemplo, MPL) preinstalados podr�a suponer una violaci�n ');
    Add('de licencia. Aparte de esto, se puede construir paquetes ');
    Add('propietarios de Lazarus siempre que no se distribuyan un ');
    Add('Lazarus preinstalado con ellos.</p>');
  end;
  agregarAplicacion('Lazarus Free Pascal',
    Utilidades.StringsToText(platDescripcion), 3,
    FrutaImagenes + 'LazarusFreePascal.jpg');
end;

procedure TFImportarPlataforma.crearMicrosoftAccess;
begin
  platDescripcion.Clear;
  With platDescripcion do
  begin
    Add('<p style="text-align: justify">Microsoft Access es un sistema de administraci�n de bases de');
    Add(' datos que te ayuda a administrar una gran cantidad de registros.');
    Add('  Adem�s, permite crear aplicaciones que utilicen Access como');
    Add('   backend.</p>');
    Add('');
    Add('<p style="text-align: justify">A diferencia de Microsoft Excel, que se utiliza para el ');
    Add('an�lisis de datos y para realizar c�lculos mediante f�rmulas;');
    Add(' Access es m�s �til para recopilar, clasificar y manipular ');
    Add(' grandes cantidades de datos.</p>');
    Add('');
    Add('<p style="text-align: justify">Access incluye diferentes plantillas simplificadas para ');
    Add('adaptarse las necesidades del usuario. Estas plantillas permiten');
    Add(' crear base de datos con facilidad y utilizarlas como ');
    Add(' aplicaciones sin necesidad de tener conocimiento de programaci�n.</p>');
    Add('');
    Add('<p style="text-align: justify">Es una buena herramienta para quienes no tiene mucha ');
    Add('experiencia en la creaci�n y administraci�n de base de datos.');
    Add(' En la pesta�a de �Archivo� estar�n las diferentes plantillas');
    Add('  disponibles con formularios, informes, tablas, o con diversos');
    Add('   campos que ya vienen creados por defecto.</p>');
    Add('');
    Add('<p style="text-align: justify">Access tambi�n permite exportar los datos con facilidad, sin');
    Add(' importar la cantidad de datos y si estos est�n vinculados a');
    Add('  fuentes diferentes. Entre sus opciones, permitir� exportarlos');
    Add('   a Excel con facilidad.</p>');
    Add('');
    Add('<p style="text-align: justify">Para usar esta funci�n, hay que ir a la pesta�a de ');
    Add('�Datos Externos� > Administrador de tablas vinculadas > ');
    Add('Exportar a Excel.</p>');
    Add('');
    Add('<p style="text-align: justify">Otra particularidad de este software es que se puede exportar');
    Add(' la base de datos en formato PDF. Esto es muy �til para compartir');
    Add('  las bases de datos con otros usuarios que no tengan el mismo');
    Add('   software y puedan verlas como si fueran im�genes. Con esta');
    Add('    funci�n, podr�n abrir el archivo en Adobe Reader sin ning�n');
    Add('     problema.</p>');
    Add('');
    Add('<p style="text-align: justify">Para hacer esto solamente hay que dirigirse a la pesta�a de');
    Add(' �Datos Externos � y luego escoge la opci�n: �PDF o XPS�.  ');
    Add(' Guarda el archivo y listo. Se tendr�n las bases de datos en PDF.</p>');
    Add('');
    Add('<p style="text-align: justify">Una funci�n que va a encantar a los que conocen la sintaxis');
    Add(' de SQL es aquella que permite hacer consultas. Esto permitir�');
    Add('  obtener informaci�n de todos los datos que se han creado en');
    Add('   las tablas y se usa la misma sintaxis de SQL.</p>');
    Add('');
    Add('<p style="text-align: justify">Para ello, hay que dirigirse a �Crear� > �Dise�o de Consulta�.');
    Add(' Una vez all�, se agreg� las tablas que se quieren consultar ');
    Add(' y se podr� ingresar las consultas que se desean hacer. Luego, ');
    Add(' se debe hacer clic en la opci�n �Ejecutar� que se encuentra');
    Add('  en la parte superior izquierda. Hecho esto, la consulta est�');
    Add('   lista.</p>');
    Add('');
    Add('<p style="text-align: justify">Otra herramienta es el asistente de consulta que permite crear ');
    Add('consultas de manera autom�tica. Tambi�n ayudar� a detectar ');
    Add('errores en el dise�o de las consultas y sugerir� crear ');
    Add('relaciones en las tablas.</p>');
    Add('');
    Add('<p style="text-align: justify">Tomado de <a ' +
      'href="https://www.ardilu.com/guias/microsoft-access-que-es">https://www.ardilu.com/guias/microsoft-access-que-es</a> ');
  end;

  agregarAplicacion('Microsoft Access',
    Utilidades.StringsToText(platDescripcion), 5,
    FrutaImagenes + 'MSAccess.jpg');
end;

procedure TFImportarPlataforma.crearNodeJS;
begin
  platDescripcion.Clear;
  With platDescripcion do
  begin
    Add('<p style="text-align: justify">Ideado como un entorno de ejecuci�n de JavaScript orientado a ');
    Add(' eventos as�ncronos, Node.js est� dise�ado para crear aplicaciones');
    Add(' network escalables.</p>');
    Add('');
    Add('<p style="text-align: justify">Esto contrasta con el modelo de concurrencia m�s com�n de hoy ');
    Add(' en d�a, en el que se emplean hilos del Sistema Operativo. Las ');
    Add(' redes basadas en hilos son relativamente ineficientes y muy ');
    Add(' dif�ciles de usar. Adem�s, los usuarios de Node.js est�n libres');
    Add(' de preocuparse por el bloqueo del proceso, ya que no existe. ');
    Add(' Casi ninguna funci�n en Node.js realiza I/O directamente, por');
    Add(' lo que el proceso nunca se bloquea. Por ello, es muy propicio');
    Add(' desarrollar sistemas escalables en Node.js.</p>');
    Add('');
    Add('Node.js es similar en dise�o y est� influenciado por sistemas ');
    Add(' como Event Machine de Ruby y Twisted de Python. Pero Node.js ');
    Add(' lleva el modelo de eventos un poco m�s all�. Incluye un bucle');
    Add(' de eventos como runtime de ejecuci�n en lugar de una biblioteca.');
    Add(' En otros sistemas siempre existe una llamada de bloqueo para ');
    Add(' iniciar el bucle de eventos. Por lo general, el comportamiento');
    Add(' se define mediante devoluciones callbacks de llamada al ');
    Add(' iniciarse un script y al final se inicia un servidor a trav�s');
    Add(' de una llamada de bloqueo como EventMachine::run(). ');
    Add(' En Node.js, no existe como tal la llamada de inicio del ');
    Add(' evento de bucle o start-the-event-loop. Node.js simplemente ');
    Add(' entra en el bucle de eventos despu�s de ejecutar el script ');
    Add(' de entrada y sale cuando no hay m�s devoluciones callbacks ');
    Add(' de llamada para realizar. Se comporta de una forma similar ');
    Add(' a JavaScript en el navegador - el bucle de eventos est� ');
    Add(' oculto al usuario.</p>');
    Add('');
    Add('HTTP es un elemento destacado en Node.js, dise�ado teniendo ');
    Add(' en cuenta la transmisi�n de operaciones con streaming y baja ');
    Add(' latencia. Esto hace que Node.js sea muy adecuado para la base ');
    Add(' de una librer�a o un framework web.</p>');
    Add('');
    Add('<p style="text-align: justify">Que Node.js est� dise�ado para trabajar sin hilos no significa ');
    Add(' que no pueda aprovechar m�ltiples n�cleos en su entorno. ');
    Add(' Se pueden generar subprocesos o procesos hijos utilizando la ');
    Add(' API child\_process.fork(), la cual est� dise�ada para que la ');
    Add(' comunicaci�n entre ellos sea f�cil mediante su proceso principal. ');
    Add(' Desarrollada sobre esa misma interfaz est� el m�dulo cluster, ');
    Add(' que le permite compartir sockets entre procesos para permitir el ');
    Add(' balanceo de carga entre sus m�ltiples n�cleos.</p>');
    Add('');
    Add('Tomado de <a href="https://nodejs.org/es/about/">' +
      'https://nodejs.org/es/about/</a>');
    Add('');
    Add('');
    Add('');
  end;
  agregarAplicacion('Node.js', Utilidades.StringsToText(platDescripcion), 6,
    FrutaImagenes + 'NodeJS.jpg');
end;

procedure TFImportarPlataforma.crearPostgreSQL;
begin
  platDescripcion.Clear;
  With platDescripcion do
  begin
    Add('<p style="text-align: justify">PostgreSQL es un sistema de c�digo abierto empleado para gestionar bases de ');
    Add('datos de tipo relacional, aquellas que administran datos relacionados entre ');
    Add('s�, esto es, tablas integradas por registros (filas) y campos (columnas) en ');
    Add('la que cada registro tiene una �nica identidad, conocida como clave. Este ');
    Add('tipo de bases de datos son hoy en d�a utilizadas por la mayor�a de los ');
    Add('desarrolladores para crear sitios web.</p>');
    Add('');
    Add('<p style="text-align: justify">PostgreSQL o Postgres permite trabajar con ellas (hacer consultas, insertar ');
    Add('datos, modificarlos y eliminarlos), ya que cuenta con una gran cantidad de ');
    Add('opciones. Tambi�n ofrece la posibilidad de realizar consultas que no sean ');
    Add('relacionales.</p>');
    Add('');
    Add('<p style="text-align: justify">Las dos principales caracter�sticas de PostgreSQL ya se han mencionado: es ');
    Add('un sistema de c�digo abierto y gratuito, lo que, sin duda, ha contribuido ');
    Add('a extender su uso. Pero tiene m�s peculiaridades:</p>');
    Add('');
    Add('<ol style="text-align: justify">');
    Add('   <li>Al igual que sucede con la inmensa mayor�a de software de c�digo ');
    Add('   libre, PostgreSQL es multiplataforma, as� que puede funcionar con cualquier ');
    Add('   sistema operativo (Windows, macOS, Linux�) y adem�s es compatible con los ');
    Add('   servidores web m�s utilizados (Apache, Nginx y LiteSpeed).</li>');
    Add('   <li>Si hay algo que valoran sus usuarios es su f�cil uso, que en buena ');
    Add('   parte se debe a que se opera a trav�s de paneles con PgAdmin, una ');
    Add('   erramienta gr�fica muy intuitiva.</li>');
    Add('   <li>Es el administrador de bases de datos que m�s lenguajes de ');
    Add('   programaci�n soporta.</li>');
    Add('   <li>Permite consultas complejas, como operaciones de escritura y ');
    Add('   lectura con datos que exigen validaci�n.</li>');
    Add('   <li>Destaca tambi�n por el gran volumen de datos con el que permite ');
    Add('   rabajar, que marca la diferencia con otros sistemas.</li>');
    Add('   <li>Asimismo, ofrece escalabilidad, la capacidad para manejar una ');
    Add('   cantidad de datos que puede ir aumentando progresivamente. Podemos ');
    Add('   configurar el sistema en diferentes equipos y se ajusta a la memoria ');
    Add('   disponible.</li>');
    Add('   <li>Cumple con todos los principios ACID: atomicity, consistency, ');
    Add('   isolation y durability, o, lo que es lo mismo, asegura la total protecci�n ');
    Add('   de los datos gracias a su atomicidad, consistencia, aislamiento y ');
    Add('   durabilidad.</li>');
    Add('   <li>Cuenta con una gran variedad de extensiones, librer�as que podemos ');
    Add('   agregar al sistema una vez instalado para aumentar sus funciones. Podemos ');
    Add('   encontrarlas en el propio servidor, en la web oficial o en Internet.</li>');
    Add('   <li>Su estabilidad se presenta como la mejor garant�a de uso para ');
    Add('   quienes eligen este sistema.</li>');
    Add('</ol>');
    Add('');
    Add('<p style="text-align: justify">Tomado de <a href="https://www.unir.net/ingenieria/revista/postgre-sql/">'
      + 'https://www.unir.net/ingenieria/revista/postgre-sql/</a></p>');
    Add('');
  end;
  agregarAplicacion('PostgreSQL', Utilidades.StringsToText(platDescripcion), 7,
    FrutaImagenes + 'PostgreSQL.jpg');
end;

procedure TFImportarPlataforma.crearVisualStudio;
begin
  platDescripcion.Clear;
  With platDescripcion do
  begin
    Add('<p style="text-align: justify">Es un r�pido y cambiante mundo de desarrollo de software, ');
    Add(' es muy importante mantenerse actualizado con las herramientas ');
    Add(' que ayuden a agilizar las tareas y, por consiguiente, tener ');
    Add(' mayor productividad. En todas las �reas es fundamental estar ');
    Add(' al d�a con las novedades, pero en el �rea de Tecnolog�a es un ');
    Add(' mandamiento, tener que estar aprendiendo continuamente y ');
    Add(' utilizar las mejores herramientas. Evidentemente, para el ');
    Add(' desarrollo de aplicaciones se necesita un editor de c�digo, y ');
    Add(' Visual Studio Code es el editor m�s utilizado en la actualidad.</p>');
    Add('');
    Add('<p style="text-align: justify">Con el crecimiento de Cloud Computing, la automatizaci�n se ha');
    Add(' llevado a otro nivel, la infraestructura como c�digo es prueba');
    Add(' de ello, por lo tanto, los editores de c�digo no est�n ');
    Add(' limitados a los desarrolladores de software o programadores, ');
    Add(' tambi�n son utilizados por quienes se dedican a la parte de ');
    Add(' infraestructura, y m�s si se trabaja con una cultura DevOps. ');
    Add(' �Ahora todos escriben c�digo!</p>');
    Add('');
    Add('<p style="text-align: justify">Visual Studio Code (VS Code) es un editor de c�digo fuente ');
    Add(' desarrollado por Microsoft. Es software libre y multiplataforma, ');
    Add(' est� disponible para Windows, GNU/Linux y macOS. VS Code tiene ');
    Add(' una buena integraci�n con Git, cuenta con soporte para ');
    Add(' depuraci�n de c�digo, y dispone de un sinn�mero de extensiones, ');
    Add(' que b�sicamente ofrencen la posibilidad de escribir y ejecutar ');
    Add(' c�digo en cualquier lenguaje de programaci�n.</p>');
    Add('');
    Add('<p style="text-align: justify">Para tener una idea de la popularidad de Visual Studio Code ');
    Add(' y la aceptaci�n que ha tenido en el mundo de desarrollo, se puede ');
    Add(' consultar datos. Seg�n una encuesta realizada por Stack Overflow ');
    Add(' a m�s de 80,000 desarrolladores en mayo del 2021, Visual Studio ');
    Add(' Code es el entorno de desarrollo m�s usado y con mucha ');
    Add(' diferencia, un 71.06%.</p>');
    Add('');
    Add('<p style="text-align: justify">VS Code tiene una gran variedad de caracter�sticas �tiles para ');
    Add(' agilizar el trabajo, que lo hacen el editor preferido por muchos ');
    Add(' para trabajar los proyectos.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>Multiplataforma:</b> Es una caracter�stica importante en cualquier ');
    Add(' aplicaci�n y m�s si trata de desarrollo. Visual Studio Code est� ');
    Add(' disponible para Windows, GNU/Linux y macOS.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>IntelliSense:</b>Esta caracter�stica est� relacionada con la ');
    Add(' edici�n de c�digo, autocompletado y resaltado de sintaxis, lo ');
    Add(' que permite ser m�s �gil a la hora de escribir c�digo. Como su ');
    Add(' nombre lo indica, proporciona sugerencias de c�digo y ');
    Add(' terminaciones inteligentes en base a los tipos de variables, ');
    Add(' funciones, etc. Con la ayuda de extensiones se puede personalizar ');
    Add(' y conseguir un IntelliSense m�s completo para cualquier lenguaje.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>Depuraci�n:</b> Visual Studio Code incluye la funci�n de depuraci�n ');
    Add(' que ayuda a detectar errores en el c�digo. De esta manera, nos ');
    Add(' evitamos tener que revisar l�nea por l�nea a puro ojo humano ');
    Add(' para encontrar errores. VS Code tambi�n es capaz de detectar ');
    Add(' peque�os errores de forma autom�tica antes de ejecutar el c�digo ');
    Add(' o la depuraci�n como tal.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>Uso del control de versiones:</b> Visual Studio Code tiene ');
    Add(' compatibilidad con Git, por lo que se puede revisar diferencias ');
    Add(' o lo que se conoce con git diff, organizar archivos, realizar ');
    Add(' commits desde el editor, y hacer push y pull desde cualquier ');
    Add(' servicio de gesti�n de c�digo fuente (SMC). Los dem�s SMC est�n ');
    Add(' disponible por medio de extensiones.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>Extensiones:</b> Hasta ahora, se han mencionado varias veces el ');
    Add(' t�rmino extensiones porque es uno de los puntos fuertes. ');
    Add(' Visual Studio Code es un editor potente y en gran parte por ');
    Add(' las extensiones. Las extensiones permiten personalizar y agregar ');
    Add(' funcionalidad adicional de forma modular y aislada. Por ejemplo, ');
    Add(' para programar en diferentes lenguajes, agregar nuevos temas al ');
    Add(' editor, y conectar con otros servicios. Realmente las extensiones ');
    Add(' nos permiten tener una mejor experiencia, y lo m�s importante, ');
    Add(' no afectan en el rendimiento del editor, ya que se ejecutan en ');
    Add(' procesos independientes.</p>');
    Add('');
    Add('<p style="text-align: justify">Es importante entender qu� es Visual Studio Code y para qu� sirve. ');
    Add(' Como se ha resumido anteriormente, VS Code es un editor de c�digo ');
    Add(' optimizado que proporciona muchas facilidades para escribir, ');
    Add(' depurar y probar c�digo. �Qu� lenguajes soporta visual Studio Code?');
    Add(' Inicialmente incluye un m�nimo de componentes y funciones b�sicas ');
    Add(' de un editor con soporte nativo para JavaScript/TypeScript y ');
    Add(' Node.js, sin embargo, es personalizable con los cientos de ');
    Add(' plugins o extensiones disponibles para escribir c�digo en ');
    Add(' diferentes lenguajes.\\');
    Add('');
    Add('<p style="text-align: justify">VS Studio Code incluye una terminal con todas las funciones, ');
    Add(' la cual se inicia f�cilmente en el directorio de trabajo. ');
    Add(' La terminal integrada puede utilizar cualquier Shell instalado ');
    Add(' en el equipo, como PowerShell, Bash o cualquier otro. Contar ');
    Add(' con una terminal en el propio editor es de gran utilidad para ');
    Add(' ejecutar diferentes comandos necesarios cuando se esta ');
    Add(' desarrollando.\\');
    Add('');
    Add('<p style="text-align: justify">VS Code cuenta con funcionalidades sorprendentes de gran provecho');
    Add(' para cualquier profesional de IT, no est� limitado para ');
    Add(' desarrollar un tipo de aplicaci�n, va m�s all�. Con las ');
    Add(' extensiones adecuadas es posible conectarse remotamente a ');
    Add(' m�quinas virtuales por medio de SSH, contenedores y WSL ');
    Add(' (Windows Subsystem for Linux), obtener acceso al sistema de ');
    Add(' archivos, y por supuesto, gesti�n desde la terminal. Tambi�n, ');
    Add(' sirve para trabajar e implementar aplicaciones en contenedores y ');
    Add(' gestionar clusters de Kubernetes. La integraci�n con Microsoft ');
    Add(' Azure es formidable, por lo tanto, abre otro abanico de ');
    Add(' posibilidades para trabajar con VS Code.\\');
    Add('');
    Add('<p style="text-align: justify">Algo importante y una ventaja con respecto a un IDE completo ');
    Add(' que incluye todos los componentes en un solo paquete, es que, ');
    Add(' con VS Code se puede instalar �nicamente las herramientas de ');
    Add(' desarrollo requeridas.\\');
    Add('');
    Add('<p style="text-align: justify">Tomado de <a href="https://openwebinars.net/blog/que-es-visual-studio-code-y-que-ventajas-ofrece/">'
      + 'https://openwebinars.net/blog/que-es-visual-studio-code-y-que-ventajas-ofrece/</a>');
  end;
  agregarAplicacion('Visual Studio Code',
    Utilidades.StringsToText(platDescripcion), 8,
    FrutaImagenes + 'VisualStudio.jpg');
end;

procedure TFImportarPlataforma.FormCreate(Sender: TObject);
var
  desc: TStringList;
begin
  platDescripcion := TStringList.Create;

  FrutaImagenes := ExtractFilePath(ParamStr(0)) + '\Plataformas\';

  crearCorelDraw;
  crearFlatIcon;
  crearInkScape;

  crearPostgreSQL;
  crearMicrosoftAccess;

  crearDelphi;
  crearLazarus;
  crearNodeJS;

  crearVisualStudio;

  platDescripcion.Free;
end;

procedure TFImportarPlataforma.seleccionarAplicacion(Sender: TObject);
begin
  if lvPlataformas.Selected <> nil then
  begin
    FNombre := lvPlataformas.Selected.Caption;
    FDescripcion := lvPlataformas.Selected.SubItems[0];
    FrutaImagen := lvPlataformas.Selected.SubItems[1];
    FSelecciono := true;
    close;
  end;
end;

function TFImportarPlataforma.seleccionoPlataforma: boolean;
begin
  FSelecciono := false;
  ShowModal;

  result := FSelecciono;
end;

procedure TFImportarPlataforma.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure TFImportarPlataforma.SetNombre(const Value: string);
begin
  FNombre := Value;
end;

procedure TFImportarPlataforma.SetrutaImagen(const Value: string);
begin
  FrutaImagen := Value;
end;

procedure TFImportarPlataforma.SetrutaImagenes(const Value: string);
begin
  FrutaImagenes := Value;
end;

procedure TFImportarPlataforma.SetSelecciono(const Value: boolean);
begin
  FSelecciono := Value;
end;

end.
