<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Concerte</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <h1 align="center">Tabela Concerte:</h1>
    <br/>
    <p align="center"><a href="nou_Concert.jsp"><b>Adaugă un nou concert.</b></a> <a href="index.html"><b>Home</b></a></p>
    <form action="m1_Concert.jsp" method="post">
        <table border="1" align="center">
            <tr>
                <td><b>Mark:</b></td>
                <td><b>IdConcert:</b></td>
                <td><b>NumeStil:</b></td>
                <td><b>NumeDeScena:</b></td>
                <td><b>DataCantarii:</b></td>
                <td><b>Scena:</b></td>
                <td><b>Ora:</b></td>
            </tr>
            <%
                ResultSet rs = null;
                try {
                    jb.connect();
                    rs = jb.vedeConcert();
                    while (rs.next()) {
            %>
            <tr>
                <td><input type="checkbox" name="primarykey" value="<%= rs.getInt("idConcert") %>" /></td>
                <td><%= rs.getInt("idConcert") %></td>
                <td><%= rs.getString("NumeStilMuzical") %></td>
                <td><%= rs.getString("NumeDeScena") %></td>
                <td><%= rs.getDate("DataCantarii") %></td>
                <td><%= rs.getString("Scena") %></td>
                <td><%= rs.getString("Ora") %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Eroare: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) rs.close();
                    jb.disconnect();
                }
            %>
        </table>
        <br/>
        <p align="center">
            <input type="submit" value="Modifica linia">
        </p>
    </form>
    <br/>
    <p align="center">
        <a href="index.html"><b>Home</b></a>
    </p>
</body>
</html>
