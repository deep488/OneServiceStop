using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace OneServiceStop
{
    public partial class RecoverPassword : System.Web.UI.Page
    {
        string GUIDvalue;
        DataTable dt = new DataTable();
        int Uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
            {
                con.Open();
                GUIDvalue = Request.QueryString["id"];
                if (GUIDvalue != null)
                {
                    SqlCommand cmd = new SqlCommand(" select * from ForgotPass where id=@id", con);
                    cmd.Parameters.AddWithValue("@id", GUIDvalue);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        Uid = Convert.ToInt32(dt.Rows[0][1]);

                    }
                    else
                    {
                        lblmsg.Text = " Your password reset link is expired or invalid...try again";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Response.Redirect("~/default.aspx");
                }
            }

            if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    txtConfirmPassword.Visible = true;
                    txtNewPassword.Visible = true;
                    lblNewPassword.Visible = true;
                    lblConfirmPassword.Visible = true;
                    btnResetPassword.Visible = true;

                }
                else
                {
                    lblmsg.Text = " Your password reset link is expired or invalid...try again";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }

            }


        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {

            if (txtNewPassword.Text != "" && txtConfirmPassword.Text != "" && txtNewPassword.Text == txtConfirmPassword.Text)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update tblUsers set Password=@p where Uid=@Uid", con);
                    cmd.Parameters.AddWithValue("@p", txtNewPassword.Text);
                    cmd.Parameters.AddWithValue("@Uid", Uid);
                    cmd.ExecuteNonQuery();

                    SqlCommand cmd2 = new SqlCommand("delete from ForgotPass where Uid='" + Uid + "'", con);
                    cmd2.ExecuteNonQuery();
                    Response.Write("<script> alert('password reset successfully done'); </script>");
                    Response.Redirect("~/SignIn.aspx");

                }
            }

        }
    }
}