<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tela de Erros</title>
	<style type="text/css">
	
		@font-face {
   			font-family: chicagopolice;
  			src: url("images/Chicago Police Font.otf");
		}
		
		body{
		background-image: url("images/background.jpg");
		font-family: chicagopolice,Arial;
		}
		</style>
</head>
<body>
	<h1>Mensagem de Erro, entre em contato com a equipe de suporte do sistema.</h1>
	<%
		out.print(request.getAttribute("msg"));
	%>
	
</body>
</html>