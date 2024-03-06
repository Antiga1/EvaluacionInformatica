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

String[][] getInfoTaulaALUMNOS() {

  int numRows = getNumRowsTaula("ALUMNOS");

  String[][] data = new String[numRows][7];

  int nr=0;
  msql.query( "SELECT * FROM ALUMNOS" );
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
