using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kotki
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                wynik.Text = "Login: " + login.Text + "&nbsp&nbsp&nbsp&nbsp&nbsp" + "Hasło: " + password.Text + "&nbsp&nbsp&nbsp&nbsp&nbsp" + "Email: " + email.Text + "&nbsp&nbsp&nbsp&nbsp&nbsp" + "Wiek: " + wiek.Text + "&nbsp&nbsp&nbsp&nbsp&nbsp" + "Liczba kotów: " + kot.Text;
            }
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/signup.aspx", true);
        }

    }
}