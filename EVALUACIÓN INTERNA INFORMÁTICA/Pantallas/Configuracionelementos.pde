Button bAcceder, bContraseña, bRegistrarse, bConfirmar;
Button[] BotonesMenu;

Button bAñadir, b, b1, b2,b3, bnextrepertorio,bprerepertorio;
Button guardarAnotacion;

String fechaEng = "2021-03-16";
String fechaEsp = "16/03/2021";

PagedTable Tabla, TablaC;
Tauler Tauler;
CalendariPlus c;
Confirm confirma, confirma1;
ListViewer lv;

// Botons de la GUI
ButtonList botons, botonsrepertorio ;
Button bAdd,bAdd2, bRemove,bRemove2;
boolean cursorHand = false;


// Color de fons de l'App
color bgColor = color(255);

// Dimensions del Confirm
float compW = 600;
float compH = 340;

// Textos del Confirm
String title = "Confirma!";
String message = "¿Quieres añadir una nueva apertura?";

String title1 = "Confirma!";
String message1 = "¿Quieres registrarte (el nombre de usuario no es modificable)";
// Exemple d'ús de camps de Text

boolean logged = false;

String dataCalendari="";
// Dimensions dels botons
int buttonH = 100, buttonW = 300;



// Creació dels elements de la GUI


void setGUI() {
  initButtons();
  TABLA();
  ButtonsAnotacion();
  confirma = new Confirm(title, message, 100, 100, compW, compH);
  confirma1 = new Confirm(title1, message1, 100, 100, compW, compH);
  confirma.setVisible(false);
  confirma1.setVisible(false);
  TableroGUI();
  TablaC();
 TEXTO();
 moviments();
 ListaBotones();
 conversionfecha();
}

void conversionfecha(){
 String fecha1 = formataFechaEsp(fechaEng);
  println("Format ESP: "+fecha1);
  
  // Formata fecha a format YYYY-MM-DD
  String fecha2 = formataFechaEng(fechaEsp);
  println("Format ENG: "+fecha2);

}
void ListaBotones(){
    // Creación de la Lista de Botones
    botons = new ButtonList(325, 200, 250, 150);
    botonsrepertorio = new ButtonList(2*marginH + sidebarWidth, 200 + buttonH + 2* marginV, columnWidth, 100);
    
    // Creación de los botones
    
    String[][] infoTaulaCLASE = getInfoTaulaCLASE(); // Llamada a la función
    for (String[] info : infoTaulaCLASE) {
        botons.addButton(info[1]); 
    }
    
    bAdd = new Button("+", 1270, 800, 70, 70);
    bRemove = new Button("-", 1350, 800, 70, 70);
    bRemove2 = new Button("-", 1350, 100, 70, 70);
    bAdd2 = new Button("+", 1270, 100, 70, 70);
    
    bnextrepertorio = new Button(">", 1160, 100, 70, 70);
    bprerepertorio = new Button("<", 1080, 100, 70, 70);
}
void ButtonsAnotacion() {
  
  guardarAnotacion = new Button ("save", 1100, 850, 100, 50);
}

void moviments(){
  lv = new ListViewer(1100, 210, 300, 640);
  lv.setNumItems(12);
  



}
void TABLA() {

  // Taula Paginada


  // Dimensiones tabla
  float tableW = 800, tableH = 300;

  // Número de files (capçalera inclosa) i columnes de la taula
  int files = 4, columnes = 6;

  // Títols de les columnes
  String[] headers = {"Id", "Nombre", "Apellidos", "Edad", "Elo", "Observaciones"};

  // Amplades de les columnes
  float[] colWidths = {5, 15, 30, 10, 10, 30};
  // Dades de la taula
  String[][]info = getInfoTaulaALUMNO();
  //files = getNumRowsTaula("ALUMNO");
  Tabla = new PagedTable(files, columnes);
  Tabla.setHeaders(headers);
  Tabla.setData(info);
  Tabla.setColumnWidths(colWidths);

  // Creació dels botons
   b3 = new Button("+", 1370, 805, 50, 50);
 
}


void TEXTO(){
  
  userText =  new TextField(600, 400, 400, 50);
  passText = new TextField(600, 500, 400, 50);
  
  newuser = new TextField(600, 400, 400, 50);
  newpass= new TextField(600, 500, 400, 50);
  
  newdia =new TextField(400, 350, 400, 50);
  
  newsesion = new TextField(1000, 150, 400, 50);
  newalumno = new TextField(400, 150, 400, 50);
  newhora = new TextField(400, 250, 400, 50);
  
  newprecio = new TextField(400, 550, 400, 50);
  newduracion = new TextField(400, 450, 400, 50);
  
  newidapertura = new TextField(500, 160, 500, 50);
  newnombreapertura =new TextField(500, 260, 500, 50);
  alumnoapertura= new TextField(500, 360, 500, 50);
  
  
  idclase= new TextField(500, 160, 500, 50);
  nombreclase= new TextField(500, 260, 500, 50);
  profesorclase= new TextField(500, 360, 500, 50);
  
idalumno1= new TextField(500, 50, 500, 50);
nombrealumno1= new TextField(500, 150, 500, 50);
apellidosalumno1= new TextField(500, 250, 500, 50);
edadalumno1= new TextField(500, 350, 500, 50);
eloalumno1= new TextField(500, 450, 500, 50);
observacionesalumno1= new TextField(500, 550, 500, 50);
  
}

void TablaC() {
  float tableW = 800, tableH = 300;

  // Número de files (capçalera inclosa) i columnes de la taula
  int files = 4, columnes = 6;

  // Títols de les columnes
  String[] headers = {"Id Sesion", "dia", "hora", "precio", "duración", "Alumno"};

  // Amplades de les columnes
  float[] colWidths = {10, 15, 30, 10, 10, 25};
  // Dades de la taula
  String[][]info = getInfoTaulaSESION();
  
  TablaC = new PagedTable(files, columnes);
  TablaC.setHeaders(headers);
  TablaC.setData(info);
  TablaC.setColumnWidths(colWidths);

  // Creació dels botons
  b1 = new Button(">", 1200, 805, buttonW/2, buttonH/2);
  b2 = new Button("<", 1045, 805, buttonW/2, buttonH/2);
}

void TableroGUI() {
  Tauler = new Tauler(340, 200, 680);
  Tauler.setImatges();
  Tauler.colocaFigures();
  
}

// Creació dels botons de la GUI
void initButtons() {
  bContraseña = new Button ("Cambiar contraseña", 600, 275+ 3*buttonH + 8*marginV, 400, 50);
  bRegistrarse = new Button ("Registrarse", 800, 150+ 3*buttonH + 8*marginV, 200, 100);
  bAcceder = new Button ("Acceder", 600, 150+ 3*buttonH + 8*marginV, 200, 100);
  bConfirmar = new Button ("Confirmar", 600, 150+ 3*buttonH + 8*marginV, 200, 100);
  
  bAñadir = new Button ("+1", 13.5*marginH + 2*sidebarWidth+columnWidth, 1.5*marginV + bannerHeight, 50, 50);
  
  c = new CalendariPlus(350, 190, 1060, 691);
  b= new Button("Calendario", 300, 10, 150, 50);


  //BOTONES MENU
  BotonesMenu = new Button[4];

  // Creació dels botons
  BotonesMenu[0] = new Button("Repertorio", 0, 200, buttonW, buttonH);
  BotonesMenu[1] = new Button("Calendario", 0, 200 + buttonH + 2* marginV, buttonW, buttonH);
  BotonesMenu[2] = new Button("Alumnos", 0, 200 + 2*buttonH + 4*marginV, buttonW, buttonH);
  BotonesMenu[3] = new Button("Mis Clases", 0, 200 + 3*buttonH + 6*marginV, buttonW, buttonH);


 
  
}



// Activar els botons del menú
void enableButtonsMenu() {
  BotonesMenu[0].setEnabled(true);
  BotonesMenu[1].setEnabled(true);
  BotonesMenu[2].setEnabled(true);
  BotonesMenu[3].setEnabled(true);
}

//activar boton acceso
void enableButtonsAcceso() {
  bAcceder.setEnabled(true);

  bContraseña.setEnabled(true);
  bRegistrarse.setEnabled(true);
}
void enableButtonsRegistrarse() {
  bConfirmar.setEnabled(true);
}
//activar botones tabla
void enableTabla() {
  b1.setEnabled(true);
  b1.setEnabled(true);
}

//activar botones repertorio
void EnableBotonesRepertorio1() {
 
  bAñadir.setEnabled(true);
}
