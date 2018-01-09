using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kotki.Model
{
    public class DataProvider
    {
        public static List<Product> getProducts()
        {
            List<Product> result = new List<Product>();
            result.Add(new Product(1, "Karma mokra", new Category("Karmy"), 18, 12));
            result.Add(new Product(22, "Karma sucha", new Category("Karmy"), 13, 44));
            result.Add(new Product(2, "Karma z witaminami", new Category("Karmy"), 10, 22));
            result.Add(new Product(3, "Karma z łososiem", new Category("Karmy"), 10, 88));
            result.Add(new Product(8, "Karma losowa", new Category("Karmy"), 10, 54));
            result.Add(new Product(196, "Piłeczka gumowa", new Category("Zabawki"), 8, 67));
            result.Add(new Product(11, "Piłeczka drewniana", new Category("Zabawki"), 4, 87));
            result.Add(new Product(33, "Patyczek", new Category("Zabawki"), 11, 99));
            result.Add(new Product(4, "Drapak", new Category("Zabawki"), 12, 980));
            result.Add(new Product(5, "Mysz na baterie", new Category("Zabawki"), 105, 456));
            result.Add(new Product(6, "Szampon", new Category("Higiena"), 66, 45));
            result.Add(new Product(7, "Szampon z odżywką", new Category("Higiena"), 32, 16));
            result.Add(new Product(888, "Odżywka", new Category("Higiena"), 153, 17));
            result.Add(new Product(3656, "Pasta", new Category("Higiena"), 155, 15));
            result.Add(new Product(22, "Szczoteczka do zębów", new Category("Higiena"), 115, 200));
            result.Add(new Product(987, "Szczotka", new Category("Higiena"), 315, 44));
            result.Add(new Product(112, "Wilgotny papier", new Category("Higiena"), 215, 89));

            return result;
        }

        public static List<Category> getCategories()
        {
            List<Category> result = new List<Category>();
            result.Add(new Category("Higiena"));
            result.Add(new Category("Zabawki"));
            result.Add(new Category("Karmy"));

            return result;
        }
    }
}