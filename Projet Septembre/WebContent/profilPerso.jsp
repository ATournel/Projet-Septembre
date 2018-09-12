<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 50%;
	margin: auto;
	text-align: center;
	font-family: arial;
	background-color: white;
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
	width: 300px;
	font-size: 20px;
	border-radius: 5px;
}

a {
	text-decoration: none;
	font-size: 24px;
	color: blue;
	width: 50%;
}

h2 {
	text-align: left;
}

body {
	background:
		url(https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX25554818.jpg)
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	margin: 0px;
	padding: 0px;
}

</style>
</head>
<body
	background="https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX25554818.jpg">
	<form action="profilePerso.jsp">
		<jsp:include page="header.html"></jsp:include>
		<h2 style="text-align: center">
			<font color="white">Profil personnel</font>
		</h2>

		<div class="card">
			<img
				src="https://wallpaper.wiki/wp-content/uploads/2017/04/wallpaper.wiki-Images-wallpaper-new-PIC-WPC00923.jpg"
				alt="ma photo" style="width: 100%">

			<h2>Nom:</h2>
			<h2>Prénom:</h2>
			<h2>Pseudo:</h2>
			<h2>Mail compte:</h2>


			<div style="margin: 24px 0;">
				<a href="#"></a> <a href="#"><i class="fa fa-twitter"></i></a><a
					href="#"><i class="fa fa-linkedin"></i></a> <a href="#"> <i
					class="fa fa-facebook"></i></a>
			</div>

		</div>
		<center>
			<button onclick="goBack()">
				<span>Retour</span>
			</button>

			<script>
				function goBack() {
					window.history.back();
				}
			</script>
		</center>
		<jsp:include page="footer.html"></jsp:include>
</body>
</html>

