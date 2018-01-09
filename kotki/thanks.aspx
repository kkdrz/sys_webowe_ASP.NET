<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thanks.aspx.cs" Inherits="kotki.thanks" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Dziękujemy!</title>
    <meta charset="UTF-8">
    <meta name="keywords" content="kot, koty, koty, kotki, obrazki, smieszne" />
    <meta name="description" content="Fajna strona internetowa na 5.5" />
    <meta name="author" content="Ludzie sukcesu" />
    <link rel="stylesheet" href="/Content/CSS/bootstrap.min.css">
    <link rel="text/javascript" href="/Content/JS/bootstrap.min.js">
    <style>
        .col-centered {
            float: none;
            margin: 0 auto;
        }

        .hidden {
            display: none;
        }
    </style>

</head>
<body>
    <header class="container">
        <div class="row">
            <div class="col-md-4">
                <a href="shop.aspx">
                    <label id="backToShop">Przejdź do sklepu</label>
                </a>
            </div>
            <div class="col-md-4 col-centered">
                <a href="index.aspx">
                    <img src="/Content/Images/logo.gif" alt="LOGO"></a>
            </div>
            <div class="col-md-4">
                <asp:Label ID="lblCart" Text="Produktów w koszyku: 0" runat="server" />
            </div>
        </div>
    </header>


    <section class="container">

        <div class="row">

            <div class="col-md-8 col-centered">
                <form id="cartForm" class="col-centered" runat="server" method='POST' style="padding: 10px; border: 1px solid #ccc">
                    <h1 class="col-centered">Ślicznie dziękujemy za zamówienie!</h1>
                    <h3 class="col-centered"><asp:Label ID="totalCost" runat="server" /></h3>

                    <img class="col-centered" src="/Content/Images/kicia_adorable.jpg" alt="Dziekujemy!">

                </form>
            </div>
        </div>
    </section>
</body>
</html>
