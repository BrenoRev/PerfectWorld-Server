<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Curso JSP</title>
</head>
<body>
	<h1>Bem vindo ao curso de JSP</h1>
	
	<%
		out.print("Seu sucesso garantido!");
	%>
	
	<form action="ServeletLogin" method="post">
		<input name="nome">
		<input name="idade">
		<input type="submit" value="enviar"></input>
	</form>
</body>
</html>