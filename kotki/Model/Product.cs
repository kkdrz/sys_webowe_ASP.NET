using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kotki.Model
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Category Category { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
        public string Info { get; set; }

        public Product (int id, string name, Category category, int quantity, int price)
        {
            this.Id = id;
            this.Name = name;
            this.Category = category;
            this.Quantity = quantity;
            this.Price = price;
            this.Info = name + " | " + Price + "zł | Dostępność: " + quantity;
        }

        public override bool Equals(Object obj)
        {
            if (obj == null || GetType() != obj.GetType())
                return false;

            Product p = (Product)obj;
            return (Id == p.Id);
        }

        public override int GetHashCode()
        {
            return base.GetHashCode() ^ Id;
        }

        internal void refreshInfo()
        {
            this.Info = this.Name + " | " + this.Price + "zł | Dostępność: " + this.Quantity;
        }
    }
}