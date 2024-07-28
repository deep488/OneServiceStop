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
    public partial class AddSubCategory : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString;
        DataSet ds;
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMainCat();
                BindSubCatRptr();
                GetData();
            }
        }

        private void GetData()
        {

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Getservsubcat", con);
                con.Open();
                da = new SqlDataAdapter("Getservsubcat", con);
                ds = new DataSet();
                da.Fill(ds);
                subcatgrid.DataSource = ds;
                subcatgrid.DataBind();
                con.Close();

            }
        }

        private void BindMainCat()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblCategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlMainCatID.DataSource = dt;
                    ddlMainCatID.DataTextField = "CatName";
                    ddlMainCatID.DataValueField = "CatID";
                    ddlMainCatID.DataBind();
                    ddlMainCatID.Items.Insert(0, new ListItem("-Select-", "0"));


                }


            }
        }

        private void BindSubCatRptr()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select a.*,B.* from tblSubCategory A inner join tblCategory B on B.CatID =A.MainCatID", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrSubCategories.DataSource = dt;
                        rptrSubCategories.DataBind();
                    }
                }

            }
        }

       
        protected void btnAddSubCategory_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblSubCategory( SubCatName,MainCatID ) values ('" + txtSubCategory.Text + "','" + ddlMainCatID.SelectedValue + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script> alert('SubCategory Added Successfully ');  </script>");
                txtSubCategory.Text = String.Empty;
                con.Close();
                ddlMainCatID.ClearSelection();
                ddlMainCatID.Items.FindByValue("0").Selected = true;



            }
            BindSubCatRptr();
            GetData();

        }

        protected void subcatgrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(subcatgrid.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("deleteservsubcat", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                GetData();
            }
        }

        protected void subcatgrid_RowEditing(object sender, GridViewEditEventArgs e)
        {

            subcatgrid.EditIndex = e.NewEditIndex;
            GetData();
        }

        protected void subcatgrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {

                int ID = Convert.ToInt32(subcatgrid.DataKeys[e.RowIndex].Value);
                string SubCat = (subcatgrid.Rows[e.RowIndex].FindControl("txtSubCategory1") as TextBox).Text;

                SqlCommand cmd = new SqlCommand("updateservsubcat", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SubCat", SubCat);
                cmd.Parameters.AddWithValue("@ID", ID);


                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                GetData();

            }
        }

        protected void subcatgrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            subcatgrid.EditIndex = -1;
            GetData();
        }
    }
}