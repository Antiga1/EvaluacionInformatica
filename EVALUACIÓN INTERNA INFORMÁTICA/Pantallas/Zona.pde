void dibujarLogo() {
  pushStyle();
  fill(0);
  rect(marginH, marginV, logoWidth, logoHeight);
  fill(255);

  popStyle();
  image(imgLogo, 0, 0, logoWidth+ marginH, 2*marginV+ logoHeight);
}

void dibujarMenu() {
  pushStyle();
  fill(0);
  rect(0, 2*marginV + logoHeight, sidebarWidth+marginH, sidebarHeight+17);
  fill(255);
  text("MENU", marginH + sidebarWidth/2, marginV + logoHeight + sidebarHeight/2);
  popStyle();
  for (Button b : BotonesMenu) {
    b.display();
  }
}

void dibujarTitulo() {
  pushStyle();
  fill(0);
  rect(2*marginH + logoWidth, marginV, bannerWidth, bannerHeight);
  fill(255);
  text("Titulo", marginH + logoWidth + bannerWidth/2, marginV + bannerHeight/2);
  popStyle();
}

void dibuixaColumna1() {
  pushStyle();


  popStyle();
  for (Button b : BotonesRepertorio1) {
    b.display();
  }
  bAñadir.display();
}

void dibuixaColumna2() {
  pushStyle();
  fill(0);
  rect(4*marginH + sidebarWidth+columnWidth, 4.5*marginV + bannerHeight, columnWidth, columnHeight);
  fill(255);
  text("COLUMN 2", 4*marginH + sidebarWidth+columnWidth, 4.5*marginV + bannerHeight, columnWidth, columnHeight);
  popStyle();
}

void DibujaCalendario() {
  pushStyle();
  fill(#e0e0e0);
  rect(3*marginH + sidebarWidth, 2*marginV + bannerHeight, 2*columnWidth + marginH, 1.08*columnHeight);
  fill(0);
  text("Calendario", 3*marginH + sidebarWidth + columnWidth, 2*marginV + bannerHeight + columnHeight/2);
  // Rectangle


  // Text amb data seleccionada
  fill(0);
  textAlign(LEFT);
  textSize(24);
  text(dataCalendari, 190, 45);

  // Dibuixa el calendari
  c.display();


  popStyle();
}

void Tablero() {
  pushStyle();
  fill(255);

  fill(255);
  Tauler.display();

  popStyle();
}


void dibuixaCercleIntro() {

  pushStyle();
  fill(#e0e0e0);
  stroke(3);
  ellipse(23*marginH+logoWidth, 3*marginV+logoWidth/2, CirculoPerfil, CirculoPerfil);
  fill(0);

  textAlign(CENTER);
  text("Perfil", 20.5*marginH+logoWidth, 1.5*marginV+logoWidth/2, CirculoPerfil/2, CirculoPerfil/2 );
  popStyle();
}


void dibuixaColumna3() {
  pushStyle();
  fill(0);
  lv.display();
  fill(255);
  text("Anotacion", 15*marginH + sidebarWidth+columnWidth, 3*marginV + bannerHeight, Tablax, Tablay);
  popStyle();
}
