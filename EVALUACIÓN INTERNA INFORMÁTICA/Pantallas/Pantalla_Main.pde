

enum PANTALLA {
  INTRO, REPERTORIO1, CALENDARIO, ALUMNOS, MISCLASES, PREPARACION, REPERTORIO2
};
enum Escac {
  REI_B, REINA_B, ALFIL_B, CAVALL_B, TORRE_B, PEO_B,
    REI_N, REINA_N, ALFIL_N, CAVALL_N, TORRE_N, PEO_N,
    BUIDA
};

PANTALLA pantalla = PANTALLA.INTRO;
PagedTable Tabla;
Tauler Tauler;
CalendariPlus c;

// Exemple d'ús de camps de Text

boolean logged = false;


// Declaració de les variables
TextField userText, passText;


void setup() {
  fullScreen();            // Pantalla completa
  noStroke();              // Sense bordes

  connexioBBDD();

  userText =  new TextField(600, 400, 300, 50);
  passText = new TextField(600, 500, 300, 50);
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

  case PREPARACION:
    dibuixaPantalla05();
    break;

  case ALUMNOS:
    dibujaPantallaAlumnos();

    break;
  }
  updateCursor();   // Modifica l'aparença del cursor
}



void mousePressed() {



  //PANTALLA INICI
  if (pantalla == PANTALLA.INTRO) {
    userText.isPressed();
    passText.isPressed();

    if (bIngresar.mouseOverButton() && bIngresar.enabled) {

      if (comprovaLogin() == true) {
        pantalla = PANTALLA.REPERTORIO1;
      }
    }
  }



  //PANTALLA DEL REPERTORI1
  if (pantalla == PANTALLA.REPERTORIO1) {
    if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (BotonesMenu[4].mouseOverButton() && BotonesMenu[4].enabled) {
      pantalla = PANTALLA.PREPARACION;
    } else if (BotonesRepertorio1[1].mouseOverButton() && BotonesRepertorio1[1].enabled) {
      pantalla = PANTALLA.REPERTORIO2;
    }
  }
  //PANTALLA CALENDARIO

  if ( pantalla == PANTALLA.CALENDARIO) {
    // Comprovar si clicam sobre botons del Calendari
    c.checkButtons();

    // Si pitja el botó, canvia la visibilitat del calendari.
    if (b.mouseOverButton()&&b.enabled) {
      c.visible = !c.visible;
    }

    if (c.bNext.mouseOverButton()) {
      c.nextMonth();
    }

    if (c.bPrev.mouseOverButton()) {
      c.prevMonth();
    }

    if (c.bOK.mouseOverButton() && c.dateSelected) {
      dataCalendari = c.selectedDay +"/"+ c.selectedMonth + "/"+ c.selectedYear;
      c.visible = false;
    }


    if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (BotonesMenu[4].mouseOverButton() && BotonesMenu[4].enabled) {
      pantalla = PANTALLA.PREPARACION;
    } else if (c.bNext.mouseOverButton()) {
      c.nextMonth();
    } else if (c.bPrev.mouseOverButton()) {
      c.prevMonth();
    } else if (c.bOK.mouseOverButton() && c.dateSelected) {
      dataCalendari = c.selectedDay +"/"+ c.selectedMonth + "/"+ c.selectedYear;
      c.visible = false;
    }
  }




  //PANTALLA MIS CLASES

  if ( pantalla == PANTALLA.MISCLASES) {
    if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (BotonesMenu[4].mouseOverButton() && BotonesMenu[4].enabled) {
      pantalla = PANTALLA.PREPARACION;
    }
  }

  //PANTALLA PREPARACIÓN
  if ( pantalla == PANTALLA.PREPARACION) {
    if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (BotonesMenu[4].mouseOverButton() && BotonesMenu[4].enabled) {
      pantalla = PANTALLA.PREPARACION;
    }
  }
  //PANTALLA REPERTORIO2
  if (pantalla == PANTALLA.REPERTORIO2) {
    Tauler.casellaMouse();

    if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (BotonesMenu[4].mouseOverButton() && BotonesMenu[4].enabled) {
      pantalla = PANTALLA.PREPARACION;
    } else if (BotonesRepertorio1[1].mouseOverButton() && BotonesRepertorio1[1].enabled) {
      pantalla = PANTALLA.REPERTORIO2;
    }
  }

  //PANTALLA ALUMNES
  if (pantalla == PANTALLA.ALUMNOS) {

    if (b1.mouseOverButton() && b1.enabled) {
      Tabla.nextPage();
    } else if (b2.mouseOverButton() && b2.enabled) {
      Tabla.prevPage();
    }


    if (BotonesMenu[0].mouseOverButton() ) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton()) {
      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() ) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() ) {
      pantalla = PANTALLA.MISCLASES;
    } else if (BotonesMenu[4].mouseOverButton() ) {
      pantalla = PANTALLA.PREPARACION;
    } else if (BotonesRepertorio1[1].mouseOverButton()) {
      pantalla = PANTALLA.REPERTORIO2;
    }
  }
}




// Modifica el cursor
void updateCursor() {

  if ((BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled)||
    (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled)||
    (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled)||
    (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled)||
    (BotonesMenu[4].mouseOverButton() && BotonesMenu[4].enabled)) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}


// Comprova si el login és correcte
boolean comprovaLogin() {
  if ( userText.text.equals("admin") && passText.text.equals("1234")) {
    return true;
  } else {
    return false;
  }
}
// Quan pitjam tecla
void keyPressed() {
  userText.keyPressed(key, (int)keyCode);
  passText.keyPressed(key, (int)keyCode);
  comprovaLogin();
  if ( pantalla == PANTALLA.CALENDARIO) {
    // Anar un mes enrere del calendari
    if (keyCode==LEFT) {
      c.prevMonth();
    }
    // Anar un mes endavant
    else if (keyCode==RIGHT) {
      c.nextMonth();
    }
  } else  if ( pantalla == PANTALLA.REPERTORIO2) {

    if (key=='m' || key=='M') {
      // Aplica la jugada seleccionada
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
