<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="kotki.WebForm1" %>
<script type="text/javascript">
    function resetForm() {
        document.getElementById("registrationForm").reset();
    }
</script>
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
			<a href="index.aspx"><img src="/Content/Images/logo.gif" alt="LOGO"></a>
		</header>
		<section class="center border-img">
			<h2><?php echo $naglowek; ?></h2>
			<form id="registrationForm"  runat="server" method='POST' style="border:1px solid #ccc">
				<div class="container">
					<label><b>Login</b></label>
                    <asp:TextBox type="text" runat="server" title="Od 3 do 16 znaków. [a-zA-Z] [0-9] _ -" placeholder="Enter Login" id="login"/>
                    <asp:RequiredFieldValidator ValidationGroup="validation" class="red" runat="server" id="reqLogin" controltovalidate="login" errormessage="Proszę wypełnić to pole" /><br />
                    <asp:RegularExpressionValidator ValidationGroup="validation" class="red" runat="server" id="rexLogin" controltovalidate="login" validationexpression="[a-zA-Z0-9_-]{3,16}$" errormessage="Od 3 do 16 znaków. [a-zA-Z] [0-9] _ -" /><br />
                    <label><b>Haslo</b></label>
					<asp:TextBox type="password" runat="server" title="Od 3 do 16 znaków. [a-zA-Z] [0-9] _ -" placeholder="Enter Password" id="password"/>
                    <asp:RequiredFieldValidator ValidationGroup="validation" class="red" runat="server" id="reqPassword" controltovalidate="password" errormessage="Proszę wypełnić to pole" /><br />
                    <asp:RegularExpressionValidator ValidationGroup="validation" class="red" runat="server" id="rexPassowed" controltovalidate="password" validationexpression="[a-zA-Z0-9_-]{5,18}$" errormessage="Od 5 do 18 znaków. [a-zA-Z] [0-9] _ -" /><br />
					<label><b>Email</b></label>
                    <asp:TextBox type="email" runat="server" title="Podaj prawidłowy adres email!" placeholder="Enter Email" id="email"/>
                    <asp:RequiredFieldValidator ValidationGroup="validation" class="red" runat="server" id="reqEmail" controltovalidate="email" errormessage="Proszę wypełnić to pole" /><br />
                    <asp:RegularExpressionValidator ValidationGroup="validation" class="red" runat="server" id="rexEmail" controltovalidate="email" validationexpression="[^@]+@[^@]+\.[a-zA-Z]{2,6}" errormessage="Podaj prawidłowy adres email!" /><br />
					<label><b>Wiek</b></label>
					<asp:TextBox type="number" runat="server" title="Podaj liczbę dodatnią, mniejszą od 100" placeholder="Enter Age" id="wiek"/>
                    <asp:RequiredFieldValidator ValidationGroup="validation" class="red" runat="server" id="reqWiek" controltovalidate="wiek" errormessage="Podaj dodatnią liczbę" /><br />
                    <asp:RangeValidator ValidationGroup="validation" class="red" runat="server" id="rngWiek" controltovalidate="wiek" type="Integer" minimumvalue="1" maximumvalue="99" errormessage="Wiek musi mieścić się w 1-99" /><br />
                    <label><b>Liczba kotów</b></label>
					<asp:TextBox type="number" runat="server" title="Podaj liczbę dodatnią, czym więcej tym lepiej" placeholder="Enter Number of Cats" id="kot"/>
                    <asp:RequiredFieldValidator ValidationGroup="validation" class="red" runat="server" id="reqKot" controltovalidate="kot" errormessage="Podaj liczbę dodatnią, czym więcej tym lepiej" /><br />
                    <asp:CompareValidator ValidationGroup="validation" class="red" runat="server" id="cmpKot" controltovalidate="kot" valuetocompare="0" operator="GreaterThan" type="Integer" errormessage="Jak nie masz kota to elo" /><br />
					<asp:Label ID="wynik" runat="server" Text=""></asp:Label><br /><br />
                    <div class="clearfix">
                        <asp:Button runat="server" OnClick="clear_Click" id="clear" class="cancelbtn" text="Wyczyść" />
                        <asp:Button runat="server" ValidationGroup="validation" style="background-color:green;" class="cancelbtn" id="submit" text="REJESTRUJ" />
					</div>
				</div>
			</form>
		</section>
		<footer class="center">
			<h4>Made by Drozd and Legut</h4>
		</footer>
</body>
</html>