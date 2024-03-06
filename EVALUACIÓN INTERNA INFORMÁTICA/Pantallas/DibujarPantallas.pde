// Funcions de Dibuix de les Pantalles

void dibuixaIntro1() {
  dibujarLogo();
  dibuixaCercleIntro();

  enableButtonsAcceso();
  bIngresar.display();

  // Dibuixa les etiquetes de text
  fill(0);
  textSize(48);
  textAlign(LEFT);
  textSize(24);
  text("Username: ", 490, 425);
  text("Password: ", 490, 525);
  // Dibuixa els camps de text
  userText.display();
  passText.display();
}

void dibuixaRepertori1() {

  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  dibuixaColumna1();
  enableButtonsMenu();
  EnableBotonesRepertorio1();
}

void dibuixaRepertori2() {
  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  enableButtonsMenu();
  Tablero();
  dibuixaColumna3();
}

void dibuixaCalendario() {
  dibujarLogo();
  dibujarMenu();
  
  DibujaCalendario();
  enableButtonsMenu();
  c.display();
  
  // Dibuixa el botó
  b.display();
}

void dibujaPantallaAlumnos() {
  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  enableButtonsMenu();
  Tabla.display(350, 200, 800, 600);
  enableTabla();
  b1.display();
  b2.display();
}

void dibuixaPantalla05() {
  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  enableButtonsMenu();
}
