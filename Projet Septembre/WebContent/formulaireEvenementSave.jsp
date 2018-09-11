<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Date.*"%>
<%

if(Boolean.TRUE.equals(session.getAttribute("isConnected"))) {

 try {
	 


		String nom = request.getParameter("nom");
		String categorie = request.getParameter("categorie");
		String lieu = request.getParameter("lieu");
		String heureDebutEvenement = request.getParameter("heureDebutEvenement");
		String heurefinEvenement  = request.getParameter("heurefinEvenement");
		
		
		String dateDebutEvenement  = request.getParameter("dateDebutEvenement");
		Date castJavaDateEvenementDebut = new SimpleDateFormat("yyyy-MM-dd").parse(dateDebutEvenement);
		// cast  java date to sql date
		java.sql.Date castSqlDateEvenementDebut = new java.sql.Date(castJavaDateEvenementDebut.getTime());
		
		String description  = request.getParameter("description");
		
		String dateFinEvenement  = request.getParameter("dateFinEvenement");
		Date castJavaDateEvenementfin = new SimpleDateFormat("yyyy-MM-dd").parse(dateFinEvenement);
		// cast  java date to sql date
		java.sql.Date castSqlDateEvenementfin = new java.sql.Date(castJavaDateEvenementfin.getTime());
		
		
		String capacite = request.getParameter("capacite");
		String mailCompte = (String)session.getAttribute("mailCompte");
	
		
		 
				
	 Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost/mayagenda?useSSL=false";
		String user = "root";
		String pwd= "Ioplop88";
		
		Connection cn=DriverManager.getConnection(url, user, pwd);
		
		PreparedStatement ps = cn.prepareStatement("INSERT INTO evenement (mail_createur, nom, categorie, lieu, heureDebutEvenement, heurefinEvenement, description, dateDebutEvenement, dateFinEvenement, capacite) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		ps.setString(1, mailCompte);
		ps.setString(2, nom);
		ps.setString(3, categorie);
		ps.setString(4, lieu);
		ps.setString(5, heureDebutEvenement);
		ps.setString(6, heurefinEvenement);
		ps.setString(7, description);
		ps.setDate(8, castSqlDateEvenementDebut);
		ps.setDate(9, castSqlDateEvenementfin);		
		ps.setString(10, capacite);
		//ps.setDate(10, dateFinEvenement);
		
	            
	    int i = ps.executeUpdate();
		
		            
		            
		    if(i>0){
		    %>
<jsp:forward page="pageEvenement.jsp"></jsp:forward>
<% 
		    }
		    else{
		    	out.print("sorry!please fill correct detail and try again" );
		    }
				
 }
 catch(Exception e){e.printStackTrace();
 out.print("sorry!please fill correct detail and try again" );
 }
}else{
	%>
	<jsp:forward page="/Sign_in"></jsp:forward>
	<% 
}

 %>
