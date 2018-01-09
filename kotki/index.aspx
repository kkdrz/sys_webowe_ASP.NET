<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="kotki.WebForm2" %>

<!DOCTYPE html>
<html lang="pl">
    <head>
        <title>KOTKI</title>
        <meta charset="UTF-8">
        <meta name="keywords" content="kot, koty, koty, kotki, obrazki, smieszne" />
        <meta name="description" content="Fajna strona internetowa na 5.5" />
        <meta name="author" content="Ludzie sukcesu" />
        <link rel="stylesheet" href="/Content/CSS/styles.css">
        <link rel="stylesheet" href="/Content/CSS/random-styles.css">
        <link rel="stylesheet" href="/Content/CSS/registerstyles.css">
    </head>
    <body id="bgcenter">
        <div class="style">
            <header class="center">
                <a href="index.aspx"><img src="/Content/images/logo.gif" alt="LOGO"></a>
            </header>
            <section class="center">
                <img src="/Content/images/kociak_glowna.png" alt="Słodki kociak">
                <br />
                <h2>Poziom sweetaśności:  <meter value="6" optimum="4" min="0" max="10">Poziom sweetaśności</meter></h2>
                <a href="signup.aspx"><img src="/Content/images/rejestracja.gif" alt="Rejestracja"></a>
                <br />
                <br />
                <a href="information.aspx"><img src="/Content/images/informacje.gif" alt="Informacje"></a>
                <br />
                <br />
                <a href="shop.aspx"><label>NASZ SUPER KOCI SKLEP</label></a>
                <br />
                <h3>&rArr;To jest strona z obrazkami zawierającymi <mark>koci content.</mark>&lArr;</h3>
                <a href="/Content/images/kociak_glowna.png" download="kociaczek_slodziaczek">Pobierz kociaka</a><br />
                <a href="http://i0.kym-cdn.com/entries/icons/mobile/000/013/564/doge.jpg" download="piesel">Pobierz psiaka ze strony zewnętrznej</a><br />
                <a href="ftp://speedtest.tele2.net/3MB.zip">Link FTP</a>
                <br />
                <br />
                <img src="/Content/images/glitter.gif" alt="Najprzeslodziasniejsze kociaki w sieci">
            </section>
            <footer class="center">
                <h4>Made by Drozd and Legut</h4>
            </footer>
        </div>
    </body>
</html>