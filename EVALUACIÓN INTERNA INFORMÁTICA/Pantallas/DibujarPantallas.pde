// Funcions de Dibuix de les Pantalles

void dibuixaIntro1(){
  dibujarLogo();
  dibuixaCercleIntro();
  
   enableButtonsAcceso();
    bIngresar.display();
}

void dibuixaRepertori1(){

  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  dibuixaColumna1();
  enableButtonsMenu();
  EnableBotonesRepertorio1();



}

void dibuixaRepertori2(){
   dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  
   Tablero();
  dibuixaColumna3();
  enableButtonsMenu();
}

void dibuixaCalendario(){
   dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  DibujaCalendario();
  enableButtonsMenu();
}

void dibuixaPantalla04(){
  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  enableButtonsMenu();
}

void dibuixaPantalla05(){
  dibujarLogo();
  dibujarMenu();
  dibujarTitulo();
  enableButtonsMenu();
}
