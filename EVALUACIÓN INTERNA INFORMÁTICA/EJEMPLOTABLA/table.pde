// Components de la GUI
// Taula
Table t;

// Dimensions de la taula
float tableW = 800, tableH = 300;

// Número de files (capçalera inclosa) i columnes de la taula
int files = 6, columnes = 1;

// Títols de les columnes 
String[] headers = {"APERTURA CON BLANCAS", "Nom"};

// Amplades de les columnes
float[] colWidths = {10, 20, 40, 10, 20};

// Dades de la taula
String[][] info = {
                     {"ESCOCESA", "Pere"},
                     {"2", "Maria"},
                     {"3", "Joan"},
                     {"4", "Bel"},
                     {"5", "Jose"},
                  };

void setup(){
  
  size(1200, 800);      // Dimensions de la Pantalla
  
  // Creació de la taula
  t = new Table(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);
  
}

void draw(){
 
  background(255);
  
  // Dibuixa la taula
  t.display(50, 50, tableW, tableH);
  
}
