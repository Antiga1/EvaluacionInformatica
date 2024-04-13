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
  botonsrepertorio.display();
 bAdd2.display();
 bRemove2.display();
 bnextrepertorio.display();
 bprerepertorio.display();
   
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
   botons.display();
  bAdd.display();
  bRemove.display();
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
  text("id Alumno: ", 200, 200);
  text("Hora: ", 200, 300);
  text("dia: ", 200, 400);
  text("duracion: ", 200, 500);
  text("precio: ", 200, 600);
  text (" id sesion: ", 900,180);
  // Dibuixa els camps de text
  newalumno.display();
  newhora.display();
  newduracion.display();
  newprecio.display();
  newdia.display();
  newsesion.display();

  bConfirmar.display();
enableButtonsRegistrarse();
confirma1.display();
}

void dibuixaPantallaAñadirApertura(){
  fill(0);
  textSize(48);
  textAlign(LEFT);
  textSize(24);
  text("id apertura (número): ", 200, 200);
  text("Nombre: ", 200, 300);
  text("Alumno (id): ", 200, 400);
  
  // Dibuixa els camps de text
 alumnoapertura.display();
  newidapertura.display();
  newnombreapertura.display();
  

  bConfirmar.display();
enableButtonsRegistrarse();
confirma1.display();
  


}

void dibuixaPantallaUpdateContraseña(){
dibujarLogo();
  dibuixaCercleIntro();
  // Dibuixa les etiquetes de text
  fill(0);
  textSize(48);
  textAlign(LEFT);
  textSize(24);
  text("Username: ", 490, 425);
  
  // Dibuixa els camps de text

  newpass.display();
  bConfirmar.display();
confirma1.display();


}
void dibuixaPantallaAñadirAlumno(){

fill(0);
  textSize(48);
  textAlign(LEFT);
  textSize(24);
  text("id Alumno (número): ", 200, 100);
  text("Nombre: ", 200, 200);
  text("Apellidos : ", 200, 300);
  text("edad: ", 200, 400);
  text("elo: ", 200, 500);
  text("observaciones: ", 200, 570);
  
  // Dibuixa els camps de text
idalumno1.display();
nombrealumno1.display();
apellidosalumno1.display();
edadalumno1.display();
eloalumno1.display();
observacionesalumno1.display();
  
  bConfirmar.display();
enableButtonsRegistrarse();
confirma1.display();

}

void dibuixaPantallaAñadirClase(){

fill(0);
  textSize(48);
  textAlign(LEFT);
  textSize(24);
  text("id clase (número): ", 200, 200);
  text("Nombre: ", 200, 300);
  text("Profesor (id): ", 200, 400);
  
  // Dibuixa els camps de text
 idclase.display();
  nombreclase.display();
  profesorclase.display();
  
  bConfirmar.display();
enableButtonsRegistrarse();
confirma1.display();

}
