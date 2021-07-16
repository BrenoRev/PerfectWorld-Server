<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receber nomes</title>
</head>
<body>
	
	<%
	String nome = request.getParameter("nome");
	out.println("nome: " +nome);
	
	String idade = request.getParameter("idade");
	out.println("idade " + idade);
	
	%>
</body>
</html>