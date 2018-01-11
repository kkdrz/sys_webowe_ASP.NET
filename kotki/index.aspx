<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="kotki.WebForm2" MasterPageFile="masterpage.Master" %>

<asp:Content ID="headindex" ContentPlaceHolderID="head" Runat="Server">
        <title>KOTKI</title>
        <meta charset="UTF-8">
        <meta name="keywords" content="kot, koty, koty, kotki, obrazki, smieszne" />
        <meta name="description" content="Fajna strona internetowa na 5.5" />
        <meta name="author" content="Ludzie sukcesu" />
        <link rel="stylesheet" href="/Content/CSS/styles.css">
        <link rel="stylesheet" href="/Content/CSS/random-styles.css">
        <link rel="stylesheet" href="/Content/CSS/registerstyles.css">
</asp:Content>
<asp:Content ID="bodyindex" ContentPlaceHolderID="body" Runat="Server">
        <div class="style" id="bgcenter">
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
        </div>
</asp:Content>