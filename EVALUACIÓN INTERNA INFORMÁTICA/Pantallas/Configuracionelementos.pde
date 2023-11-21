Button bRepertori1, bCalendario, bRegistroHoras, bMisClases, bPreparación;

// Dimensions dels botons
int buttonH = 100, buttonW = 300;

// Creació dels elements de la GUI
void setGUI() {
  initButtons();
}

// Creació dels botons de la GUI
void initButtons() {
  bRepertori1     = new Button("Repertorio", 2*marginH, 360, buttonW, buttonH);
  bCalendario     = new Button("Calendario", 2*marginH, 360 + buttonH + 2* marginV, buttonW, buttonH);
  bRegistroHoras = new Button("Registro Horas", 2*marginH, 360 + 2*buttonH + 4*marginV, buttonW, buttonH);
  bMisClases    = new Button("Mis Clases", 2*marginH, 360 + 3*buttonH + 6*marginV, buttonW, buttonH);
  bPreparación     = new Button("Preparación", 2*marginH, 360 + 4*buttonH + 8*marginV, buttonW, buttonH);
}

// Activar els botons del menú
void enableButtons() {
  bRepertori1.setEnabled(true);
  bCalendario.setEnabled(true);
  bRegistroHoras.setEnabled(true);
  bMisClases.setEnabled(true);
  bPreparación.setEnabled(true);
}
