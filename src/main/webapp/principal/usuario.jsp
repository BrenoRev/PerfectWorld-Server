<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
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
                                                            <div class="form-group form-default">
                                                                <input type="text" name="login" id="login" class="form-control" required="required" autocomplete="off" value="${modLogin.login}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Login</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default">
                                                                <input type="password" name="senha" id="senha" class="form-control" required="required" autocomplete="off" value="${modLogin.senha}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Senha</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="nome" id="nome" class="form-control" required="required" autocomplete="off" value="${modLogin.nome}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nome</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="email" name="email" id="email" class="form-control" required="required" autocomplete="off" value="${modLogin.email}">
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
         											   <button class="btn waves-effect waves-light btn-primary btn-skew">Cadastrar</button>
         											    <button type="button" class="btn waves-effect waves-light btn-secondary btn-skew" onclick="limparForm()" >Limpar</button>
															<button type="button" class="btn waves-effect waves-light btn-info btn-skew" data-toggle="modal" data-target="#ModalUsuario">
  																Pesquisar
																</button>

                                                    	</form>
                                                    </div>
                                                </div>
                                            </div>
                                            <span> ${msg}</span>
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
   
   </div>
   
   
   <div class="modal fade" id="ModalUsuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalUsuario">Pesquisar Usuário</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <div class="input-group">
  <input type="text" class="form-control" id="input" placeholder="Nome" aria-label="Nome do usuário" aria-describedby="basic-addon2">
  		<div class="input-group-append">
    <button class="btn btn-success" type="button" onclick="buscarUsuario()">Pesquisar</button>
    <button class="btn btn-danger" type="button" onclick="limparInput()">Limpar</button>
  		</div>
		</div>
		<div style="height: 300px; overflow:scroll;">
		<table class="table" id="tabelaresultados">
		<thead>
		<tr>
			<th scope="col">ID</th>
  			<th scope="col">Nome</th>
  			<th scope="col">Classe</th>
  			<th scope="col">#</th>
  		</tr>
		</thead>
  <tbody>
  		<tr>
  		<td> *********** </td>
  		<td> *********** </td>
  		<td> *********** </td>
  		<td> *********** </td>
  		</tr>
  		
  </tbody>
		</table>
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>

<jsp:include page="javascriptfile.jsp"></jsp:include>

<script type="text/javascript">
// LIMPAR TODOS OS DADOS DO FORMULARIO
function limparForm(){
		var elementos = document.getElementById("formUser").elements; // retorna um array de elementos do form
		for(p=0; p<elementos.length; p++){
			elementos[p].value = '';
		}
			
}

function limparInput(){
		var input = document.getElementById("input").value= '';
}

/*
  
  function buscarUsuario(){
	var nome = document.getElementById("input").value;
	
	if(nome != null && nome != '' && nome.trim() != ''){
		 var urlAction = document.getElementById('formUser').action;
		
		 $.ajax({
		     
		     method: "get",
		     url : urlAction,
		     data : "nome=" + nome + '&acao=buscarUser',
		     success: function (response) {
			 
			 var json = JSON.parse(response);
			 
			 
			 $('#tabelaresultados > tbody > tr').remove();
			 
			  for(var p = 0; p < json.length; p++){
			      $('#tabelaresultados > tbody').append('<tr> <td>'+json[p].id+'</td> <td> '+json[p].nome+<td>'+json[p].classe+'</td>+'</td> <td><button type="button" class="btn btn-info">Ver</button></td></tr>');
			  }
			  
			  document.getElementById('totalResultados').textContent = 'Resultados: ' + json.length;
			 
		     }
		     
		 }).fail(function(xhr, status, errorThrown){
		    alert('Erro ao buscar usuário por nome: ' + xhr.responseText);
		 });
		
	}
}
 
 */
 
</script>
</body>

</html>
    