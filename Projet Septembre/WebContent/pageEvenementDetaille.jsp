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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style/Style.css">
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
		// verification System.out.println("page evenementDetail:" + eventId);
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
			
			
			dateDebutEvenement = result.getString("dateDebutEvenement");
			dateFinEvenement = result.getString("dateFinEvenement");

			out.println("<h1>");
			out.println("<strong>" + nom + " - </strong> ( "+ categorie + ") ");
			out.println("</h1>");
			out.println("<p>");
			out.println("Date " + dateDebutEvenement + " / " + dateFinEvenement);
			out.println("<br>");
			out.println(heureDebutEvenement + " à " + heurefinEvenement + "    - Lieu :" + lieu);
			out.println("</p>");
			out.println("<p>");
			out.println(description);
			out.println("</p>");

			
			


			String sessionMail = (String) session.getAttribute("mailCompte");

			if (sessionMail != null) {
				out.print("<form action=\"participants.jsp\">");
				out.print("<input type='hidden' name='eventId' value=" + id_evenement + ">");
				out.print("<button type=\"submit\">Voir les participants</button><br>");
				out.print("</form>");

				out.print("<form name='btnParti' action='ParticiperServlet' method='post'>");
				out.print("<input type='hidden' name='eventId' value='" + id_evenement + "'>");
				out.print("<input type='hidden' name='partiId' value='" + sessionMail + "'>");
				out.print("<input type='submit' value='Participer'>");
				out.print("</form>");

				out.print("<form name='btnParti' action='PartiPeutEtreServlet' method='post'>");
				out.print("<input type='hidden' name='eventId' value='" + id_evenement + "'>");
				out.print("<input type='hidden' name='partiId' value='" + sessionMail + "'>");
				out.print("<input type='submit' value='Peut-être'>");
				out.print("</form>");
			}

			else {
				out.print("<form action=\"participants.jsp\">");
				out.print("<input type='hidden' name='eventId' value=" + id_evenement + ">");
				out.print("<button type=\"submit\">Voir les participants</button><br>");
				out.print("</form>");
				out.print("<p>Connectez-vous pour vous inscrire</p>");
			}
          out.print("<br>");
			
			out.print("<form action=\"supprimerEvenementDetail.jsp\">");
			out.print("<input type='hidden' name='eventId' value=" + id_evenement + ">");
			out.print("<button type=\"submit\">Supprimer</button><br>");
			out.print("</form>");
			
			 out.print("<br>");
				
				out.print("<form action=\"modifierPageEvenementDetail.jsp\">");
				out.print("<input type='hidden' name='eventId' value=" + id_evenement + ">");
				out.print("<button type=\"submit\">Modifier</button><br>");
				out.print("</form>");
		}
	%>


</body>
</html>