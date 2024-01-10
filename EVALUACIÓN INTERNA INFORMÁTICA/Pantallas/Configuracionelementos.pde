Button bIngresar;
Button[] BotonesMenu;
Button[] BotonesRepertorio1;
Button bAñadir;

String dataCalendari="";
// Dimensions dels botons
int buttonH = 100, buttonW = 300;

// Creació dels elements de la GUI
void setGUI() {
  initButtons();
  
  
  
}

// Creació dels botons de la GUI
void initButtons() {
 
  bIngresar = new Button ("Acceder",600,150+ 3*buttonH + 8*marginV, 200,100);
  bAñadir = new Button ("+",13.5*marginH + 2*sidebarWidth+columnWidth, 1.5*marginV + bannerHeight, 50,50);
  c = new CalendariPlus(3*marginH + sidebarWidth, 5*marginV + bannerHeight, 2*columnWidth + marginH, 1.08*columnHeight);
  //tablero
  
   
  t = new Tauler(340, 200, 680);
  t.setImatges();
  t.colocaFigures();
  
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
  
  BotonesRepertorio1[0] = new Button("Blancas",2*marginH + sidebarWidth, 4.5*marginV + bannerHeight, columnWidth,100);
  BotonesRepertorio1[1] = new Button("Escocesa",2*marginH + sidebarWidth, 200 + buttonH + 2* marginV, columnWidth,100);
  BotonesRepertorio1[2] = new Button("Negras",4*marginH + sidebarWidth+columnWidth, 4.5*marginV + bannerHeight, columnWidth,100);
  
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
void enableButtonsAcceso(){
   bIngresar.setEnabled(true);
}

//activar botones repertorio
void EnableBotonesRepertorio1(){
    BotonesRepertorio1[0].setEnabled(true);
   BotonesRepertorio1[1].setEnabled(true);
   BotonesRepertorio1[2].setEnabled(true);
    bAñadir.setEnabled(true);
}
