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
    public partial class Register : System.Web.UI.Page
    {
        BO bo = new BO();
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        public void getData()
        {                       
            bo.fname = txtfname.Text;
            bo.lname = txtlname.Text;
            bo.mobileno = Convert.ToInt64(txtmobileno.Text);
            bo.email = txtemail.Text;
            bo.password = txtpassword.Text;
        }

        void Clear()
        {
            txtfname.Text = "";
            txtlname.Text = "";
            txtmobileno.Text = "";
            txtemail.Text = "";
            txtpassword.Text = "";
        }

        public bool CheckUser()
        {            
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = $"select * from UserDetails where moblieno={bo.mobileno} or emailid='{bo.email}'";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.HasRows == true)
                        {
                            return false;
                        }
                        else return true;

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
                    }
                }
            }
            return false;
        }

        protected void Register_Function(object sender, EventArgs e)
        {
            getData();            
            if (CheckUser())
            {
                using (SqlConnection con = new SqlConnection(cs))
                {                             
                    string sql = $"insert into UserDetails values('{bo.fname}','{bo.lname}',{bo.mobileno},'{bo.email}','{bo.password}')";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        try
                        {
                            con.Open();
                            int t = cmd.ExecuteNonQuery();
                            if (t > 0)
                            {
                                //Session[""]
                                //Response.Write("<script>alert('Inserted Successfull')</script>");
                                Response.Redirect("LoginPage.aspx");
                                Response.Output.Write("<script>alert('Inserted Successfull')</script>");
                            }
                        }
                        catch (Exception ex)
                        {
                            Response.Write($"<script>alert('{ex.Message} Inserted Field ')</script>");
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
            else Response.Write($"<script>alert('Already Mobile or email ID Register.. ')</script>");            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }
    }
}
