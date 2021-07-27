package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public ModelLogin consultaUsuarioId(String id) throws SQLException {
		ModelLogin modelLogin = new ModelLogin(); 
		String sql = "SELECT * FROM model_login WHERE id = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, Long.parseLong(id));
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
	
	public List<ModelLogin> buscarUsuarioList(String nome) throws SQLException{
		
		List<ModelLogin> usuarios = new ArrayList<>();
		
		if(nome.equalsIgnoreCase("x")) {
			String sql = "SELECT id, login, senha, email, nome, classe FROM model_login";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet result = preparedStatement.executeQuery();
			
			while(result.next()) {
				ModelLogin m = new ModelLogin();
				m.setId(result.getLong("id"));
				m.setLogin(result.getString("login"));
				m.setEmail(result.getString("email"));
				m.setClasse(result.getString("classe"));
				m.setSenha("********");
				m.setNome(result.getString("nome"));
				usuarios.add(m);
			}
			connection.commit();
			return usuarios;
		
		}else {
			String sql = "SELECT id, login, senha, email, nome, classe FROM model_login WHERE upper(nome) like upper(?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, "%"+nome+"%");
			ResultSet result = preparedStatement.executeQuery();

			while(result.next()) {
				ModelLogin m = new ModelLogin();
				m.setId(result.getLong("id"));
				m.setLogin(result.getString("login"));
				m.setEmail(result.getString("email"));
				m.setClasse(result.getString("classe"));
				m.setSenha("********");
				m.setNome(result.getString("nome"));
				usuarios.add(m);
			}
			connection.commit();
			return usuarios;
		}
		
	}
		
	
	public boolean validarLogin(String login) throws SQLException {

			String sql = "select count(1) from model_login where upper(login) = upper('"+login+"')";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				return resultSet.getInt(1) >= 1;
			}
			return false;
			
	}


	public void atualizarUsuario(ModelLogin modelLogin) throws SQLException {
		// ATUALIZAR O USUARIO NO BANCO DE DADOS
		try {
		String sql = "UPDATE model_login SET login=?, senha=?, email=?, nome=?, classe=? WHERE login='" + modelLogin.getLogin()+"';";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, modelLogin.getLogin());
			statement.setString(2, modelLogin.getSenha());
			statement.setString(3, modelLogin.getEmail());
			statement.setString(4, modelLogin.getNome());
			statement.setString(5, modelLogin.getClasse());
			
			statement.executeUpdate();
			connection.commit();
		}catch(Exception e){
			connection.rollback();
			e.printStackTrace();
		}
			
	}
	

	public int deletarUSuario(String idUser){
		// DELETAR O USUARIO NO BANCO DE DADOS
			try {
				String sql = "DELETE FROM model_login WHERE id='"+idUser+"'";
					PreparedStatement statement = connection.prepareStatement(sql);		
					
					if(statement.executeUpdate() > 0) {
						statement.executeUpdate();
						connection.commit();
						return 1;
					}else {
						return 0;
					}
			}catch(Exception e) {
				return 0;
			}
	}

}