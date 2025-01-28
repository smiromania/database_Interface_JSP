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
            int idConcert = java.lang.Integer.parseInt(request.getParameter("idConcert"));
            String idStil = request.getParameter("idStil");
            String idMuzician = request.getParameter("idMuzician");
            String DataCantarii = request.getParameter("DataCantarii");
            String Scena = request.getParameter("Scena");
            String Ora = request.getParameter("Ora");

            String[] valori = {idStil, idMuzician, DataCantarii, Scena, Ora};
            String[] campuri = {"idStil", "idMuzician", "DataCantarii", "Scena", "Ora"};
            jb.modificaTabela("Festival", "idConcert", idConcert, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate!</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>
