<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Stiluri Muzicale</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Stiluri Muzicale:</h1>
        <br/>
        <p align="center"><a href="nou_StilMuzical.jsp"><b>Adauga un nou stil muzical.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("StiluriMuzicale", "idStil", aux);
            rs.first();
            String Nume = rs.getString("Nume");
            String Descriere = rs.getString("Descriere");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_StilMuzical.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdStil:</td>
                    <td> <input type="text" name="idStil" size="30" value="<%= aux %>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= Nume %>" /></td>
                </tr>
                <tr>
                    <td align="right">Descriere:</td>
                    <td> <input type="text" name="Descriere" size="50" value="<%= Descriere %>" /></td>
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
