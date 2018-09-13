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
		System.out.println("Driver ok! :) ");

		String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
		String user = "root";
		String pwd = "Ioplop88";//Ioplop88

		Connection cn = null;
		Statement st = null;

		// Recupération des données utilisateur
		String sessionMail = (String) session.getAttribute("mailCompte");
		int eventId = Integer.parseInt(request.getParameter("eventId"));
		
		String eraseParticipant;
		String eraseEvenement;
		
		// recuperation de la connexion
		cn = DriverManager.getConnection(url, user, pwd);
		//creation d un statement 
		st = cn.createStatement();

		// Requête: effacer les participants
		String sql = "DELETE FROM participant  WHERE id_evenement =" + eventId + "";
		st.executeUpdate(sql);
		sql ="DELETE FROM evenement WHERE id_evenement=" + eventId + "";
		st.executeUpdate(sql);
		
		
		
	%>


</body>
</html>