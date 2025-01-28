<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Concerte</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Concerte:</h1>
        <br/>
        <p align="center"><a href="nou_Concert.jsp"><b>Adauga un nou concert.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String DataCantarii, Scena, Ora;
            int idStil, idMuzician;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("Festival", "idConcert", aux);
            rs.first();

            idStil = rs.getInt("idStil");
            idMuzician = rs.getInt("idMuzician");
            DataCantarii = rs.getString("DataCantarii");
            Scena = rs.getString("Scena");
            Ora = rs.getString("Ora");

            ResultSet rsStiluri = jb.vedeTabela("StiluriMuzicale");
            ResultSet rsMuzicieni = jb.vedeTabela("Muzicieni");
        %>
        <form action="m2_Concert.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdConcert:</td>
                    <td> <input type="text" name="idConcert" size="30" value="<%= aux %>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Stil Muzical:</td>
                    <td>
                        <SELECT NAME="idStil">
                            <%
                                while (rsStiluri.next()) {
                                    int stilId = rsStiluri.getInt("idStil");
                                    String stilNume = rsStiluri.getString("Nume");
                                    if (stilId != idStil) {
                            %>
                            <OPTION VALUE="<%= stilId %>"><%= stilId %>, <%= stilNume %></OPTION>
                                <%
                                    } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= stilId %>"><%= stilId %>, <%= stilNume %></OPTION>
                                <%
                                    }
                                }
                            %>
                        </SELECT>
                    </td>
                </tr>
                <tr>
                    <td align="right">Muzician:</td>
                    <td>
                        <SELECT NAME="idMuzician">
                            <%
                                while (rsMuzicieni.next()) {
                                    int muzicianId = rsMuzicieni.getInt("idMuzician");
                                    String muzicianNume = rsMuzicieni.getString("Nume");
                                    String muzicianPrenume = rsMuzicieni.getString("Prenume");
                                    if (muzicianId != idMuzician) {
                            %>
                            <OPTION VALUE="<%= muzicianId %>"><%= muzicianId %>, <%= muzicianNume %>, <%= muzicianPrenume %></OPTION>
                                <%
                                    } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= muzicianId %>"><%= muzicianId %>, <%= muzicianNume %>, <%= muzicianPrenume %></OPTION>
                                <%
                                    }
                                }
                            %>
                        </SELECT>
                    </td>
                </tr>
                <tr>
                    <td align="right">Data Cantării:</td>
                    <td> <input type="date" name="DataCantarii" value="<%= DataCantarii %>" /></td>
                </tr>
                <tr>
                    <td align="right">Scena:</td>
                    <td> <input type="text" name="Scena" size="30" value="<%= Scena %>" /></td>
                </tr>
                <tr>
                    <td align="right">Ora:</td>
                    <td> <input type="time" name="Ora" value="<%= Ora %>" /></td>
                </tr>
            </table>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
        <%
            rs.close();
            rsStiluri.close();
            rsMuzicieni.close();
            jb.disconnect();
        %>
    </body>
</html>
