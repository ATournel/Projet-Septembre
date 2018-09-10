<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%> <%@page import="java.util.*" %> <%@page import= "java.text.*"%> <%@page import="java.util.Date" %> <%@page import="java.sql.Date.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<h3>Créer un Evenement: <a href="formulaireEvenement.jsp">Go!</a></h3><br /><br />

<%

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
String user = "root";
String pwd= "Ioplop88";

Connection cn=DriverManager.getConnection(url, user, pwd);
Statement st = cn.createStatement(); 

String sql = "SELECT * FROM mayagenda.evenement order by dateDebutEvenement DESC";

//execution requete 
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
	
	int id_evenement=result.getInt("id_evenement");
	session.setAttribute("id_evenement",id_evenement);
	
	nom = result.getString("nom");
	categorie = result.getString("categorie");
	lieu = result.getString("lieu");
	description = result.getString("description");
	heureDebutEvenement = result.getString("heureDebutEvenement");
	heurefinEvenement = result.getString("heurefinEvenement");
	
		
	dateDebutEvenement = result.getString("dateDebutEvenement");
	dateFinEvenement = result.getString("dateFinEvenement");
	
	
	out.println(dateDebutEvenement);
	out.print("<br>");
	out.println("<p>");
	out.println("<strong>" + nom + " - </strong> " + categorie );
	out.println("</p>");
	out.print("<br>");
	
	out.print("<form action=\"pageEvenementDetaille.jsp\">");
	out.print("<button type=\"submit\">En savoir plus</button><br>");
	out.print("</form>");
	  

}


%>

<jsp:include page="footer.html"></jsp:include>
</body>
</html>