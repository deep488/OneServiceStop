using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



namespace OneServiceStop
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtsignup_Click(object sender, EventArgs e)
        {
            if (isformvalid())
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into tblUsers(Username,Password,Name,Email,Usertype ) values ('" + txtUname.Text + "','" + txtPass.Text + "','" + txtName.Text + "','" + txtEmail.Text + "','User')", con);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script> alert('Registration Successfully done');  </script>");
                    clr();
                    con.Close();
                    lblmsg.Text = "Registration Successfully done";
                    lblmsg.ForeColor = System.Drawing.Color.Green;

                }
                Response.Redirect("~/SignIn.aspx");
            }
            else
            {
                Response.Write("<script> alert('Registration failed');  </script>");
                lblmsg.Text = "All fields are mandatory";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool isformvalid()
        {
            if (txtUname.Text == "")
            {
                Response.Write("<script> alert('username not valid');  </script>");
                txtUname.Focus();
                return false;
            }
            else if (txtPass.Text == "")
            {
                Response.Write("<script> alert('Password not valid');  </script>");
                txtPass.Focus();
                return false;
            }
            else if (txtPass.Text != txtCPass.Text)
            {
                Response.Write("<script> alert('confirm Password not valid');  </script>");
                txtCPass.Focus();
                return false;
            }
            else if (txtEmail.Text == "")
            {
                Response.Write("<script> alert('Email not valid');  </script>");
                txtEmail.Focus();
                return false;
            }
            else if (txtName.Text == "")
            {
                Response.Write("<script> alert('Name not valid');  </script>");
                txtName.Focus();
                return false;
            }
            return true;
        }
        private void clr()
        {
            txtName.Text = String.Empty;
            txtPass.Text = String.Empty;
            txtUname.Text = String.Empty;
            txtEmail.Text = String.Empty;
            txtCPass.Text = String.Empty;
        }
    }
}