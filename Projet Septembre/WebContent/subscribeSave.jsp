<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
	try {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String pseudo = request.getParameter("pseudo");
		String mail_compte = request.getParameter("mail_compte");
		String mdp = request.getParameter("mdp");

		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/mayagenda?useUnicode=true&characterEncoding=UTF-8&allowPublicKeyRetrieval=true&useSSL=false";
		String user = "root";
		String pwd = "Ioplop88)";

		Connection con = DriverManager.getConnection(url, user, pwd);

		PreparedStatement ps = con.prepareStatement(
				"insert into compte(nom, prenom, pseudo, mail_compte, mdp) values(?,?,?,?,?)");

		ps.setString(1, nom);
		ps.setString(2, prenom);
		ps.setString(3, pseudo);
		ps.setString(4, mail_compte);
		ps.setString(5, mdp);

		int i = ps.executeUpdate();

		if (i > 0) {
%>
<jsp:forward page="subscribe.jsp"></jsp:forward>
<%
	} else {
			out.print("Veuillez remplir correctement tous les champs, merci.");
		}

	} catch (Exception e) {
		e.printStackTrace();

		out.print("Mauvaise Connection.");
	}
