<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="kotki.cart" MasterPageFile="masterpage.Master" %>

<asp:Content ID="headcart" ContentPlaceHolderID="head" Runat="Server">
    <title>Koszyk</title>
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
<asp:Content ID="bodycart" ContentPlaceHolderID="body" Runat="Server">
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
                <form id="cartForm" runat="server" method='POST' style="padding: 10px; border: 1px solid #ccc">
                    <asp:Label ID="mainCartLbl" Text="Koszyk" runat="server" />
                    <asp:CheckBoxList ID="cartProducts" Visible="true" RepeatDirection="Vertical" runat="server" />
                    <br />
                    <asp:Label ID="totalCost" Text="Całkowity koszt: " runat="server" />
                    <br />
                    <br />
                    <asp:Label ID="shippingLbl" Text="Wybierz czym mamy wysłać Twoją przekociachną przesyłkę:" runat="server" />
                    <asp:RadioButtonList ID="rblShipping" AutoPostBack="false" CssClass="table" RepeatDirection="Horizontal" runat="server" />


                    <asp:RequiredFieldValidator runat="server" ID="shippingRequired" Display="Dynamic"
                        ControlToValidate="rblShipping" ErrorMessage="Musisz wybrać sposób doręczenia" ForeColor="Red"
                        ValidationGroup="buy" />
                    <br />
                    <asp:CustomValidator ID="AtLeastOneCheckBox" ValidationGroup="validation" ErrorMessage="Musisz cos wybrać, żeby móc usunąć"
                        ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" />
                    <br />

                    <asp:Button ID="clearButton" ValidationGroup="validation" OnClick="ClearCart" runat="server" CssClass="btn btn-danger" Text="Usuń zaznaczone" />
                    <asp:Button ID="buyButton" ValidationGroup="buy" OnClick="BuyCart" runat="server" CssClass="btn btn-success" Text="Zamów" />
                </form>
            </div>
        </div>


    </section>

    <script type="text/javascript">
        function ValidateCheckBoxList(sender, args) {
            var checkBoxList = document.getElementById("<%=cartProducts.ClientID %>");
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