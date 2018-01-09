using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kotki.Model
{
    public class Category
    {
        public string Name { get; set; }

        public Category(string name)
        {
            this.Name = name;
        }
    }
}