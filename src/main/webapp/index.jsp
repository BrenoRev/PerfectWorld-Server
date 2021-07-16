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
	
	
	<form action="ServeletLogin" method="post">
		<table>
<tr>
	<td><label> Login</label></td>
	<td>
			<input type="text" name="login">
	</td>
</tr>

<tr>
	<td><label> Senha </label></td>
	<td>
		<input type="password" name="senha">
	</td>
</tr>

<tr>
	<td>
	<td>
		<input type="submit" value="enviar"></input>
	</td>
</tr>
		</table>
		
	</form>
	
	<h4>${msg}</h4>
</body>
</html>