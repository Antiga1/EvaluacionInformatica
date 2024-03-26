

enum PANTALLA {
  INTRO, REPERTORIO1, CALENDARIO, ALUMNOS, MISCLASES, REPERTORIO2, REGISTRARSE,FECHA,APERTURA
};
enum Escac {
  REI_B, REINA_B, ALFIL_B, CAVALL_B, TORRE_B, PEO_B,
    REI_N, REINA_N, ALFIL_N, CAVALL_N, TORRE_N, PEO_N,
    BUIDA
};

PANTALLA pantalla = PANTALLA.REPERTORIO1;



// Declaració de les variables
TextField userText, passText, newuser, newpass,anotacion,newdia,newhora,newalumno,newprecio,newduracion;


void setup() {
  fullScreen();            // Pantalla completa
  noStroke();              // Sense bordes

  connexioBBDD();
  
  loadMedia();
  loadFonts();// Càrrega dels elements multimèdia
  setGUI();      // Estableix els paràmetres de la GUI
  
  int n = getNumRowsTaula("ALUMNO");
  println("NUM ALUMNOS:" +n);
}


void draw() {

  background(255);    // Color del fondo



  switch(pantalla) {
  case INTRO:
    dibuixaIntro1();

    break;

  case REPERTORIO2:
    dibuixaRepertori2();
    break;

  case REPERTORIO1:
    dibuixaRepertori1();
    break;

  case CALENDARIO:
    dibuixaCalendario();
    break;

  case MISCLASES:
    dibuixaPantalla05();
    break;

  case ALUMNOS:
    dibujaPantallaAlumnos();

    break;

  case REGISTRARSE:
    dibuixaPantallaRegisrarse();

    break;
    
    case FECHA:
    dibuixaPantallaAñadirFecha();
    break;
    
    case APERTURA:
    dibuixaPantallaAñadirApertura();
    break;
  }
  updateCursor();   // Modifica l'aparença del cursor
}




// Modifica el cursor
void updateCursor() {

  if ((BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled)||
    (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled)||
    (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled)||
    (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled)) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}




// Quan pitjam tecla
void keyPressed() {
  userText.keyPressed(key, (int)keyCode);
  passText.keyPressed(key, (int)keyCode);
  newuser.keyPressed(key, (int)keyCode);
  newpass.keyPressed(key, (int)keyCode);
  newalumno.keyPressed(key, (int)keyCode);
  newhora.keyPressed(key, (int)keyCode);
  newprecio.keyPressed(key, (int)keyCode);
  newduracion.keyPressed(key, (int)keyCode);
  
  if ( pantalla == PANTALLA.CALENDARIO) {
    // Anar un mes enrere del calendari
    if (keyCode==LEFT) {
      c.prevMonth();
      TablaC.prevPage();
    }
    // Anar un mes endavant
    else if (keyCode==RIGHT) {
      c.nextMonth();
      TablaC.nextPage();
    }
  } else  if ( pantalla == PANTALLA.REPERTORIO2) {

    if (key=='m' || key=='M') {
      // Aplica la jugada seleccionada
      String textJugada = Tauler.getJugada();
      int num = lv.items.size() + 1;
      lv.addItemToList(num + " " + textJugada);
      Tauler.mouJugada();
    }
  } else  if ( pantalla == PANTALLA.ALUMNOS) {
    if (keyCode==LEFT) {
      Tabla.prevPage();
    } else if (keyCode==RIGHT) {
      Tabla.nextPage();
    }
  }
   
}
