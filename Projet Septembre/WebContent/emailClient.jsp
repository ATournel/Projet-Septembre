<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
input[type=text] {
	padding: 5px;
	border: 2px solid #ccc;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

input[type=text]:focus {
	border-color: #333;
}

input[type=submit] {
	padding: 5px 15px;
	background: #ccc;
	border: 0 none;
	cursor: pointer;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	display: inline-block;
	color: white;
	width: 200px;
	font-size: 20px;
}

b {
	display: inline-block
}

body {
	background-image:
		url("https://ak1.picdn.net/shutterstock/videos/21830161/thumb/1.jpg");
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	margin: 0px;
	padding: 0px;
}

center {
	color: white;
}

#footer {
	bottom: 0;
	width: 100%;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email</title>
</head>
<text-align= "center">
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contactUs">
		<center>
			<h1>Nous contacter</h1>
			<form method="POST" action="MailDispatcherServlet">
				<table>
					<tr>
						<td><p></p></td>
					</tr>

					<tr>
						<label for="expediteur"><td align="left"><b>Email
									expediteur :</b></td></label>
						<td><input type="text" name="email" size="73"></td>
					</tr>
					<tr>
						<td><p></p></td>
					</tr>

					<tr>
						<label for="sujet"><td align="left"><b>Sujet :</b></td></label>
						<td><input type="text" name="subject" size="73"></td>
					</tr>
					<tr>
						<td><p></p></td>
					</tr>
					<tr>
						<label for="message"><td align="left"><b>Message
									:</b></td></label>
						<td><textarea name="message" cols="75" rows="6"
								maxlength="1000"></textarea></td>
					</tr>
					<tr>
						<td><p></p></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Envoyer"></td>
					<tr>
						<td><p></p></td>
					</tr>
					</form>
				</table display= "inline-block">
			</form>
		</center>
	</div>
	<div id="footer">
		<jsp:include page="footer.html"></jsp:include>
	</div>
</body>
</text-align>
</html>