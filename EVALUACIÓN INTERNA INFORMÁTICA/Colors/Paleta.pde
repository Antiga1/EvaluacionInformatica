void setup() {
  size(800, 800);
  setColors();
 
}

void draw() {
  background(255);
  fill(getColorAt(4));
  noStroke();
  rect(0, 3*height/4, width, height/4);
  displayColors(100, 100, width-200);
  
 
  
 
}
