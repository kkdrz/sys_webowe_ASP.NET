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
                    getProductById(p.Id, PRODUCTS).Quantity--;
                }
                lblCart.Text = "Produktów w koszyku: " + CART.Count;
                refreshProductsInfo();
                loadCheckbox();
            }
            //else
            //{
            //    if (validateProductAndQuantity(prod_id.Text, prod_quantity.Text))
            //    {
            //        int product_id = Int32.Parse(prod_id.Text.Trim());
            //        int product_quantity = Int32.Parse(prod_quantity.Text.Trim());
            //        Product product = getProductById(product_id);

            //        Product purchased_prod = new Product(product.Id, product.Name,product.Category, product_quantity, product.Price);
            //        CART.Add(purchased_prod);
            //        if (PRODUCTS.Contains(product))
            //        {
            //            product.Quantity -= product_quantity;

            //            if (product.Quantity <= 0)
            //            {
            //                PRODUCTS.Remove(product);
            //            }

            //        }

            //        loadProducts();
            //    }
            //}

        }

        private void refreshProductsInfo()
        {
            foreach(Product p in PRODUCTS)
            {
                p.refreshInfo();
            }
        }

        //private bool validateProductAndQuantity(string gid, string gquantity)
        //{
        //    string s_id = gid.Trim();
        //    string s_quantity = gquantity.Trim();

        //    if (s_id.Length == 0 || s_quantity.Length == 0)
        //    {
        //        return false;
        //    }
        //    int id;
        //    int quantity;
        //    try
        //    {
        //        id = Int32.Parse(s_id);
        //        quantity = Int32.Parse(s_quantity);
        //    }
        //    catch (FormatException ex)
        //    {
        //        return false;
        //    }

        //    Product product = getProductById(id);
        //    if (product == null || product.Quantity < quantity)
        //    {
        //        return false;
        //    }

        //    return true;
        //}

        //protected void ValidateIdAndQuantity(object source, ServerValidateEventArgs args)
        //{
        //    if (!validateProductAndQuantity(prod_id.Text, prod_quantity.Text))
        //    {
        //        args.IsValid = false;
        //        return;
        //    }

        //    args.IsValid = true;
        //}


        protected void OnRadio_Changed(object sender, EventArgs e)
        {
            //loadProducts();
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

        //private void loadProducts()
        //{
        //    List<Product> products = filterProductsByCategory(PRODUCTS, rblCategories.SelectedItem.Value);

        //    addLabelsToTable(productsTable);

        //    for (int i = 0; i < products.Count; i++)
        //    {
        //        addRow(productsTable, products[i].Id, products[i].Name, products[i].Quantity, products[i].Price);
        //    }
        //}

        private Product getProductById(int id, List<Product> PRODUCTS)
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
        //private void addRow(Table g_table, int g_id, string g_name, int g_quantity, int g_price)
        //{
        //    TableRow row = new TableRow();

        //    TableCell id = new TableCell();
        //    id.Text = g_id.ToString();
        //    TableCell name = new TableCell();
        //    name.Text = g_name;
        //    TableCell quantity = new TableCell();
        //    quantity.Text = g_quantity.ToString();
        //    TableCell price = new TableCell();
        //    quantity.Text = g_price.ToString();

        //    row.Cells.Add(id);
        //    row.Cells.Add(name);
        //    row.Cells.Add(quantity);
        //    row.Cells.Add(price);

        //    productsTable.Rows.Add(row);
        //}
    }
}