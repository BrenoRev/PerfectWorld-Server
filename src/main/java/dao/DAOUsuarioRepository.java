package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;
	
	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	
	public ModelLogin gravarUsuario(ModelLogin modelLogin) throws SQLException {
		
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

			return this.consultaUsuario(modelLogin.getLogin());
	}
	
	public ModelLogin consultaUsuario(String login) throws SQLException {
		ModelLogin modelLogin = new ModelLogin(); 
		String sql = "SELECT * FROM model_login WHERE login = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, login);
		ResultSet resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setClasse(resultSet.getString("classe"));
			modelLogin.setLogin(resultSet.getString("login"));
			modelLogin.setSenha(resultSet.getString("senha"));
		}
		
		return modelLogin;
	}
}
