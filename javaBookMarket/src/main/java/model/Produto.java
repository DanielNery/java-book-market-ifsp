package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Produto {
	
	private int idProduto;
	private String fabricante;
	private String nome;
	private String marca;
	private String modelo;
	private String idCategoria;
	private String descricao;
	private String unidadeMedida;
	private double largura;
	private double altura;
	private double profundidade;
	private double peso;
	private String cor;
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private String where = "";
	private DBQuery dbQuery = null;
	
	
	/* Construtores */
	
	public Produto() {
		this.tableName = "produtos";
		this.fieldsName = "idProduto, fabricante, nome, marca, modelo, idCategoria, descricao, unidadeMedida, largura, altura, profundidade, peso, cor";
		this.keyField = "";
		this.where = "";
		this.dbQuery = new DBQuery(tableName, fieldsName, keyField);
	}

	public Produto(int idProduto, String fabricante, String nome, String marca, String modelo, String idCategoria,
			String descricao, String unidadeMedida, double largura, double altura, double profundidade, double peso,
			String cor) {
		
		this.tableName = "produtos";
		this.fieldsName = "idProduto, fabricante, nome, marca, modelo, idCategoria, descricao, unidadeMedida, largura, altura, profundidade, peso, cor";
		this.keyField = "";
		this.where = "";
		this.dbQuery = new DBQuery(tableName, fieldsName, keyField);
		
		
		this.idProduto = idProduto;
		this.fabricante = fabricante;
		this.nome = nome;
		this.marca = marca;
		this.modelo = modelo;
		this.idCategoria = idCategoria;
		this.descricao = descricao;
		this.unidadeMedida = unidadeMedida;
		this.largura = largura;
		this.altura = altura;
		this.profundidade = profundidade;
		this.peso = peso;
		this.cor = cor;
	}

	
	/* Conversão para array */
	
	public String[] toArray() {
		return (
			new String[] {
				""+this.getIdProduto(),
				""+this.getFabricante(),
				""+this.getNome(),
				""+this.getMarca(),
				""+this.getModelo(),
				""+this.getIdCategoria(),
				""+this.getDescricao(),
				""+this.getunidadeMedida(),
				""+this.getLargura(),
				""+this.getAltura(),
				""+this.getProfundidade(),
				""+this.getPeso(),
				""+this.getCor(),
			}
		);
	}
	
	/* Crud */
	
	public void save() {
		if ((this.getIdProduto() == 0)) {
			this.dbQuery.insert(this.toArray());
		} else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if (this.getIdProduto() > 0) {
			this.dbQuery.delete( this.toArray() );
		}
	}
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<div class='container-fluid table-responsive p-2'>";
		saida += "<h1>Lista de Produtos</h1>";
		saida += "<table class='table table-dark table-striped'>";
		
		try {
			while (rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("idProduto") + "</td>";
				saida += "<td>" + rs.getString("fabricante") + "</td>";
				saida += "<td>" + rs.getString("nome") + "</td>";
				saida += "<td>" + rs.getString("marca") + "</td>";
				saida += "<td>" + rs.getString("modelo") + "</td>";
				saida += "<td>" + rs.getString("idCategoria") + "</td>";
				saida += "<td>" + rs.getString("descricao") + "</td>";
				saida += "<td>" + rs.getString("unidadeMedida") + "</td>";
				saida += "<td>" + rs.getString("largura") + "</td>";
				saida += "<td>" + rs.getString("altura") + "</td>";
				saida += "<td>" + rs.getString("profundidade") + "</td>";
				saida += "<td>" + rs.getString("peso") + "</td>";
				saida += "<td>" + rs.getString("cor") + "</td>";
				saida += "<td><a href='#'><i class='fas fa-times text-danger'></i></a></td>";
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		saida += "</table></div>";
		return (saida);
	}
	
	/* Getters and Setters */

	public int getIdProduto() {
		return idProduto;
	}


	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}


	public String getFabricante() {
		return fabricante;
	}


	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getMarca() {
		return marca;
	}


	public void setMarca(String marca) {
		this.marca = marca;
	}


	public String getModelo() {
		return modelo;
	}


	public void setModelo(String modelo) {
		this.modelo = modelo;
	}


	public String getIdCategoria() {
		return idCategoria;
	}


	public void setIdCategoria(String idCategoria) {
		this.idCategoria = idCategoria;
	}


	public String getDescricao() {
		return descricao;
	}


	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}


	public String getunidadeMedida() {
		return unidadeMedida;
	}


	public void setunidadeMedida(String unidadeMedida) {
		this.unidadeMedida = unidadeMedida;
	}


	public double getLargura() {
		return largura;
	}


	public void setLargura(double largura) {
		this.largura = largura;
	}


	public double getAltura() {
		return altura;
	}


	public void setAltura(double altura) {
		this.altura = altura;
	}


	public double getProfundidade() {
		return profundidade;
	}


	public void setProfundidade(double profundidade) {
		this.profundidade = profundidade;
	}


	public double getPeso() {
		return peso;
	}


	public void setPeso(double peso) {
		this.peso = peso;
	}


	public String getCor() {
		return cor;
	}


	public void setCor(String cor) {
		this.cor = cor;
	}
	
	
	
	
	
	
	
	
	
}
