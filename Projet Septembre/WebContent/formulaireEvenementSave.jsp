<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%> <%@page import="java.util.*" %> <%@page import= "java.text.*"%> <%@page import="java.util.Date" %> <%@page import="java.sql.Date.*" %>
<%

 try {
 		
	 	//get 
 			
		// String
		String nom = request.getParameter("nom");
		String categorie = request.getParameter("categorie");
		String lieu = request.getParameter("lieu");
		String description = request.getParameter("description");
		String heureDebutEvenement = request.getParameter("heureDebutEvenement");
		String heurefinEvenement = request.getParameter("heurefinEvenement");
 			
 		// places
		int age_mini = (int) Integer.parseInt(request.getParameter("age_mini"));
		int capacite = (int) Integer.parseInt(request.getParameter("capacite"));
		
 		
 		//date
		String dateDebutEvenement = request.getParameter("dateDebutEvenement");
		Date castJavaDateEvenementDebut = new SimpleDateFormat("yyyy-MM-dd").parse(dateDebutEvenement);
		// cast  java date to sql date
		java.sql.Date castSqlDateEvenementDebut = new java.sql.Date(castJavaDateEvenementDebut.getTime());
		
 		//date
		String dateFinEvenement = request.getParameter("dateFinEvenement");
		Date castJavaDateEvenementFin = new SimpleDateFormat("yyyy-MM-dd").parse(dateFinEvenement);
		// cast  java date to sql date
		java.sql.Date castSqlDateEvenementFin = new java.sql.Date(castJavaDateEvenementFin.getTime());
		
		
		
		
 			
	        
	        Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
			String user = "root";
			String pwd= "Itsalmostdone1";
			
			Connection cn=DriverManager.getConnection(url, user, pwd);
			PreparedStatement ps = cn.prepareStatement("INSERT INTO evenement(nom, categorie, lieu, description, heureDebutEvenement, heurefinEvenement, age_mini, capacite, dateDebutEvenement, dateFinEvenement ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				
			ps.setString(1, nom);
			ps.setString(2, categorie);
			ps.setString(3, lieu);
			ps.setString(4, description);
			ps.setString(5, heureDebutEvenement);
			ps.setString(6, heurefinEvenement);
			
			ps.setInt(7, age_mini);
			ps.setInt(8, capacite);
			
			ps.setDate(9, castSqlDateEvenementDebut); 
			ps.setDate(10, castSqlDateEvenementFin);
		            
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
