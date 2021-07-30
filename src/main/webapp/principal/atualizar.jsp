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
                                                        <h5>ATUALIZAR DADOS DO JOGADOR</h5>
                                                    </div>
                                                    <div class="card-block">
                                                        <form method="post" class="form-material" action="<%= request.getContextPath()%>/ServeletAtualizarController" id="formUser">
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="login" id="login" class="form-control" readonly="readonly" autocomplete="off" value=<%= request.getSession().getAttribute("usuario") %> >
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Login</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default">
                                                                <input type="password" name="senha" id="senha" class="form-control" required="required" autocomplete="off" value="${modLogin.senha}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nova Senha</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="nome" id="nome" class="form-control" required="required" autocomplete="off" value="${modLogin.nome}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Novo Nome</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="email" name="email" id="email" class="form-control" required="required" autocomplete="off" value="${modLogin.email}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Novo Email</label>
                                                            </div>
                                                            
                                                            
                                                             <div class="col-bg-12">
                                                             <br>
                                                             <p> Escolha sua nova classe </p>
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
         											   <button class="btn waves-effect waves-light btn-primary btn-skew">Atualizar</button>
														<button type="button" class="btn waves-effect waves-light btn-secondary btn-skew" onclick="limparForm()" >Limpar</button>
	 </div>
	 <div style="width: 350px; padding-top: 30px;">
															<a class="btn btn-dark stretched-link" href="usuario.jsp" >Cadastro</a>
																<a href="deletar.jsp" class="btn btn-dark stretched-link" >Deletar</a>
															</div>
                                                    	</form>
                                                    </div>
                                                </div>
                                            </div>
                                            <p style="font-size: 1.2em">${msg}</p>
                                             
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
		for(p=1; p<elementos.length; p++){
			elementos[p].value = '';
		}
			
}

function limparInput(){
	var input = document.getElementById("nomeBusca").value= '';
	document.getElementById('totalResultados').innerHTML = '';
	$('#tabelaresultados > tbody > tr').remove();
	     
}


    
}
</script>
</body>

</html>
    