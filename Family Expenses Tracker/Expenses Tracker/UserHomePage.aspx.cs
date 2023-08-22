using BAL;
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
    public partial class UserHomePage : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        List<string> CategoryList = new List<string>();
        Categories_BAL categories_Bal = new Categories_BAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUser();
            int userId = (int)Session["UserId"];
            string Uname = (string)Session["fname"] + " " + (string)Session["lname"];
            Response.Output.Write($"User Id :{userId}, Name : {Uname}");
            if (!IsPostBack)
            {
                ddlCategory.DataSource = categories_Bal;
                ddlCategory.DataBind();
            }

        }

        protected void Load()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                int UserId = (int)Session["UserId"];
                using (SqlCommand cmd = new SqlCommand("DisplayAllRecords", con))
                {
                    try
                    {

                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@user_id", UserId));

                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows == true)
                        {
                            GridView1.DataSource = dr;
                            GridView1.DataBind();
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>alert('{ex.Message} Grid Viwe Field ')</script>");
                    }
                    finally
                    {
                        if (con.State == ConnectionState.Open)
                        {
                            con.Close();
                        }
                        Clear();
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
                        Clear();
                    }
                }
            }
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                int UserId = (int)Session["UserId"];
                string t2 = ddlCategoryList.Text;
                string t3 = txtdate.Text;
                string t4 = txtgst.Text;
                decimal t5 = Convert.ToDecimal(txtcost.Text);
                string t6 = txtAbout.Text;
                using (SqlCommand cmd = new SqlCommand("Insert_Records_TB", con))
                {
                    try
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@user_id", UserId));
                        cmd.Parameters.Add(new SqlParameter("@categoryList_id", t2));
                        cmd.Parameters.Add(new SqlParameter("@expenseDate", t3));
                        cmd.Parameters.Add(new SqlParameter("@Bill_IdOrGst_Id", t4));
                        cmd.Parameters.Add(new SqlParameter("@totalCost", t5));
                        cmd.Parameters.Add(new SqlParameter("@about", t6));
                        int t = cmd.ExecuteNonQuery();//date char convertion Errer
                        if (t > 0)
                        {
                            //Session[""]
                            Response.Write("<script>alert('Inserted Successfull')</script>");
                            //Response.Output.Write("<script>alert('Inserted Successfull')</script>");
                        }
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number == 2627)
                            Response.Write($"<script>alert(' Already Recorde Exists ')</script>");
                        else
                            Response.Write($"<script>alert('{ex.Message} Inserted Field ')</script> {ex.Message}");
                    }
                    finally
                    {
                        if (con.State == ConnectionState.Open)
                        {
                            con.Close();
                        }
                        Clear();
                    }
                }
            }
            Load();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            Response.Redirect("LoginPage.aspx");

            //Response.Redirect("LoginPage.aspx");
            //Server.Transfer("LoginPage.aspx");
            //Server.Execute("LoginPage.aspx");  //continue same page
            //Response.Buffer = true;
            //Response.CacheControl = "no-cache";
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Session.Clear();
        }

        //protected void txtgst_TextChanged(object sender, EventArgs e)
        //{
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        string sql=$"select * from "
        //        using (SqlCommand cmd = new SqlCommand("Insert_Records_TB", con))
        //        {
        //            try
        //            {
        //                con.Open();

        //                int t = cmd.ExecuteNonQuery();//date char convertion Errer
        //                if (t > 0)
        //                {
        //                    //Session[""]
        //                    //Response.Write("<script>alert('Inserted Successfull')</script>");
        //                    //Response.Output.Write("<script>alert('Inserted Successfull')</script>");
        //                }
        //            }
        //            catch (SqlException ex)
        //            {
        //                if (ex.Number == 2627)
        //                    Response.Write($"<script>alert(' Already Recorde Exists ')</script>");
        //                else
        //                    Response.Write($"<script>alert('{ex.Message} Inserted Field ')</script> {ex.Message}");
        //            }
        //            finally
        //            {
        //                if (con.State == ConnectionState.Open)
        //                {
        //                    con.Close();
        //                }
        //                Clear();
        //            }
        //        }
        //    }

        //}

        void CheckUser()
        {
            if (Session["UserId"] == null || (string)Session["fname"] == null || (string)Session["lname"] == null)
                Response.Redirect("LoginPage.aspx");
        }

        void Clear()
        {
            txtAbout.Text = "";
            txtdate.Text = "";
            txtgst.Text = "";
            txtcost.Text = "";
            CategoryList.Clear();
        }


    }
}