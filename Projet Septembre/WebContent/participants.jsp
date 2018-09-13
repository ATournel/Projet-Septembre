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

	
	<%
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver ok! :) ");

		String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
		String user = "root";
		String pwd = "Ioplop88";//Ioplop88

		Connection cn = null;
		Statement st = null;
		int eventId = Integer.parseInt(request.getParameter("eventId"));
		// recuperation de la connexion
		cn = DriverManager.getConnection(url, user, pwd);
		//creation d un statement 
		st = cn.createStatement();

		String sql = "SELECT compte.nom, compte.prenom FROM participant, compte	WHERE (participant.mail_participant = compte.mail_compte) AND id_evenement =" + eventId;

		//execution requete 
		ResultSet result = st.executeQuery(sql);

		String nom;
		String prenom;
		
		int id_evenement = eventId;
		
		
		Connection cn2 = DriverManager.getConnection(url, user, pwd);
		Statement st2 = cn2.createStatement();
		
		String sql2= "SELECT COUNT(*) AS presence FROM participant, compte WHERE (participant.mail_participant = compte.mail_compte) AND id_evenement =1";
		
		ResultSet result2 = st2.executeQuery(sql2);
		String participant;
		
		while (result.next()) { // ne fonctionne qu'avec le while, solution à trouver !

			nom = result.getString("nom");
			prenom = result.getString("prenom");
			
			while(result2.next()){
				
				participant = result2.getString("presence");
				out.print("<h1>" + participant +  " Participant.es</h1>");
			}
			
			// ***********************/!\ AJOUTER LIEN VERS PROFIL individuel/!\ **************************
				//utiliser meme méthodo [evenement; evenment détaille] 
			out.print(nom + " " + prenom);
			out.print("<br>");
			out.print("<br>");

		}
		out.print("<br>");
		out.print("<br>");
		out.print("<form action=\"pageEvenementDetaille.jsp\">");
		out.print("<input type='hidden' name='eventId' value=" + id_evenement + ">");
		out.print("<button type=\"submit\">Revenir à l'événement</button><br>");
		out.print("</form>");
	%>
<jsp:include page="footer.html"></jsp:include>

</body>
</html>