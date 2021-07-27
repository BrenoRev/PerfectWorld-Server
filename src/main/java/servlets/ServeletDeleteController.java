package servlets;

import java.io.IOException;
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
@WebServlet("/ServeletDeleteController")
public class ServeletDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();

	public ServeletDeleteController() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		try {
			
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjax")) {

				String nomeBusca = request.getParameter("nomeBusca");
				 
				 List<ModelLogin> dadosJsonUser;
				
				 dadosJsonUser = daoUsuarioRepository.buscarUsuarioList(nomeBusca);
				 
				 ObjectMapper mapper = new ObjectMapper();
				 
				 String json = mapper.writeValueAsString(dadosJsonUser);
				 
				 response.getWriter().write(json);
			}

		else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarajax")) {
				String msg;
				String idUser = request.getParameter("id");
				if (daoUsuarioRepository.deletarUSuario(idUser) == 1) {
					daoUsuarioRepository.deletarUSuario(idUser);
					msg = "Usuário excluído com sucesso!";
				} else {
					msg = "Usuário invalido.";
				}

				response.getWriter().write(msg);
				request.getRequestDispatcher("principal/deletar.jsp").forward(request, response);
			}

			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {
				String msg;
				// DELETE USANDO O METHOD GET DO FORMULÁRIO
				String idUser = request.getParameter("id");
				if (daoUsuarioRepository.deletarUSuario(idUser) == 1) {
					daoUsuarioRepository.deletarUSuario(idUser);
					msg = "Usuário excluído com sucesso!";
				} else {
					msg = "Usuário invalido.";
				}
				request.setAttribute("msg", msg);

				request.getRequestDispatcher("principal/deletar.jsp").forward(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
