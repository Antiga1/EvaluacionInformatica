class ButtonList {
  
  ArrayList<Button> buttons;
  float x, y;
  float w, h;
  
  
  ButtonList(float x, float y, float w, float h){
    this.buttons = new ArrayList();
    this.x = x; this.y = y; this.w = w; this.h = h;
  }
  
  void addButton(String text){
    float xb = x + (this.buttons.size()%4)*(w + 25);
    float yb = y + (this.buttons.size()/4)*(h + 25);
    Button b = new Button(text, xb, yb, w, h);
    this.buttons.add(b);
  }
  
    void addButton2(String text){
    float xb = x + (this.buttons.size()%1)*(w + 25);
    float yb = y + (this.buttons.size()/1)*(h + 25);
    Button b = new Button(text, xb, yb, w, h);
    this.buttons.add(b);
  }
  
  void deleteLastButton(){
    this.buttons.remove(this.buttons.size()-1);
  }
  
  void display(){
    for(int i=0; i<this.buttons.size(); i++){
      this.buttons.get(i).display();
    }
  }
  
  int checkButtons(){
    for(int i=0; i<this.buttons.size(); i++){
      if(this.buttons.get(i).mouseOverButton()){
        return i;
      }
    }
    return +-1;
  }
  
  String checkButtonsText(){
    for(int i=0; i<this.buttons.size(); i++){
      if(this.buttons.get(i).mouseOverButton()){
        return this.buttons.get(i).textBoto;
      }
    }
    return null;
  }
    
}
