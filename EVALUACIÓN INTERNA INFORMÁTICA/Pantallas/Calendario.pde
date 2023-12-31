import java.util.Calendar;

class Calendari {
  
  // Textos representatius dels mesos
  String[] Meses = {"Jan","Feb","Mar","Apr","May","Jun",
                     "Jul","Aug","Sep","Oct","Nov","Dec"};

  // Informació del calendari
  int año, mes, dia;
  int numeroDiasMes, numeroDiasMesPrevio;
  int DiaSemana, PrimerDia;
  
  // Data seleccionada
  boolean FechaSeleccionada = false;
  int DiaSeleccionado=0, MesSeleccionado=0, añoSeleccionado=0;
  
  // Calendario actual y del mes anterior
  Calendar cal, cPrev;
  
  // Botones del calendario
  DayButton[] buttons;
  
  // Dimensionse del calendari0
  float x, y, w, h;
  
  
  // Constructor
  Calendari(float x, float y, float w, float h){
    
    this.buttons = new DayButton[37];
    
    this.cal = Calendar.getInstance();
    cal.set(Calendar.DAY_OF_MONTH, 1);
    
    this.año = cal.get(Calendar.YEAR);
    this.mes = cal.get(Calendar.MONTH) + 1;
    this.dia = cal.get(Calendar.DATE);
    
    this.numeroDiasMes = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

    this.DiaSemana = cal.get(Calendar.DAY_OF_WEEK);
    if(DiaSemana==Calendar.SUNDAY){ this.DiaSemana = 6; }
    else { this.DiaSemana  = this.DiaSemana - 2; }

    cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
    this.PrimerDia = cal.get(Calendar.DATE);

    cPrev = Calendar.getInstance();
    setPrevCalendar(1, this.mes-2, this.año);
    
    this.numeroDiasMesPrevio = cPrev.getActualMaximum(Calendar.DAY_OF_MONTH);

    this.x = x; this.y = y; this.w = w; this.h = h;
    createCalendar(x, y, w, h);
  }
  
  // Setters
  
  void setCalendar(int d, int m, int y){
    cal.set(Calendar.YEAR, y);
    cal.set(Calendar.MONTH, m);
    cal.set(Calendar.DATE, d);
  }
  
  void setPrevCalendar(int d, int m, int y){
    cPrev.set(Calendar.YEAR, y);
    cPrev.set(Calendar.MONTH, m);
    cPrev.set(Calendar.DATE, d);
  }
  
  void setSelectedDate(int d, int m, int y){
    this.DiaSeleccionado = d;
    this.MesSeleccionado = m;
    this.añoSeleccionado = y;
  }
  
  // Va un mes enrera en el Calendari
  void prevMonth(){
    
    this.buttons = new DayButton[37];
    
    this.mes --;
    if(this.mes==0){
      this.mes = 12;
      this.año--;
    }
    setCalendar(this.dia, this.mes -1, this.año);
    
    this.numeroDiasMes = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    
    this.DiaSemana = cal.get(Calendar.DAY_OF_WEEK);
    if(DiaSemana==Calendar.SUNDAY){ this.DiaSemana = 6; }
    else { this.DiaSemana  = this.DiaSemana - 2; }

    cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
    this.PrimerDia = cal.get(Calendar.DATE);
    
    setPrevCalendar(1, this.mes -2, this.año);
    this.numeroDiasMesPrevio = cPrev.getActualMaximum(Calendar.DAY_OF_MONTH);

    createCalendar(x, y, w, h);
  }
  
  void createCalendar(float x, float y, float w, float h){
    
    float dayWidth  = w / 7;
    float dayHeight = h / 6;
    int numDia = 1;
    int f = 0, nb = 0;
    
    while(numDia<=numeroDiasMes){
      
      if(PrimerDia!=1 && f==0){
        int cPrev=0;
        for(int p=PrimerDia, c=0; p<=numeroDiasMesPrevio; p++, c++){
          buttons[nb] = new DayButton(x + c*dayWidth, y + f*dayHeight, dayWidth, dayHeight, p, mes, año);
          buttons[nb].setEnabled(false);
          cPrev++; nb++;
        }
        for(int c=cPrev; c<7; c++){
          buttons[nb] = new DayButton(x + c*dayWidth, y + f*dayHeight, dayWidth, dayHeight, numDia, mes, año);
          numDia++; nb++;
        }
        f++;
      }
      else {
        for(int c=0; c<7; c++){
          buttons[nb] = new DayButton(x + c*dayWidth, y + f*dayHeight, dayWidth, dayHeight, numDia, mes, año);
          numDia++; nb++;
          if(numDia>numeroDiasMes){ break; }
        }
        f++;
      }
    }
  }
  
  // Va un mes endavant en el calendari
  void nextMonth(){
    
    this.buttons = new DayButton[37];
    
    this.mes ++;
    if(this.mes==13){
      this.mes = 1;
      this.año++;
    }
    setCalendar(this.dia, this.mes-1, this.año);
    
    this.numeroDiasMes = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    
    this.DiaSemana = cal.get(Calendar.DAY_OF_WEEK);
    if(DiaSemana==Calendar.SUNDAY){ this.DiaSemana = 6; }
    else { this.DiaSemana  = this.DiaSemana - 2; }

    cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
    this.PrimerDia = cal.get(Calendar.DATE);
    
    setPrevCalendar(1, this.mes-2, this.año);
    
    this.numeroDiasMesPrevio = cPrev.getActualMaximum(Calendar.DAY_OF_MONTH);
    
    createCalendar(x, y, w, h);
  }
  

  
  // Dibuixa el Calendari
  void display(){
    pushStyle();
    fill(0); textSize(36); textAlign(LEFT);
    text(Meses[mes-1]+"/"+año, x, y - 30);
    for(DayButton b : buttons){
      if(b!=null){
        b.display();
      }
    }
    
    if(FechaSeleccionada){
      String dateText = this.DiaSeleccionado+"/"+this.MesSeleccionado+"/"+this.añoSeleccionado;
      fill(0); textSize(24); textAlign(RIGHT);
      text(dateText, x+w, y - 30);
    }
    popStyle();
  }
  
  
  // Comprova si pitjam sobre els botons del Calendari
  void checkButtons(){
    for(DayButton b : buttons){
      if((b!=null)&&(b.enabled)&&(b.mouseOver())){
        boolean prevState = b.selected;
        deselectAll();
        b.setSelected(!prevState);
        if(b.selected){
          FechaSeleccionada = true;
          setSelectedDate(b.dia,b.mes,b.any);
        }
        else {
          FechaSeleccionada = false;
        }
      }
    }
  }
  
  // Deselecciona tots els botons del Calendari
  void deselectAll(){
    for(DayButton b : buttons){
      if(b!=null){
        b.setSelected(false);
      }
    }
  }
  
}
