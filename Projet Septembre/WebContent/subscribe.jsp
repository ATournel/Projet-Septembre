
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subscribe</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style/Style.css">
</head>
<body class="subscribeBody">
	<jsp:include page="header3.html"></jsp:include>

	<H1 class="signTitle">Formulaire d'inscription</H1>

	<form action="subscribeSave.jsp" class="signForm">

		<table>
			<tr>
				<td><input type="text" name="nom" placeholder="Nom"></td>
			</tr>
			<tr>
				<td><input type="text" name="prenom" placeholder="Pr�nom"></td>
			</tr>
			<tr>
				<td><input type="text" name="pseudo" placeholder="Pseudo"></td>
			</tr>
			<tr>
				<td><input type="text" name="mail_compte" placeholder="Mail"></td>
			</tr>
			<tr>
				<td><input type="password" name="mdp"
					placeholder="Mot de passe"></td>
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
			D�j� membre? <a href="signInForm.jsp">Connexion</a>
		</p>
	</form>

	<jsp:include page="footer.html"></jsp:include>
</body>