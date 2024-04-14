class ListViewer {

  ArrayList<ItemList> items;
  Button next, previous, resetButton; // Agrega el botón de reset
  
  float x, y, w, h;
  
  int start = 0;
  int numItems;
  
  
  ListViewer(float x, float y, float w, float h){
    this.x = x; this.y = y; this.w = w; this.h = h;
    this.items = new ArrayList();
    
    next = new Button(">",13.5*marginH + 2*sidebarWidth+columnWidth, 850, 50, 50);
    next.enabled = false;
    previous = new Button("<", 1295, 850, 50, 50);
    
    // Inicializa el botón de reset
    resetButton = new Button("Reset", 100, 850, 100, 50);
  }
  
  void setStartItem(int n){
    this.start = n;
  }
  
  void setNumItems(int n){
    this.numItems = n;
  }
  
  void addItemToList(String s){
    this.items.add(new ItemList(s));
  }
  
  // Función para eliminar jugadas de la lista
  void removeItem(int index) {
    if (index >= 0 && index < items.size()) {
      items.remove(index);
    }
  }
  
  void display(){
    
    pushStyle();
    fill(200);
    rect(x, y, w, h, 5);
    int s = this.start;
    int e = min(this.items.size(), s + numItems);
    for(int i= s; i< e; i++){
      this.items.get(i).display(x+5, y + (i-s)*50 + 5, w-10, 50);
    }
    
    next.display();
    previous.display();
    resetButton.display(); // Mostrar el botón de reset
    popStyle();
  }
  
  void buttonPressed(){
    if(next.mouseOverButton() && this.start>0){
      this.start--;
    }
    else if(previous.mouseOverButton() && this.start < this.items.size()){
      this.start++;
    }
    if(this.start >0){
      next.enabled  = true;
    }
    else {
      next.enabled = false;
    }
    if(this.start >= this.items.size()){
      previous.enabled = false;
    }
    else {
      previous.enabled = true;
    }
    
    // Verifica si se presionó el botón de reset
    if (resetButton.mouseOverButton()) {
      // Elimina todas las jugadas
      items.clear();
    }
  }
}
