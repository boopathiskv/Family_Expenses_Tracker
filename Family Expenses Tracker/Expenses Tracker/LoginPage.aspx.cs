using BAL;
using BO;
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
        UserDetails bo = new UserDetails();
        //string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

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

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            getData();
            UserDetails_BAL bAL = new UserDetails_BAL();
            if (bAL.User_Login(bo))
            {
                Session["UserId"] = bo.userid;
                Session["Fname"] = bo.fname;
                Session["Lname"] = bo.lname;
                Clear();
                Response.Redirect("UserHomePage.aspx");
            }
            else
            {
                Clear();
                Response.Write("<script>alert('User ID or Password Not Machi....')</script>");
            }
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