<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddService.aspx.cs" Inherits="OneServiceStop.AddService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="form-horizontal">
            
            <br />
            <br />
            <br />
            <h2> Add Service </h2>
            <hr />
            

             <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label"  Text=" Service name "></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtServiceName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ErrorMessage="please enter valid Service name " ControlToValidate="txtServiceName" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>

            </div>
            

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label"  Text=" Charge "></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" ErrorMessage="please enter valid Service charge" ControlToValidate="txtPrice" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>

            </div>


            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label"  Text="To do Charge"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtsellPrice" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger" ErrorMessage="please enter valid Service DO Charge" ControlToValidate="txtsellPrice" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>

            </div> 

           

            
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label"  Text="Category"></asp:Label>
                <div class="col-md-3">
                     <asp:DropDownList ID="ddlCategory" CssClass ="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="text-danger" ErrorMessage="please select valid Service Category" ControlToValidate="ddlCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

            </div>

            <div class="form-group">
                <asp:Label ID="Label6" runat="server" CssClass="col-md-2 control-label"  Text="SubCategory"></asp:Label>
                <div class="col-md-3">
                     <asp:DropDownList ID="ddlSubCategory" CssClass ="form-control"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="text-danger" ErrorMessage="please Select valid Subcategory" ControlToValidate="ddlSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

            </div>

           


             

            

             <div class="form-group">
                <asp:Label ID="Label8" runat="server" CssClass="col-md-2 control-label" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="text-danger" ErrorMessage="please enter valid Service Description" ControlToValidate="txtDescription" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>

            </div>

           


           

            <div class="form-group">
                <asp:Label ID="Label11" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg01" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="text-danger" ErrorMessage="please Select Image" ControlToValidate="fuImg01" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

            </div>


            <div class="form-group">
                <asp:Label ID="Label12" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fuImg02" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="text-danger" runat="server" ErrorMessage="please Select Image" ControlToValidate="fuImg02" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>

            </div>

        

            <div class="form-group">
                       <div class="col-md-2 "> 
                           <br />
                           <br />
                       </div>
                       <div class="col-md-6 ">

                           <asp:Button ID="btnAdd" CssClass ="btn btn-success" runat="server" Text="Add Service" OnClick="btnAdd_Click" />


                       </div>
                   </div>

             <h1>Services</h1>
        <hr />

            <div class="form-group">
                <asp:GridView ID="servgrid" runat="server" CssClass="table" 
                    OnRowDeleting="servgrid_RowDeleting"
                     OnRowEditing="servgrid_RowEditing"
                     OnRowUpdating="servgrid_RowUpdating"
                     OnRowCancelingEdit="servgrid_RowCancelingEdit"
                     DataKeyNames="SID"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Service ID" DataField="SID" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Service Name">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("SName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtServiceName" runat="server" Text='<%# Bind("SName") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Service charge">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("SCharge") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("SCharge") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Service Do charge">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("SDoCharge") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtsellPrice" runat="server" Text='<%# Bind("SDoCharge") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("CatName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                     <asp:DropDownList ID="ddlCategory" CssClass ="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged1"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        
                         <asp:TemplateField HeaderText="SubCategory">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("SubCatName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                     <asp:DropDownList ID="ddlSubCategory" CssClass ="form-control"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged1"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("SDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("SDescription") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="images">
                            <EditItemTemplate>
                              <img src="Images/ServiceImages/<%# Eval("SID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %> Height="100px" Width="100px" "/>
                                <asp:FileUpload  ID="imgedit" runat="server"/>
                            </EditItemTemplate>
                           <ItemTemplate>
                                <div class="thumbnail">              
                                  <img src="Images/ServiceImages/<%# Eval("SID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %> Height="100px" Width="100px" "/>
                                    
                         </ItemTemplate>
                        </asp:TemplateField>
                      

                          <%---   <asp:ImageField DataImageUrlField="Name" HeaderText="Image"></asp:ImageField> ---%>

                       

                        
                 <%---         <asp:TemplateField HeaderText="Image">
                             <ItemTemplate>
                                 <asp:Image ID="Images" runat="server" Height="100px" Width="100px" 
                                     ImageUrl='<%#"data:Images/ServiceImages/;base64" + Convert.ToBase64String((byte[])Eval("Name")) %>' />
                             </ItemTemplate>
                         </asp:TemplateField> ---%>
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
    </div>

</asp:Content>
