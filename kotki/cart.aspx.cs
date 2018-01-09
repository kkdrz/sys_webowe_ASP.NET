using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kotki.Model;

namespace kotki
{
    public partial class cart : System.Web.UI.Page
    {
        private List<string> shipping = new List<string>();
        public static int total_cost = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            refreshProductsInfo();
            checkIfCartEmpty();
            if (!IsPostBack)
            {
                populateShipping();
                populateCartProducts();
            }
            lblCart.Text = "Produktów w koszyku: " + shop.CART.Count;
        }

        private void checkIfCartEmpty()
        {
            if (shop.CART.Count <= 0)
            {
                showCartElements(false);
            }
            else
            {
                showCartElements(true);
            }
        }


        protected void BuyCart(object sender, EventArgs e)
        {
            shop.CART = new List<Product>();
            
            Response.Redirect("thanks.aspx");
        }

            protected void ClearCart(object sender, EventArgs e)
        {
            List<int> selectedValues = cartProducts.Items.Cast<ListItem>()
                                    .Where(li => li.Selected)
                                    .Select(li => Int32.Parse(li.Value))
                                    .ToList();

            List<Product> selectedProducts = new List<Product>();
            foreach (int id in selectedValues)
            {
                selectedProducts.Add(shop.getProductById(id, shop.CART));
            }

            foreach (Product p in selectedProducts)
            {
                if (shop.CART.Contains(p))
                {
                    if (p.Quantity <= 1)
                    {
                        shop.CART.Remove(p);
                    }
                    else
                    {
                        p.Quantity--;
                    }
                }

                if (shop.PRODUCTS.Contains(shop.getProductById(p.Id, shop.PRODUCTS)))
                {
                    shop.getProductById(p.Id, shop.PRODUCTS).Quantity++;
                }
                else
                {
                    shop.PRODUCTS.Add(new Product(p.Id, p.Name, p.Category, 1, p.Price));
                }

            }
            refreshProductsInfo();
            populateCartProducts();
            checkIfCartEmpty();
            lblCart.Text = "Produktów w koszyku: " + shop.CART.Count;
        }

        private void populateCartProducts()
        {
            cartProducts.DataSource = shop.CART;
            cartProducts.DataTextField = "CartInfo";
            cartProducts.DataValueField = "Id";
            cartProducts.DataBind();
        }

        private void populateShipping()
        {
            shipping.Add("Kurier");
            shipping.Add("Paczkomat");
            shipping.Add("Odbior osobisty");
            rblShipping.DataSource = shipping;

            rblShipping.DataBind();
        }

        private void refreshProductsInfo()
        {
            foreach (Product p in shop.CART)
            {
                p.refreshInfo();
            }
            updateTotalCost();
        }

        private void updateTotalCost()
        {
            total_cost = 0;
            foreach(Product p in shop.CART) {
                total_cost += p.Quantity * p.Price;
            }
            totalCost.Text = "Suma: " + total_cost + "zł. Dla naszych kocich klientów dostawa ZA DARMO!";
        }

        private void showCartElements(bool v)
        {
            shippingLbl.Visible = v;
            rblShipping.Visible = v;
            clearButton.Visible = v;
            buyButton.Visible = v;
            cartProducts.Visible = v;
            totalCost.Visible = v;

            if (v)
            {
                mainCartLbl.Text = "Koszyk:";
            }
            else
            {
                mainCartLbl.Text = "Koszyk jest pusty :(";
            }
        }
    }
}