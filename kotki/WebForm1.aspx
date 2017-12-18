<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="kotki.WebForm1" %>
  
<!DOCTYPE html>
<html lang="pl">
	<head>
		<title>Rejestracja/Zmiana danych</title>
		<meta charset= "UTF-8" >
		<meta name="keywords" content="kot, koty, koty, kotki, obrazki, smieszne"/>
		<meta name="description" content="Fajna strona internetowa na 5.5"/>
		<meta name="author" content="Ludzie sukcesu"/>
		<link rel="stylesheet" href="/Content/CSS/styles.css">
		<link rel="stylesheet" href="/Content/CSS/random-styles.css">
		<link rel="stylesheet" href="/Content/CSS/registerstyles.css">
	</head>
	<body class="style">
		<header class="center">
			<a href="index.php"><img src="/Content/Images/logo.gif" alt="LOGO"></a>
		</header>
		<section class="center border-img">
			<h2><?php echo $naglowek; ?></h2>
			<form id="registrationForm" method='POST' style="border:1px solid #ccc">
				<div class="container">
					<label><b>Login</b></label>
					<input type="text" pattern="[a-zA-Z0-9_-]{3,16}$" title="Od 3 do 16 znaków. [a-zA-Z] [0-9] _ -" placeholder="Enter Login" name="login" required>
					<label><b>Haslo</b></label>
					<input type="password" pattern="[a-zA-Z0-9_-]{5,18}$" title="Od 5 do 18 znaków. [a-zA-Z] [0-9] _ -"  placeholder="Enter Password" name="password" required>
					<label><b>Imie</b></label>
					<input type="text" pattern="[a-zA-Z]{3,20}" title="Tylko małe i duże litery od 3 do 20 znaków" placeholder="Enter Name" name="name" required>
					<label><b>Nazwisko</b></label>
					<input type="text" pattern="[a-zA-Z]{3,20}" title="Tylko małe i duże litery od 3 do 20 znaków" placeholder="Enter Surname" name="surname" required>
					<label><b>Email</b></label>
					<input type="text" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" title="Podaj prawidłowy adres email!" placeholder="Enter Email" name="email" required>
					<label><b>Telefon</b></label>
					<input type="text" pattern="\d{9}" title="Dziewięciocyfrowy numer telefonu." placeholder="Enter Phone Number" name="phone" required>
					
					<input type="radio" name="sex" value="M" checked> Mężczyzna
					<input type="radio" name="sex" value="K"> Kobieta<br>
					<div class="clearfix">
						<button type="button" onClick="resetForm()" class="cancelbtn">Wyczyść</button>
						<button type="submit" style="background-color:green;" class="cancelbtn">REJESTRUJ</button>
					</div>
					
				</div>
			</form>
		</section>
		<footer class="center">
			<h4>Made by Drozd and Legut</h4>
		</footer>
		<script>
function resetForm() {
    document.getElementById("registrationForm").reset();
}
function resetForm2() {
    window.location.href = "logowanie.php";
}
</script>
	</body>
</html>