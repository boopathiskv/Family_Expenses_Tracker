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
    public class UserDetails_DAL
    {
        
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        public bool CheckUser(UserDetails Uds)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = $"select * from UserDetails where moblieno={Uds.mobileno} or emailid='{Uds.email}'";
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
                        return false;
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


        public bool Register_Function(UserDetails Uds)
        {
            if (CheckUser(Uds))
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string sql = $"insert into UserDetails values('{Uds.fname}','{Uds.lname}',{Uds.mobileno},'{Uds.email}','{Uds.password}')";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        try
                        {
                            con.Open();
                            int t = cmd.ExecuteNonQuery();
                            if (t > 0) return true;                            
                        }
                        catch (Exception ex)
                        {
                            return false;
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
            else return false;
            return false;
        }

        public bool User_Login(UserDetails uds)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = $"select * from UserDetails where emailid='{uds.email}'";
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
                                if (userpassword == uds.password)
                                {
                                    uds.userid = Convert.ToInt32(dr["userid"]);
                                    return true;
                                }
                                else return false;
                            }
                        }
                        else return false;

                    }
                    catch (Exception ex)
                    {
                        return false;
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



    }
}
