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
    public partial class LoginPage : System.Web.UI.Page
    {
        BO bo = new BO();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            //else
            //{
            //    Session.Abandon();
            //    Response.Cookies.Clear();
            //}

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        public bool CheckUser()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = $"select * from UserDetails where emailid='{bo.email}'";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows == true)
                        {
                            while (dr.Read())
                            {
                                string userpassword = dr["password"].ToString();
                                if (userpassword == bo.password)
                                {
                                    Session["UserId"] = Convert.ToInt32(dr["userid"]);
                                    Session["Fname"] = dr["fname"].ToString();
                                    Session["Lname"] = dr["lname"].ToString();
                                    return true;
                                }
                                else return false;
                            }
                        }
                        else return false;

                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
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
            return false;
        }
        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            getData();
            if (CheckUser())
            {
                Response.Redirect("UserHomePage.aspx");
            }
            else Response.Write("<script>alert('User ID or Password Not Machi....')</script>");
        }

        public void getData()
        {
            bo.email = txtemail.Text;
            bo.password = txtpassword.Text;
        }

        void Clear()
        {
            txtemail.Text = "";
            txtpassword.Text = "";
        }
    }
}