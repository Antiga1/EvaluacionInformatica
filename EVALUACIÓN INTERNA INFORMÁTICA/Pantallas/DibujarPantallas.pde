// Funcions de Dibuix de les Pantalles

void dibuixaIntro1() {
  dibujarLogo();
  dibuixaCercleIntro();

  enableButtonsAcceso();
  bAcceder.display();
 bContraseña.display();
    bRegistrarse.display();
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
  confirma.display();
   
}

void dibuixaRepertori2() {
  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  enableButtonsMenu();
  Tablero();
  dibuixaColumna3();
  
  guardarAnotacion.display();
}

void dibuixaCalendario() {
  dibujarLogo();
  dibujarMenu();
  
  TablaC.display(350, 200, 1000, 600);
  enableButtonsMenu();
  c.display();
  
  b1.display();
  b2.display();
  b.display();
}

void dibujaPantallaAlumnos() {
  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  enableButtonsMenu();
  Tabla.display(325, 200, 1090, 600);
  enableTabla();
  b1.display();
  b2.display();
  b3.display();
}

void dibuixaPantalla05() {
  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  enableButtonsMenu();
}

void dibuixaPantallaRegisrarse(){
dibujarLogo();
  dibuixaCercleIntro();
  // Dibuixa les etiquetes de text
  fill(0);
  textSize(48);
  textAlign(LEFT);
  textSize(24);
  text("Username: ", 490, 425);
  text("Password: ", 490, 525);
  // Dibuixa els camps de text
  newuser.display();
  newpass.display();
  bConfirmar.display();
enableButtonsRegistrarse();
confirma1.display();
}


void dibuixaPantallaAñadirFecha(){

  fill(0);
  textSize(48);
  textAlign(LEFT);
  textSize(24);
  text("Alumno: ", 200, 200);
  text("Hora: ", 200, 300);
  text("dia: ", 200, 400);
  text("duracion: ", 200, 500);
  text("precio: ", 200, 600);
  // Dibuixa els camps de text
  newalumno.display();
  
  newhora.display();
  newduracion.display();
  newprecio.display();

  bConfirmar.display();
enableButtonsRegistrarse();
confirma1.display();
}

void dibuixaPantallaAñadirApertura(){
  fill(0);
  textSize(48);
  textAlign(LEFT);
  textSize(24);
  text("Nombre Apertura: ", 200, 200);
  text("Hora: ", 200, 300);
  text("dia: ", 200, 400);
  text("duracion: ", 200, 500);
  text("precio: ", 200, 600);
  // Dibuixa els camps de text
  newalumno.display();
  newdia.display();
  newhora.display();
  newduracion.display();
  newprecio.display();

  bConfirmar.display();
enableButtonsRegistrarse();
confirma1.display();
  


}
