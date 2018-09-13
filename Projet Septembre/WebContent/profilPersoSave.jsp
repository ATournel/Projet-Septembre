<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%> <%@page import="java.util.*" %> <%@page import= "java.text.*"%> <%@page import="java.util.Date" %> <%@page import="java.sql.Date.*" %>
<%
 try {
	 
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String pseudo = request.getParameter("pseudo");
		String mail_compte = request.getParameter("mail_compte");
		String mdp  = request.getParameter("mdp");
		String genre  = request.getParameter("genre");
		String age  = request.getParameter("age");
		String statut  = request.getParameter("statut");
	
		
		 
				
	 Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
		String user = "root";
		String pwd= "Ioplop88";
		
		Connection cn=DriverManager.getConnection(url, user, pwd);
		
		PreparedStatement ps = cn.prepareStatement("SELECT* FROM evenement () values (?, ?, ?, ?, ?, ?, ?, ?)");
		
		ps.setString(1, nom);
		ps.setString(2, prenom);
		ps.setString(3, pseudo);
		ps.setString(4, mail_compte);
		ps.setString(5, mdp);
		ps.setString(6, genre);
		ps.setString(7, age);
		ps.setString(8, statut);
		
	    int i = ps.executeUpdate();
		
		            
		            
		    if(i>0){
		    %>
<jsp:forward page="profilPerso.jsp"></jsp:forward>
<% 
		    }
		    else{
		    	out.print("Veuillez remplir correctement tous les champs, merci." );
		    }
				
 }
 catch(Exception e){e.printStackTrace();
 out.print("Veuillez remplir correctement tous les champs, merci." );
 }
 %>