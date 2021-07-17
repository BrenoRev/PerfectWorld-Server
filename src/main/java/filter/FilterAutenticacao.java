package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

// INTERCEPTA TODAS AS REQUISIÇÕES QUE VIEREM DO PROJETO OU DO MAPEAMENTO
@WebFilter(urlPatterns = {"/principal/*"})
public class FilterAutenticacao implements Filter {
	
	private static Connection connection;
	
    public FilterAutenticacao() {
        // TODO Auto-generated constructor stub
    }

    // ENCERRA OS PROCESSOS QUANDO O SERVIDOR É PARADO
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// INTERCEPTA AS REQUISICOES E AS RESPOSTAS
	// TUDO QUE FIZER NO SISTEMA VAI PASSAR POR ESSE MÉTODO
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException{
		try {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String usuarioLogado = (String) session.getAttribute("usuario");
		String urlParaAutenticar = req.getServletPath(); // URL QUE ESTÁ SENDO ACESSADA
		
		// VALIDAR SE ESTÁ LOGADO SENÃO REDIRECIONA PARA A TELA DE LOGIN
		// SE O USUARIO NÃO ESTIVER LOGADO VAI REDIRECIONAR PARA O INDEX E MOSTRAR A MENSAGEM
		if(usuarioLogado == null || usuarioLogado.equals("null") && 
				!urlParaAutenticar.equalsIgnoreCase("/principal/ServeletLogin")) {
			RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
			request.setAttribute("msg", "Realize o login!");
			redireciona.forward(request, response);
			return; // PARA A EXECUÇÃO E REDIRECIONA PARA O LOGIN
		}else {
			chain.doFilter(request, response);
		}
		connection.commit(); // SE DER TUDO CERTO COMITA NO BANCO DE DADOS
		}catch(Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			try {
				connection.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	// É EXECUTADO QUANDO INICIA O SISTEMA
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnectionBanco.getConnection();
	}

}
