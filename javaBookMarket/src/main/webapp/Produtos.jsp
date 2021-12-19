<%@page import="model.Produto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Produtos</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>

	
	<%
		
		String idProduto = request.getParameter("idProduto");
		String fabricante = request.getParameter("fabricante");
		String nome = request.getParameter("nome");
		String marca = request.getParameter("marca");
		String modelo = request.getParameter("modelo");
		String idCategoria = null;
		String descricao = request.getParameter("descricao");
		String unidadeMedida = request.getParameter("unidadeMedida");
		String largura = request.getParameter("largura");
		String altura = request.getParameter("altura");
		String profundidade = request.getParameter("profundidade");
		String peso = request.getParameter("peso");
		String cor = "P";
	
		//String acao = request.getParameter("acao");
		String acao = "1";
		
		if ( (nome != null) ){
			Produto produto = new Produto(Integer.valueOf(idProduto), fabricante, nome, marca, modelo, idCategoria, descricao, unidadeMedida, Double.valueOf(largura), Double.valueOf(altura), Double.valueOf(profundidade), Double.valueOf(peso), cor);
			
			if ( Integer.valueOf(acao) == 1 ){
				produto.save();
			} else if (Integer.valueOf(acao) == 2) {
				produto.delete();
			}
		
		}
		
		String saida = new Produto().listAll();
		response.getWriter().write(saida);
			
	%>

	<div class="container-fluid">
		<a href="./Index.jsp" ><button type="button" class="btn btn-danger">Voltar</button></a>
		<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><button type="button" class="btn btn-primary">Criar</button></a>
	</div>
	

	<!-- Cadastro Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div  class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Cadastro</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="Produtos.jsp" method="post">
			  
			  <div class="mb-3">
			    <label for="idProduto" class="form-label">Identificação do Produto</label>
			    <input type="text" class="form-control" id="idProduto" name="idProduto" aria-describedby="idUsuario" value="0">
			  </div>
			  
			  <div class="mb-3">
			    <label for="fabricante" class="form-label">Fabricante</label>
			    <input type="text" class="form-control" id="fabricante" name="fabricante" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="nome" class="form-label">Nome</label>
			    <input type="text" class="form-control" id="nome" name="nome">
			  </div>
			  
			  <div class="mb-3">
			    <label for="marca" class="form-label">Marca</label>
			    <input type="text" class="form-control" id="marca" name="marca" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="modelo" class="form-label">Modelo</label>
			    <input type="text" class="form-control" id="modelo" name="modelo" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="idCategoria" class="form-label">Categoria</label>
			    <input type="text" class="form-control" id="idCategoria" name="idCategoria" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="descricao" class="form-label">Descrição</label>
			    <input type="text" class="form-control" id="descricao" name="descricao" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="unidadeMedida" class="form-label">Unidade de Medida</label>
			    <input type="text" class="form-control" id="unidadeMedida" name="unidadeMedida" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="largura" class="form-label">Largura</label>
			    <input type="text" class="form-control" id="largura" name="largura" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="altura" class="form-label">Altura</label>
			    <input type="text" class="form-control" id="altura" name="altura" aria-describedby="emailHelp">
			  </div>
			  
			  
			  <div class="mb-3">
			    <label for="profundidade" class="form-label">Profundidade</label>
			    <input type="text" class="form-control" id="profundidade" name="profundidade" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="peso" class="form-label">Peso</label>
			    <input type="text" class="form-control" id="peso" name="peso" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="cor" class="form-label">Cor</label>
			    <input type="text" class="form-control" id="cor" name="cor" aria-describedby="emailHelp">
			  </div>
			  			  
			  <button type="button" class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
			  <button type="submit" id="btnUsers" class="btn btn-primary" >Cadastre</button>
			</form>
	      </div>
	    </div>
	  </div>
	</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>