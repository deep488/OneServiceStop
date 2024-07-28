using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace OneServiceStop
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblUsers where Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);


                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    string myGUID = Guid.NewGuid().ToString();
                    int UID = Convert.ToInt32(dt.Rows[0][0]);
                    SqlCommand cmd1 = new SqlCommand("insert into ForgotPass(ID,UId,RequestDateTime) values ('" + myGUID + "','" + UID + "',GETDATE())", con);
                    cmd1.ExecuteNonQuery();

                    //send reset link via email

                    string ToEmailAddress = dt.Rows[0][3].ToString();
                    string Username = dt.Rows[0][1].ToString();
                    string EmailBody = "Hi ," + Username + ",<br/><br/>Click the link below to reset your password,<br/><br/> https://localhost:44365/RecoverPassword.aspx?id="+myGUID;

                    MailMessage PassRecMail = new MailMessage("oneservicestop11@gmail.com", ToEmailAddress);

                    PassRecMail.Body = EmailBody;
                    PassRecMail.IsBodyHtml = true;
                    PassRecMail.Subject = "Reset Password";

                    using (SmtpClient client = new SmtpClient())
                    {
                        client.EnableSsl = true;
                        client.UseDefaultCredentials = false;
                        client.Credentials = new NetworkCredential("oneservicestop11@gmail.com", "pxcpibapxfmtwnxd");
                        client.Host = "smtp.gmail.com";
                        client.Port = 587;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;

                        client.Send(PassRecMail);
                    }



                    //-------------------------

                    lblResetPassMsg.Text = " Reset Link Send | check your email for reset password";
                    lblResetPassMsg.ForeColor = System.Drawing.Color.Green;
                    txtEmailID.Text = String.Empty;

                }
                else
                {
                    lblResetPassMsg.Text = " Oops! This Email Does not exist....Try again ";
                    lblResetPassMsg.ForeColor = System.Drawing.Color.Red;
                    txtEmailID.Text = String.Empty;
                    txtEmailID.Focus();
                }
            }


        }
    }
}