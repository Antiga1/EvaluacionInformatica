enum PANTALLA {
  INTRO, REPERTORIO1, CALENDARIO, REGISTROHORAS, MISCLASES, PREPARACION
};
PANTALLA pantalla = PANTALLA.INTRO;

// Exemple d'ús de camps de Text

boolean logged = false;

// Declaració de les variables
TextField userText, passText;


void setup() {
  fullScreen();            // Pantalla completa
  noStroke();              // Sense bordes

  userText =  new TextField(600, 400, 300, 50);
  passText = new TextField(600, 500, 300, 50);
  loadMedia();
  loadFonts();// Càrrega dels elements multimèdia
  setGUI();      // Estableix els paràmetres de la GUI
}

void draw() {

  background(50);    // Color del fondo



  switch(pantalla) {
  case INTRO:
    dibuixaIntro1();
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
    break;
    
  case REPERTORIO1:
    dibuixaRepertori1();
    break;
    
  case CALENDARIO:
    dibuixaCalendario();
    break;
    
  case MISCLASES:
    dibuixaPantalla04();
    break;
    
  case PREPARACION:
    dibuixaPantalla04();
    break;
    
  case REGISTROHORAS:
    dibuixaPantalla04();
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



  //PANTALLA DEL REPERTORI
  if (pantalla == PANTALLA.REPERTORIO1) {
    if (bRepertori1.mouseOverButton() && bRepertori1.enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (bCalendario.mouseOverButton() && bCalendario.enabled) {
      println("Pantalla Punts");
      pantalla = PANTALLA.CALENDARIO;
    } else if (bRegistroHoras.mouseOverButton() && bRegistroHoras.enabled) {
      pantalla = PANTALLA.REGISTROHORAS;
    } else if (bMisClases.mouseOverButton() && bMisClases.enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (bPreparación.mouseOverButton() && bPreparación.enabled) {
      pantalla = PANTALLA.PREPARACION;
    }
  }
  //PANTALLA CALENDARIO

  if ( pantalla == PANTALLA.CALENDARIO) {
    if (bRepertori1.mouseOverButton() && bRepertori1.enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (bCalendario.mouseOverButton() && bCalendario.enabled) {
      println("Pantalla Punts");
      pantalla = PANTALLA.CALENDARIO;
    } else if (bRegistroHoras.mouseOverButton() && bRegistroHoras.enabled) {
      pantalla = PANTALLA.REGISTROHORAS;
    } else if (bMisClases.mouseOverButton() && bMisClases.enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (bPreparación.mouseOverButton() && bPreparación.enabled) {
      pantalla = PANTALLA.PREPARACION;
    }
  }
  //PANTALLA REGISTRO HORAS
  if ( pantalla == PANTALLA.REGISTROHORAS) {
    if (bRepertori1.mouseOverButton() && bRepertori1.enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (bCalendario.mouseOverButton() && bCalendario.enabled) {
      println("Pantalla Punts");
      pantalla = PANTALLA.CALENDARIO;
    } else if (bRegistroHoras.mouseOverButton() && bRegistroHoras.enabled) {
      pantalla = PANTALLA.REGISTROHORAS;
    } else if (bMisClases.mouseOverButton() && bMisClases.enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (bPreparación.mouseOverButton() && bPreparación.enabled) {
      pantalla = PANTALLA.PREPARACION;
    }
  }
  
  //PANTALLA MIS CLASES
  
  if ( pantalla == PANTALLA.MISCLASES) {
    if (bRepertori1.mouseOverButton() && bRepertori1.enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (bCalendario.mouseOverButton() && bCalendario.enabled) {
      println("Pantalla Punts");
      pantalla = PANTALLA.CALENDARIO;
    } else if (bRegistroHoras.mouseOverButton() && bRegistroHoras.enabled) {
      pantalla = PANTALLA.REGISTROHORAS;
    } else if (bMisClases.mouseOverButton() && bMisClases.enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (bPreparación.mouseOverButton() && bPreparación.enabled) {
      pantalla = PANTALLA.PREPARACION;
    }
  }
  
  //PANTALLA PREPARACIÓN
  if ( pantalla == PANTALLA.PREPARACION) {
    if (bRepertori1.mouseOverButton() && bRepertori1.enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (bCalendario.mouseOverButton() && bCalendario.enabled) {
      println("Pantalla Punts");
      pantalla = PANTALLA.CALENDARIO;
    } else if (bRegistroHoras.mouseOverButton() && bRegistroHoras.enabled) {
      pantalla = PANTALLA.REGISTROHORAS;
    } else if (bMisClases.mouseOverButton() && bMisClases.enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (bPreparación.mouseOverButton() && bPreparación.enabled) {
      pantalla = PANTALLA.PREPARACION;
    }
  }
}
  



  // Modifica el cursor
  void updateCursor() {

    if ((bRepertori1.mouseOverButton() && bRepertori1.enabled)||
      (bCalendario.mouseOverButton() && bCalendario.enabled)||
      (bRegistroHoras.mouseOverButton() && bRegistroHoras.enabled)||
      (bMisClases.mouseOverButton() && bMisClases.enabled)||
      (bPreparación.mouseOverButton() && bPreparación.enabled)) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }


  // Comprova si el login és correcte
  boolean comprovaLogin() {
    if ( userText.text.equals("MARTA") && passText.text.equals("1234")) {
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
  }
