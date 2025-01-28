<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Muzicieni</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Muzicieni:</h1>
        <br/>
        <p align="center"><a href="nou_Muzician.jsp"><b>Adauga un nou muzician.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("Muzicieni", "idMuzician", aux);
            rs.first();
            String Nume = rs.getString("Nume");
            String Prenume = rs.getString("Prenume");
            String NumeDeScena = rs.getString("NumeDeScena");
            String DataNasterii = rs.getString("DataNasterii");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Muzician.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdMuzician:</td>
                    <td> <input type="text" name="idMuzician" size="30" value="<%= aux %>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= Nume %>" /></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="Prenume" size="30" value="<%= Prenume %>" /></td>
                </tr>
                <tr>
                    <td align="right">Nume de Scenă:</td>
                    <td> <input type="text" name="NumeDeScena" size="30" value="<%= NumeDeScena %>" /></td>
                </tr>
                <tr>
                    <td align="right">Data Nașterii:</td>
                    <td> <input type="date" name="DataNasterii" value="<%= DataNasterii %>" /></td>
                </tr>
            </table>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
