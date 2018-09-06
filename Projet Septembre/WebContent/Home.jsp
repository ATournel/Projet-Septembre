<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="projetSept.EventHome"%>
<%
	ArrayList<EventHome> listeEvent = new ArrayList<EventHome>();
	try {
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/mayagenda";
		String user = "root";
		String pwd = "Ioplop88";

		Connection con = DriverManager.getConnection(url, user, pwd);
		Statement st = con.createStatement();
		String sql = "Select * FROM evenement ORDER BY id_evenement DESC LIMIT 10";
		ResultSet result = st.executeQuery(sql);

		while (result.next()) {

			EventHome instanceEvent = new EventHome();

			instanceEvent.setNom(result.getString("nom"));
			instanceEvent.setCategorie(result.getString("categorie"));
			instanceEvent.setLieu(result.getString("lieu"));
			instanceEvent.setDate(result.getString("dateDebutEvenement"));

			listeEvent.add(instanceEvent);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="style/Style.css">
</head>
<body>
	<jsp:include page="header.html"></jsp:include>
	<div class="bandeau">
		<table>
			<tr>
				<td><h1>Vous cherchez un evenement?</h1></td>
			</tr>
			<tr>
				<td><form action="pageEvenement.jsp">
						<input type="text" class="search-bar" placeholder="Evenement.."><input
							type="submit" class="search-icon" value="Trouver">
					</form></td>
			</tr>
			<tr>
				<td><ul class="bande-ul">
						<li><a href="Sign_in">Connexion</a></li>
						<li><a href="subscribe.jsp">Inscription</a></li>
					</ul></td>
			</tr>
		</table>
	</div>

	<div class="lastEvents">
		<h2>Les derniers evenements:</h2>

		<%
			out.println("<ul>");
			for (int i = 0; i < listeEvent.size(); i++) {
				out.println("<li>");
				out.print("<strong>");
				out.print(listeEvent.get(i).getNom());
				out.print("</strong>");
				out.print(" dans la categorie ");
				out.print("<em>");
				out.print(listeEvent.get(i).getCategorie());
				out.print("</em>");
				out.print(", ");
				out.print(listeEvent.get(i).getLieu());
				out.println("</li>");
				out.println("<br />");
			}
			out.println("</ul>");
		%>

	</div>
	<a class="voirPlus" href="pageEvenement.jsp">Plus d'evenements...</a>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>