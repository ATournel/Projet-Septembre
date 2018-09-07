<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formulaire Event</title>
</head>
<body>
	<jsp:include page="header.html"></jsp:include>

	<h1 class="signTitle">Créer un événement</h1>
	<form class="signForm" action="formulaireEvenementSave.jsp">


		<table>

			<tr><td>Titre de l'événement:</td><td><input type="text" name="nom"></td></tr>
			
			<tr> <td> Catégorie: </td><td>
				<select name="catégorie">
            			<option></option>
            			<option>Atelier Coworking</option>
            			<option>Hackaton</option>
       	 	</select> <br/></td></tr>
			<tr><td>Lieu :</td><td><input type="text" name="lieu"></td></tr>
			<tr><td>Date début :</td><td><input type="date" name="dateDebutEvenement"></td></tr>
			<tr><td>Heure de début :</td><td><input type="text" name="heureDebutEvenement"></td></tr>
			<tr><td>Date de fin :</td><td><input type="text" name="dateFinEvenement"></td></tr>
			<tr><td>Heure de fin :</td><td><input type="text" name="heurefinEvenement"></td></tr>
			<tr><td>Nombre de places :</td><td><input type="text" name="capacite"></td></tr>
			<tr><td>Description :</td><td><input type="textarea" name="description"></td></tr>
			
			

			<tr>
				<td><input type="submit" value="VALIDER"></td>
			</tr>


		</table>
	</form>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>