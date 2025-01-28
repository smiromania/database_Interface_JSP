<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Stil Muzical</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Nume = request.getParameter("Nume");
            String Descriere = request.getParameter("Descriere");
            if (Nume != null) {
                jb.connect();
                jb.adaugaStilMuzical(Nume, Descriere);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p>
        <%
            } else {
        %>
        <h1> Adauga Stil Muzical</h1>
        <form action="nou_StilMuzical.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Stil Muzical:</td>
                    <td> <input type="text" name="Nume" size="40" required /></td>
                </tr>
                <tr>
                    <td align="right">Descriere:</td>
                    <td> <input type="text" name="Descriere" size="50" required /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga Stilul Muzical" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
