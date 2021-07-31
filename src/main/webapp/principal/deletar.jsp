<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html lang="en">

<link rel="shortcut icon" href="images/pwicon.png" />
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
                                                        <h5>DELETAR USUARIO</h5>
                                                    </div>
                                                    <div class="card-block">
                                                        <form method="post" class="form-material" id="formUser" action="<%= request.getContextPath()%>/ServeletDeleteController" >
                                                        
                                                        	<input type="hidden" name="acao" id="acao" value="">
                                                        
                                                            <div class="form-group form-default">
                                                                <input type="text" name="id" id="id" class="form-control" required="required" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ID a ser deletado.</label>
                                                            </div>
																<br>
																<br>
																<div style="width: 350px;">
         											  	 <button type="button" class="btn waves-effect waves-light btn-primary btn-skew" onclick="criarDelete()">Excluir por ID</button>
														 <button type="button" class="btn waves-effect waves-light btn-danger btn-skew" data-toggle="modal" data-target="#exampleModalUsuario" onclick="limparInput();">Excluir por Pesquisa</button>
															</div>
															<div style="width: 350px; padding-top: 30px;">
															<a class="btn btn-dark stretched-link" href="<%= request.getContextPath()%>/principal/usuario.jsp" >Cadastro</a>
																<a href="<%= request.getContextPath()%>/principal/atualizar.jsp" class="btn btn-dark stretched-link" >Atualizar</a>
															</div>
                                                    	</form>
                                                    </div>
                                                </div>	
                                            </div>
                                            <span id="msg"> ${msg}</span>
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
   
<jsp:include page="javascriptfile.jsp"></jsp:include>
<jsp:include page="/principal/pesquisar.jsp"></jsp:include>
<script type="text/javascript">

function criarDeleteTabela(id){
	// PEDE A CONFIRMAÇÃO ANTES DE REALIZAR A AÇÃO
	if(confirm("Deseja realmente excluir o registro?")){
	document.getElementById("formUser").method= 'get';
	document.getElementById("acao").value = 'deletar';
	document.getElementById("formUser").submit();
	}
}
    
function deleteAjax(id) {
    
    if (confirm('Deseja realmente excluir os dados?')){
	
	 var urlAction = document.getElementById('formUser').action;
	 alert(urlAction);
	 alert(id);
	 $.ajax({
	     
	     method: "get",
	     url : urlAction,
	     data : "id=" + id + '&acao=deletarajax',
	     success: function (response) {
	    	 alert("sucesso" + id)
	     }
	     
	 }).fail(function(xhr, status, errorThrown){
	    alert('Erro ao deletar usuário por id: ' + xhr.responseText);
	 });
	 
	  
    }
    
}

function criarDelete(){
	// PEDE A CONFIRMAÇÃO ANTES DE REALIZAR A AÇÃO
	if(confirm("Deseja realmente excluir o registro?")){
	document.getElementById("formUser").method= 'get';
	document.getElementById("acao").value = 'deletar';
	document.getElementById("formUser").submit();
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
		      $('#tabelaresultados > tbody').append('<tr> <td>'+json[p].id+'</td> <td> '+json[p].nome+'</td> <td>'+json[p].classe+'</td> <td><button onclick="deleteAjax('+json[p].id+')" type="button" class="btn btn-info">Deletar</button></td></tr>');
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
    