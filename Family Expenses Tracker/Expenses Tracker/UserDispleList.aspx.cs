using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expenses_Tracker
{
    public partial class UserDispleList : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        List<string> CategoryList = new List<string>();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUser();
            int userId = (int)Session["UserId"];
            string Uname = (string)Session["fname"] + " " + (string)Session["lname"];
            Response.Output.Write($"User Id :{userId}, Name : {Uname}");
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string sql = $"select * from CategoryList_TB order by category_ID";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        try
                        {
                            con.Open();
                            SqlDataReader dr = cmd.ExecuteReader();
                            List<string> Category = new List<string>();
                            Category.Add("All Category");
                            while (dr.Read())
                            {
                                Category.Add(dr["category_Name"].ToString());
                            }
                            ddlCategory.DataSource = Category;
                            ddlCategory.DataBind();
                        }
                        catch (Exception ex)
                        {
                            Response.Write($"<script>alert('{ex.Message} Category Field ')</script>");
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

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                string selectCategory = ddlCategory.SelectedValue.ToString();
                string sql = $"select List_Name from List_Category_TB where CategoryList_TB_ID = (select category_ID from CategoryList_TB where category_Name = '{selectCategory}') ";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        List<string> Category = new List<string>();
                        while (dr.Read())
                        {
                            Category.Add(dr["List_Name"].ToString());
                        }
                        ddlCategoryList.DataSource = Category;
                        ddlCategoryList.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>alert('{ex.Message} Category List Field ')</script>");
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
             
        void CheckUser()
        {
            if (Session["UserId"] == null && (string)Session["fname"] == null && (string)Session["lname"] == null)
                Response.Redirect("LoginPage.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {            
            string sql;
            string ddlName;
            
            if (chkSub.Checked)
            {
                sql = "Sub_Category_select_TB";
                
                ddlName = ddlCategoryList.Text;
            }
            else if(ddlCategory.Text== "All Category")
            {
                sql = "All_Category_select_TB";
                ddlName = ddlCategory.Text;
            }
            else
            {
                sql = "Category_select_TB";
                ddlName = ddlCategory.Text;
            }
            using (SqlConnection con = new SqlConnection(cs))
            {
                int UserId = (int)Session["UserId"];
                
                
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    try
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@user_id", UserId));
                        cmd.Parameters.Add(new SqlParameter("@categoryName", ddlName));

                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows == true)
                        {
                            GridView1.DataSource = dr;
                            GridView1.DataBind();
                        }
                        else
                        {
                            GridView1.EmptyDataText = "";
                            GridView1.DataBind();
                            Response.Output.Write($"<script>alert('No Data {ddlName} Category')</script> ");
                        }
                    }
                    catch (SqlException ex)
                    {
                        Response.Write($"<script>alert('{ex.Message} selectd Field ')</script> {ex.Message}");
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

        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            Response.Redirect("LoginPage.aspx");
        }
    }
}