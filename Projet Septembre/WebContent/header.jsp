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

	<div class="container header">
		<div class="row justify-content-md-center">
			<div class="col">
				<img src="images/LogoMakr_15OHZR.png" class="logo">
			</div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col">
				<div class="bandeau">
					<table>
						<tr>
							<td><h1><STRONG><em>VOUS CHERCHEZ UN EVENEMENT?</em></STRONG></h1></td>
						</tr>
						<tr>
							<td><form action="pageEvenementSearch.jsp" name="searchBar">
									<div class="form-row">
										<div class="col">
											<input type="text" class="search-bar1" name="eventName"
												placeholder="Evenement..">
										</div>
										<div class="col">
											<select name="categorie" class="search-bar">
												<option></option>
												<option>Atelier Coworking</option>
												<option>Hackathon</option>
											</select>
											<div class="input-group-append">
												<button class="btn btn-outline-secondary" type="submit">TROUVER</button>
											</div>
										</div>
									</div>
								</form></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="row justify-content-md-center navBar">
			<div class="col">
				<a href="Home.jsp" id="accueil" class="bigLink"><em>ACCUEIL</em></a>
			</div>
			<div class="col">
				<a href="pageEvenement.jsp" class="bigLink"><em>EVENEMENTS</em></a>
			</div>
			<div class="col"><em>${connect}</em></div>
		</div>
	</div>
</body>
</html>