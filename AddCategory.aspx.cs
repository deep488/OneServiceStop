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
    public partial class AddCategory : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }

        private void GetData()
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblCategory", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        subcategorygrid.DataSource = dt;
                        subcategorygrid.DataBind();
                    }
                }

            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblCategory( CatName ) values ('" + txtCategory.Text + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script> alert('Category Added Successfully ');  </script>");
                txtCategory.Text = String.Empty;
                con.Close();
                // lblmsg.Text = "Registration Successfully done";
                //lblmsg.ForeColor = System.Drawing.Color.Green;
                txtCategory.Focus();
                GetData();


            }


        }

        protected void subcategorygrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(subcategorygrid.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("deleteservcat", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                GetData();
            }
        }

        protected void subcategorygrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            subcategorygrid.EditIndex = e.NewEditIndex;
            GetData();
        }

        protected void subcategorygrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {

                int ID = Convert.ToInt32(subcategorygrid.DataKeys[e.RowIndex].Value);
                string Cat = (subcategorygrid.Rows[e.RowIndex].FindControl("txtCategory") as TextBox).Text;

                SqlCommand cmd = new SqlCommand("updateservcat", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CatN", Cat);
                cmd.Parameters.AddWithValue("@ID", ID);


                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                GetData();

            }
        }

        protected void subcategorygrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            subcategorygrid.EditIndex = -1;
            GetData();
        }
    }
}