<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Stiluri Muzicale</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String[] s = request.getParameterValues("primarykey");
            if (s != null && s.length > 0) {
                jb.connect();
                jb.stergeDateTabela(s, "StiluriMuzicale", "idStil");
                jb.disconnect();
        %>
        <p>Datele au fost șterse cu succes.</p>
        <%
            } else {
        %>
        <p>Nicio înregistrare nu a fost selectată pentru ștergere.</p>
        <%
            }
        %>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>
