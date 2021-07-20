package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;
	
	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	
	public void gravarUsuario(ModelLogin modelLogin) throws SQLException {
		
		String sql = "INSERT INTO public.model_login(login, senha, email, nome, classe) "
				+ "VALUES (?, ?, ?, ?, ?)";
		
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, modelLogin.getLogin());
			statement.setString(2, modelLogin.getSenha());
			statement.setString(3, modelLogin.getEmail());
			statement.setString(4, modelLogin.getNome());
			statement.setString(5, modelLogin.getClasse());
			
			statement.execute();
			connection.commit();
		
		
	}
}
