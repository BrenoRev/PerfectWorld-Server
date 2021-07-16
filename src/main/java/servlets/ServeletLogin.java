package servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;

// CONTROLLER
@WebServlet("/ServeletLogin") // Mapemaneto da URL
public class ServeletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ServeletLogin() {
       
    }
    /* Recebe os dados pela URL em parametros */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	/* Recebe os dados enviados por um formulário */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// RECEBE OS PARAMETROS DA WEB E IMPRIME NA TELA
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		// SE O LOGIN E A SENHA NÃO FOREM VAZIAS OU NULAS ELE CRIA UM NOVO LOGIN
		if(!login.isBlank() && !senha.isBlank()) {
			ModelLogin modelLogin = new ModelLogin();
			modelLogin.setLogin(login);
			modelLogin.setSenha(senha);
			
			// SIMULANDO O LOGIN
			if(modelLogin.getLogin().equalsIgnoreCase("admin")
				&& modelLogin.getSenha().equalsIgnoreCase("admin"))
				{
				// INFORMANDO UMA SESSÃO ABERTA DE USUARIO
					request.getSession().setAttribute("usuario", modelLogin.getLogin());
					
					// REDIRECIONAR
					RequestDispatcher redirecionar = request.getRequestDispatcher("principal/principal.jsp");
					redirecionar.forward(request, response);
				}
			else {
				RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg", "Informe o login e senha correatmente!");
				redirecionar.forward(request, response);
			}
		}else {
			// EM CASO DE ERRO NA AUTENTICAÇÃO RETORNAR PRA MESMA PÁGINA
			RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
			// MENSAGEM DE ERRO
			request.setAttribute("msg", "Informe o login e senha correatmente!");
			// FAZER O REDIRECIONAMENTO
			redirecionar.forward(request, response);
		}
		
	}

}
