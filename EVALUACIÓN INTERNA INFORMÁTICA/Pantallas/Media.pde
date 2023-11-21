// Elements Multimèdia de l'APP
// Imatges, tipografies, sons, ...



// Imatges
PImage imgLogo;
// Tipografies
PFont font1;

void loadMedia() {
  loadImages();
  loadFonts();
}

// Càrrega de les Imatges
void loadImages() {
  imgLogo = loadImage("Warrior.jpg");
}

// Càrrega de les Tipografies
void loadFonts() {
  font1 = createFont("Philo.ttf", 32);
}
