using BO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Category_DAL
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        public List<Category> GetCategories()
        {
            List<Category> categories = new List<Category>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = $"select * from CategoryList_TB order by category_ID";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            Category c = new Category();
                            c.Category_Name = dr["category_Name"].ToString();
                            categories.Add(c);
                        }
                        return categories;
                        //ddlCategory.DataSource = Category;
                        //ddlCategory.DataBind();
                    }
                    catch (Exception ex)
                    {
                        return categories;
                    }
                    finally
                    {
                        if (con.State == ConnectionState.Open)
                        {
                            con.Close();
                        }
                    }
                }
            }
        }




    }
}
