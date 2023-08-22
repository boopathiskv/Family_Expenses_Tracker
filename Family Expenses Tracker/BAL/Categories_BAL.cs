using BO;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL
{
    public class Categories_BAL
    {
        public List<Category> categories = new List<Category>();

        public List<Category> GetCategories()
        {
            Category_DAL dAL = new Category_DAL();
            return dAL.GetCategories();
        }


    }
}
