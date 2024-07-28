<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="OneServiceStop.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <br />
    <br />
    <div class="row">
      <div class="col-md-12">
         <%---  <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right"  type="button">
                        Cart <span id="CartBadge" runat="server" class="badge"> 0 </span>
                    </button> ---%>
                    <h3>
                        <asp:Label ID="Label1" runat="server" Text="Showing All Services"></asp:Label>
                    </h3>
                    <hr />
                    
      </div>
    </div>

    <div class="row" style="padding-top:50px">

   <%----   <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" 
              placeholder="Search Products...." AutoPostBack="true" 
              ontextchanged="txtFilterGrid1Record_TextChanged" ></asp:TextBox> ---%>
      <br />
      <hr />

       <asp:repeater ID="rptrServices" runat="server">
           <ItemTemplate>
        <div class="col-sm-3 col-md-3">
            <a href="ServiceView.aspx?SID=<%# Eval("SID") %>" style="text-decoration:none;">
          <div class="thumbnail">              
              <img src="Images/ServiceImages/<%# Eval("SID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>"/>
              <div class="caption"> 
                   <div class="servName"> <%# Eval ("SName") %> </div>
                   <div class="servPrice"> <span class="servOgPrice" > <%# Eval ("SCharge","{0:0,00}") %> </span> <%# Eval ("SDoCharge","{0:c}") %> <span class="servPriceDiscount"> (<%# Eval("DisAmount","{0:0,00}") %>off) </span></div> 
                   
              </div>
          </div>
                </a>
        </div>
               
               </ItemTemplate>
       </asp:repeater>
    </div>







    

</asp:Content>
