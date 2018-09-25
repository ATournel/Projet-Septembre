<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="projetSept.EventHome"%>
<%
	ArrayList<EventHome> listeEvent = new ArrayList<EventHome>();
	try {
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/mayagenda?useSSL=false";
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style/Style.css">
</head>
<body class="homeBody">
	<jsp:include page="header.jsp"></jsp:include>
	
	<h2>Les derniers événements:</h2>
	<div class="eventList">


		<%
			
			for (int i = 0; i < listeEvent.size(); i++) {
				out.println("<div class='eventStyle'>");
				out.println("</br>");
				out.println("<h2>");
				out.print(listeEvent.get(i).getNom());
				out.println("</h2>");
				out.print("<p>");
				out.print(listeEvent.get(i).getCategorie());
				out.print("</p>");
				out.print("<p>Le "+listeEvent.get(i).getDate()+" à ");
				out.print(listeEvent.get(i).getLieu());
				out.print("</p>");
				out.println("</div>");
			}
			
		%>

	</div>
	<a href="pageEvenement.jsp">Plus d'événements ...</a>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>