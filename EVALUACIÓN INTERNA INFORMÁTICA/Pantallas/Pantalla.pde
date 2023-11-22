enum PANTALLA {INTRO, REPERTORIO1, CALENDARIO, REGISTROHORAS, MISCLASES, PREPARACION};
PANTALLA pantalla = PANTALLA.INTRO;



void setup() {
  fullScreen();            // Pantalla completa
  noStroke();              // Sense bordes
  
  loadMedia();
  loadFonts();// Càrrega dels elements multimèdia
  setGUI();      // Estableix els paràmetres de la GUI
}

void draw() {

  background(50);    // Color del fondo
  
   switch(pantalla){
    case INTRO: dibuixaIntro1(); break;
    case REPERTORIO1: dibuixaRepertori1(); break;
    case CALENDARIO: dibuixaCalendario(); break;
    case MISCLASES: dibuixaPantalla04(); break;
    case PREPARACION: dibuixaPantalla04(); break;
    case REGISTROHORAS: dibuixaPantalla04(); break;
  } 
  
  String infoPantalla = pantalla.ordinal()+" ) "+pantalla.name();
  text(infoPantalla, width/2, height/2);  // Número i nom de la Pantalla
  
  updateCursor();   // Modifica l'aparença del cursor
  
}

void mousePressed(){
  
  if(bRepertori1.mouseOverButton() && bRepertori1.enabled){
    pantalla = PANTALLA.REPERTORIO1;
   
  }
  else if(bCalendario.mouseOverButton() && bCalendario.enabled){
    println("Pantalla Punts");
    pantalla = PANTALLA.CALENDARIO;
    
  }
  else if(bRegistroHoras.mouseOverButton() && bRegistroHoras.enabled){
    pantalla = PANTALLA.REGISTROHORAS;
   
  }
  else if(bMisClases.mouseOverButton() && bMisClases.enabled){
    pantalla = PANTALLA.MISCLASES;
    
  }
  else if(bPreparación.mouseOverButton() && bPreparación.enabled){
    pantalla = PANTALLA.PREPARACION;
  
  }
}


// Modifica el cursor
void updateCursor(){
  
  if((bRepertori1.mouseOverButton() && bRepertori1.enabled)||
     (bCalendario.mouseOverButton() && bCalendario.enabled)||
     (bRegistroHoras.mouseOverButton() && bRegistroHoras.enabled)||
     (bMisClases.mouseOverButton() && bMisClases.enabled)||
     (bPreparación.mouseOverButton() && bPreparación.enabled)){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }
  
}
