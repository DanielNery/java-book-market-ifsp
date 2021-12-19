<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Realizando Login...</title>
</head>
<body>

	<%
	
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		Usuario usuario = new Usuario();
		String respostaLogin = usuario.login(email, senha);
		response.getWriter().write(respostaLogin);
	
	%>

</body>
</html>