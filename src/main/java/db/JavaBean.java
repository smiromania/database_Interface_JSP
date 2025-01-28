/*
 * Curs3_Eclipse - Valentin Pupezescu
 */
package db;

import java.sql.*;

/**
 *
 * @author vali
 */
public class JavaBean {

	String error;
	Connection con;

	public JavaBean() {
	}

	public void connect() throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Festival?useSSL=false", "root", "admin1");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect()

	public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "admin1");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd)

	public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "admin1");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd, String ip)

	public void disconnect() throws SQLException {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException sqle) {
			error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
			throw new SQLException(error);
		}
	} // disconnect()

	public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori)
	        throws SQLException, Exception {
	    if (con != null) {
	        String update = "UPDATE " + tabela + " SET ";
	        StringBuilder temp = new StringBuilder();

	        try {
	            // Construim secțiunea SET a comenzii SQL
	            for (int i = 0; i < campuri.length; i++) {
	                temp.append(campuri[i]).append("='").append(valori[i]).append("'");
	                if (i != campuri.length - 1) {
	                    temp.append(", ");
	                }
	            }
	            update += temp + " WHERE " + IDTabela + " = " + ID + ";";

	            // Executăm comanda SQL
	            Statement stmt = con.createStatement();
	            stmt.executeUpdate(update);
	        } catch (SQLException sqle) {
	            error = "ExceptieSQL: Modificarea nu a reușit; este posibil să existe duplicate sau alte erori.";
	            throw new SQLException(error);
	        } catch (Exception e) {
	            error = "Exceptie: A apărut o problemă în timpul modificării tabelei.";
	            throw new Exception(error);
	        }
	    } else {
	        error = "Exceptie: Conexiunea cu baza de date a fost pierdută.";
	        throw new Exception(error);
	    }
	} // end of modificaTabela()

	public void adaugaStilMuzical(String Nume, String Descriere)
	        throws SQLException, Exception {
	    if (con != null) {
	        try {
	            Statement stmt;
	            stmt = con.createStatement();
	            stmt.executeUpdate("insert into StiluriMuzicale(Nume, Descriere) values('" + Nume + "', '" + Descriere + "');");
	        } catch (SQLException sqle) {
	            error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
	            throw new SQLException(error);
	        }
	    } else {
	        error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
	        throw new Exception(error);
	    }
	} // end of adaugaStilMuzical()

	public void adaugaMuzician(String Nume, String Prenume, String NumeDeScena, String DataNasterii)
	        throws SQLException, Exception {
	    if (con != null) {
	        try {
	            Statement stmt;
	            stmt = con.createStatement();
	            stmt.executeUpdate("insert into Muzicieni(Nume, Prenume, NumeDeScena, DataNasterii) values('" + Nume + "', '" + Prenume + "', '" + NumeDeScena + "', '" + DataNasterii + "');");
	        } catch (SQLException sqle) {
	            error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
	            throw new SQLException(error);
	        }
	    } else {
	        error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
	        throw new Exception(error);
	    }
	} // end of adaugaMuzician()

	public void adaugaConcert(int idStil, int idMuzician, String DataCantarii, String Scena, String Ora)
	        throws SQLException, Exception {
	    if (con != null) {
	        try {
	            Statement stmt;
	            stmt = con.createStatement();
	            stmt.executeUpdate("insert into Festival(idStil, idMuzician, DataCantarii, Scena, Ora) values('" 
	                + idStil + "', '" + idMuzician + "', '" + DataCantarii + "', '" + Scena + "', '" + Ora + "');");
	        } catch (SQLException sqle) {
	            error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
	            throw new SQLException(error);
	        }
	    } else {
	        error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
	        throw new Exception(error);
	    }
	} // end of adaugaConcert()

	public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
	    ResultSet rs = null;
	    try {
	        String queryString = ("select * from Festival." + tabel + ";");
	        Statement stmt = con.createStatement();
	        rs = stmt.executeQuery(queryString);
	    } catch (SQLException sqle) {
	        error = "SQLException: Interogarea nu a fost posibila.";
	        throw new SQLException(error);
	    } catch (Exception e) {
	        error = "A aparut o exceptie in timp ce se extrageau datele.";
	        throw new Exception(error);
	    }
	    return rs;
	} // vedeTabela()

	public ResultSet vedeConcert() throws SQLException, Exception {
	    ResultSet rs = null;
	    try {
	        String queryString = "SELECT s.Nume AS NumeStilMuzical, m.NumeDeScena, c.idConcert, c.DataCantarii, c.Scena, c.Ora " +
	                             "FROM StiluriMuzicale s " +
	                             "JOIN Festival c ON s.idStil = c.idStil " +
	                             "JOIN Muzicieni m ON m.idMuzician = c.idMuzician;";
	        Statement stmt = con.createStatement();
	        rs = stmt.executeQuery(queryString);
	    } catch (SQLException sqle) {
	        error = "SQLException: Interogarea nu a fost posibila.";
	        throw new SQLException(error);
	    } catch (Exception e) {
	        error = "A aparut o exceptie in timp ce se extrageau datele.";
	        throw new Exception(error);
	    }
	    return rs;
	}


	public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
	    if (con != null) {
	        try {
	            long aux;
	            PreparedStatement delete;
	            delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
	            for (int i = 0; i < primaryKeys.length; i++) {
	                aux = java.lang.Long.parseLong(primaryKeys[i]);
	                delete.setLong(1, aux);
	                delete.execute();
	            }
	        } catch (SQLException sqle) {
	            error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
	            throw new SQLException(error);
	        } catch (Exception e) {
	            error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
	            throw new Exception(error);
	        }
	    } else {
	        error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
	        throw new Exception(error);
	    }
	} // end of stergeDateTabela()

	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
	    ResultSet rs = null;
	    try {
	        String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
	        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	        rs = stmt.executeQuery(queryString);
	    } catch (SQLException sqle) {
	        error = "SQLException: Interogarea nu a fost posibila.";
	        throw new SQLException(error);
	    } catch (Exception e) {
	        error = "A aparut o exceptie in timp ce se extrageau datele.";
	        throw new Exception(error);
	    }
	    return rs;
	} // end of intoarceLinieDupaId()

}