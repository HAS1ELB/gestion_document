<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document ajout�</title>
<link rel="stylesheet" href="css/docAjoutSucces.css">
</head>
<body>
	<form action="docAjouterSucces.do" method="get">
		<button type="submit">Retour liste des documents</button>
		<input type="hidden" name="username" value="<%=request.getAttribute("username")%>">
	</form>
	
</body>
</html>