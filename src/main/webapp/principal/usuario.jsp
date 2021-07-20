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
                                                        <form class="form-material">
                                                         <div class="form-group form-danger form-static-label">
                                                                <input type="text" name="footer-email" class="form-control" required="">
                                                                <span class="form-bd"></span>
                                                                <label class="float-label">ID</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="footer-email" class="form-control" required="">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nome</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="footer-email" class="form-control" required="">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Email</label>
                                                            </div>
                                                             <div class="col-bg-12">
                                                                        <select name="select" class="form-control">
                                                                            <option value="opt1">Selecione sua classe</option>
                                                                            <option value="opt2">Guerreiro</option>
                                                                            <option value="opt3">Mago</option>
                                                                            <option value="opt4">Barbaro</option>
                                                                            <option value="opt5">Feiticeira</option>
                                                                            <option value="opt6">Arqueiro</option>
                                                                            <option value="opt7">Sacerdote</option>
                                                                            <option value="opt8">Arcano</option>
                                                                            <option value="opt9">Mistico</option>
                                                                            <option value="opt10">Mercenario</option>
                                                                            <option value="opt11">Espiritualista</option>
                                                                            <option value="opt12">Tormentador</option>
                                                                            <option value="opt13">Retalhador</option>
                                                                        </select>
                                                               </div>

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
   
   
<jsp:include page="javascriptfile.jsp"></jsp:include>
</body>

</html>
    