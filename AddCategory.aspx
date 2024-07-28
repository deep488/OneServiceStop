<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="OneServiceStop.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
               <div class="form-horizontal">
                   <br />
                   <br />
                   <br />
                   <h2> Add Category </h2>
                   <hr />
                   <div class="form-group">
                       <asp:Label ID="Label1" CssClass="col-md-2 control-label1" runat="server" Text="Category Name"></asp:Label>
                       <div class="col-md-3 ">

                           <asp:TextBox ID="txtCategory" CssClass="form-control" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategoryname" runat="server" CssClass="text-danger" ErrorMessage="please enter   Category name" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>

                       </div>
                   </div>

                   

                   
                   <div class="form-group">
                       <div class="col-md-2 "> </div>
                       <div class="col-md-6 ">

                           <asp:Button ID="btnAddCategory" CssClass ="btn btn-success" runat="server" Text="Add Category" OnClick="btnAddCategory_Click" />


                       </div>
                   </div>

                    

               </div>

          <h1>Categories</h1>
        <hr />

        <div class="form-group">
                <asp:GridView ID="subcategorygrid" runat="server" CssClass="table" 
                    OnRowDeleting="subcategorygrid_RowDeleting"
                     OnRowEditing="subcategorygrid_RowEditing"
                     OnRowUpdating="subcategorygrid_RowUpdating"
                     OnRowCancelingEdit="subcategorygrid_RowCancelingEdit"
                     DataKeyNames="CatID"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Category ID" DataField="CatID" ReadOnly="true" />


                         <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label runat="server" Text=' <%# Eval("CatName") %> '></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCategory1" runat="server" Text='<%# Bind("CatName") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    
                        <asp:CommandField  ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger" HeaderText="Remove Record " >
<ControlStyle CssClass="btn btn-danger"></ControlStyle>
                        </asp:CommandField>
                       
                        <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" HeaderText="Edit Record " >

<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                        </asp:CommandField>

                    </Columns>

                </asp:GridView>


            </div>

               </div> 
</asp:Content>
