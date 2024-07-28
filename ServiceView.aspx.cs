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
    public partial class ServiceView : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["SID"] != null)
            {
                if (!IsPostBack)
                {
                    

                        
                        BindServiceImage();
                    BindServiceDetails();
                }
            }
            else
            {
                Response.Redirect("~/Services.aspx");
            }
        }

        private void BindServiceDetails()
        {
            Int64 SID = Convert.ToInt64(Request.QueryString["SID"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindsrvDetails", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@SID", SID);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrServiceDetails.DataSource = dt;
                    rptrServiceDetails.DataBind();
                    
                }

            }
        }

        private void BindServiceImage()
        {
            Int64 SID = Convert.ToInt64(Request.QueryString["SID"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblServicesImages where SID='" + SID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrImage.DataSource = dt;
                        rptrImage.DataBind();
                    }
                }
            }
        }



        protected string GetActiveImgClass(int ItemIndex)
        {
            if (ItemIndex == 0)
            {
                return "active";
            }
            else
            {
                return "";

            }
        }

        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("en-IN");
            ci.NumberFormat.CurrencySymbol = "₹";
            Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();
        }

        protected void rptrServiceDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }

    
}