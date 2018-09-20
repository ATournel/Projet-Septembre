<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style/Style.css">
<title>Sign In Form</title>
</head>
<body>
	<jsp:include page="header3.html"></jsp:include>
	<h1 class="signTitle">Connexion</h1>

	<form class="signForm" name="signin" action="Sign_in" method="post">
		<table>
			<tr>
				
				<td><input type="text" name="pseudo" value='${sessionLogin}' placeholder="Pseudo"></td>
			</tr>
			<tr></tr>
			<tr>
				
				<td><input type="password" name="password" placeholder="Mot de passe"></td>
			</tr>
			<tr>
				<td><p></p></td>
			</tr>
			<tr>
				<td><p></p></td>
			</tr>
			<tr>
				<td><input type="submit" value="Valider"></td>
			</tr>
		</table>
		<p>
			Pas encore membre? <a href="subscribe.jsp">Inscription</a>
		</p>
	</form>

	<jsp:include page="footer.html"></jsp:include>

	<!--  Jsp script (bootstrap) -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>