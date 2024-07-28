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
    public partial class Services : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            
                if (!IsPostBack)
                {
                    
                    BindServiceRepeater();
                   

                }
            
        }

        private void BindServiceRepeater()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("servBindAllServices", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrServices.DataSource = dt;
                        rptrServices.DataBind();
                    }

                }
            }
        }
    }
}