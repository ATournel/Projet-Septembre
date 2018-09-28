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
<title>Events Filtrés</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style/Style.css">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	
	<h2 class='divTitle'>
		<a href="formulaireEvenement.jsp" class="voirPlus">Créer mon Evenement!</a>
	</h2>
	<br />
	<br />
	<div class="eventList">
		<%
			String searchNom = request.getParameter("eventName");
			String searchType = request.getParameter("categorie");

			System.out.println(searchNom);
			System.out.println(searchType);

			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
			String user = "root";
			String pwd = "Ioplop88";

			Connection cn = DriverManager.getConnection(url, user, pwd);
			Statement st = cn.createStatement();

			String sql = "SELECT * FROM evenement WHERE nom LIKE '%" + searchNom + "%' AND categorie='" + searchType
					+ "' ORDER BY dateDebutEvenement DESC";

			ResultSet result = st.executeQuery(sql);

			String nom;
			String categorie;
			String lieu;
			String description;
			String heureDebutEvenement;
			String heurefinEvenement;

			// int
			int age_mini;
			int capacite;
			int idEvenement;

			// recupération en String ok
			String dateDebutEvenement;
			String dateFinEvenement;

			
			while (result.next()) { // ne fonctionne qu'avec le while, solution à trouver !

				int id_evenement = result.getInt("id_evenement");
				session.setAttribute("id_evenement", id_evenement);

				nom = result.getString("nom");
				categorie = result.getString("categorie");
				lieu = result.getString("lieu");
				description = result.getString("description");
				heureDebutEvenement = result.getString("heureDebutEvenement");
				heurefinEvenement = result.getString("heurefinEvenement");

				dateDebutEvenement = result.getString("dateDebutEvenement");
				dateFinEvenement = result.getString("dateFinEvenement");
				out.print("<div class='eventStyle'>");
				out.println(dateDebutEvenement);
				out.print("<br>");
				out.println("<h2><strong>" + nom + "</strong></h2>");
				out.println("<p>"+categorie+"</p>");
				out.println("<p>Le " + dateDebutEvenement + "</br>à "
						+ lieu + "</p>");
				out.print("<br>");

				Statement st2 = cn.createStatement();
				String login = (String) session.getAttribute("mailCompte");
				System.out.println(login);
				String sql2 = "SELECT * FROM mayagenda.participant WHERE id_evenement=" + id_evenement
						+ " AND mail_participant='" + login + "'";
				ResultSet result2 = st2.executeQuery(sql2);
				String presence = "";

				while (result2.next()) {

					presence = result2.getString("presence");

					if (presence.equals("participe")) {
						out.print("<form action=\"eventDetailOk.jsp\">");
						out.print("<input type='hidden' name='eventId' value=" + id_evenement + ">");
						out.print("<button type=\"submit\">En savoir plus</button><br>");
						out.print("</form>");
					} else {
						out.print("<form action=\"eventDetailPeutEtre.jsp\">");
						out.print("<input type='hidden' name='eventId' value=" + id_evenement + ">");
						out.print("<button type=\"submit\">En savoir plus</button><br>");
						out.print("</form>");
					}

				}
				if (presence.equals("")) {
					out.print("<form action=\"pageEvenementDetaille.jsp\">");
					out.print("<input type='hidden' name='eventId' value=" + id_evenement + ">");
					out.print("<button type=\"submit\">En savoir plus</button><br>");
					out.print("</form>");
				}
				out.print("</div>");

			}
		%>
	</div>
	<a class="voirPlus" href="pageEvenement.jsp">Voir tous les
		événements ...</a>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>