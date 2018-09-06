<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.html"></jsp:include>
	<div class="bandeau">
		<table>
			<tr>
				<td><h1>Vous cherchez un evenement?</h1></td>
			</tr>
			<tr>
				<td><form action="searchEvent.jsp">
						<input type="text" class="search-bar" placeholder="Evenement.."><input
							type="submit" class="search-icon" value="Trouver">
					</form></td>
			</tr>
			<tr>
				<td><ul class="bande-ul">
						<li><a href="Sign_in">Connexion</a></li>
						<li><a href="subscribe.jsp">Inscription</a></li>
					</ul></td>
			</tr>
		</table>
	</div>

	<div class="lastEvents">
		<h2>Les derniers evenements:</h2>
		
	</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>