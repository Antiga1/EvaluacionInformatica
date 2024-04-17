
void mousePressed() {



  //PANTALLA INICI
  if (pantalla == PANTALLA.INTRO) {
    userText.isPressed();
    passText.isPressed();
    Tauler.resetPiezas();
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
    } else if (bContraseña.mouseOverButton()) {
      pantalla = PANTALLA.UPDATECONTRASEÑA;
    }

    //pantalla registrarse
  } else if (pantalla == PANTALLA.REGISTRARSE) {
    newuser.isPressed();
    newpass.isPressed();
    Tauler.resetPiezas();
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

    //pantalla fecha
  } else if (pantalla == PANTALLA.FECHA) {

    Tauler.resetPiezas();
    newhora.isPressed();
    newalumno.isPressed();
    newprecio.isPressed();
    newduracion.isPressed();
    newsesion.isPressed();

    if (confirma1.bAceptar.mouseOverButton()) {
      confirma1.setVisible(false);
      String idsesion = newsesion.text;
      String dia = newdia.text;
      String hora = newhora.text;
      String Precio = newprecio.text;
      String duracion = newduracion.text;
      String idalumno = newalumno.text;
      insertInfoCalendario(idsesion, fechaEng, hora, Precio, duracion, idalumno);
      String[][]info = getInfoTaulaSESION();
      TablaC.setData(info);

      pantalla = PANTALLA.CALENDARIO;
    } else if (confirma1.bCancelar.mouseOverButton()) {
      confirma1.setVisible(false);
    } else if (bConfirmar.mouseOverButton() && bAñadir.enabled) {
      confirma1.setVisible(true);
    }
  }



  //PANTALLA CALENDARIO

  else if ( pantalla == PANTALLA.CALENDARIO) {
    // Comprovar si clicam sobre botons del Calendari
    c.checkButtons();
    Tauler.resetPiezas();
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
      newdia.text = c.selectedDay + "/"+c.selectedMonth + "/" + c.selectedYear;
    }
  }


  //PANTALLA DEL REPERTORI1
  else if (pantalla == PANTALLA.REPERTORIO1) {

    Tauler.resetPiezas();
    if (botons.checkButtons() != -1) {
      String id = newidapertura.text;
      String nombre = newnombreapertura.text;
      String idAl = alumnoapertura.text;
      String[][] infor = getInfoTaulaAPERTURA(); // Obtenemos la información de la clase
      insertInfoRepertorio(id, nombre, idAl);
      

      // Iteramos sobre los datos de la clase para encontrar el nombre correspondiente
      for (int i = 0; i < infor.length; i++) {
        if (botonsrepertorio.checkButtonsText().equals(nombre) || botonsrepertorio.checkButtonsText().equals(infor[i][1])) {
          pantalla = PANTALLA.REPERTORIO2;
         break;
        }
      }
    }
    
    
    else if (bAdd2.mouseOverButton()) {
      pantalla = PANTALLA.APERTURA;
    } else if (bRemove2.mouseOverButton()) {
      botonsrepertorio.deleteLastButton();
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
    }
  }

  //PANTALLA MIS CLASES

  else if ( pantalla == PANTALLA.MISCLASES) {
    Tauler.resetPiezas();

    if (botons.checkButtons() != -1) {
      String idc = idclase.text;
      String nombrec = nombreclase.text;
      String idAlc = profesorclase.text;
      String[][] info = getInfoTaulaCLASE(); // Obtenemos la información de la clase
      

      InsertInfoClase(idc, nombrec, idAlc);

      // Iteramos sobre los datos de la clase para encontrar el nombre correspondiente
      for (int i = 0; i < info.length; i++) {
        if ( botons.checkButtonsText().equals(info[i][1])) {
          pantalla = PANTALLA.REPERTORIO2;
          break; // Salimos del bucle una vez que se ha encontrado una coincidencia
        }
      }
    } else if (bAdd.mouseOverButton()) {

      pantalla = PANTALLA.CLASE;
    } else if (bRemove.mouseOverButton()) {
      botons.deleteLastButton();
    } else if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    }

    //pantalla clase
  } else if (pantalla == PANTALLA.CLASE) {
    idclase.isPressed();
    nombreclase.isPressed();
    profesorclase.isPressed();

    Tauler.resetPiezas();

    if (confirma1.bAceptar.mouseOverButton()) {
      confirma1.setVisible(false);
      String idc = idclase.text;
      String nombrec = nombreclase.text;
      String idAlc = profesorclase.text;
      InsertInfoClase(idc, nombrec, idAlc);
      botons.addButton(""+nombrec+"");
      pantalla = PANTALLA.MISCLASES;
    } else if (confirma1.bCancelar.mouseOverButton()) {
      confirma1.setVisible(false);
    } else if (bConfirmar.mouseOverButton() && bAñadir.enabled) {
      confirma1.setVisible(true);
    }
  }

  //PANTALLA REPERTORIO2
  else if (pantalla == PANTALLA.REPERTORIO2) {
    Tauler.casellaMouse();
    lv.buttonPressed();
  String[][] infoM = getInfoTaulaMOVIMIENTO();

    if (BotonesMenu[0].mouseOverButton() && BotonesMenu[0].enabled) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton() && BotonesMenu[1].enabled) {

      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() && BotonesMenu[2].enabled) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() && BotonesMenu[3].enabled) {
      pantalla = PANTALLA.MISCLASES;
    } else if (guardarAnotacion.mouseOverButton()) {
      println("SAVING ");
      ArrayList<ItemList> movis = lv.items;
      int n= 1;
      for (ItemList m : movis) {

        String info = m.info;
        String clase = "1";
        String num = String.valueOf(n);
        n++;
        insertMovimiento(info, clase, num);
      }
    }
  }

  //PANTALLA ALUMNES
  else if (pantalla == PANTALLA.ALUMNOS) {
    Tauler.resetPiezas();
    if (b1.mouseOverButton() && b1.enabled) {
      Tabla.nextPage();
    } else if (b2.mouseOverButton() && b2.enabled) {
      Tabla.prevPage();
    } else if (b3.mouseOverButton()) {
      pantalla = PANTALLA.AÑADIRALUMNO;
    }


    if (BotonesMenu[0].mouseOverButton() ) {
      pantalla = PANTALLA.REPERTORIO1;
    } else if (BotonesMenu[1].mouseOverButton()) {
      pantalla = PANTALLA.CALENDARIO;
    } else if (BotonesMenu[2].mouseOverButton() ) {
      pantalla = PANTALLA.ALUMNOS;
    } else if (BotonesMenu[3].mouseOverButton() ) {
      pantalla = PANTALLA.MISCLASES;
    }

    //pantalla añadir apertura
  } else if ( pantalla == PANTALLA.APERTURA) {
    Tauler.resetPiezas();
    newidapertura.isPressed();
    newnombreapertura.isPressed();
    alumnoapertura.isPressed();

    if (confirma1.bAceptar.mouseOverButton()) {
      confirma1.setVisible(false);

      String id = newidapertura.text;
      String nombre = newnombreapertura.text;
      String idAl = alumnoapertura.text;
      insertInfoRepertorio(id, nombre, idAl);
      botonsrepertorio.addButton2(""+nombre+"");
      pantalla = PANTALLA.REPERTORIO1;
    } else if (confirma1.bCancelar.mouseOverButton()) {
      confirma1.setVisible(false);
    } else if (bConfirmar.mouseOverButton() && bAñadir.enabled) {
      confirma1.setVisible(true);
    }
  } else if (pantalla == PANTALLA.UPDATECONTRASEÑA) {
    Tauler.resetPiezas();
    newpass.isPressed();
    if (confirma1.bAceptar.mouseOverButton()) {
      confirma1.setVisible(false);

      String password = newpass.text;
      insertInfoTablaUsuario(user, password);
      pantalla = PANTALLA.INTRO;
    } else if (confirma1.bCancelar.mouseOverButton()) {
      confirma1.setVisible(false);
    } else if (bConfirmar.mouseOverButton() && bAñadir.enabled) {
      confirma1.setVisible(true);
    }
  } else if (pantalla == PANTALLA.AÑADIRALUMNO) {
    idalumno1.isPressed();
    nombrealumno1.isPressed();
    apellidosalumno1.isPressed();
    edadalumno1.isPressed();
    eloalumno1.isPressed();
    observacionesalumno1.isPressed();
    Tauler.resetPiezas();
    if (confirma1.bAceptar.mouseOverButton()) {
      confirma1.setVisible(false);
      String idalumno = idalumno1.text;
      String nombrealumno = nombrealumno1.text;
      String apellidosalumno = apellidosalumno1.text;
      String edadalumno = edadalumno1.text;
      String eloalumno = eloalumno1.text;
      String observaciones = observacionesalumno1.text;
      InsertInfoAlumno(idalumno, nombrealumno, apellidosalumno, edadalumno, eloalumno, observaciones);
      String[][]info = getInfoTaulaALUMNO();
      Tabla.setData(info);


      pantalla = PANTALLA.ALUMNOS;
    } else if (confirma1.bCancelar.mouseOverButton()) {
      confirma1.setVisible(false);
    } else if (bConfirmar.mouseOverButton() && bAñadir.enabled) {
      confirma1.setVisible(true);
    }
  }
}
