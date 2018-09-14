<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Date.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evenements</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<h1>Evénement</h1>
	<%
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
		String user = "root";
		String pwd = "Ioplop88";//Ioplop88

		Connection cn = null;
		Statement st = null;
		int eventId = Integer.parseInt(request.getParameter("eventId"));
		// verification System.out.println("page modifier evenementDetail:" + eventId);
		// recuperation de la connexion
		cn = DriverManager.getConnection(url, user, pwd);
		//creation d un statement 
		st = cn.createStatement();
		String sql = "SELECT * FROM mayagenda.evenement WHERE evenement.id_evenement =" + eventId + "";
		
		
		//execution requete 
		ResultSet result = st.executeQuery(sql);
		
		
	
		
		
		String nom;
		String mail_participant;
		String categorie;
		String lieu;
		String description;
		String heureDebutEvenement;
		String heurefinEvenement;
		
		// int
		int age_mini;
		int capacite;
		int idEvenement;
		int participant=0;

		// recupération en String ok
		String dateDebutEvenement;
		String dateFinEvenement;

		
		
		while (result.next()) { // ne fonctionne qu'avec le while, solution à trouver !
			
			
			nom = result.getString("nom");
			categorie = result.getString("categorie");
			lieu = result.getString("lieu");
			description = result.getString("description");
			heureDebutEvenement = result.getString("heureDebutEvenement");
			heurefinEvenement = result.getString("heurefinEvenement");
			
			
			int id_evenement = result.getInt("id_evenement");
			capacite = result.getInt("capacite");
			
			dateDebutEvenement = result.getString("dateDebutEvenement");
			dateFinEvenement = result.getString("dateFinEvenement");
			
		
			
			out.print("<form class=\"signForm\" action=\"modificationPageEvenementDetailSave.jsp\">");
			out.print("<table>");
			out.print("<tr><td>Titre de l'événement:</td><td><input type=\"text\" name=\"nom\" value="+nom+"\"></td></tr>");
			out.print("<tr> <td> Catégorie: </td><td>");
			out.print("<select name=\"catégorie\" value="+categorie+"\">");
			out.print("<option></option>");
			out.print("<option>Atelier Coworking</option>");
			out.print("<option>Hackathon</option>");
			out.print("</select> <br/></td></tr>");
			
			out.print("<tr><td>Lieu :</td><td><input type=\"text\" name=\"lieu\" value="+ lieu +"></td></tr>");
			out.print("<tr><td>Date début :</td><td><input type=\"date\" date=\"dateDebutEvenement\" value="+ dateDebutEvenement +"></td></tr>");
			out.print("<tr><td>Heure de début :</td><td><input type=\"text\" name=\"heureDebutEvenement\" value="+ heureDebutEvenement +"></td></tr>");
			out.print("<tr><td>Date de fin :</td><td><input type=\"date\" name=\"dateFinEvenement\" value="+ dateFinEvenement +"></td></tr>");
			out.print("<tr><td>Heure de fin :</td><td><input type=\"text\" name=\"heurefinEvenement\" value="+ heurefinEvenement +"></td></tr>");
			out.print("<tr><td>Nombre de places :</td><td><input type=\"text\" name=\"capacite\" value="+ capacite +"></td></tr>");
			out.print("<tr><td>Description :</td><td><input type=\"textarea\" name=\"description\" value="+ description +"></td></tr>");
			
			
			out.print("<input type='hidden' name='eventId' value=" + id_evenement + ">");
			out.print("<tr><td><input type=\"submit\" value=\"VALIDER\"></td></tr>");
			out.print("</table>");
			out.print("</form>");
			out.print("");
			
			
						

			}
	%>

	
</body>
</html>