using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace OneServiceStop
{
    public partial class Payment : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnPlaceNPay_Click(object sender, EventArgs e)
        {

        }

        protected void btnPaytm_Click(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                string USERID = Session["USERID"].ToString();
                string PaymentType = "Paytm";
                string PaymentStatus = "NotPaid";
                string EMAILID = Session["USEREMAIL"].ToString();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into tblOrder values('" + USERID + "','"+ hdAmount.Value + "','" + hdDiscount.Value + "','" + hdTotalPayed.Value + "','" + PaymentType + "','" + PaymentStatus + "',getdate(),'"
                        + txtName.Text + "','" + txtAddress.Text + "','" + txtPinCode.Text + "','" + txtMobileNumber.Text + "') select SCOPE_IDENTITY()", con);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    Int64 PurchaseID = Convert.ToInt64(cmd.ExecuteScalar());
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }
    }
}