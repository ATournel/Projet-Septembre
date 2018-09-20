<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Date.*"%>
<%@page import="projetSept.EventList"%>
<%
	ArrayList<EventList> listEventPage = new ArrayList<EventList>();

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
	String user = "root";
	String pwd = "Ioplop88";//Ioplop88
	Connection cn = DriverManager.getConnection(url, user, pwd);
	Statement st = cn.createStatement();

	String sql = "SELECT * FROM mayagenda.evenement order by dateDebutEvenement DESC";

	//execution requete 
	ResultSet result = st.executeQuery(sql);

	while (result.next()) { // ne fonctionne qu'avec le while, solution à trouver !

		EventList instanceEventList = new EventList();

		instanceEventList.setNom(result.getString("nom"));
		instanceEventList.setCategorie(result.getString("categorie"));
		instanceEventList.setLieu(result.getString("lieu"));
		instanceEventList.setDescription(result.getString("description"));
		instanceEventList.setHeureDebutEvenement(result.getString("heureDebutEvenement"));
		instanceEventList.setHeurefinEvenement(result.getString("heurefinEvenement"));
		instanceEventList.setDateDebutEvenement(result.getString("dateDebutEvenement"));
		instanceEventList.setDateFinEvenement(result.getString("dateFinEvenement"));
		instanceEventList.setIdEvenement(result.getInt("id_evenement"));

		listEventPage.add(instanceEventList);

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style/Style.css">
</head>
<body class="eventPageBody">

	<jsp:include page="header.jsp"></jsp:include>

	<div class="bandeau">
		<table>
			<tr>
				<td><h1>Vous cherchez un événement?</h1></td>
			</tr>
			<tr>
				<td><form action="pageEvenementSearch.jsp">
						<input type="text" class="search-bar" name="eventName"
							placeholder="Evenement.."> <select name="categorie"
							class="search-bar">
							<option></option>
							<option>Atelier Coworking</option>
							<option>Hackathon</option>
						</select> <input type="submit" class="search-icon" value="Trouver">
					</form></td>
			</tr>

		</table>
	</div>

	<h3>
		Créer mon Evenement: <a href="formulaireEvenement.jsp">Go!</a>
	</h3>
	<br />
	<br />
	<div class="eventList">



		<%
			for (int i = 0; i < listEventPage.size(); i++) {
				out.print("<div class='eventStyle'>");
				out.print("<br>");
				out.println("<h2><strong>" + listEventPage.get(i).getNom() + "</strong></h2>");
				out.println("<p>" + listEventPage.get(i).getCategorie() + "</p>");
				out.println("<p>Le " + listEventPage.get(i).getDateDebutEvenement() + "</br>à"
						+ listEventPage.get(i).getLieu() + "</p>");
				out.print("<br>");

				Statement st2 = cn.createStatement();

				String login = (String) session.getAttribute("mailCompte");
				System.out.println(login);

				String sql2 = "SELECT * FROM mayagenda.participant WHERE id_evenement="
						+ listEventPage.get(i).getIdEvenement() + " AND mail_participant='" + login + "'";
				ResultSet result2 = st2.executeQuery(sql2);
				String presence = "";

				while (result2.next()) {
					presence = result2.getString("presence");

					if (presence.equals("participe")) {
						out.print("<form action=\"eventDetailOk.jsp\">");
						out.print("<input type='hidden' name='eventId' value=" + listEventPage.get(i).getIdEvenement()
								+ ">");
						out.print("<button type=\"submit\">Détails</button><br>");
						out.print("</form>");
					} else if (presence.equals("peut-être")) {
						out.print("<form action=\"eventDetailPeutEtre.jsp\">");
						out.print("<input type='hidden' name='eventId' value=" + listEventPage.get(i).getIdEvenement()
								+ ">");
						out.print("<button type=\"submit\">Détails</button><br>");
						out.print("</form>");
					}
				}
				if (presence.equals("")) {
					out.print("<form action=\"pageEvenementDetaille.jsp\">");
					out.print(
							"<input type='hidden' name='eventId' value=" + listEventPage.get(i).getIdEvenement() + ">");
					out.print("<button type=\"submit\">Détails</button><br>");
					out.print("</form>");
					out.print("<br>");
				}
				out.print("</div>");
			}
		%>

	</div>
	<a class="voirPlus" href="Home.jsp">Retour à l'accueil</a>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>