import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

// Objecte de connexió a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "admin";
String pass     = "12345";
String database = "ajedrez";


// Connexió
void connexioBBDD() {

  msql = new MySQL( this, "localhost:8889", database, user, pass );

  // Si la connexió s'ha establert
  if (msql.connect()) {
    // La connexió s'ha establert correctament
    println("Connexió establerta :)");
  } else {
    // La connexió ha fallat!!!
    println("Error de Connexió :(");
  }
}

// Obté el número de files de la taula
int getNumRowsTaula(String nomTaula) {
  msql.query( "SELECT COUNT(*) AS n FROM %s", nomTaula );
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

String[][] getInfoTaulaALUMNO() {

  int numRows = getNumRowsTaula("ALUMNO");

  String[][] data = new String[numRows][7];

  int nr=0;
  msql.query( "SELECT * FROM ALUMNO" );
  while (msql.next()) {
    data[nr][0] = String.valueOf(msql.getInt("idALUMNO"));
    data[nr][1] = msql.getString("nombre");
    data[nr][2] = msql.getString("apellidos");
    data[nr][3] = String.valueOf(msql.getInt("edat"));
    data[nr][4] = String.valueOf(msql.getInt("elo"));
    data[nr][5] = msql.getString("observaciones");
    data[nr][6] = msql.getString("titulo");
    nr++;
  }
  return data;
}

String[][] getInfoTaulaSESION() {

  int numRows = getNumRowsTaula("SESION");

  String[][] data = new String[numRows][6];

  int nr=0;
  msql.query( "SELECT * FROM SESION" );
  while (msql.next()) {
    data[nr][0] = String.valueOf(msql.getInt("idSESION"));
    data[nr][1] = msql.getString("dia");
    data[nr][2] = msql.getString("hora");
    data[nr][3] = String.valueOf(msql.getInt("precio"));
    data[nr][4] = String.valueOf(msql.getInt("duración"));
    data[nr][5] = msql.getString("idALUMNO");
    
    nr++;
  }
  return data;
}



boolean isValidUser(String userName, String password){
  String q = "SELECT COUNT(*) AS n FROM USUARIO WHERE Usuario = '"+userName+"' AND Pass='"+password+"'";
  println(q);
  msql.query(q);
  msql.next();
  println(msql.getInt("n"));
  return msql.getInt("n")==1;
}

void insertInfoTablaUsuario(String nom, String password){
  String q = "INSERT INTO `USUARIO` (`Usuario`, `Pass`) VALUES ('"+nom+"','"+password+"')";
  println(q);
  msql.query(q);
}
