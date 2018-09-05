<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In Form</title>
</head>
<body>
	<jsp:include page="header.html"></jsp:include>
	<h1>Connexion</h1>

	<form name="signin" action="Sign_in" method="post">
		<table>
			<tr>
				<td>Pseudo:</td>
				<td><input type="text" name="email" value='${sessionLogin}'></td>
			</tr>
			<tr></tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td><p></p></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><input type="submit" value="Sign In"></td>
			</tr>
		</table>
		<p>Invalid Pseudo or Password!</p>
		<p>
			Pas encore membre? <a href="subscribe.jsp">Inscription</a>
		</p>
	</form>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>