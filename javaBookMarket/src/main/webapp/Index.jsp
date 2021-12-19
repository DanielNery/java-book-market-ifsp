<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Loja de Livros</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>


</head>
	<body>
	
		<%
		
		int idUsuario = 0;
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
			Usuario usuario = new Usuario(idUsuario, email, senha, Integer.valueOf(idNivelUsuario), nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto,ativo);
			
			if ( Integer.valueOf(acao) == 1 ){
				usuario.save();
			}
		
		}
		
			
	%>
	
		<!-- Menu Navbar -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="#">Livraria Online</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="#">Início</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="./Produtos.jsp">Produtos</a>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            Outros
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="#">Sobre</a></li>
		            <li><a class="dropdown-item" href="#">Serviços</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="#">Equipe</a></li>
		          </ul>
		        </li>
		      </ul>
		      
		      <form class="d-flex justify-content-between align-items-center">
		        <input class="form-control me-2" type="search" placeholder="Pesquisa" aria-label="Search">
		        <button class="btn btn-outline-dark me-4 " type="submit">Pesquisa</button>
		      	<a href="#" class="me-4" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-user text-dark"></i></a>
		      	<i class="fas fa-shopping-cart me-4"></i>
		      </form>
		    </div>
		  </div>
		</nav>
	
		<!-- Login Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div  class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Login</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="Login.jsp" method="post">
				  <div class="mb-3">
				    <label for="exampleInputEmail1" class="form-label">Email</label>
				    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
				  </div>
				  <div class="mb-3">
				    <label for="exampleInputPassword1" class="form-label">Senha</label>
				    <input type="password" class="form-control" id="senha" name="senha">
				  </div>
				  <div class="mb-3 form-check">
				    <input type="checkbox" class="form-check-input" id="exampleCheck1">
				    <label class="form-check-label" for="exampleCheck1">Mantenha-me logado</label>
				  </div>
				  <button type="submit" class="btn btn-primary">Entrar</button>
				  <a href="#" class="me-4" data-bs-toggle="modal" data-bs-target="#exampleModal2"><button type="submit" class="btn ">Cadastre-se</button></a>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	
		<!-- Cadastro Modal -->
		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
		  <div  class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel2">Cadastro</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="Index.jsp" method="post">
				  
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
	
	
		<!-- Header Slider -->
		<header>
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img 
			      	src="./static/teste02.jpg" 
			      	class="w-100"
			      	style="height: 620px" 
			      	alt="..."
			      >
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Third slide label</h5>
			        <p>Some representative placeholder content for the third slide.</p>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img 
			      	src="./static/teste.jpg"
			      	class="w-100"
			      	style="height: 620px"
			      	alt="...">
			      	
			      	<div class="carousel-caption d-none d-md-block">
				        <h5>Third slide label</h5>
				        <p>Some representative placeholder content for the third slide.</p>
			      	</div>
			      	
			    </div>
			    <div class="carousel-item">
			      <img 
			      	src="https://images.pexels.com/photos/904616/pexels-photo-904616.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260" 
			      	class="w-100"
			      	style="height: 620px" 
			      	alt="...">
			      	
			      	<div class="carousel-caption d-none d-md-block">
				        <h5>Third slide label</h5>
				        <p>Some representative placeholder content for the third slide.</p>
			      	</div>
			      	
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</header>
		
		
			
		<div class="row m-5 justify-content-center">
			
			<div class="row">
				
				<div class="col-6">
					<img src="./static/vetor.svg" />
				</div>
			
				<div class="col-6 text-center justify-content-center align-items-center">
					<h1>Projeto de PWE</h1>
					<h2>Loja de livros.</h2>
					<br>
					<br>
					<p>O projeto ainda está em desenvolvimento</p>
				</div>
			
			</div>
			
		</div>
			
	
	
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>