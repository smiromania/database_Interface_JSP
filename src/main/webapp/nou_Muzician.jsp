<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Muzician</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String NumeDeScena = request.getParameter("NumeDeScena");
            String DataNasterii = request.getParameter("DataNasterii");
            if (Nume != null) {
                jb.connect();
                jb.adaugaMuzician(Nume, Prenume, NumeDeScena, DataNasterii);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p>
        <%
            } else {
        %>
        <h1> Adauga Muzician</h1>
        <form action="nou_Muzician.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Muzician:</td>
                    <td> <input type="text" name="Nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Prenume Muzician:</td>
                    <td> <input type="text" name="Prenume" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Nume de Scena:</td>
                    <td> <input type="text" name="NumeDeScena" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Data Nasterii:</td>
                    <td> <input type="date" name="DataNasterii" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga Muzicianul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
