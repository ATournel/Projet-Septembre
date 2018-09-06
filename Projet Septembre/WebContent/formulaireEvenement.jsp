<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.html"></jsp:include>

	<h1>Créer un évenement</h1>
	<form action="formulaireEvenementSave.jsp">


		<table>

			<tr><td>Titre de l'événement:</td><td><input type="text" name="nom"></td></tr>
			
			<tr> <td> Catégorie: </td><td>
				<select name="categorie">
            			<option>Atelier Coworking</option>
            			<option>Hackaton</option>
       	 	</select> <br/></td></tr>
			<tr><td>lieu :</td><td><input type="text" name="lieu"></td></tr>
			<tr><td>dateDebutEvenement :</td><td><input type="text" name="dateDebutEvenement"></td></tr>
			<tr><td>heureDebutEvenement :</td><td><input type="text" name="heureDebutEvenement"></td></tr>
			<tr><td>dateFinEvenement :</td><td><input type="text" name="dateFinEvenement"></td></tr>
			<tr><td>heurefinEvenement :</td><td><input type="text" name="heurefinEvenement"></td></tr>
			<tr><td>description :</td><td><input type="text" name="description"></td></tr>
			<tr><td>Nombre de places :</td><td><input type="text" name="capacite"></td></tr>
			
			

			<tr>
				<td><input type="submit" value="Submit"></td>
			</tr>


		</table>
	</form>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>