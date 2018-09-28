<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Formulaire Event</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style/Style.css">
</head>
<body class="createEventBody">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="signInForm">
		<h1 class="signTitle">Cr�er un �v�nement</h1>
		<form class="signForm" action="formulaireEvenementSave.jsp">


			<table>

				<tr>
					<td>Titre de l'�v�nement:</td>
					<td><input type="text" name="nom"></td>
				</tr>

				<tr>
					<td>Cat�gorie:</td>
					<td><select name="cat�gorie">
							<option></option>
							<option>Atelier Coworking</option>
							<option>Hackathon</option>
					</select> <br /></td>
				</tr>
				<tr>
					<td>Lieu :</td>
					<td><input type="text" name="lieu"></td>
				</tr>
				<tr>
					<td>Date d�but :</td>
					<td><input type="date" date="dateDebutEvenement"></td>
				</tr>
				<tr>
					<td>Heure de d�but :</td>
					<td><input type="text" name="heureDebutEvenement"></td>
				</tr>
				<tr>
					<td>Date de fin :</td>
					<td><input type="date" name="dateFinEvenement"></td>
				</tr>
				<tr>
					<td>Heure de fin :</td>
					<td><input type="text" name="heurefinEvenement"></td>
				</tr>
				<tr>
					<td>Nombre de places :</td>
					<td><input type="text" name="capacite"></td>
				</tr>
				<tr>
					<td>Description :</td>
					<td><input type="textarea" name="description"></td>
				</tr>



				<tr>
					<td><input type="submit" value="VALIDER"></td>
				</tr>


			</table>
		</form>
	</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>

