<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subscribe</title>
</head>
<body>
	<form action="subscribeSave.jsp">
		<jsp:include page="header.html"></jsp:include>
		<center>
			<H1>FORMULAIRE D'INSCRIPTION</H1>
			<table>
				<tr>
					<td>Nom:</td>
					<td><input type="text" name="nom"></td>
				</tr>
				<td>Prénom:</td>
				<td><input type="text" name="prenom"></td>
				</tr>
				<tr>
					<td>Pseudo:</td>
					<td><input type="text" name="pseudo"></td>
				</tr>
				<td>Mail:</td>
				<td><input type="text" name="mail_compte"></td>
				</tr>
				<tr>
					<td>Mot de passe:</td>
					<td><input type="password" name="mdp"></td>
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
				Déjà membre? <a href="signInForm.jsp">Connexion</a>
			</p>
	</form>
	</center>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>