<<<<<<< Updated upstream
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

		String url = "jdbc:mysql://localhost:3306/mayagenda";
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
		out.print("Veuillez remplir correctement tous les champs, merci.");
	}
=======
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
		String genre = request.getParameter("genre");
		int age = (int) Integer.parseInt(request.getParameter("age"));
		

		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
		String user = "root";
		String pwd = "ioplop88";

		Connection con = DriverManager.getConnection(url, user, pwd);
		
		PreparedStatement ps = con.prepareStatement("insert into compte(nom, prenom, pseudo, mail_compte, mdp, genre, age) values(?,?,?,?,?,?,?)");

		ps.setString(1, nom);
		ps.setString(2, prenom);
		ps.setString(3, pseudo);
		ps.setString(4, mail_compte);
		ps.setString(5, mdp);
		ps.setString(6, genre);
		ps.setInt(7, age);
		
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
		out.print("Veuillez remplir correctement tous les champs, merci.");
	}
>>>>>>> Stashed changes
%>