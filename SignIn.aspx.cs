using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;



namespace OneServiceStop
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UNAME"] != null && Request.Cookies["UPASS"] != null)
                {
                    txtUsername.Text = Request.Cookies["UNAME"].Value;
                    txtPassword.Text = Request.Cookies["UPASS"].Value;
                   // CheckBox1.Checked = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblUsers where Username=@username and Password=@password", con);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);

                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {

                    Session["USERID"] = dt.Rows[0]["Uid"].ToString();
                    Session["USEREMAIL"] = dt.Rows[0]["Email"].ToString();
                   // Response.Cookies["Username"].Expires = DateTime.Now.AddDays(-1);
                   // Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                   // if (CheckBox1.Checked)
                    {
                        Response.Cookies["Username"].Value = txtUsername.Text;
                        Response.Cookies["Password"].Value = txtPassword.Text;


                        Response.Cookies["Username"].Expires = DateTime.Now.AddDays(7);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(7);

                    }
                    
                    {

                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["UPASS"].Expires = DateTime.Now.AddDays(-1);

                    }

                    string Utype;
                    Utype = dt.Rows[0][5].ToString().Trim();

                    if (Utype == "User")
                    {
                        Session["Username"] = txtUsername.Text;
                        Session["USERID"] = dt.Rows[0]["Uid"].ToString();

                        // Response.Redirect("~/UserHome.aspx");
                        Response.Redirect("~/Services.aspx");

                    }
                    if (Utype == "Admin")
                    {
                        Session["Username"] = txtUsername.Text;
                        Response.Redirect("~/AdminHome.aspx");
                    }
                }
                else
                {
                    lblError.Text = "Invalid Username or Password";
                }

                // Response.Write("<script> alert('Login Successfully done');  </script>");
                clr();
                con.Close();
                //lblMsg.Text = "Registration Successfully done";
                //lblMsg.ForeColor = System.Drawing.Color.Green;


            }
        }

        private void clr()
        {
            txtPassword.Text = String.Empty;
            txtUsername.Text = String.Empty;
            txtUsername.Focus();

        }
    }
    
} 