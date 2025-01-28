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
        <h1 align="center"> Tabela Muzicieni:</h1>
        <br/>
        <p align="center"><a href="nou_Muzician.jsp"><b>Adauga un nou muzician.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idMuzician"));
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String NumeDeScena = request.getParameter("NumeDeScena");
            String DataNasterii = request.getParameter("DataNasterii");

            String[] valori = {Nume, Prenume, NumeDeScena, DataNasterii};
            String[] campuri = {"Nume", "Prenume", "NumeDeScena", "DataNasterii"};
            jb.modificaTabela("Muzicieni", "idMuzician", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate!</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>
