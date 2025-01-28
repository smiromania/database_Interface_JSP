<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Stil Muzical</title>
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
            int aux = Integer.parseInt(request.getParameter("idStil"));
            String Nume = request.getParameter("Nume");
            String Descriere = request.getParameter("Descriere");

            String[] valori = {Nume, Descriere};
            String[] campuri = {"Nume", "Descriere"};
            jb.modificaTabela("StiluriMuzicale", "idStil", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate!</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>
