<%@ page language="java" contentType="text/html; charset=UTF-8"
%>

   <div class="modal fade" id="exampleModalUsuario"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Pesquisar Usuário</h5>
       
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
         <span style="margin: auto; padding-top:20px;">Digite "x" para pesquisar todos os usuários.</span>
      <div class="modal-body">
        <div class="input-group">
  <input type="text" class="form-control" id="nomeBusca" placeholder="Nome" aria-label="nome" aria-describedby="basic-addon2">
  		<div class="input-group-append">
    <button class="btn btn-success" type="button" onclick="buscarUsuario();">Pesquisar</button>
    <button class="btn btn-danger" type="button" onclick="limparInput()">Limpar</button>
  		</div>
		</div>
		
		<div style="height: 300px;overflow-y: scroll;" >
		<table class="table" id="tabelaresultados">
		<thead>
		<tr>
	  <th scope="col">ID</th>
      <th scope="col">Nome</th>
      <th scope="col">Classe</th>
      <th scope="col"></th>
  		</tr>
		</thead>
  <tbody>
  </tbody>
		</table>
  </div>
  <p id="totalResultados"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>
   


