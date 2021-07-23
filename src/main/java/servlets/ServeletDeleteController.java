package servlets;

import java.io.IOException;

import dao.DAOUsuarioRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// CLASSE RESPONSÁVEL POR CONTROLAR O CADASTRO DE NOVOS USUARIOS
@WebServlet("/ServeletDeleteController")
public class ServeletDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
	
    public ServeletDeleteController() {
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {;
		
	try {
		String msg;
		String acao = request.getParameter("acao");
		
		// DELETE USANDO O METHOD GET DO FORMULÁRIO
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {
			String idUser = request.getParameter("id");
			if(daoUsuarioRepository.deletarUSuario(idUser) == 1) {
				daoUsuarioRepository.deletarUSuario(idUser);
				msg = "Usuário excluído com sucesso!";
			}else {
				msg = "Usuário invalido.";
			}
			request.setAttribute("msg", msg);
			
			// DELETE USANDO O AJAX
		}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarajax")) {
			String idUser = request.getParameter("id");
			if(daoUsuarioRepository.deletarUSuario(idUser) == 1) {
				daoUsuarioRepository.deletarUSuario(idUser);
				msg = "Usuário excluído com sucesso!";
			}else {
				msg = "Usuário invalido.";
			}
			
			response.getWriter().write(msg);
		}
		
		request.getRequestDispatcher("principal/deletar.jsp").forward(request, response);
		
	}catch(Exception e) {
		e.printStackTrace();
		RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
		request.setAttribute("msg", e.getMessage());
		redirecionar.forward(request, response);
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
}
	
}
