<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Usuários</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>

	
	<%
		
		String idUsuario = request.getParameter("idUsuario");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String idNivelUsuario = "1";
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String cep = request.getParameter(" cep");
		String endereco = request.getParameter("endereco");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String uf = request.getParameter("uf");
		String telefone = request.getParameter("telefone");
		String foto = "teste";
		String ativo = "N";
	
		//String acao = request.getParameter("acao");
		String acao = "1";
		
		if ( (email != null) ){
			Usuario usuario = new Usuario(Integer.valueOf(idUsuario), email, senha, Integer.valueOf(idNivelUsuario), nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto,ativo);
			
			if ( Integer.valueOf(acao) == 1 ){
				usuario.save();
			} else if (Integer.valueOf(acao) == 2) {
				usuario.delete();
			}
		
		}
		
		String saida = new Usuario().listAll();
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
	        <form action="Users.jsp" method="post">
			  
			  <div class="mb-3">
			    <label for="idUsuario" class="form-label">Identificação do Usuário</label>
			    <input type="text" class="form-control" id="idUsuario" name="idUsuario" aria-describedby="idUsuario" value="0">
			  </div>
			  
			  <div class="mb-3">
			    <label for="email" class="form-label">Email</label>
			    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="senha" class="form-label">Senha</label>
			    <input type="password" class="form-control" id="senha" name="senha">
			  </div>
			  
			  <div class="mb-3">
			    <label for="nome" class="form-label">Nome</label>
			    <input type="text" class="form-control" id="nome" name="nome" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="cpf" class="form-label">CPF</label>
			    <input type="text" class="form-control" id="cpf" name="cpf" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="cep" class="form-label">CEP</label>
			    <input type="text" class="form-control" id="cep" name="cep" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="endereco" class="form-label">Endereço</label>
			    <input type="text" class="form-control" id="endereco" name="endereco" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="bairro" class="form-label">Bairro</label>
			    <input type="text" class="form-control" id="bairro" name="bairro" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="cidade" class="form-label">Cidade</label>
			    <input type="text" class="form-control" id="cidade" name="cidade" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="form-group">
			    <label for="uf" class="form-label">UF</label>
			    <select class="form-control" id="uf" name="uf" size="1">
			    
			    	<option value="AC">Acre</option>
			    	<option value="RO">Rndônia</option> 
			    	<option value="AM">Amazônas</option> 
			    	<option value="RR">Roraima</option> 
			    	<option value="PA">Pará</option> 
			    	<option value="AP">Amapá</option> 
			    	<option value="TO">Tocantins</option> 
			    	<option value="MA">Maranhão</option> 
			    	<option value="PI">Piauí</option> 
			    	<option value="CE">Ceará</option> 
			    	<option value="RN">Rio Grande do Norte</option>
			    	<option value="PB">Paraíba</option> 
			    	<option value="PE">Pernanbuco</option> 
			    	<option value="AL">Alagoas</option> 
			    	<option value="SE">Sergipe</option> 
			    	<option value="BA">Bahia</option> 
			    	<option value="MG">Minas Gerais</option> 
			    	<option value="ES">Espirito Santo</option> 
			    	<option value="RJ">Rio de Janeiro</option> 
			    	<option value="SP">São Paulo</option> 
			    	<option value="PR">Paraná</option>
			    	<option value="SC">Santa Catarina</option> 
			    	<option value="RS">Rio Grande do Sul</option> 
			    	<option value="MS">Mato Grosso do Sul</option> 
			    	<option value="MT">Mato Grosso</option> 
			    	<option value="GO">Goiás</option> 
			    	<option value="DF">Distrito Federal</option> 
			    
			    </select>
			  </div>
			  
			  <div class="mb-3">
			    <label for="telefone" class="form-label">Telefone</label>
			    <input type="text" class="form-control" id="telefone" name="telefone" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3">
			    <label for="foto" class="form-label">Foto</label>
			    <input type="file" class="form-control" id="foto" name="foto" aria-describedby="emailHelp">
			  </div>
			  
			  <div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" id="exampleCheck1">
			    <label class="form-check-label" for="exampleCheck1">Li e Concordo com o termos de uso?</label>
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