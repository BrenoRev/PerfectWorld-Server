package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

	// SETANDO O LOCAL DO BANCO DE DADOS
	
	private static String url = "jdbc:postgresql://localhost:5432/curso-jsp?autoReconnect=true";
	// LOGIN E SENHA DO BANCO DE DADOS
	private static String user = "postgres";
	private static String password = "123";

	// VARIAVEL DE VERIFICAÇÃO SE O BANCO ESTÁ ABERTO
	private static Connection connection = null;
	
	static {
		conectar();
	}
	
	// CONSTRUTOR PARA TODA VEZ QUE FOR INSTANCIADO JÁ INICIALIZAR O BANCO
	public SingleConnectionBanco() {
		conectar();
	}
	
	private static void conectar() {
		try {
			
			// VERIFICAR SE JÁ EXISTA A CONEXÃO
			
			if(connection == null) {
				// CARREGAR O DRIVER DO POSTGRE
				Class.forName("org.postgresql.Driver");
				// CARREGANDO A CONEXÃO COM BASE NOS DADOS SETADOS
				connection = DriverManager.getConnection(url, user, password);
				// AUTO SALVAMENTO FALSO
				connection.setAutoCommit(false);
				System.out.println("Conectou com sucesso!");
			}
			
			}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		return connection;
	}
	
}
	

