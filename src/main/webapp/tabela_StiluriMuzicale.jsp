<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./styles.css">
<title>Tabela Stiluri Muzicale</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Stiluri Muzicale:</h1>
	<br />
	<p align="center">
		<a href="nou_StilMuzical.jsp"><b>Adauga un nou stil muzical.</b></a>
		<a href="index.html"><b>Home</b></a>
	</p>
	<form action="sterge_StilMuzical.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdStil:</b></td>
				<td><b>Nume:</b></td>
				<td><b>Descriere:</b></td>
			</tr>
			<%
                jb.connect();
                ResultSet rs = jb.vedeTabela("StiluriMuzicale");
                long x;
                while (rs.next()) {
                    x = rs.getInt("idStil");
            %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x %>" /></td>
				<td><%= x %></td>
				<td><%= rs.getString("Nume") %></td>
				<td><%= rs.getString("Descriere") %></td>
			</tr>
			<%
                }
            %>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
        rs.close();
        jb.disconnect();
    %>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>
