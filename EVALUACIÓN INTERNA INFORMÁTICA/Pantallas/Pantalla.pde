int numPantalla = 1;  // Número de la Pantalla Actual

void setup() {
  fullScreen();            // Pantalla completa

  noStroke();              // Sense bordes
  textAlign(CENTER);       // Alineació del text
  textSize(18);            // Mida del text
}

void draw() {

  background(255);    // Color del fondo

  if (numPantalla==1) {
    dibuixaRepertori1();
  } else if (numPantalla == 2) {
    dibuixaPantalla02();
  } else if (numPantalla == 3) {
    dibuixaPantalla03();
  } else if (numPantalla == 4) {
    dibuixaPantalla04();
  } else if (numPantalla == 5) {
    dibuixaPantalla05();
  }


  pushStyle();
  fill(0);
  textSize(36);
  textAlign(RIGHT);
  text("PANTALLA "+numPantalla, width-50, 60);
  text("X: "+mouseX+", Y:"+mouseY, width-50, 100);
  popStyle();
}


void keyPressed() {
  if (keyCode==RIGHT) {
    numPantalla++;
  } else if (keyCode==LEFT) {
    numPantalla--;
  }
  numPantalla = constrain(numPantalla,1,5);
}
