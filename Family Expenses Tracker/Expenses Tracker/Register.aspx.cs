using BAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;

namespace Expenses_Tracker
{
    public partial class Register : System.Web.UI.Page
    {
        UserDetails Uds = new UserDetails();   
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        public void getData()
        {                       
            Uds.fname = txtfname.Text;
            Uds.lname = txtlname.Text;
            Uds.mobileno = Convert.ToInt64(txtmobileno.Text);
            Uds.email = txtemail.Text;
            Uds.password = txtpassword.Text;
        }

        void Clear()
        {
            txtfname.Text = "";
            txtlname.Text = "";
            txtmobileno.Text = "";
            txtemail.Text = "";
            txtpassword.Text = "";
        }
        
        protected void Register_Function(object sender, EventArgs e)
        {

            getData();
            UserDetails_BAL bAL = new UserDetails_BAL();
            if (bAL.Register_Function(Uds))
            {
                Clear();
                Response.Redirect("LoginPage.aspx");
                Response.Output.Write("<script>alert('Inserted Successfull')</script>");
            }
            else
            {
                Clear();
                Response.Write($"<script>alert('Already Mobile or email ID Register.. ')</script>");
            }           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }
    }
}
