using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kotki.Model;
namespace kotki
{
    public partial class shop : System.Web.UI.Page
    {
        public static List<Product> CART = new List<Product>();
        public static List<Product> PRODUCTS = DataProvider.getProducts();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rblCategories.DataSource = DataProvider.getCategories();
                rblCategories.DataTextField = "Name";
                rblCategories.DataValueField = "Name";
                rblCategories.DataBind();
            }
            else
            {
                List<int> selectedValues = cblProducts.Items.Cast<ListItem>()
                                    .Where(li => li.Selected)
                                    .Select(li => Int32.Parse(li.Value))
                                    .ToList();

                List<Product> selectedProducts = new List<Product>();
                foreach(int id in selectedValues)
                {
                    selectedProducts.Add(getProductById(id, PRODUCTS));
                }

                foreach(Product p in selectedProducts)
                {
                    if(CART.Contains(p))
                    {
                        getProductById(p.Id, CART).Quantity++;
                        
                    } else
                    {
                        CART.Add(new Product(p.Id, p.Name, p.Category, 1, p.Price));
                    }
                    if(getProductById(p.Id, PRODUCTS).Quantity <= 1)
                    {
                        PRODUCTS.Remove(getProductById(p.Id, PRODUCTS));
                    } else
                    {
                        getProductById(p.Id, PRODUCTS).Quantity--;
                    }
                    
                }
                refreshProductsInfo();
                loadCheckbox();
            }
            lblCart.Text = "Produktów w koszyku: " + CART.Count;

            
        }

        private void refreshProductsInfo()
        {
            foreach(Product p in PRODUCTS)
            {
                p.refreshInfo();
            }
        }

        protected void OnRadio_Changed(object sender, EventArgs e)
        {
            loadCheckbox();
        }

        private void loadCheckbox()
        {
            List<Product> products = filterProductsByCategory(PRODUCTS, rblCategories.SelectedItem.Value);

            cblProducts.DataSource = products;
            cblProducts.DataTextField = "Info";
            cblProducts.DataValueField = "Id";
            cblProducts.DataBind();
        }

        public static Product getProductById(int id, List<Product> PRODUCTS)
        {
            foreach (Product p in PRODUCTS)
            {
                if (p.Id == id) return p;
            }
            return null;
        }

        private List<Product> filterProductsByCategory(List<Product> allProducts, string selectedValue)
        {
            List<Product> products = new List<Product>();
            for (int i = 0; i < allProducts.Count; i++)
            {
                if (allProducts[i].Category.Name.Equals(selectedValue))
                {
                    products.Add(allProducts[i]);
                }
            }
            return products;
        }

        private void addLabelsToTable(Table table)
        {
            TableRow row = new TableRow();

            TableCell id = new TableCell();
            id.Text = "Id";
            TableCell name = new TableCell();
            name.Text = "Produkt";
            TableCell quantity = new TableCell();
            quantity.Text = "Ilość";
            TableCell price = new TableCell();
            quantity.Text = "Cena";

            row.Cells.Add(id);
            row.Cells.Add(name);
            row.Cells.Add(quantity);
            row.Cells.Add(price);

            table.Rows.Add(row);
        }
        
    }
}