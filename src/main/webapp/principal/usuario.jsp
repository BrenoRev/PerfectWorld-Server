<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html lang="en">


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
                                                        <form method="post" class="form-material" action="<%= request.getContextPath()%>/ServeletUsuarioController">
                                                         <div class="form-group form-danger form-static-label">
                                                                <input type="text" name="id" id="id" class="form-control" readonly="readonly" autocomplete="off">
                                                                <span class="form-bd"></span>
                                                                <label class="float-label">ID</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="login" id="login" class="form-control" required="required" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Login</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default">
                                                                <input type="password" name="senha" id="senha" class="form-control" required="required" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Senha</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="nome" id="nome" class="form-control" required="required" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nome</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="email" name="email" id="email" class="form-control" required="required" autocomplete="off">
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
         											   <button class="btn waves-effect waves-light btn-primary btn-skew">Confirmar Dados</button>


                                                    	</form>
                                                    </div>
                                                </div>
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
   
   </div>
   
<jsp:include page="javascriptfile.jsp"></jsp:include>
</body>

</html>
    