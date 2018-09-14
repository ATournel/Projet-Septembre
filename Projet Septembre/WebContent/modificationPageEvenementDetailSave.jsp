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
		// Connexion
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
		String user = "root";
		String pwd = "Ioplop88";//Ioplop88

		Connection cn = null;
		Statement st = null;

		int eventId = Integer.parseInt(request.getParameter("eventId"));
		// verification System.out.println("page modif save evenementDetail:" + eventId);
		// recuperation de la connexion
		cn = DriverManager.getConnection(url, user, pwd);
		//creation d un statement 
		st = cn.createStatement();
		String sql = "SELECT * FROM mayagenda.evenement WHERE evenement.id_evenement =" + eventId + "";

		//execution requete 

		// VARIABLE
		String nom;
		String categorie;
		String lieu;
		String description;
		String heureDebutEvenement;
		String heurefinEvenement;

		//int capacite; /!\ /!\ /!\ /!\ /!\ /!\  rétablir une fois bdd modifié
		String capacite;

		// recupération en String ok
		String dateDebutEvenement;
		String dateFinEvenement;

		// Récupérer les valeurs
		nom = request.getParameter("nom");
		categorie = request.getParameter("categorie");
		lieu = request.getParameter("lieu");
		heureDebutEvenement = request.getParameter("heureDebutEvenement");
		heurefinEvenement = request.getParameter("heurefinEvenement");
		description = request.getParameter("description");
		capacite = request.getParameter("capacite");
		//capacite = Integer.parseInt(request.getParameter("capacite")); /!\ /!\ /!\ /!\ /!\ /!\  rétablir une fois bdd modifié

		dateDebutEvenement = request.getParameter("dateDebutEvenement");
		//Date castJavaDateEvenementDebut = new SimpleDateFormat("yyyy-MM-dd").parse(dateDebutEvenement);
		// cast  java date to sql date
		//java.sql.Date castSqlDateEvenementDebut = new java.sql.Date(castJavaDateEvenementDebut.getTime());

		dateFinEvenement = request.getParameter("dateFinEvenement");
		//Date castJavaDateEvenementfin = new SimpleDateFormat("yyyy-MM-dd").parse(dateFinEvenement);
		// cast  java date to sql date
		//java.sql.Date castSqlDateEvenementfin = new java.sql.Date(castJavaDateEvenementfin.getTime());

		PreparedStatement ps = cn.prepareStatement("UPDATE evenement " + "SET nom= ?," + "categorie= ? , "
				+ "lieu= ? , " + "heureDebutEvenement= ? , " + "heurefinEvenement= ? , " + "description= ? , " + "dateDebutEvenement= ? , " + "dateFinEvenement= ? , "
				+ "capacite = ? " + " WHERE id_evenement=" + eventId + "");
		
		ps.setString(1, nom);
		ps.setString(2, categorie);
		ps.setString(3, lieu);
		ps.setString(4, heureDebutEvenement);
		ps.setString(5, heurefinEvenement);
		ps.setString(6, description);
		ps.setString(7, dateDebutEvenement);
		ps.setString(8, dateFinEvenement);
		ps.setString(9, capacite);

		int i = ps.executeUpdate();

		if (i > 0) {
	%>
	<jsp:forward page="pageEvenement.jsp"></jsp:forward>
	<%
		} else {
			out.print("sorry!please fill correct detail and try again");
		}
	%>


</body>
</html>