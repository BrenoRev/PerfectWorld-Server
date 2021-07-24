package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAOUsuarioRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;

// CLASSE RESPONSÁVEL POR CONTROLAR O CADASTRO DE NOVOS USUARIOS
@WebServlet("/ServeletRegistroController")
public class ServeletRegistroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
	
    public ServeletRegistroController() {
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
		String acao = request.getParameter("acao");
		
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjax")) {

		String nomeBusca = request.getParameter("nomeBusca");
		 
		 List<ModelLogin> dadosJsonUser;
		
		 dadosJsonUser = daoUsuarioRepository.buscarUsuarioList(nomeBusca);
		 
		 ObjectMapper mapper = new ObjectMapper();
		 
		 String json = mapper.writeValueAsString(dadosJsonUser);
		 
		 response.getWriter().write(json);
	}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
		/*
		String nomeBusca = request.getParameter("nome");
		List<ModelLogin> listaNomes = daoUsuarioRepository.buscarUsuarioList(nomeBusca);
		request.setAttribute("lista", listaNomes);
		RequestDispatcher redirecionar = request.getRequestDispatcher("principal/usuario.jsp");
	
		System.out.println(listaNomes);
		System.out.println(nomeBusca);
		System.out.println(acao);
		
		ObjectMapper mapper = new ObjectMapper();
		 
		String json = mapper.writeValueAsString(listaNomes);
		 
		response.getWriter().write(json);
		 
		 redirecionar.forward(request, response);*/
	
	
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String msg;
		ModelLogin modelLogin = new ModelLogin();
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String classe = request.getParameter("classe");
		String login = request.getParameter("login");
		
		
		modelLogin.setNome(nome);
		modelLogin.setEmail(email);
		modelLogin.setClasse(classe);
		modelLogin.setSenha(senha);
		modelLogin.setLogin(login);
		
		if(daoUsuarioRepository.validarLogin(modelLogin.getLogin())) {
			msg = "Já existe um usuário com o mesmo login.";
			
		}else {
				msg = "Usuario criado com sucesso!";
				daoUsuarioRepository.gravarUsuario(modelLogin);
		}
		
		request.setAttribute("msg", msg);
		RequestDispatcher redireciona = request.getRequestDispatcher("principal/usuario.jsp");
		
		// CRIA UM ATRIBUTO COM TODOS OS PARAMETROS PARA SER MOSTRADO NA TELA
		
		redireciona.forward(request, response);
	
	}catch(Exception e) {
		e.printStackTrace();
		RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
		request.setAttribute("msg", e.getMessage());
		redirecionar.forward(request, response);
	}
	}
}
