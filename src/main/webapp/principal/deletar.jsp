<%@page import="model.ModelLogin"%>
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
                                                        <h5>DELETE DE USUARIO</h5>
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
         											  	 <button type="button" class="btn waves-effect waves-light btn-primary btn-skew" onclick="criarDelete()">Deletar</button>


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
   
<jsp:include page="javascriptfile.jsp"></jsp:include>

<script type="text/javascript">

function criarDelete(){
	document.getElementById("formUser").method= 'get';
	document.getElementById("acao").value = 'deletar';
	document.getElementById("formUser").submit();
}
</script>
</body>

</html>
    