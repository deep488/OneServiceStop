using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace OneServiceStop
{
    public partial class AddService : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["osmdb"].ConnectionString;
        
        DataSet ds;
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //when page first time run then this code will execute
                BindCategory();
                ddlSubCategory.Enabled = false;
                ddlCategory.Enabled = true;
                getdata();


            }
        }

        

        private void BindCategory()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblCategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatID";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));


                }


            }
        }

        private void getdata()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Getserv", con);
                con.Open();
                da = new SqlDataAdapter("Getserv", con);
                ds = new DataSet();
                da.Fill(ds);
                servgrid.DataSource = ds;
                servgrid.DataBind();
                con.Close();

            }

        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertService", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SName", txtServiceName.Text);
                cmd.Parameters.AddWithValue("@SCharge", txtPrice.Text);
                cmd.Parameters.AddWithValue("@SDoCharge", txtsellPrice.Text);
                cmd.Parameters.AddWithValue("@SCategoryID", ddlCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SSubCategoryID", ddlSubCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SDescription", txtDescription.Text);

                con.Open();
                Int64 SID = Convert.ToInt64(cmd.ExecuteScalar());

                //insert and upload images
                if (fuImg01.HasFiles)
                {
                    string SavePath = Server.MapPath("~/Images/ServiceImages/") + SID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                    fuImg01.SaveAs(SavePath + "\\" + txtServiceName.Text.ToString().Trim() + "01" + Extention);

                    
                    //SqlCommand cmd3 = new SqlCommand(" insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() +"01" + "','" + Extention + "')", con);
                    SqlCommand cmd2 = new SqlCommand("insert into tblServicesImages(SID,Name,Extention) values(@SID,@Name,@Extention)", con);
                    cmd2.Parameters.AddWithValue("@SID", Convert.ToInt32(SID));
                    cmd2.Parameters.AddWithValue("@Name", txtServiceName.Text.ToString().Trim() + "01");
                    cmd2.Parameters.AddWithValue("@Extention", Extention);
                    cmd2.ExecuteNonQuery();

                }


                if (fuImg02.HasFiles)
                {
                    string SavePath = Server.MapPath("~/Images/ServiceImages/") + SID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                    fuImg02.SaveAs(SavePath + "\\" + txtServiceName.Text.ToString().Trim() + "02" + Extention);

                    //SqlCommand cmd3 = new SqlCommand(" insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() +"01" + "','" + Extention + "')", con);
                    SqlCommand cmd3 = new SqlCommand("insert into tblServicesImages(SID,Name,Extention) values(@SID,@Name,@Extention)", con);
                    cmd3.Parameters.AddWithValue("@SID", Convert.ToInt32(SID));
                    cmd3.Parameters.AddWithValue("@Name", txtServiceName.Text.ToString().Trim() + "02" );
                    cmd3.Parameters.AddWithValue("@Extention", Extention);
                    cmd3.ExecuteNonQuery();
                }
                getdata();
            }

        }    

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblSubCategory where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlSubCategory.DataSource = dt;
                    ddlSubCategory.DataTextField = "SubCatName";
                    ddlSubCategory.DataValueField = "SubCatID";
                    ddlSubCategory.DataBind();
                    ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));


                }


            }
            if (ddlCategory.SelectedIndex != 0)
            {
                ddlSubCategory.Enabled = true;
            }
            else
            {
                ddlSubCategory.Enabled = false;
            }
        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }

        protected void servgrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(servgrid.DataKeys[ e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("deleteserv", con);
                cmd.CommandType = System.Data. CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID",id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                getdata();
            }

        }

        protected void servgrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
                            BindCategory();

            servgrid.EditIndex = e.NewEditIndex;
            getdata();
        }

        protected void servgrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {

                int ID = Convert.ToInt32(servgrid.DataKeys[e.RowIndex].Value);
                string SName = (servgrid.Rows[e.RowIndex].FindControl("txtServiceName") as TextBox).Text;
                string SCharge = (servgrid.Rows[e.RowIndex].FindControl("txtPrice") as TextBox).Text;
                string SDoCharge = (servgrid.Rows[e.RowIndex].FindControl("txtsellPrice") as TextBox).Text;

                string SCategoryID = (servgrid.Rows[e.RowIndex].FindControl("ddlCategory") as DropDownList).SelectedItem.Value;
                string SSubCategoryID = (servgrid.Rows[e.RowIndex].FindControl("ddlSubCategory") as DropDownList).SelectedItem.Value;
                string Description = (servgrid.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text;
                FileUpload image = (servgrid.Rows[e.RowIndex].FindControl("imgedit") as FileUpload);
                string path = "~/Images/ServiceImages/";
                if (image.HasFiles)
                {
                    string filename = Path.GetFileName(image.PostedFile.FileName);
                    path = SName + ID;
                    image.SaveAs(MapPath(path));
                }
                else
                {
                    Image img = (Image)servgrid.Rows[e.RowIndex].FindControl("imgedit");
                    path = img.ImageUrl;
                }
                SqlCommand cmd = new SqlCommand("updateserv", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SName", txtServiceName.Text);
                cmd.Parameters.AddWithValue("@SCharge", txtPrice.Text);
                cmd.Parameters.AddWithValue("@SDoCharge", txtsellPrice.Text);
                cmd.Parameters.AddWithValue("@SCategoryID", ddlCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SSubCategoryID", ddlSubCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SDescription", txtDescription.Text);
                cmd.Parameters.AddWithValue("@ID", ID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                getdata();


            }

        }

        protected void servgrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            servgrid.EditIndex = -1;
            getdata();
        }

        protected void ddlCategory_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblSubCategory where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlSubCategory.DataSource = dt;
                    ddlSubCategory.DataTextField = "SubCatName";
                    ddlSubCategory.DataValueField = "SubCatID";
                    ddlSubCategory.DataBind();
                   // ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));


                }


            }
            if (ddlCategory.SelectedIndex != 0)
            {
                ddlSubCategory.Enabled = true;
            }
            else
            {
                ddlSubCategory.Enabled = false;
            }
        }

        protected void ddlSubCategory_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }

}