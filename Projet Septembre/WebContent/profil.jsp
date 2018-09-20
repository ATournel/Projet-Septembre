<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 500px;
	margin: auto;
	text-align: center;
	font-family: arial;
}

.title {
	color: grey;
	font-size: 18px;
}

button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: grey;
	text-align: center;
	cursor: pointer;
	width: 500px;
	font-size: 18px;
}

a {
	text-decoration: none;
	font-size: 22px;
	color: black;
}
</style>
</head>
<body>
	<form action="profileSave.jsp">
		<jsp:include page="header.jsp"></jsp:include>
		<h2 style="text-align: center">Profil participant</h2>

		<div class="card">
			<left><img
				src="https://wallpaper.wiki/wp-content/uploads/2017/04/wallpaper.wiki-Images-wallpaper-new-PIC-WPC00923.jpg"
				alt="ma photo" style="width: 100%"></left>
			<h1>Nom:</h1>
			<h1>Prénom:</h1>
			<p class="title">Mail:</p>

			<div style="margin: 24px 0;">
				<a href="#"></a> <a href="#"><i class="fa fa-twitter"></i></a> <a
					href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i
					class="fa fa-facebook"></i></a>
			</div>

		</div>
		<center>
			<button onclick="goBack()">Retour</button>

			<script>
				function goBack() {
					window.history.back();
				}
			</script>
		</center>
		<jsp:include page="footer.html"></jsp:include>
</body>
</html>


