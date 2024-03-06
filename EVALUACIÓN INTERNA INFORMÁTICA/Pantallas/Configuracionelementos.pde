Button bIngresar;
Button[] BotonesMenu;
Button[] BotonesRepertorio1;
Button bAñadir,b, b1, b2;

String dataCalendari="";
// Dimensions dels botons
int buttonH = 100, buttonW = 300;

//creación tabla



// Creació dels elements de la GUI


void setGUI() {
  initButtons();
  TABLA();
}
void TABLA() {

  // Taula Paginada
  PagedTable t;

  // Dimensiones tabla
  float tableW = 800, tableH = 300;

  // Número de files (capçalera inclosa) i columnes de la taula
  int files = 8, columnes = 6;

  // Títols de les columnes
  String[] headers = {"Id", "Nombre", "Apellidos", "Edad", "Sexo", "Elo"};

  // Amplades de les columnes
  float[] colWidths = {10, 20, 40, 10, 20, 20};
  // Dades de la taula
  String[][] info = {
    {"1", "Marta", "Antich Fernández", "17", "Dona", "1930"},
    {"2", "Nicolás", "Dominguez Martinez", "15", "Home", "1779"},
    {"3", "David", "Dominguez Martinez", "18", "Home", "1450"},
    {"4", "Jaime", "Dominguez Martinez", "11", "Home", "1039"},
    {"5", "Monica", "Dominguez Martinez", "10", "Dona", "0"},
    {"6", "Pablo Luis", "Aguado Doncel", "17", "Home", "2100"},
    {"7", "Jordi", "Amengual Perelló", "20", "Home", "2100"},
    {"8", "Guiem", "Trave Gonzalez", "17", "Home", "1300"},
    {"9", "Bel", "Riera Mates", "52", "Dona", "1000"},
    {"10", "Jose", "Perez Galdós", "37", "Home", "1000"},
    {"11", "Pere", "Soler Miralles", "33", "Home", "1000"},
    {"12", "Maria", "Garcia Lopez", "25", "Dona", "1000"},
    {"13", "Joan", "Melis Cabrer", "47", "Home", "1000"},
    {"14", "Bel", "Riera Mates", "52", "Dona", "1000"},
    {"15", "Jose", "Perez Galdós", "37", "Home", "1000"},
    {"16", "Pepe", "Viyuela Lopez", "42", "Home", "1000"},
  };


  Tabla = new PagedTable(files, columnes);
  Tabla.setHeaders(headers);
  Tabla.setData(info);
  Tabla.setColumnWidths(colWidths);

  // Creació dels botons
  b1 = new Button(">", 1100, 805, buttonW/2, buttonH/2);
  b2 = new Button("<", 900, 805, buttonW/2, buttonH/2);
}

// Creació dels botons de la GUI
void initButtons() {

  bIngresar = new Button ("Acceder", 600, 150+ 3*buttonH + 8*marginV, 200, 100);
  bAñadir = new Button ("+", 13.5*marginH + 2*sidebarWidth+columnWidth, 1.5*marginV + bannerHeight, 50, 50);
  c = new CalendariPlus(350, 190, 1060, 691);
  b= new Button("Calendari", 300, 10, 150, 50);


  //tablero


  Tauler = new Tauler(340, 200, 680);
  Tauler.setImatges();
  Tauler.colocaFigures();

  //BOTONES MENU
  BotonesMenu = new Button[5];

  // Creació dels botons
  BotonesMenu[0] = new Button("Repertorio", 0, 200, buttonW, buttonH);
  BotonesMenu[1] = new Button("Calendario", 0, 200 + buttonH + 2* marginV, buttonW, buttonH);
  BotonesMenu[2] = new Button("Alumnos", 0, 200 + 2*buttonH + 4*marginV, buttonW, buttonH);
  BotonesMenu[3] = new Button("Mis Clases", 0, 200 + 3*buttonH + 6*marginV, buttonW, buttonH);
  BotonesMenu[4] = new Button("Preparación", 0, 200 + 4*buttonH + 8*marginV, buttonW, buttonH);

  //BOTONES REPERTORIO1
  BotonesRepertorio1 = new Button[3];

  BotonesRepertorio1[0] = new Button("Blancas", 2*marginH + sidebarWidth, 4.5*marginV + bannerHeight, columnWidth, 100);
  BotonesRepertorio1[1] = new Button("Escocesa", 2*marginH + sidebarWidth, 200 + buttonH + 2* marginV, columnWidth, 100);
  BotonesRepertorio1[2] = new Button("Negras", 4*marginH + sidebarWidth+columnWidth, 4.5*marginV + bannerHeight, columnWidth, 100);
}



// Activar els botons del menú
void enableButtonsMenu() {
  BotonesMenu[0].setEnabled(true);
  BotonesMenu[1].setEnabled(true);
  BotonesMenu[2].setEnabled(true);
  BotonesMenu[3].setEnabled(true);
  BotonesMenu[4].setEnabled(true);
}

//activar boton acceso
void enableButtonsAcceso() {
  bIngresar.setEnabled(true);
}
//activar botones tabla
void enableTabla() {
  b1.setEnabled(true);
  b1.setEnabled(true);
}

//activar botones repertorio
void EnableBotonesRepertorio1() {
  BotonesRepertorio1[0].setEnabled(true);
  BotonesRepertorio1[1].setEnabled(true);
  BotonesRepertorio1[2].setEnabled(true);
  bAñadir.setEnabled(true);
}
