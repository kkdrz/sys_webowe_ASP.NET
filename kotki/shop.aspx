<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="kotki.shop" MasterPageFile="masterpage.Master" %>

<asp:Content ID="headshop" ContentPlaceHolderID="head" Runat="Server">
    <title>Rejestracja/Zmiana danych</title>
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

</asp:Content>
<asp:Content ID="bodyshop" ContentPlaceHolderID="body" Runat="Server">
    <header class="container">
        <div class="row">
            <div class="col-md-4 col-centered">
                <a href="index.aspx">
                    <img src="/Content/Images/logo.gif" alt="LOGO"></a>
            </div>
            <div class="col-md-4">
                <a href="cart.aspx">
                    <asp:Label ID="lblCart" Text="Produktów w koszyku: 0" runat="server" />
                </a>
            </div>
        </div>
    </header>


    <section class="container">

        <div class="row">

            <div class="col-md-8 col-centered">
                <form id="categoryForm" runat="server" method='POST' style="padding: 10px; border: 1px solid #ccc">
                    <label>Kategoria: </label>
                    <asp:RadioButtonList ID="rblCategories" AutoPostBack="true" CssClass="table" OnSelectedIndexChanged="OnRadio_Changed" RepeatDirection="Horizontal" runat="server" />
                    <asp:CheckBoxList ID="cblProducts" Visible="true" RepeatDirection="Vertical" runat="server" />
                    <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Musisz cos wybrać, żeby dodać do koszyka.."
                        ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" />
                    <asp:Button ID="BuyButton" runat="server" CssClass="btn btn-success" Text="Dodaj do koszyka" />
                </form>
            </div>
        </div>


    </section>

    <script type="text/javascript">
        function ValidateCheckBoxList(sender, args) {
            var checkBoxList = document.getElementById("<%=cblProducts.ClientID %>");
            var checkboxes = checkBoxList.getElementsByTagName("input");
            var isValid = false;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    isValid = true;
                    break;
                }
            }
            args.IsValid = isValid;
        }
    </script>
</asp:Content>