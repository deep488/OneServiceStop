<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="OneServiceStop.AddSubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
               <div class="form-horizontal">
                   <br />
                   <br />
                   <br />
                   <h2> Add  SubCategory </h2>
                   <hr />

                   <div class="form-group">
                       <asp:Label ID="Label2" CssClass="col-md-2 control-label1" runat="server" Text="Main CategoryID"></asp:Label>
                       <div class="col-md-3 ">

                           <asp:DropDownList ID="ddlMainCatID" CssClass ="form-control"  runat="server"></asp:DropDownList>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlMainCatID" runat="server" CssClass="text-danger" ErrorMessage="please Select  Main CategoryID" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>

                       </div>
                   </div>


                   <div class="form-group">
                       <asp:Label ID="Label1" CssClass="col-md-2 control-label1" runat="server" Text="SubCategory Name"></asp:Label>
                       <div class="col-md-3 ">

                           <asp:TextBox ID="txtSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategoryname" runat="server" CssClass="text-danger" ErrorMessage="please enter   SubCategory name" ControlToValidate="txtSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>

                       </div>
                   </div>

                   

                   
                   <div class="form-group">
                       <div class="col-md-2 "> </div>
                       <div class="col-md-6 ">

                           <asp:Button ID="btnAddSubCategory" CssClass ="btn btn-success" runat="server" Text="Add SubCategory" OnClick="btnAddSubCategory_Click"   />


                       </div>
                   </div>

                    

               </div>

        <h1>Sub-Categories</h1>
        <hr />

     <!---   <div class="panel panel-default">
            <div class="panel-heading"> All Sub-Categories</div>

            <asp:Repeater ID="rptrSubCategories" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Sub-Category</th>
                        <th>Main Category</th>
                        <th>Edit</th>

                    </tr>
                </thead>
                
                
                <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <th> <%# Eval("SubCatID") %> </th>
                        <td> <%# Eval("SubCatName") %> </td>
                        <td> <%# Eval("CatName") %> </td>


                        <td>Edit</td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                          
                </tbody>

            </table>
                </FooterTemplate>

            </asp:Repeater>

            
              

        </div>  ----->

        <div class="form-group">
                <asp:GridView ID="subcatgrid" runat="server" CssClass="table" 
                    OnRowDeleting="subcatgrid_RowDeleting"
                     OnRowEditing="subcatgrid_RowEditing"
                     OnRowUpdating="subcatgrid_RowUpdating"
                     OnRowCancelingEdit="subcatgrid_RowCancelingEdit"
                     DataKeyNames="SubCatID"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Subcaregory ID" DataField="SubCatID" ReadOnly="true" />

                           <asp:BoundField HeaderText="Main Category" DataField="CatName" ReadOnly="true" />

                         <asp:TemplateField HeaderText="SubCategory">
                            <ItemTemplate>
                                <asp:Label runat="server" Text=' <%# Eval("SubCatName") %> '></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSubCategory1" runat="server" Text='<%# Bind("SubCatName") %>'></asp:TextBox>
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
