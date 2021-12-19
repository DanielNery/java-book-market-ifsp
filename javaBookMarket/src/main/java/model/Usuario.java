package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Usuario {

	private int idUsuario;
	private String email;
	private String senha;
	private int idNivelUsuario;
	private String nome;
	private String cpf;
	private String endereco;
	private String bairro;
	private String cidade;
	private String uf;
	private String cep;
	private String telefone;
	private String foto;
	private String ativo;
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private String where = "";
	private DBQuery dbQuery = null;

	/* Construtores */
	
	public Usuario() {
		this.tableName = "usuarios";
		this.fieldsName = "idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto, ativo";
		this.keyField = "";
		this.where = "";
		this.dbQuery = new DBQuery(tableName, fieldsName, keyField);
	}

	public Usuario(int idUsuario, String email, String senha, int idNivelUsuario, String nome, String cpf,
			String endereco, String bairro, String cidade, String uf, String cep, String telefone, String foto,
			String ativo) {
		this.tableName = "usuarios";
		this.fieldsName = "idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto, ativo";
		this.keyField = "";
		this.where = "";
		this.dbQuery = new DBQuery(tableName, fieldsName, keyField);
		this.setIdUsuario(idUsuario);
		this.setEmail(email);
		this.setSenha(senha);
		this.setIdNivelUsuario(idNivelUsuario);
		this.setNome(nome);
		this.setCpf(cpf);
		this.setEndereco(endereco);
		this.setBairro(bairro);
		this.setCidade(cidade);
		this.setUf(uf);
		this.setCep(cep);
		this.setTelefone(telefone);
		this.setFoto(foto);
		this.setAtivo(ativo);
	}

	/* Conversão para array */
	
	public String[] toArray() {
		return (
			new String[] {
				""+this.getIdUsuario(),
				""+this.getEmail(),
				""+this.getSenha(),
				""+this.getIdNivelUsuario(),
				""+this.getNome(),
				""+this.getCpf(),
				""+this.getEndereco(),
				""+this.getBairro(),
				""+this.getCidade(),
				""+this.getUf(),
				""+this.getCep(),
				""+this.getTelefone(),
				""+this.getFoto(),
				""+this.getAtivo(),
			}
		);
	}
	
	/* Crud */
	
	public void save() {
		if ((this.getIdUsuario() == 0)) {
			this.dbQuery.insert(this.toArray());
		} else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if (this.getIdUsuario() > 0) {
			this.dbQuery.delete( this.toArray() );
		}
	}
	
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<div class='container-fluid table-responsive p-2'>";
		saida += "<h1>Lista de Usuários</h1>";
		saida += "<table class='table table-dark table-striped'>";
		
		try {
			while (rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("idUsuario") + "</td>";
				saida += "<td>" + rs.getString("email") + "</td>";
				saida += "<td>" + rs.getString("senha") + "</td>";
				saida += "<td>" + rs.getString("idNivelUsuario") + "</td>";
				saida += "<td>" + rs.getString("nome") + "</td>";
				saida += "<td>" + rs.getString("cpf") + "</td>";
				saida += "<td>" + rs.getString("endereco") + "</td>";
				saida += "<td>" + rs.getString("bairro") + "</td>";
				saida += "<td>" + rs.getString("cidade") + "</td>";
				saida += "<td>" + rs.getString("uf") + "</td>";
				saida += "<td>" + rs.getString("cep") + "</td>";
				saida += "<td>" + rs.getString("telefone") + "</td>";
				saida += "<td>" + rs.getString("foto") + "</td>";
				saida += "<td>" + rs.getString("ativo") + "</td>";
				saida += "<td><a href='#'><i class='fas fa-times text-danger'></i></a></td>";
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		saida += "</table></div>";
		return (saida);
	}

	
	public String login(String email, String senha) {
		String where = "email = '" + email + "' AND senha = '" + senha + "';" ;
		
		ResultSet rs = this.dbQuery.select(where);
		String saida = "";
		
		if (rs != null) {
			saida = "<script>alert('Login Realizado com Sucesso!')</script>";
		} else {
			saida = "<script>alert('Email ou Senha inválidos.')</script>";
		}

		return (saida);
		
	}
	
	/* Gets and Setters */
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getSenha() {
		return senha;
	}


	public void setSenha(String senha) {
		this.senha = senha;
	}


	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}


	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}


	public String getEndereco() {
		return endereco;
	}


	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}


	public String getBairro() {
		return bairro;
	}


	public void setBairro(String bairro) {
		this.bairro = bairro;
	}


	public String getCidade() {
		return cidade;
	}


	public void setCidade(String cidade) {
		this.cidade = cidade;
	}


	public String getUf() {
		return uf;
	}


	public void setUf(String uf) {
		this.uf = uf;
	}


	
	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getAtivo() {
		return ativo;
	}

	public void setAtivo(String ativo) {
		this.ativo = ativo;
	}
	
}
