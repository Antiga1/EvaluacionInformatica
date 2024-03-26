
void mousePressed() {



  //PANTALLA INICI
  if (pantalla == PANTALLA.INTRO) {
    userText.isPressed();
    passText.isPressed();

    if (bAcceder.mouseOverButton()) {
      String userName = userText.text;
      String password = passText.text;
      logged = isValidUser(userName, password);
      println(logged);

      if (logged) {
        fill(0);
        textAlign(CENTER);
        pantalla = PANTALLA.REPERTORIO1;
      }
    } else if (bRegistrarse.mouseOverButton()) {
      pantalla = PANTALLA.REGISTRARSE;
    }
  } else if (pantalla == PANTALLA.REGISTRARSE) {
    newuser.isPressed();
    newpass.isPressed();
    if (confirma1.bAceptar.mouseOverButton()) {
      confirma1.setVisible(false);
      String nombre = newuser.text;
      String password = newpass.text;
      insertInfoTablaUsuario(nombre, password);
      pantalla = PANTALLA.INTRO;
    } else if (confirma1.bCancelar.mouseOverButton()) {
      confirma1.setVisible(false);
    } else if (bConfirmar.mouseOverButton() && bAñadir.enabled) {
      confirma1.setVisible(true);
    }
  } else if (pantalla == PANTALLA.FECHA) {

    
    newhora.isPressed();
    newalumno.isPressed();
    newprecio.isPressed();
    newduracion.isPressed();


    if (confirma1.bAceptar.mouseOverButton()) {
      confirma1.setVisible(false);
      pantalla = PANTALLA.CALENDARIO;
    } else if (confirma1.bCancelar.mouseOverButton()) {
      confirma1.setVisible(false);
    } else if (bConfirmar.mouseOverButton() && bAñadir.enabled) {
      confirma1.setVisible(true);
    }
  }


  //PANTALLA DEL REPERTORI1
  else if (pantalla == PANTALLA.REPERTORIO1) {


    if (bAñadir.mouseOverButton()) {

      pantalla = PANTALLA.APERTURA;
    }



    // MENU
    else if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (BotonesRepertorio1[1].mouseOverButton() && BotonesRepertorio1[1].enabled) {
      pantalla = PANTALLA.REPERTORIO2;
    }
  }
  //PANTALLA CALENDARIO

  else if ( pantalla == PANTALLA.CALENDARIO) {
    // Comprovar si clicam sobre botons del Calendari
    c.checkButtons();
    if (b1.mouseOverButton() && b1.enabled) {
      TablaC.nextPage();
    } else if (b2.mouseOverButton() && b2.enabled) {
      TablaC.prevPage();
    }
    // Si pitja el botó, canvia la visibilitat del calendari.
    if (b.mouseOverButton()&&b.enabled) {
      c.visible = !c.visible;
    }

    if (c.bNext.mouseOverButton()) {
      c.nextMonth();
    }

    if (c.bPrev.mouseOverButton()) {
      c.prevMonth();
    }

    if (c.bOK.mouseOverButton() && c.dateSelected) {
      dataCalendari = c.selectedDay +"/"+ c.selectedMonth + "/"+ c.selectedYear;
      c.visible = false;
    }


    if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (c.bNext.mouseOverButton()) {
      c.nextMonth();
    } else if (c.bPrev.mouseOverButton()) {
      c.prevMonth();
    } else if (c.bOK.mouseOverButton() && c.dateSelected) {
      dataCalendari = c.selectedDay +"/"+ c.selectedMonth + "/"+ c.selectedYear;
      c.visible = false;
      pantalla = PANTALLA.FECHA;
    }
  }




  //PANTALLA MIS CLASES

  else if ( pantalla == PANTALLA.MISCLASES) {

    if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    }
  }


  //PANTALLA REPERTORIO2
  else if (pantalla == PANTALLA.REPERTORIO2) {
    Tauler.casellaMouse();
    lv.buttonPressed();

    if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (BotonesRepertorio1[1].mouseOverButton() && BotonesRepertorio1[1].enabled) {
      pantalla = PANTALLA.REPERTORIO2;
    }
  }

  //PANTALLA ALUMNES
  else if (pantalla == PANTALLA.ALUMNOS) {

    if (b1.mouseOverButton() && b1.enabled) {
      Tabla.nextPage();
    } else if (b2.mouseOverButton() && b2.enabled) {
      Tabla.prevPage();
    }


    if (BotonesMenu[0].mouseOverButton() ) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton()) {
      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() ) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() ) {
      pantalla = PANTALLA.MISCLASES;
    } else if (BotonesRepertorio1[1].mouseOverButton()) {
      pantalla = PANTALLA.REPERTORIO2;
    }
  }
}
