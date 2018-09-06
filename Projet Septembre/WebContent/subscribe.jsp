<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subscribe</title>
</head>
<body>
	<jsp:include page="header.html"></jsp:include>
	<H1 class="signTitle">Formulaire d'Inscription</H1>
	<form class="signForm" action="subscribeSave.jsp">

		<table>
			<tr>
				<td>Nom:</td>
				<td><input type="text" name="nom"></td>
			</tr>
			<tr>
				<td>Prénom:</td>
				<td><input type="text" name="prenom"></td>
			</tr>
			<tr>
				<td>Pseudo:</td>
				<td><input type="text" name="pseudo"></td>
			</tr>
			<tr>
				<td>Adresse mail:</td>
				<td><input type="text" name="mail_compte"></td>
			</tr>
			<tr>
				<td>Mot de passe:</td>
				<td><input type="password" name="mdp"></td>
			</tr>
			<tr>
				<td>Genre:</td>
				<td>
					<fieldset>
						<input type="radio" id="Femme" name="feature" value="Femme"
							checked /> <label for="Femme">Femme</label> <input type="radio"
							id="Homme" name="feature" value="Homme" /> <label for="Homme">Homme</label>
					</fieldset>
				</td>
			</tr>
			<tr>
				<td>Age:</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td><input type="submit" value="S'inscrire"></td>
			</tr>

		</table>

		<p>
			Déjà membre? <a href="signInForm.jsp">Connexion</a>
		</p>
	</form>
	</center>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>