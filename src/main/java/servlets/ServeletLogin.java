package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
		System.out.println(request.getParameter("nome"));
		System.out.println(request.getParameter("idade"));
	}

}
