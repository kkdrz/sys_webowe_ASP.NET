<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="kotki.WebForm4" %>
<asp:Content ID="headproducts" ContentPlaceHolderID="head" runat="server">
        <title>Kocie produkty</title>
        <meta charset="UTF-8">
        <meta name="keywords" content="kot, koty, koty, kotki, obrazki, smieszne" />
        <meta name="description" content="Fajna strona internetowa na 5.5" />
        <meta name="author" content="Ludzie sukcesu" />
        <link rel="stylesheet" href="/Content/CSS/products.css">
</asp:Content>
<asp:Content ID="bodyproducts" ContentPlaceHolderID="body" runat="server">
    
    <form id="form1" runat="server">
        <h1>Oto informacje na temat oferowanych przez nas produktów<br/>
        <img src="/Content/images/banan.gif" alt="Kotek z bananem"></h1>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource">
            <ItemTemplate>
                <div id="cont">
                <h2><asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' /></h2>
                <br />
                <h3>Cena:</h3>
                <p><asp:Label ID="CenaLabel" runat="server" Text='<%# Eval("Cena") %>' /></p>
                <br />
                <h3>Opis:</h3>
                <p><asp:Label ID="OpisLabel" runat="server" Text='<%# Eval("Opis") %>' /></p>
                <br />
                    <h3></h3>
                <p id="date">Data dodania: <asp:Label ID="Data_dodaniaLabel" runat="server" Text='<%# Eval("Data_dodania", "{0:d}") %>' /></p>
                    </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Nazwa], [Cena], [Opis], [Data dodania] AS Data_dodania FROM [Produkty]"></asp:SqlDataSource>
</form>
</asp:Content>