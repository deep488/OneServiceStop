<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ServiceView.aspx.cs" Inherits="OneServiceStop.ServiceView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="col-md-5">
            <div style="max-width:480px" class="thumbnail">
             <%--   for proImage slider--%>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
   

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">

      <asp:repeater ID="rptrImage" runat="server">
          <ItemTemplate>
    <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>">
      <img src="Images/ServiceImages/<%# Eval("SID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/noimg.jpg'">
      
    </div>
             </ItemTemplate>
    </asp:repeater>


  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

              <%--  for proimage slider ending--%>
            </div>
        </div>
        <div class="col-md-5">
            <asp:Repeater ID="rptrServiceDetails" runat="server" OnItemCommand="rptrServiceDetails_ItemCommand">
                <ItemTemplate>
            <div class="divDet1">
                 <h1 class="srvNameView"><%# Eval("SName") %> </h1>
                   <span class="srvOgPriceView">Rs.<%#Eval("SCharge","{0:c}") %></span><span class="srvPriceDiscountView">Off Rs.<%# string.Format("{0}",Convert.ToInt64(Eval("SCharge"))-Convert.ToInt64(Eval("SDoCharge"))) %></span><p class="srvPriceView">Now Rs. <%#Eval("SDoCharge","{0:c}") %></p>

            </div>
                    <div class="divDet1">
                <asp:button ID="btnBuy" CssClass="mainButton" runat="server" text=" ORDER " OnClick="btnBuy_Click"/>
           <asp:Label ID="lblError" CssClass ="text-danger " runat="server" ></asp:Label>
                
            </div>
            <div class="divDet1">
                <h5 class="h5size"> Description</h5>
                <p>   <%#Eval("SDescription") %>          </p>
                </div>
                    
                    
                
           

</ItemTemplate>
</asp:Repeater>
            
           
           
        </div>







</asp:Content>
