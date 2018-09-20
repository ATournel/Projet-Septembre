<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style/Style.css">
<title>Header</title>
</head>
<body>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col">
				<a href="Home.jsp" class="btn btn-primary" id="accueil">Accueil</a>
			</div>
			<div class="col-7">
				<div class="row justify-content-md-center">
					<div class="col"></div>
					<div class="col-12">
						<img src="images/LogoMakr_15OHZR.png" class="logo">
					</div>
					<div class="col"></div>
				</div>
			</div>
			<div class="col">
				<p>${connect}</p>
			</div>
		</div>
	</div>

</body>
</html>