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

<h1> Créer un évenement </h1>
 <form action="formulaireEvenementSave.jsp">
   
    	<table>
    	
    	<tr> <td>Nom: </td><td><input type="text" name="nom"></td></tr> 	
		<tr> <td> Catégorie: </td><td>
			<select name="categorie">
			<option></option>
            <option>Hackaton</option>
            <option>Atelier Coworking</option>
       		</select> <br/></td></tr>
       	<tr> <td>Description: </td><td><input type="content" name="description"></td></tr>
    	<tr> <td>lieu: </td><td><input type="text" name="lieu"></td></tr>
    	<tr> <td>Date de début de votre événement: </td><td><input type="date" name="dateDebutEvenement" ></td></tr>
    	<tr> <td>Heure du début événement: </td><td><input type="time" name="heureDebutEvenement"></td></tr>
    	<tr> <td>Date de fin de votre événement: </td><td><input type="date" name="dateFinEvenement"></td></tr>
    	<tr> <td>Heure de fin événement: </td><td><input type="time" name="heurefinEvenement"></td></tr>
    	<tr> <td>Age minimal: </td><td><input type="text" name="age_mini"></td></tr> <!-- titre indicatif !!!!!!!!!!!!!!!  --> 
    	<tr> <td>Nombre de places </td><td><input type="text" name="capacite"></td></tr>
		
		<tr><td><input type="submit" value="Submit"></td></tr>
		
		
		</table>
   </form>
  <jsp:include page="footer.html"></jsp:include>
</body>
</html>