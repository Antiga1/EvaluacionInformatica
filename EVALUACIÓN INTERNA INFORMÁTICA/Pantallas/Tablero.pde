class Tauler {

  Casella[][] caselles;
  float x, y, w, cw;

  PImage[] figures;

  int sel1Fila, sel1Col, sel2Fila, sel2Col;
  boolean sel1, sel2;

  Tauler(int x, int y, int w) {

    this.x = x;
    this.y = y;
    this.w = w;
    this.cw = w / 8;

    caselles = new Casella[8][8];
    int nc=0;
    for (int f=0; f<8; f++) {
      for (int c=0; c<8; c++) {
        float xc = x + c*cw;
        float yc = y + f*cw;
        color cc = ((f+nc)%2==0) ? color(255) : color(0);
        caselles[f][c] = new Casella(xc, yc, cw, f, c, cc);
        nc++;
      }
    }

    resetSeleccio();
  }

  int getFila(int f) {
    return 8 - f;
  }

  char getColumna(int c) {
    char simbol = 'A';
    return (char)(simbol + c);
  }

  String getFilaColumna(int f, int c) {
    return (getColumna(c)+""+getFila(f));
  }

  void resetSeleccio() {
    sel1 = false;
    sel2 = false;
    sel1Fila = -1;
    sel1Col = -1;
    sel2Fila = -1;
    sel2Col = -1;
  }

  void setImatges() {

    this.figures = new PImage[12];

    // Blanques
    figures[0] = loadImage("reinaB.png");  // Rei B
    figures[1] = loadImage("reiB.png");  // Reina B
    figures[2] = loadImage("alfilB.png");  // Alfil B
    figures[3] = loadImage("cavallB.png");  // Cavall B
    figures[4] = loadImage("torreB.png");  // Torre B
    figures[5] = loadImage("peoB.png");  // Peo B

    // Negres
    figures[6] = loadImage("reinaN.png");  // Rei N
    figures[7] = loadImage("reiN.png");  // Reina N
    figures[8] = loadImage("alfilN.png");  // Alfil N
    figures[9] = loadImage("cavallN.png");  // Cavall N
    figures[10] = loadImage("torreN.png");  // Torre N
    figures[11] = loadImage("peoN.png");  // Peo N
  }

  void colocaFigures() {
    caselles[0][0].setFigura(Escac.TORRE_N);
    caselles[0][7].setFigura(Escac.TORRE_N);
    caselles[0][1].setFigura(Escac.CAVALL_N);
    caselles[0][6].setFigura(Escac.CAVALL_N);
    caselles[0][2].setFigura(Escac.ALFIL_N);
    caselles[0][5].setFigura(Escac.ALFIL_N);
    caselles[0][3].setFigura(Escac.REI_N);
    caselles[0][4].setFigura(Escac.REINA_N);
    for (int i=0; i<8; i++) {
      caselles[1][i].setFigura(Escac.PEO_N);
    }

    caselles[7][0].setFigura(Escac.TORRE_B);
    caselles[7][7].setFigura(Escac.TORRE_B);
    caselles[7][1].setFigura(Escac.CAVALL_B);
    caselles[7][6].setFigura(Escac.CAVALL_B);
    caselles[7][2].setFigura(Escac.ALFIL_B);
    caselles[7][5].setFigura(Escac.ALFIL_B);
    caselles[7][3].setFigura(Escac.REI_B);
    caselles[7][4].setFigura(Escac.REINA_B);
    for (int i=0; i<8; i++) {
      caselles[6][i].setFigura(Escac.PEO_B);
    }
  }

  void display() {

    pushStyle();
    for (int f=0; f<8; f++) {
      for (int c=0; c<8; c++) {
        Casella ct = caselles[f][c];
        ct.display();
        if (ct.figura != Escac.BUIDA) {
          imageMode(CENTER);
          int n = ct.figura.ordinal();
          image(figures[n], ct.x + cw/2, ct.y + cw/2, cw, cw);
        }
      }
    }
    dibuixaLletres(this.y - 10);
    dibuixaLletres(this.y + this.w + 20);

    dibuixaNumeros(this.x - 20);
    dibuixaNumeros(this.x +  this.w + 20);

    popStyle();
  }

  void dibuixaLletres(float y) {
    char c = 'A';
    for (int i=0; i<8; i++) {
      textAlign(CENTER);
      textSize(15);
      text(c, this.x + i*this.cw + this.cw/2, y);
      c++;
    }
  }

  void dibuixaNumeros(float x) {
    for (int f=0; f<8; f++) {
      textAlign(CENTER);
      textSize(18);
      text(8 - f, x, this.y + f * this.cw + this.cw / 2);
    }
  }

  void casellaMouse() {
    for (int f=0; f<8; f++) {
      for (int c=0; c<8; c++) {
        Casella ct = caselles[f][c];
        // Seleccionar SEL1
        if (ct.mouseDinsCasella() && !sel1) {
          sel1 = true;
          ct.selected = true;
          sel1Fila = f;
          sel1Col = c;
        }
        // Deseleccionar SEL1
        else if (ct.mouseDinsCasella() && sel1 && sel1Fila == f && sel1Col == c) {
          sel1 = false;
          ct.selected = false;
        }
        // Seleccionar SEL2
        else if (ct.mouseDinsCasella() && sel1 && !sel2) {
          sel2 = true;
          ct.selected = true;
          sel2Fila = f;
          sel2Col = c;
        }
        // Deseleccionar SEL2
        else if (ct.mouseDinsCasella() && sel1 && sel2 && sel2Fila == f && sel2Col == c) {
          sel2 = false;
          ct.selected = false;
        }
      }
    }
  }

  void mouJugada() {
    if (sel1 && sel2) {

      Escac escac1 = caselles[sel1Fila][sel1Col].figura;
      Escac escac2 = caselles[sel2Fila][sel2Col].figura;
      String prefixe="";
      if ( escac2 == Escac.CAVALL_N || escac2 == Escac.CAVALL_B) {
        prefixe = "C";
      }

      String fcDesti = prefixe + getFilaColumna(sel2Fila, sel2Col);

      moviment(sel1Fila, sel1Col, sel2Fila, sel2Col);
    }
  }

  String getJugada() {

    Escac escac1 = caselles[sel1Fila][sel1Col].figura;

    String prefixe="";
    if ( escac1 == Escac.CAVALL_N || escac1 == Escac.CAVALL_B) {
      prefixe = "C";
    } else if ( escac1 == Escac.TORRE_N || escac1 == Escac.TORRE_B) {
      prefixe = "T";
    } else if ( escac1 == Escac.ALFIL_N || escac1 == Escac.ALFIL_B) {
      prefixe = "A";
    } else if ( escac1 == Escac.REI_N || escac1 == Escac.REI_B) {
      prefixe = "D";
    } else if ( escac1 == Escac.REINA_N || escac1 == Escac.REINA_B) {
      prefixe = "R";
    }
    String fcDesti = prefixe + getFilaColumna(sel2Fila, sel2Col);
    return fcDesti;
  }

  void moviment(int fo, int co, int fd, int cd) {
    this.caselles[fd][cd].figura = this.caselles[fo][co].figura;
    this.caselles[fo][co].figura = Escac.BUIDA;
    this.caselles[fd][cd].selected = false;
    this.caselles[fo][co].selected = false;
    resetSeleccio();
  }
  void resetPiezas() {
    // Limpiar todas las casillas del tablero
    for (int f = 0; f < 8; f++) {
      for (int c = 0; c < 8; c++) {
        caselles[f][c].setFigura(Escac.BUIDA);
      }
    }

    // Restablecer las piezas a su posición inicial
    // Blanques
    caselles[0][0].setFigura(Escac.TORRE_N);
    caselles[0][7].setFigura(Escac.TORRE_N);
    caselles[0][1].setFigura(Escac.CAVALL_N);
    caselles[0][6].setFigura(Escac.CAVALL_N);
    caselles[0][2].setFigura(Escac.ALFIL_N);
    caselles[0][5].setFigura(Escac.ALFIL_N);
    caselles[0][3].setFigura(Escac.REI_N);
    caselles[0][4].setFigura(Escac.REINA_N);
    for (int i = 0; i < 8; i++) {
      caselles[1][i].setFigura(Escac.PEO_N);
    }

    // Negres
    caselles[7][0].setFigura(Escac.TORRE_B);
    caselles[7][7].setFigura(Escac.TORRE_B);
    caselles[7][1].setFigura(Escac.CAVALL_B);
    caselles[7][6].setFigura(Escac.CAVALL_B);
    caselles[7][2].setFigura(Escac.ALFIL_B);
    caselles[7][5].setFigura(Escac.ALFIL_B);
    caselles[7][3].setFigura(Escac.REI_B);
    caselles[7][4].setFigura(Escac.REINA_B);
    for (int i = 0; i < 8; i++) {
      caselles[6][i].setFigura(Escac.PEO_B);
    }
  }
}
