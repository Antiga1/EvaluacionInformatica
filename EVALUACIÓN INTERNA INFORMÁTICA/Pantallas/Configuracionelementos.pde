Button bRepertori1, bCalendario, bRegistroHoras, bMisClases, bPreparación,bIngresar;

// Dimensions dels botons
int buttonH = 100, buttonW = 300;

// Creació dels elements de la GUI
void setGUI() {
  initButtons();
  
}

// Creació dels botons de la GUI
void initButtons() {
  bRepertori1     = new Button("Repertorio", 0, 200, buttonW, buttonH);
  bCalendario     = new Button("Calendario", 0, 200 + buttonH + 2* marginV, buttonW, buttonH);
  bRegistroHoras = new Button("Registro Horas", 0, 200 + 2*buttonH + 4*marginV, buttonW, buttonH);
  bMisClases    = new Button("Mis Clases", 0, 200 + 3*buttonH + 6*marginV, buttonW, buttonH);
  bPreparación     = new Button("Preparación", 0, 200 + 4*buttonH + 8*marginV, buttonW, buttonH);
  bIngresar = new Button ("Acceder",600,150+ 3*buttonH + 8*marginV, 200,100);

}



// Activar els botons del menú
void enableButtonsMenu() {
  bRepertori1.setEnabled(true);
  bCalendario.setEnabled(true);
  bRegistroHoras.setEnabled(true);
  bMisClases.setEnabled(true);
  bPreparación.setEnabled(true);
}

void enableButtonsAcceso(){
   bIngresar.setEnabled(true);
}
