<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Muzicieni</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Muzicieni:</h1>
        <br/>
        <p align="center"><a href="nou_Muzician.jsp"><b>Adauga un nou muzician.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_Muzician.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdMuzician:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Prenume:</b></td>
                    <td><b>NumeDeScena:</b></td>
                    <td><b>DataNasterii:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("Muzicieni");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idMuzician");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x %>" /></td>
                    <td><%= x %></td>
                    <td><%= rs.getString("Nume") %></td>
                    <td><%= rs.getString("Prenume") %></td>
                    <td><%= rs.getString("NumeDeScena") %></td>
                    <td><%= rs.getDate("DataNasterii") %></td>
                </tr>
                <%
                    }
                %>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
            jb.disconnect();
        %>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>
