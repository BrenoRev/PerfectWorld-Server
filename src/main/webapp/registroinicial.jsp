<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/pwicon.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Registro PW</title>

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
	<h1 id="inicio">Registro</h1>
	<div id="centro" class="col-md-6 offset-md-3" >
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                              <div class="row">
                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div class="card-header" style="padding: 10px;">
                                                     		<h4 style="text-align: center;"> Insira seus dados</h4>
                                                    </div>
                                                    <div class="card-block" style="padding: 20px;">
                                                        <form method="post" class="form-material"  id="formUser" action="<%= request.getContextPath()%>/ServeletRegistroInicialController">
                                                    	    <input type="hidden" name="acao" id="acao" value="">
                                                            <div class="form-group form-default">
                                                            <label class="float-label">Login</label>
                                                                <input type="text" name="login" id="login" class="form-control" required="required" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                
                                                            </div>
                                                            
                                                            <div class="form-group form-default">
                                                             <label class="float-label">Senha</label>
                                                                <input type="password" name="senha" id="senha" class="form-control" required="required" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                               
                                                            </div>
                                                            <div class="form-group form-default">
                                                             <label class="float-label">Nome</label>
                                                                <input type="text" name="nome" id="nome" class="form-control" required="required" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                               
                                                            </div>
                                                            <div class="form-group form-default">
                                                              <label class="float-label">Email</label>
                                                                <input type="email" name="email" id="email" class="form-control" required="required" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                              
                                                            </div>
                                                            
                                                            
                                                             <div class="col-bg-12">
                                                             <br>
                                                             <p> Escolha sua classe </p>
                                                                        <select name="classe" id="classe" class="form-control" required="required">
                                                                            <option value="Guerreiro">Guerreiro</option>
                                                                            <option value="Mago">Mago</option>
                                                                            <option value="Barbaro">Barbaro</option>
                                                                            <option value="Feiticeira">Feiticeira</option>
                                                                            <option value="Arqueiro">Arqueiro</option>
                                                                            <option value="Sacerdote">Sacerdote</option>
                                                                            <option value="Arcano">Arcano</option>
                                                                            <option value="Mistico">Mistico</option>
                                                                            <option value="Mercenario">Mercenario</option>
                                                                            <option value="Espiritualista">Espiritualista</option>
                                                                            <option value="Tormentador">Tormentador</option>
                                                                            <option value="Retalhador">Retalhador</option>
                                                                        </select>
                                                               </div>
																<br>
																<br>
																<div style="width: 350px;">
         											   <button class="btn waves-effect waves-light btn-primary btn-skew">Cadastrar</button>
         											    <button type="button" class="btn waves-effect waves-light btn-secondary btn-skew" onclick="limparForm()" >Limpar</button>
         											     <button id="button" type="button" class="btn btn-alert" onclick="window.location.href='index.jsp'" style="padding:20px;">Voltar</button>
         											     </div>
         											   
                                                        </form> 
                                                       
                                                   
                                                </div>
                                                </div>
                                                </div>
                                                </div>
                                                <p style="font-size: 1em; padding: 20px;">${msg}</p>
													
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
           </div>
           
          

<script type="text/javascript">	

function verEditar(id){
	var urlAction = document.getElementById('formUser').action;
	 window.location.href = urlAction + '?acao=buscarEditar&id=' +id;
	}


// LIMPAR TODOS OS DADOS DO FORMULARIO
function limparForm(){
		var elementos = document.getElementById("formUser").elements; // retorna um array de elementos do form
		for(p=0; p<elementos.length; p++){
			elementos[p].value = '';
		
		}
		
}

function limparInput(){
	var input = document.getElementById("nomeBusca").value= '';
	document.getElementById('totalResultados').innerHTML = '';
	$('#tabelaresultados > tbody > tr').remove();
	     
}

 
</script>
</body>
</html>