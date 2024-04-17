import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

// conexión a la BBDD
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
// inserts


void insertInfoTablaUsuario(String nom, String password) {
  String q = "INSERT INTO `USUARIO` (`Usuario`, `Pass`) VALUES ('"+nom+"','"+password+"')";
  println(q);
  msql.query(q);
}


void insertInfoRepertorio(String id, String nombre, String idAl) {
  String q = "INSERT INTO `APERTURA` (`idAPERTURA`, `nombre`, `idALUMNO`) VALUES ('"+id+"','"+nombre+"','"+idAl+"')";
  println(q);
  msql.query(q);
}

void InsertInfoClase(String idc, String nombrec, String idAlc) {
  String q = "INSERT INTO `CLASE` (`idCLASE`, `nombre`,  `idMAESTRO`) VALUES ('"+idc+"','"+nombrec+"','"+idAlc+"')";
  println(q);
  msql.query(q);
}

void insertInfoCalendario(String ids, String dia, String hora, String Precio, String duracion, String idalumno) {
  String q = "INSERT INTO `SESION` (`idSESION`, `dia`, `hora`, `precio`, `duracion`, `idALUMNO`) VALUES ('" + ids + "','" + fechaEng + "','" + hora + "','" + Precio + "','" + duracion + "','" + idalumno + "')";
  String fechaEng = formataFechaEng(fechaEsp);
  println(q);

  msql.query(q);
}

void InsertInfoAlumno(String idalumno, String nombrealumno, String apellidosalumno, String edadalumno, String eloalumno, String observaciones) {
  String q = "INSERT INTO `ALUMNO` (`idALUMNO`, `nombre`, `apellidos`, `edat`, `elo`, `observaciones`) VALUES('"+idalumno+"','"+nombrealumno+"','"+apellidosalumno+"','"+edadalumno+"','"+eloalumno+"','"+observaciones+"')";
  println(q);
  msql.query(q);
}


void insertMovimiento(String mov, String clase, String num) {
  String q = "INSERT INTO `MOVIMIENTO` (`idMOVIMIENTO`, `posicion1`, `idCLASE`, `num`) VALUES (NULL, '"+mov+"', '"+clase+"', '"+num+"')";
  println(q);
  msql.query(q);
}


//selects
// Obté el número de files de la taula
int getNumRowsTaula(String nomTaula) {
  msql.query( "SELECT COUNT(*) AS n FROM %s", nomTaula );
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

String[][] getInfoTaulaALUMNO() {

  int numRows = getNumRowsTaula("ALUMNO");

  String[][] data = new String[numRows][6];

  int nr=0;
  msql.query( "SELECT * FROM ALUMNO" );
  while (msql.next()) {
    data[nr][0] = String.valueOf(msql.getInt("idALUMNO"));
    data[nr][1] = msql.getString("nombre");
    data[nr][2] = msql.getString("apellidos");
    data[nr][3] = String.valueOf(msql.getInt("edat"));
    data[nr][4] = String.valueOf(msql.getInt("elo"));
    data[nr][5] = msql.getString("observaciones");

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
    data[nr][4] = String.valueOf(msql.getInt("duracion"));
    data[nr][5] = msql.getString("idALUMNO");

    nr++;
  }
  return data;
}
String[][] getInfoTaulaAPERTURA() {
  int numRows = getNumRowsTaula("APERTURA");

  String[][] data = new String[numRows][3]; // Ajustamos el tamaño del array a 3, ya que hay 3 columnas en la tabla "APERTURA"

  int nr = 0;
  msql.query("SELECT * FROM APERTURA");
  while (msql.next()) {
    data[nr][0] = String.valueOf(msql.getInt("idAPERTURA")); // Asignamos el valor de la columna "idAPERTURA"
    data[nr][1] = msql.getString("nombre"); // Asignamos el valor de la columna "nombre"
    data[nr][2] = String.valueOf(msql.getInt("idALUMNO")); // Asignamos el valor de la columna "idALUMNO"

    nr++;
  }
  return data;
}
String[][] getInfoTaulaMOVIMIENTO() {

  int numRows = getNumRowsTaula("MOVIMIENTO");

  String[][] data = new String[numRows][4];

  int nr=0;
  msql.query( "SELECT * FROM MOVIMIENTO" );
  while (msql.next()) {
    data[nr][0] = String.valueOf(msql.getInt("idMOVIMIENTO"));
    data[nr][1] = msql.getString("posicion1");
    data[nr][2] = msql.getString("idCLASE");
    data[nr][3] = msql.getString("num");
   
    nr++;
  }
  return data;
}

boolean isValidUser(String userName, String password) {
  String q = "SELECT COUNT(*) AS n FROM USUARIO WHERE Usuario = '"+userName+"' AND Pass='"+password+"'";
  println(q);
  msql.query(q);
  msql.next();
  println(msql.getInt("n"));
  return msql.getInt("n")==1;
}
String[][] getInfoTaulaCLASE() {
  int numRows = getNumRowsTaula("CLASE");

  String[][] data = new String[numRows][3];

  int nr=0;
  msql.query( "SELECT * FROM CLASE" );
  while (msql.next()) {
    data[nr][0] = String.valueOf(msql.getInt("idCLASE"));
    data[nr][1] = msql.getString("nombre");
    data[nr][2] = String.valueOf(msql.getInt("idMAESTRO"));

    nr++;
  }
  return data;
}
