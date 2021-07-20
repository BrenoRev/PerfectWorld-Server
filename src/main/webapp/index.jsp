<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>JSP</title>

	<style type="text/css">
	
		@font-face {
   			font-family: chicagopolice;
  			src: url("images/Chicago Police Font.otf");
		}
		
		body{
		background-image: url("images/background.jpg");
		font-family: chicagopolice,Arial;
		}
		
		label{
			text-align: center;
			font-size: 1.5em;
		}
		
		#inicio{
			padding-top: 10%;
			text-align: center;
		}
		
		#mensagem{
		
		font-style: bold;
		padding-top:5%;
		font-size: 1.2em;
		left:5em;
		color: red;
		}
		
		#button{
		font-size: 1.5em;
			width:200px;
			margin-left: 0.3em;
		}
		
		#centro{
			padding: 15px;
			}
			
			#tamanho{
				font-family: Arial;
			}
			
	</style>
	
</head>
<body>
	<h1 id="inicio">Seja bem vindo!</h1>

<div id="centro" class="col-md-6 offset-md-3">
	<form action="<%=request.getContextPath() %>/ServeletLogin" method="post" class="row g-3 needs-validation" novalidate>
	
	<input type="hidden" value="<%= request.getParameter("url")%>"name="url">
	
<div class="col-md-7">
	<label id="centralizar" class="form-label" > Login</label>
	<input id="tamanho" type="text" name="login" class="form-control" required>
	<div class="invalid-feedback">
        Informe o seu Login.
      </div>
</div>

<div class="col-md-7">		
	<label id="centralizar" class="form-label"> Senha</label>
	<input id="tamanho" type="password" name="senha" class="form-control" required>
	<div class="invalid-feedback">
        Informe a sua Senha.
      </div>
     
</div>

		<input id="button" type="submit" value="Entrar" class="btn btn-primary"></input>

	</form>
	<h4 id="mensagem">${msg}</h4>
</div>
	

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    	<!--  //Script de Validação dos campos do input -->
    <script type="text/javascript">
    (function () {
      'use strict'

      var forms = document.querySelectorAll('.needs-validation')

      Array.prototype.slice.call(forms)
        .forEach(function (form) {
          form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
              event.preventDefault()
              event.stopPropagation()
            }

            form.classList.add('was-validated')
          }, false)
        })
    })()
    
    </script>
</body>
</html>