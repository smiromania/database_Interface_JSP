<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <title>Tabela Muzicieni</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Muzicieni:</h1>
        <br/>
        <p align="center"><a href="nou_Muzician.jsp"><b>Adaugă un nou muzician.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="sterge_Muzician.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdMuzician:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Prenume:</b></td>
                    <td><b>NumeDeScena:</b></td>
                    <td><b>Vârstă:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("Muzicieni");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idMuzician");
                        java.sql.Date dataNasterii = rs.getDate("DataNasterii");
                        int varsta = 0;

                        // Calculăm vârsta pe baza datei nașterii
                        if (dataNasterii != null) {
                            java.util.Calendar birthDate = java.util.Calendar.getInstance();
                            birthDate.setTime(dataNasterii);
                            java.util.Calendar today = java.util.Calendar.getInstance();
                            varsta = today.get(java.util.Calendar.YEAR) - birthDate.get(java.util.Calendar.YEAR);
                            if (today.get(java.util.Calendar.DAY_OF_YEAR) < birthDate.get(java.util.Calendar.DAY_OF_YEAR)) {
                                varsta--;
                            }
                        }
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x %>" /></td>
                    <td><%= x %></td>
                    <td><%= rs.getString("Nume") %></td>
                    <td><%= rs.getString("Prenume") %></td>
                    <td><%= rs.getString("NumeDeScena") %></td>
                    <td><%= varsta %> ani</td>
                </tr>
                <%
                    }
                %>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>
