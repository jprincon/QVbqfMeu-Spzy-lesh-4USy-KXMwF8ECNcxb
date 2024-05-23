{Este formulario permite importar información por defecto de las plataformas
e IDEs usados para el desarrollo de la aplicación. La aplicación cuenta con
una información por defecto que le permite al usuario importarla para
la descripción técnica de su software}
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
    Add('<p style="text-align: justify">CorelDRAW® Graphics Suite 2020 es un programa líder de software de diseño ');
    Add('gráfico preferido por millones de profesionales, pequeños empresarios y ');
    Add('aficionados al diseño de todo el mundo. Ofrece una experiencia de diseño ');
    Add('transparente para gráficos, diseño de páginas, ilustración, edición de ');
    Add('fotografías, vectorización, imágenes para Web, proyectos para impresión, ');
    Add('arte, tipografía y mucho más.</p>');
    Add('');
    Add('<p style="text-align: justify">El programa CorelDRAW es parte del paquete de Corel Graphics Suite diseñado ');
    Add('por Corel Corporation, que cuenta con varias versiones desde la más básica ');
    Add('hasta la más avanzada y reciente.</p>');
    Add('');
    Add('<p style="text-align: justify">Este software se utiliza en ámbitos de artes gráficas y comunicación con el ');
    Add('propósito de producir, editar y transformar imágenes a nivel digital. Se trata');
    Add(' de una aplicación de dibujo vectorial, con herramientas de diagramación, ');
    Add(' efectos y funciones sobre imágenes y páginas y alternativas de retoque y ');
    Add(' dición múltiples. Se utiliza a menudo para generar imágenes y gráficos desde');
    Add('  cero, pero también permite editar fotografías, dibujos y otro tipo de ');
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
    Add('<p style="text-align: justify">Además de ser uno de los programas más populares, el CorelDRAW es también ');
    Add('reconocido como uno de los más sofisticados softwares en edición de imágenes.</p>');
    Add('');
    Add('<p style="text-align: justify">Entre sus características más reconocidas en el mercado, se cuentan la ');
    Add('versatilidad que tiene para usarlo en diferentes tareas y operaciones de ');
    Add('diseño gráfico, publicidad, prensa, diseño web, arquitectura, diseño ');
    Add('industrial y textil, gigantografías y otros, la compatibilidad con archivos ');
    Add('de diversos formatos de gráficos vectoriales, mapas de bits y otros, y con ');
    Add('programas similares y la usabilidad en cuanto a posibilidades de ');
    Add('personalizarlo al gusto y elección de cada usuario.</p>');
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
    Add('<p style="text-align: justify">Embarcadero es una compañía de software norteamericana.');
    Add(' Fue fundada en 1993 y desde entonces se ha dedicado al ');
    Add(' desarrollo de herramientas, IDEs y compiladores para ');
    Add(' desarrolladores de software, DBA' + #39 + 's y arquitectos de ');
    Add(' software. El primer CEO fue Ben T. Smith IV, siendo el ');
    Add(' actual Jim Douglas. El 7 de mayo de 2008 Borland y ');
    Add(' Embarcadero Technologies anunciaron que Embarcadero había ');
    Add(' llegado a un acuerdo con Borland para la compra de CodeGear.');
    Add('  El proceso de compra finalizó en junio de 2008.</p>');
    Add('  ');
    Add('<p style="text-align: justify">RAD Studio™ es la manera más rápida de desarrollar apps ');
    Add(' nativas multiplataforma con servicios flexibles de nube');
    Add(' y amplia conectividad con IoT. Ofrece controles VCL ');
    Add(' para Windows 10 y posibilita el desarrollo con FMX');
    Add(' para Windows, Mac y móviles. RAD Studio es compatible ');
    Add(' con Delphi o C++ y ofrece una amplia variedad de ');
    Add(' servicios para Enterprise Strong Development™. ');
    Add(' Aprovecha más memoria para proyectos más grandes, ');
    Add(' soporte extendido para múltiples monitores, un ');
    Add(' Inspector de objetos mejorado y mucho más. RAD Studio es ');
    Add(' 5 veces más rápido en el desarrollo y la implementación ');
    Add(' para múltiples plataformas móviles, de escritorio, ');
    Add(' nubes y bases de datos, incluido Windows 10 de 32 bits y ');
    Add(' 64 bits.</p>');
    Add(' ');
    Add('<p style="text-align: justify">El desarrollo rápido de aplicaciones o RAD (acrónimo en inglés');
    Add(' de rapid application development) es un proceso de desarrollo');
    Add(' de software, desarrollado inicialmente por James Martin en');
    Add(' 1991 basado en el trabajo hecho por Scott Shultz en los 80.');
    Add(' El método comprende el desarrollo interactivo, la construcción');
    Add(' de prototipos y el uso de utilidades CASE (ingeniería ');
    Add(' asistida por computadora). Tradicionalmente, el desarrollo');
    Add(' rápido de aplicaciones tiende a englobar también la ');
    Add(' usabilidad, utilidad y la rapidez de ejecución.</p>');
    Add('');
    Add('<p style="text-align: justify">Hoy en día se suele utilizar para referirnos al desarrollo rápido');
    Add(' de interfaces gráficas de usuario tales como Glade, o entornos');
    Add(' de desarrollo integrado completos. Algunas de las plataformas');
    Add(' más conocidas son Visual Studio, Lazarus, Gambas, Delphi, ');
    Add(' Foxpro, Anjuta o Game Maker. En el área de la autoría ');
    Add(' multimedia, software como Neosoft Neobook y MediaChance ');
    Add(' Multimedia Builder proveen plataformas de desarrollo ');
    Add(' rápido de aplicaciones, dentro de ciertos límites.</p>');
    Add('');
    Add('<p style="text-align: justify">Principios básicos:</p>');
    Add('  ');
    Add('<ol style="text-align: justify">');
    Add(' <li>Objetivo clave es para un rápido desarrollo y entrega de ');
    Add(' una alta calidad en un sistema de relativamente bajo coste de ');
    Add(' inversión.</li>');
    Add(' <li>Intenta reducir los riesgos inherentes del proyecto ');
    Add(' partiéndolo en segmentos más pequeños y proporcionar más ');
    Add(' facilidad de cambio durante el proceso de desarrollo.</li>');
    Add(' <li>Orientación dedicada a producir sistemas de alta ');
    Add(' calidad con rapidez, principalmente mediante el uso de ');
    Add(' iteración por prototipos (en cualquier etapa de desarrollo), ');
    Add(' promueve la participación de los usuarios y el uso de ');
    Add(' herramientas de desarrollo computarizadas. Estas herramientas');
    Add('  pueden incluir constructores de Interfaz gráfica de usuario ');
    Add('  (GUI), Computer Aided Software Engineering (CASE) las ');
    Add('  herramientas, los sistemas de gestión de bases de datos ');
    Add('  (DBMS), lenguajes de programación de cuarta generación, ');
    Add('  generadores de código, y técnicas orientada a objetos.</li>');
    Add(' <li>Hace especial hincapié en el cumplimiento de la necesidad');
    Add('  comercial, mientras que la ingeniería tecnológica o la ');
    Add('  excelencia es de menor importancia.</li>');
    Add(' <li>Control de proyecto implica el desarrollo de prioridades');
    Add('  y la definición de los plazos de entrega. Si el proyecto empieza');
    Add('   a aplazarse, se hace hincapié en la reducción de requisitos ');
    Add('   para el ajuste, no en el aumento de la fecha límite.</li>');
    Add(' <li>La participación activa de los usuarios es imprescindible.</li>');
    Add(' <li>Iterativamente realiza la producción de software, en ');
    Add(' lugar de enfocarse en un prototipo.</li>');
    Add(' <li>Produce la documentación necesaria para facilitar el ');
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
    Add('cuadro de búsqueda o encontrar el paquete de iconos apropiado.</p>');
    Add('');
    Add('<p style="text-align: justify">Contiene todos los iconos que necesita, desde mascotas hasta ');
    Add('computadoras. Nunca tendrá que usar otro sitio web de ');
    Add('iconos después de usar Flaticon.</p>');
    Add('');
    Add('<p style="text-align: justify">Facilidad en el uso: A diferencia de muchos otros sitios web');
    Add(' de descarga de iconos que requieren numerosos pasos para');
    Add('  descargar un icono, Flaticon tiene uno de los métodos más ');
    Add('  simples. Todo lo que tiene que hacer es encontrar un icono ');
    Add('  perfecto para su necesidad, hacer clic en él, elegir el ');
    Add('  formato y elegir el tamaño. El icono se descargará de ');
    Add('  inmediato.</p>');
    Add('');
    Add('<p style="text-align: justify">Además, si se registra para obtener una cuenta gratuita de ');
    Add('Flaticon, puede crear sus propias colecciones de iconos y ');
    Add('descargarlas todas a la vez. Pero los usuarios solo tendrán ');
    Add('una cantidad limitada de descargas / día.</p>');
    Add('');
    Add('<p style="text-align: justify">Paquetes de iconos Flaticon: El paquete de iconos es un grupo');
    Add(' de iconos. Los paquetes de iconos facilitan la búsqueda de ');
    Add(' iconos o iconos relacionados del mismo autor. De esta manera,');
    Add('  puede encontrar los mejores y más perfectos iconos para sus ');
    Add('  necesidades.</p>');
    Add('');
    Add('<p style="text-align: justify">Descarga en diferentes formatos: Flaticon permite descargar');
    Add(' sus iconos favoritos en cualquiera de los formatos PNG, ');
    Add(' SVG, EPS, PSD, Base 64. Si descargas el icono en formato ');
    Add(' PNG, tendrá la opción de seleccionar los tamaños preferidos');
    Add('  (16px, 24px, 32px, a 512px) y colores.</p>');
    Add('');
    Add('<p style="text-align: justify">Por lo tanto, puede personalizar los iconos incluso antes');
    Add(' de descargarlos. En otros formatos, no hay necesidad de ');
    Add(' tales opciones, por ejemplo, las imágenes SVG no perderán');
    Add('  su calidad a un tamaño enorme, por lo que no lo incluyeron.</p>');
    Add('');
    Add('<p style="text-align: justify">¿Por qué Flaticon ofrece iconos gratis?: Los iconos gratis');
    Add(' forman parte del modelo de negocio freemium, que significa');
    Add('  que la mayoría de los recursos que se ofrecen en Flaticon');
    Add('   se pueden utilizar de forma gratuita atribuyendo el ');
    Add('   recurso a Flaticon. Además, solo pagando una pequeña ');
    Add('   cantidad, un usuario puede suscribirse al Plan Premium');
    Add('    y podrá utilizar todas las ilustraciones sin tener que');
    Add('     atribuirlas al autor.</p>');
    Add('');
    Add('<p style="text-align: justify">Durante 10 días se puede utilizar la extensión sin limitación');
    Add(' alguna y pasado este período, se sigue teniendo acceso gratuito');
    Add('  a los 10 primeros iconos de cada búsqueda que hagas con la');
    Add('   extensión. La versión de pago no tiene limitación.</p>');
    Add('');
    Add('<p style="text-align: justify">Importancia de los iconos en la usabilidad: Los iconos tienen');
    Add(' como objetivo representar una acción o idea de manera visual');
    Add('  a través de un color, estilo y atractivo específicos.</p>');
    Add('');
    Add('<p style="text-align: justify">El propósito de un icono en una interfaz de usuario es');
    Add(' resonar con la personalidad de la marca de una manera');
    Add('  clara y coherente. Esto permite al usuario realizar su');
    Add('   tarea con mayor facilidad y flexibilidad.</p>');
    Add('');
    Add('<p style="text-align: justify">Es fundamental que el icono mantenga la claridad y la ');
    Add('coherencia. El icono es más que un elemento llamativo para');
    Add(' los usuarios. A muchos diseñadores les ha resultado difícil');
    Add('  decidir entre icono y texto en términos de usabilidad.</p>');
    Add('');
    Add('<p style="text-align: justify">El viejo dicho de que «una imagen vale más que mil palabras»');
    Add(' es válido para la usabilidad y la eficiencia del icono');
    Add('  sobre el texto.</p>');
    Add('');
    Add('<p style="text-align: justify">¿Qué pueden hacer los iconos?: Los iconos son un medio ');
    Add('eficaz para definir el significado en un espacio pequeño');
    Add(' en comparación con el texto. Esto se vuelve aún más ');
    Add(' importante en una era en la que los tamaños de pantalla ');
    Add(' se han reducido y los estándares de diseño receptivo han ');
    Add(' hecho que sea obligatorio redefinir el diseño según el ');
    Add(' tamaño de la pantalla. Los iconos elevan el elemento ');
    Add(' intuitivo del diseño web, un estándar de diseño importante.</p>');
    Add('');
    Add('<p style="text-align: justify">Propósito del icono para la interfaz de usuario: Para las ');
    Add('pantallas pequeñas, los íconos se pueden mejorar con el tacto');
    Add(' y sirven como buenos objetivos. Las barras de herramientas');
    Add('  y los elementos del menú de navegación tienen más espacio');
    Add('   para mostrarse porque los iconos liberan mucho espacio');
    Add('    que, de otro modo, sería utilizado por el texto.</p>');
    Add('');
    Add('<p style="text-align: justify">La memorabilidad se mejora mediante el uso de iconos porque');
    Add(' las imágenes se registran durante más tiempo en el cerebro');
    Add('  en comparación con el texto.</p>');
    Add('');
    Add('<p style="text-align: justify">Por lo tanto, los íconos permanecen más frescos en su mente,');
    Add(' lo que facilita que los usuarios los reconozcan. Los iconos');
    Add('  mejoran el atractivo visual del diseño y la coherencia');
    Add('   refuerza una clase de producto o servicio.</p>');
    Add('');
    Add('<p style="text-align: justify">Diseño de iconos: Un icono funciona bien en dispositivos');
    Add(' móviles ya que hay menos elementos en la pantalla del móvil');
    Add('  y el icono se destaca entre otros elementos.</p>');
    Add('');
    Add('<p style="text-align: justify">El caso se invierte cuando se mejora el tamaño de la ');
    Add('pantalla. En tales casos, el tamaño del icono debería ser ');
    Add('mayor y la navegación debería ser visible y no oculta ');
    Add('debajo del icono. Esto proporciona una mayor visibilidad de');
    Add(' las opciones del menú y evita problemas de usabilidad del');
    Add('  diseño. </p>');
    Add('');
    Add('<p style="text-align: justify">El enfoque debe estar en mejorar la memorabilidad para los');
    Add(' usuarios. El icono debería tardar unos segundos en ');
    Add(' transmitir su mensaje y significado.</p>');
    Add('');
    Add('<p style="text-align: justify">El diseño debe basarse en la funcionalidad y las ');
    Add('características específicas, en lugar de solo el atractivo');
    Add(' visual y la imagen gráfica. Los iconos deben probarse en ');
    Add(' cuanto a la memorabilidad (para verificar la naturaleza ');
    Add(' intuitiva y el refuerzo de la marca) con los usuarios para');
    Add('  medir la efectividad.</p>');
    Add('');
    Add('<p style="text-align: justify">Los íconos estéticos cuidadosamente diseñados con etiquetas');
    Add(' de texto aumentan tanto el atractivo como el alcance para');
    Add('  todo tipo de público. El enfoque del diseño debe ser ');
    Add('  trascender las barreras idiomáticas y culturales para ');
    Add('  destacar como un ícono verdaderamente global.</p>');
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
    Add('<p style="text-align: justify">Inkscape es un software de vectores gráficos de calidad profesional para ');
    Add('Windows, Mac OS X y GNU/Linux. Es usado por diseñadores profesionales y ');
    Add('aficionados de todo el mundo para crear una gran variedad de gráficos como ');
    Add('ilustraciones, iconos, logos, diagramas, mapas y diseños web. Inkscape es ');
    Add('un software libre y de código abierto, que utiliza SVG (Scalable Vector ');
    Add('Graphic), el estándar abierto de W3C, como formato nativo.</p>');
    Add('');
    Add('<p style="text-align: justify">Inkscape tiene herramientas de dibujo vectorial sofisticadas con capacidades');
    Add(' comparables con los estándares de la industria. Puede exportar e importar ');
    Add(' varios formatos de archivo, incluyendo SVG, AI, EPS, PDF, PS y PNG. Tiene ');
    Add(' funcionalidades muy fáciles de comprender, una interfaz sencilla, soporte ');
    Add(' multi-idiomas y está diseñado para ser extensible, los usuarios pueden ');
    Add(' personalizar las funcionalidades de Inkscape con sus múltiples extensiones.</p>');
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
    Add('<p style="text-align: justify">Lazarus es una herramienta de desarrollo rápido de aplicaciones');
    Add(' (RAD) basada en el lenguaje de programación Object Pascal, ');
    Add(' disponible para los sistemas operativos Windows, GNU/Linux y');
    Add(' Mac OS X.</p>');
    Add('');
    Add('<p style="text-align: justify">Se trata de una alternativa libre y gratuita a Delphi, ');
    Add('desarrollada como proyecto de software libre a partir de Free ');
    Add('Pascal. La web y la mayoría de la documentación están en inglés, ');
    Add('pero el entorno de desarrollo (IDE) sí está traducido al español ');
    Add('en gran parte.</p>');
    Add('');
    Add('<p style="text-align: justify">Lazarus fue creado en febrero de 1999 por Cliff Baeseman, ');
    Add('Shane Miller y Michael A. Hess, quienes luego de un frustrado ');
    Add('paso por el proyecto Megido, decidieron crear su propio software ');
    Add('de desarrollo rápido para Object Pascal.</p>');
    Add('');
    Add('<p style="text-align: justify">Lazarus es compatible con varios motores de bases de datos, ');
    Add('sin embargo el desarrollador debe instalar paquetes adicionales ');
    Add('para gestionar cada uno. El programador puede acceder a la ');
    Add('base de datos mediante código o bien arrastrando componentes ');
    Add('en un formulario visual. Los componentes de la base de datos ');
    Add('representan campos y son conectados por la correcta configuración ');
    Add('de propiedades a un TDataSource, que representa una tabla y ');
    Add('es también conectado a los componentes de la base de datos, ');
    Add('ya sea TPSQLDatabase, TSQLiteDataSet o algún otro.</p>');
    Add('');
    Add('<p style="text-align: justify">Los siguientes motores de bases de' +
      ' datos son compatibles:</p>');
    Add('');
    Add('<ol style="text-align: justify">');
    Add(' <li>PostgreSQL requiere el paquete PSQL</li>');
    Add(' <li>dBase y FoxPro pueden ser usados sin necesidad de un ');
    Add(' servidor externo o biblioteca mediante el componente TDbf</li>');
    Add(' <li>MySQL funciona correctamente</li>');
    Add(' <li>SQLite, necesita sólo una simple biblioteca externa y el ');
    Add(' componente TSQLiteDataSet o ZeosLib</li>');
    Add(' <li>Microsoft SQL Server, funciona con la biblioteca ZeosLib</li>');
    Add(' <li>InterBase / Firebird, componente de acceso nativo, ');
    Add(' también trabaja con ZeosLib</li>');
    Add(' <li>Oracle, también trabaja con ZeosLib</li>');
    Add(' <li>MariaDB, accesible a través de ZeosLib y a carpeta de ');
    Add(' archivo</li>');
    Add('</ol>');
    Add('');
    Add('<p style="text-align: justify">Aunque el software Lazarus está licenciado bajo la GPL, el ');
    Add('software desarrollado mediante el uso de esta herramienta ');
    Add('puede ser distribuido bajo alguna otra licencia. La biblioteca ');
    Add('de componentes de Lazarus (LCL) se vincula estáticamente dentro ');
    Add('de los programas y es licenciada usando una versión modificada ');
    Add('de la LGPL diseñada especialmente para permitir vinculaciones ');
    Add('estáticas a programas privativos.</p>');
    Add('');
    Add('<p style="text-align: justify">Nótese que instalar un paquete en tiempo de diseño equivale a ');
    Add('vincular al IDE. Distribuir el IDE Lazarus junto a paquetes en ');
    Add('tiempo de diseño con una licencia no compatible con GPL ');
    Add('(por ejemplo, MPL) preinstalados podría suponer una violación ');
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
    Add('<p style="text-align: justify">Microsoft Access es un sistema de administración de bases de');
    Add(' datos que te ayuda a administrar una gran cantidad de registros.');
    Add('  Además, permite crear aplicaciones que utilicen Access como');
    Add('   backend.</p>');
    Add('');
    Add('<p style="text-align: justify">A diferencia de Microsoft Excel, que se utiliza para el ');
    Add('análisis de datos y para realizar cálculos mediante fórmulas;');
    Add(' Access es más útil para recopilar, clasificar y manipular ');
    Add(' grandes cantidades de datos.</p>');
    Add('');
    Add('<p style="text-align: justify">Access incluye diferentes plantillas simplificadas para ');
    Add('adaptarse las necesidades del usuario. Estas plantillas permiten');
    Add(' crear base de datos con facilidad y utilizarlas como ');
    Add(' aplicaciones sin necesidad de tener conocimiento de programación.</p>');
    Add('');
    Add('<p style="text-align: justify">Es una buena herramienta para quienes no tiene mucha ');
    Add('experiencia en la creación y administración de base de datos.');
    Add(' En la pestaña de “Archivo” estarán las diferentes plantillas');
    Add('  disponibles con formularios, informes, tablas, o con diversos');
    Add('   campos que ya vienen creados por defecto.</p>');
    Add('');
    Add('<p style="text-align: justify">Access también permite exportar los datos con facilidad, sin');
    Add(' importar la cantidad de datos y si estos están vinculados a');
    Add('  fuentes diferentes. Entre sus opciones, permitirá exportarlos');
    Add('   a Excel con facilidad.</p>');
    Add('');
    Add('<p style="text-align: justify">Para usar esta función, hay que ir a la pestaña de ');
    Add('“Datos Externos” > Administrador de tablas vinculadas > ');
    Add('Exportar a Excel.</p>');
    Add('');
    Add('<p style="text-align: justify">Otra particularidad de este software es que se puede exportar');
    Add(' la base de datos en formato PDF. Esto es muy útil para compartir');
    Add('  las bases de datos con otros usuarios que no tengan el mismo');
    Add('   software y puedan verlas como si fueran imágenes. Con esta');
    Add('    función, podrán abrir el archivo en Adobe Reader sin ningún');
    Add('     problema.</p>');
    Add('');
    Add('<p style="text-align: justify">Para hacer esto solamente hay que dirigirse a la pestaña de');
    Add(' “Datos Externos ” y luego escoge la opción: “PDF o XPS”.  ');
    Add(' Guarda el archivo y listo. Se tendrán las bases de datos en PDF.</p>');
    Add('');
    Add('<p style="text-align: justify">Una función que va a encantar a los que conocen la sintaxis');
    Add(' de SQL es aquella que permite hacer consultas. Esto permitirá');
    Add('  obtener información de todos los datos que se han creado en');
    Add('   las tablas y se usa la misma sintaxis de SQL.</p>');
    Add('');
    Add('<p style="text-align: justify">Para ello, hay que dirigirse a “Crear” > “Diseño de Consulta”.');
    Add(' Una vez allí, se agregá las tablas que se quieren consultar ');
    Add(' y se podrá ingresar las consultas que se desean hacer. Luego, ');
    Add(' se debe hacer clic en la opción “Ejecutar” que se encuentra');
    Add('  en la parte superior izquierda. Hecho esto, la consulta está');
    Add('   lista.</p>');
    Add('');
    Add('<p style="text-align: justify">Otra herramienta es el asistente de consulta que permite crear ');
    Add('consultas de manera automática. También ayudará a detectar ');
    Add('errores en el diseño de las consultas y sugerirá crear ');
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
    Add('<p style="text-align: justify">Ideado como un entorno de ejecución de JavaScript orientado a ');
    Add(' eventos asíncronos, Node.js está diseñado para crear aplicaciones');
    Add(' network escalables.</p>');
    Add('');
    Add('<p style="text-align: justify">Esto contrasta con el modelo de concurrencia más común de hoy ');
    Add(' en día, en el que se emplean hilos del Sistema Operativo. Las ');
    Add(' redes basadas en hilos son relativamente ineficientes y muy ');
    Add(' difíciles de usar. Además, los usuarios de Node.js están libres');
    Add(' de preocuparse por el bloqueo del proceso, ya que no existe. ');
    Add(' Casi ninguna función en Node.js realiza I/O directamente, por');
    Add(' lo que el proceso nunca se bloquea. Por ello, es muy propicio');
    Add(' desarrollar sistemas escalables en Node.js.</p>');
    Add('');
    Add('Node.js es similar en diseño y está influenciado por sistemas ');
    Add(' como Event Machine de Ruby y Twisted de Python. Pero Node.js ');
    Add(' lleva el modelo de eventos un poco más allá. Incluye un bucle');
    Add(' de eventos como runtime de ejecución en lugar de una biblioteca.');
    Add(' En otros sistemas siempre existe una llamada de bloqueo para ');
    Add(' iniciar el bucle de eventos. Por lo general, el comportamiento');
    Add(' se define mediante devoluciones callbacks de llamada al ');
    Add(' iniciarse un script y al final se inicia un servidor a través');
    Add(' de una llamada de bloqueo como EventMachine::run(). ');
    Add(' En Node.js, no existe como tal la llamada de inicio del ');
    Add(' evento de bucle o start-the-event-loop. Node.js simplemente ');
    Add(' entra en el bucle de eventos después de ejecutar el script ');
    Add(' de entrada y sale cuando no hay más devoluciones callbacks ');
    Add(' de llamada para realizar. Se comporta de una forma similar ');
    Add(' a JavaScript en el navegador - el bucle de eventos está ');
    Add(' oculto al usuario.</p>');
    Add('');
    Add('HTTP es un elemento destacado en Node.js, diseñado teniendo ');
    Add(' en cuenta la transmisión de operaciones con streaming y baja ');
    Add(' latencia. Esto hace que Node.js sea muy adecuado para la base ');
    Add(' de una librería o un framework web.</p>');
    Add('');
    Add('<p style="text-align: justify">Que Node.js esté diseñado para trabajar sin hilos no significa ');
    Add(' que no pueda aprovechar múltiples núcleos en su entorno. ');
    Add(' Se pueden generar subprocesos o procesos hijos utilizando la ');
    Add(' API child\_process.fork(), la cual está diseñada para que la ');
    Add(' comunicación entre ellos sea fácil mediante su proceso principal. ');
    Add(' Desarrollada sobre esa misma interfaz está el módulo cluster, ');
    Add(' que le permite compartir sockets entre procesos para permitir el ');
    Add(' balanceo de carga entre sus múltiples núcleos.</p>');
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
    Add('<p style="text-align: justify">PostgreSQL es un sistema de código abierto empleado para gestionar bases de ');
    Add('datos de tipo relacional, aquellas que administran datos relacionados entre ');
    Add('sí, esto es, tablas integradas por registros (filas) y campos (columnas) en ');
    Add('la que cada registro tiene una única identidad, conocida como clave. Este ');
    Add('tipo de bases de datos son hoy en día utilizadas por la mayoría de los ');
    Add('desarrolladores para crear sitios web.</p>');
    Add('');
    Add('<p style="text-align: justify">PostgreSQL o Postgres permite trabajar con ellas (hacer consultas, insertar ');
    Add('datos, modificarlos y eliminarlos), ya que cuenta con una gran cantidad de ');
    Add('opciones. También ofrece la posibilidad de realizar consultas que no sean ');
    Add('relacionales.</p>');
    Add('');
    Add('<p style="text-align: justify">Las dos principales características de PostgreSQL ya se han mencionado: es ');
    Add('un sistema de código abierto y gratuito, lo que, sin duda, ha contribuido ');
    Add('a extender su uso. Pero tiene más peculiaridades:</p>');
    Add('');
    Add('<ol style="text-align: justify">');
    Add('   <li>Al igual que sucede con la inmensa mayoría de software de código ');
    Add('   libre, PostgreSQL es multiplataforma, así que puede funcionar con cualquier ');
    Add('   sistema operativo (Windows, macOS, Linux…) y además es compatible con los ');
    Add('   servidores web más utilizados (Apache, Nginx y LiteSpeed).</li>');
    Add('   <li>Si hay algo que valoran sus usuarios es su fácil uso, que en buena ');
    Add('   parte se debe a que se opera a través de paneles con PgAdmin, una ');
    Add('   erramienta gráfica muy intuitiva.</li>');
    Add('   <li>Es el administrador de bases de datos que más lenguajes de ');
    Add('   programación soporta.</li>');
    Add('   <li>Permite consultas complejas, como operaciones de escritura y ');
    Add('   lectura con datos que exigen validación.</li>');
    Add('   <li>Destaca también por el gran volumen de datos con el que permite ');
    Add('   rabajar, que marca la diferencia con otros sistemas.</li>');
    Add('   <li>Asimismo, ofrece escalabilidad, la capacidad para manejar una ');
    Add('   cantidad de datos que puede ir aumentando progresivamente. Podemos ');
    Add('   configurar el sistema en diferentes equipos y se ajusta a la memoria ');
    Add('   disponible.</li>');
    Add('   <li>Cumple con todos los principios ACID: atomicity, consistency, ');
    Add('   isolation y durability, o, lo que es lo mismo, asegura la total protección ');
    Add('   de los datos gracias a su atomicidad, consistencia, aislamiento y ');
    Add('   durabilidad.</li>');
    Add('   <li>Cuenta con una gran variedad de extensiones, librerías que podemos ');
    Add('   agregar al sistema una vez instalado para aumentar sus funciones. Podemos ');
    Add('   encontrarlas en el propio servidor, en la web oficial o en Internet.</li>');
    Add('   <li>Su estabilidad se presenta como la mejor garantía de uso para ');
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
    Add('<p style="text-align: justify">Es un rápido y cambiante mundo de desarrollo de software, ');
    Add(' es muy importante mantenerse actualizado con las herramientas ');
    Add(' que ayuden a agilizar las tareas y, por consiguiente, tener ');
    Add(' mayor productividad. En todas las áreas es fundamental estar ');
    Add(' al día con las novedades, pero en el área de Tecnología es un ');
    Add(' mandamiento, tener que estar aprendiendo continuamente y ');
    Add(' utilizar las mejores herramientas. Evidentemente, para el ');
    Add(' desarrollo de aplicaciones se necesita un editor de código, y ');
    Add(' Visual Studio Code es el editor más utilizado en la actualidad.</p>');
    Add('');
    Add('<p style="text-align: justify">Con el crecimiento de Cloud Computing, la automatización se ha');
    Add(' llevado a otro nivel, la infraestructura como código es prueba');
    Add(' de ello, por lo tanto, los editores de código no están ');
    Add(' limitados a los desarrolladores de software o programadores, ');
    Add(' también son utilizados por quienes se dedican a la parte de ');
    Add(' infraestructura, y más si se trabaja con una cultura DevOps. ');
    Add(' ¡Ahora todos escriben código!</p>');
    Add('');
    Add('<p style="text-align: justify">Visual Studio Code (VS Code) es un editor de código fuente ');
    Add(' desarrollado por Microsoft. Es software libre y multiplataforma, ');
    Add(' está disponible para Windows, GNU/Linux y macOS. VS Code tiene ');
    Add(' una buena integración con Git, cuenta con soporte para ');
    Add(' depuración de código, y dispone de un sinnúmero de extensiones, ');
    Add(' que básicamente ofrencen la posibilidad de escribir y ejecutar ');
    Add(' código en cualquier lenguaje de programación.</p>');
    Add('');
    Add('<p style="text-align: justify">Para tener una idea de la popularidad de Visual Studio Code ');
    Add(' y la aceptación que ha tenido en el mundo de desarrollo, se puede ');
    Add(' consultar datos. Según una encuesta realizada por Stack Overflow ');
    Add(' a más de 80,000 desarrolladores en mayo del 2021, Visual Studio ');
    Add(' Code es el entorno de desarrollo más usado y con mucha ');
    Add(' diferencia, un 71.06%.</p>');
    Add('');
    Add('<p style="text-align: justify">VS Code tiene una gran variedad de características útiles para ');
    Add(' agilizar el trabajo, que lo hacen el editor preferido por muchos ');
    Add(' para trabajar los proyectos.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>Multiplataforma:</b> Es una característica importante en cualquier ');
    Add(' aplicación y más si trata de desarrollo. Visual Studio Code está ');
    Add(' disponible para Windows, GNU/Linux y macOS.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>IntelliSense:</b>Esta característica está relacionada con la ');
    Add(' edición de código, autocompletado y resaltado de sintaxis, lo ');
    Add(' que permite ser más ágil a la hora de escribir código. Como su ');
    Add(' nombre lo indica, proporciona sugerencias de código y ');
    Add(' terminaciones inteligentes en base a los tipos de variables, ');
    Add(' funciones, etc. Con la ayuda de extensiones se puede personalizar ');
    Add(' y conseguir un IntelliSense más completo para cualquier lenguaje.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>Depuración:</b> Visual Studio Code incluye la función de depuración ');
    Add(' que ayuda a detectar errores en el código. De esta manera, nos ');
    Add(' evitamos tener que revisar línea por línea a puro ojo humano ');
    Add(' para encontrar errores. VS Code también es capaz de detectar ');
    Add(' pequeños errores de forma automática antes de ejecutar el código ');
    Add(' o la depuración como tal.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>Uso del control de versiones:</b> Visual Studio Code tiene ');
    Add(' compatibilidad con Git, por lo que se puede revisar diferencias ');
    Add(' o lo que se conoce con git diff, organizar archivos, realizar ');
    Add(' commits desde el editor, y hacer push y pull desde cualquier ');
    Add(' servicio de gestión de código fuente (SMC). Los demás SMC están ');
    Add(' disponible por medio de extensiones.</p>');
    Add('');
    Add('<p style="text-align: justify"><b>Extensiones:</b> Hasta ahora, se han mencionado varias veces el ');
    Add(' término extensiones porque es uno de los puntos fuertes. ');
    Add(' Visual Studio Code es un editor potente y en gran parte por ');
    Add(' las extensiones. Las extensiones permiten personalizar y agregar ');
    Add(' funcionalidad adicional de forma modular y aislada. Por ejemplo, ');
    Add(' para programar en diferentes lenguajes, agregar nuevos temas al ');
    Add(' editor, y conectar con otros servicios. Realmente las extensiones ');
    Add(' nos permiten tener una mejor experiencia, y lo más importante, ');
    Add(' no afectan en el rendimiento del editor, ya que se ejecutan en ');
    Add(' procesos independientes.</p>');
    Add('');
    Add('<p style="text-align: justify">Es importante entender qué es Visual Studio Code y para qué sirve. ');
    Add(' Como se ha resumido anteriormente, VS Code es un editor de código ');
    Add(' optimizado que proporciona muchas facilidades para escribir, ');
    Add(' depurar y probar código. ¿Qué lenguajes soporta visual Studio Code?');
    Add(' Inicialmente incluye un mínimo de componentes y funciones básicas ');
    Add(' de un editor con soporte nativo para JavaScript/TypeScript y ');
    Add(' Node.js, sin embargo, es personalizable con los cientos de ');
    Add(' plugins o extensiones disponibles para escribir código en ');
    Add(' diferentes lenguajes.\\');
    Add('');
    Add('<p style="text-align: justify">VS Studio Code incluye una terminal con todas las funciones, ');
    Add(' la cual se inicia fácilmente en el directorio de trabajo. ');
    Add(' La terminal integrada puede utilizar cualquier Shell instalado ');
    Add(' en el equipo, como PowerShell, Bash o cualquier otro. Contar ');
    Add(' con una terminal en el propio editor es de gran utilidad para ');
    Add(' ejecutar diferentes comandos necesarios cuando se esta ');
    Add(' desarrollando.\\');
    Add('');
    Add('<p style="text-align: justify">VS Code cuenta con funcionalidades sorprendentes de gran provecho');
    Add(' para cualquier profesional de IT, no está limitado para ');
    Add(' desarrollar un tipo de aplicación, va más allá. Con las ');
    Add(' extensiones adecuadas es posible conectarse remotamente a ');
    Add(' máquinas virtuales por medio de SSH, contenedores y WSL ');
    Add(' (Windows Subsystem for Linux), obtener acceso al sistema de ');
    Add(' archivos, y por supuesto, gestión desde la terminal. También, ');
    Add(' sirve para trabajar e implementar aplicaciones en contenedores y ');
    Add(' gestionar clusters de Kubernetes. La integración con Microsoft ');
    Add(' Azure es formidable, por lo tanto, abre otro abanico de ');
    Add(' posibilidades para trabajar con VS Code.\\');
    Add('');
    Add('<p style="text-align: justify">Algo importante y una ventaja con respecto a un IDE completo ');
    Add(' que incluye todos los componentes en un solo paquete, es que, ');
    Add(' con VS Code se puede instalar únicamente las herramientas de ');
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
