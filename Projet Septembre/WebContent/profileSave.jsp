<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Date.*"%>
<%
	try {

		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String mail_compte = request.getParameter("mail_compte");

		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
		String user = "root";
		String pwd = "Ioplop88";

		Connection cn = DriverManager.getConnection(url, user, pwd);

		PreparedStatement ps = cn
				.prepareStatement("SELECT nom, prenom, mail_compte FROM compte () values (?, ?, ?)");

		ps.setString(1, nom);
		ps.setString(2, prenom);
		ps.setString(3, mail_compte);

		int i = ps.executeUpdate();

		if (i > 0) {
%>
<jsp:forward page="profil.jsp"></jsp:forward>
<%
	} else {
			out.print("Veuillez remplir correctement tous les champs, merci.");
		}

	} catch (Exception e) {
		e.printStackTrace();
		out.print("Veuillez remplir correctement tous les champs, merci.");
	}
%>