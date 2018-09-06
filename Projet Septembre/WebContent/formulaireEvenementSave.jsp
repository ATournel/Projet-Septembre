<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%> <%@page import="java.util.*" %> <%@page import= "java.text.*"%> <%@page import="java.util.Date" %> <%@page import="java.sql.Date.*" %>
<%

 try {
	 


		String nom = request.getParameter("nom");
		String categorie = request.getParameter("categorie");
		String lieu = request.getParameter("lieu");
		String heureDebutEvenement = request.getParameter("heureDebutEvenement");
		String heurefinEvenement  = request.getParameter("heurefinEvenement");
		String dateDebutEvenement  = request.getParameter("dateDebutEvenement");
		String description  = request.getParameter("description");
		String dateFinEvenement  = request.getParameter("dateFinEvenement");
		String capacite =  request.getParameter("capacite");
	
		
		 
				
	 Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
		String user = "root";
		String pwd= "Itsalmostdone1";
		
		Connection cn=DriverManager.getConnection(url, user, pwd);
		
		PreparedStatement ps = cn.prepareStatement("INSERT INTO evenement (nom, categorie, lieu, heureDebutEvenement, heurefinEvenement, description, dateDebutEvenement, dateFinEvenement, capacite) values (  ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		ps.setString(1, nom);
		ps.setString(2, categorie);
		ps.setString(3, lieu);
		ps.setString(4, heureDebutEvenement);
		ps.setString(5, heurefinEvenement);
		ps.setString(6, description);
		ps.setString(7, dateDebutEvenement);
		ps.setString(8, dateFinEvenement);
		
		ps.setString(9, capacite);
		//ps.setDate(10, dateFinEvenement);
		
	            
	    int i = ps.executeUpdate();
		
		            
		            
		    if(i>0){
		    %>
<jsp:forward page="formulaireEvenement.jsp"></jsp:forward>
<% 
		    }
		    else{
		    	out.print("sorry!please fill correct detail and try again" );
		    }
				
 }
 catch(Exception e){e.printStackTrace();
 out.print("sorry!please fill correct detail and try again" );
 }

 %>
