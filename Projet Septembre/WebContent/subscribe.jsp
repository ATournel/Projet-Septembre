
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
	<jsp:include page="header.jsp"></jsp:include>

	<div class="signInForm">

		<form action="subscribeSave.jsp" class="signForm">
			<H1 class="signTitle">Formulaire d'inscription</H1>
			<div class="form-group">
				<input type="text" name="nom" placeholder="Nom">
			</div>
			<div class="form-group">
				<input type="text" name="prenom" placeholder="Prénom">
			</div>
			<div class="form-group">
				<input type="text" name="pseudo" placeholder="Pseudo">
			</div>
			<div class="form-group">
				<input type="text" name="mail_compte" placeholder="Mail">
			</div>
			<div class="form-group">
				<input type="password" name="mdp" placeholder="Mot de passe">
			</div>
			<div class="form-group">
				<p></p>
			</div>
			<input type="submit" value="Valider">
			<div class="form-group">
				<p>
					Déjà membre? <a href="signInForm.jsp">Connexion</a>
				</p>
			</div>
		</form>
	</div>
	<jsp:include page="footer.html"></jsp:include>
</body>