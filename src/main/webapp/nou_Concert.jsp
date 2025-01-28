<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Concert</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idStil, idMuzician;
            String id1 = request.getParameter("idStil");
            String id2 = request.getParameter("idMuzician");
            String DataCantarii = request.getParameter("DataCantarii");
            String Scena = request.getParameter("Scena");
            String Ora = request.getParameter("Ora");
            if (id1 != null && id2 != null) {
                jb.connect();
                jb.adaugaConcert(Integer.parseInt(id1), Integer.parseInt(id2), DataCantarii, Scena, Ora);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p>
        <%
            } else {
                jb.connect();
                ResultSet rsStiluri = jb.vedeTabela("StiluriMuzicale");
                ResultSet rsMuzicieni = jb.vedeTabela("Muzicieni");
        %>
        <h1> Adauga Concert</h1>
        <form action="nou_Concert.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Stil Muzical:</td>
                    <td>
                        <select name="idStil">
                            <%
                                while (rsStiluri.next()) {
                                    int id = rsStiluri.getInt("idStil");
                                    String nume = rsStiluri.getString("Nume");
                            %>
                                <option value="<%= id %>"><%= id %> - <%= nume %></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">Muzician:</td>
                    <td>
                        <select name="idMuzician">
                            <%
                                while (rsMuzicieni.next()) {
                                    int id = rsMuzicieni.getInt("idMuzician");
                                    String nume = rsMuzicieni.getString("Nume");
                                    String prenume = rsMuzicieni.getString("Prenume");
                            %>
                                <option value="<%= id %>"><%= id %> - <%= nume %> <%= prenume %></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">Data Cântării:</td>
                    <td> <input type="date" name="DataCantarii" required /></td>
                </tr>
                <tr>
                    <td align="right">Scena:</td>
                    <td> <input type="text" name="Scena" size="30" required /></td>
                </tr>
                <tr>
                    <td align="right">Ora:</td>
                    <td> <input type="time" name="Ora" required /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga Concertul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
