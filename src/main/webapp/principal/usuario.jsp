<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="servlets.ServeletRegistroController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">


<jsp:include page="head.jsp"></jsp:include>

  <body>
  <!-- Pre-loader start -->
  
  <jsp:include page="theme-loader.jsp"></jsp:include>
  
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          
          <jsp:include page="navbar.jsp"></jsp:include>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  
                  <jsp:include page="navbarmainmenu.jsp"></jsp:include>
                  
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                      
                      <jsp:include page="page-header.jsp"></jsp:include>
                      
                      <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                              <div class="row">
                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>CADASTRO DE JOGADOR</h5>
                                                    </div>
                                                    <div class="card-block">
                                                        <form method="post" class="form-material"  id="formUser" action="<%= request.getContextPath()%>/ServeletRegistroController">
                                                    	    <input type="hidden" name="acao" id="acao" value="">
                                                            <div class="form-group form-default">
                                                                <input type="text" name="login" id="login" class="form-control" required="required" autocomplete="off" value="${modelLogin.login}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Login</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default">
                                                                <input type="password" name="senha" id="senha" class="form-control" required="required" autocomplete="off" value="${modelLogin.senha}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Senha</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="nome" id="nome" class="form-control" required="required" autocomplete="off" value="${modelLogin.nome}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nome</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="email" name="email" id="email" class="form-control" required="required" autocomplete="off" value="${modelLogin.email}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Email</label>
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
         											     <button type="button" class="btn waves-effect waves-light btn-info btn-skew" data-toggle="modal" data-target="#exampleModalUsuario" onclick="limparInput();">Pesquisar</button>
         											     </div>
         											     <div style="width: 350px; padding-top: 30px;">
															<a class="btn btn-dark stretched-link" href="deletar.jsp" >Deletar</a>
																<a href="atualizar.jsp" class="btn btn-dark stretched-link" >Atualizar</a>
															</div>
                                                        </form> 
                                                       
                                                   
                                                </div>
                                                </div>
                                                </div>
                                                </div>
                                                <p style="font-size: 1.2em">${msg}</p>
                                                
                                                <div id="aparecer" class="alert alert-primary" role="alert" style="height: fix-content; display: none; width: 300px; word-break: break-all;">
                                               					<p style="width: fix-content;">ID: ${modLogin.id}</p>
																<p style="width: fix-content;">Nome: ${modLogin.nome}</p>
																<p style="width: fix-content;">Login: ${modLogin.login}</p>
																<p style="width: fix-content;">Email: ${modLogin.email}</p>
																<p style="width: fix-content;">Classe: ${modLogin.classe}</p>
													</div>
													
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
<jsp:include page="javascriptfile.jsp"></jsp:include>

<jsp:include page="/principal/pesquisar.jsp"></jsp:include>

<script type="text/javascript">

	window.onload = function init() {
		   var current = window.location;
		   var s = current.href;
		 if(s.indexOf("buscarEditar") > -1){
			 var display = document.getElementById('aparecer').style.display = 'block';
		 }
} 
			

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


function buscarUsuario() {
	
    var nomeBusca = document.getElementById('nomeBusca').value;
    
    if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != ''){ /*Validando que tem que ter valor pra buscar no banco*/
	
	 var urlAction = document.getElementById('formUser').action;
	
	 $.ajax({
	     
	     method: "get",
	     url : urlAction,
	     data : "nomeBusca=" + nomeBusca + '&acao=buscarUserAjax',
	     success: function (response) {
		 
		 var json = JSON.parse(response);
		 
		 
		 $('#tabelaresultados > tbody > tr').remove();
		 
		  for(var p = 0; p < json.length; p++){
		      $('#tabelaresultados > tbody').append('<tr> <td>'+json[p].id+'</td> <td> '+json[p].nome+'</td> <td>'+json[p].classe+'</td> <td><button onclick="verEditar('+json[p].id+')" type="button" class="btn btn-info">Ver</button></td></tr>');
		  }
		  
		  document.getElementById('totalResultados').textContent = 'Resultados: ' + json.length;
		 
	     }
	     
	 }).fail(function(xhr, status, errorThrown){
	    alert('Erro ao buscar usuário por nome: ' + xhr.responseText);
	 });
	
	
    }
    
}
 
</script>
</body>

</html>
    