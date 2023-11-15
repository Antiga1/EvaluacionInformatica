void dibujarLogo() {
  pushStyle();
  fill(#79b8f6);
  rect(marginH, marginV, logoWidth, logoHeight);
  fill(0);
  text("LOGOTIPO", marginH + logoWidth/2, marginV + logoHeight/2);
  popStyle();
}

void dibujarMenu() {
  pushStyle();
  fill(#66adf5);
  rect(marginH, 2*marginV + logoHeight, sidebarWidth, sidebarHeight);
  fill(0);
  text("MENU", marginH + sidebarWidth/2, marginV + logoHeight + sidebarHeight/2);
  popStyle();
  

}

void dibujarTitulo() {
  pushStyle();
  fill(#9fccf9);
  rect(2*marginH + logoWidth, marginV, bannerWidth, bannerHeight);
  fill(0);
  text("Titulo", marginH + logoWidth + bannerWidth/2, marginV + bannerHeight/2);
  popStyle();
}

void dibuixaColumna1() {
  pushStyle();
  fill(#b2d6fa);
  rect(2*marginH + sidebarWidth, 4.5*marginV + bannerHeight, columnWidth, columnHeight);
  fill(0);
  text("COLUMN 1", 2*marginH + sidebarWidth, 4.5*marginV + bannerHeight, columnWidth, columnHeight);
  popStyle();
}

void dibuixaColumna2() {
  pushStyle();
  fill(#b2d6fa);
  rect(4*marginH + sidebarWidth+columnWidth, 4.5*marginV + bannerHeight, columnWidth, columnHeight);
 fill(0);
text("COLUMN 2",4*marginH + sidebarWidth+columnWidth, 4.5*marginV + bannerHeight, columnWidth, columnHeight);
  popStyle();
}

void DibujaCalendario() {
  pushStyle();
  fill(#e0e0e0);
  rect(3*marginH + sidebarWidth, 2*marginV + bannerHeight, columnWidth + marginH, 1.08*columnHeight);
  fill(0);
  text("Calendario", 3*marginH + sidebarWidth + columnWidth, 2*marginV + bannerHeight + columnHeight/2);
  popStyle();
}

void Tablero() {
  pushStyle();
  fill(0);
  rect(4*marginH + sidebarWidth , 2*marginV + bannerHeight, Tablerox,Tableroy);
  fill(255);
  text("TABLERO", 4*marginH + sidebarWidth + 2*columnWidth +columnWidth/2, 2*marginV + bannerHeight + columnHeight/2);
  popStyle();
}


void dibuixaCercleIntro() {

  pushStyle();
  fill(255);
  ellipse(20*marginH+logoWidth, 3*marginV+logoWidth/2, CirculoPerfil, CirculoPerfil);
  fill(0);

  text("Perfil", 17.5*marginH+logoWidth, 1.5*marginV+logoWidth/2, CirculoPerfil/2, CirculoPerfil/2 );
  popStyle();
}


void dibuixaColumna3(){
   pushStyle();
  fill(#b2d6fa);
  rect(15*marginH + sidebarWidth+columnWidth, 2*marginV + bannerHeight, Tablax,Tablay);
 fill(0);
text("Anotacion",15*marginH + sidebarWidth+columnWidth, 3*marginV + bannerHeight, Tablax,Tablay);
  popStyle();
}
